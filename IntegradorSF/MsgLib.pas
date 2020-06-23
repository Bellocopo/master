unit MsgLib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls, Controls, Math, pngimage, jpeg, Gauges, System.UITypes;

type
  TTipoMensagem = (tmErro, tmAtencao, tmInterrogacao, tmInformacao, tmAguarde, tmMsgComp);

  TfrMsg = class(TForm)
    imIcones: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);

    //eventos atribuídos aos objetos criados
    procedure sbSim_Click(Sender: TObject);
    procedure sbNao_Click(Sender: TObject);
    procedure sbOk_Click(Sender: TObject);
    procedure sbCancelar_Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imIconesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure MsgErro(sMsg1: string; sMsg2: string = ''; bmp: TBitmap = nil);
  function  MsgAtencao(sMsg1: string; sMsg2: string = ''): boolean;
  function  MsgInterrogacao(sMsg1: string; sMsg2: string = ''; bmp: TBitmap = nil): boolean;
  procedure MsgInformacao(sMsg1: string; sMsg2: string = ''; bmp: TBitmap = nil);

  function MsgComp(cp: TWinControl; sMsg1: string = ''; sMsg2: string = ''; bmp: TBitmap = nil;
           CancelButton: boolean = false; OkButton: boolean = true): boolean;

  function MsgAguarde(sMsg: string = ''; posGauge: integer = -1; CancelGauge: boolean = false; fr: TForm = nil): boolean;
  procedure RetiraAguarde(fr: TForm = nil);

  //função principal
  function  Mensagem(TpMsg: TTipoMensagem; sMsg1,sMsg2: string; posGauge: integer; bmpIcone: TBitmap;
            CancelButton: boolean; OkButton: boolean = true): TModalResult;

  function  ProgramaEmPrimeiroPlano: Boolean;
var
  frMsg          : TfrMsg;
  MsgCor         : TColor;
  Msg_WinControl : TWinControl;
  gaProc         : TGauge;

implementation

{$R *.DFM}

//==============================================================================
function ProgramaEmPrimeiroPlano: Boolean;
begin
  Result := (FindControl(GetForegroundWindow()) <> nil);
end;
//==============================================================================
function SetFirstFocus(Control: TWinControl): Boolean;
var i: Integer;
    wc: TWinControl;
begin
  result := false;
  if (not Control.Visible) or (not Control.Enabled) then
    exit;
  for i := 0 to Control.ControlCount-1 do begin
    if not ( Control.Controls[i] is TWinControl ) then
      continue;
    wc := Control.Controls[i] as TWinControl;
//    if (wc.Name <> '') and ( ( wc.TabOrder <> 0 ) or ( not wc.visible ) or ( not wc.enabled )) then
    if ( wc.TabOrder <> 0 ) or ( not wc.visible ) or ( not wc.enabled ) then
      continue;

    if wc.ComponentCount > 0 then
      result := SetFirstFocus(wc)
    else
      try
        if ProgramaEmPrimeiroPlano and wc.CanFocus then
          wc.SetFocus;
        result := wc.Focused;
      except
        result := false;
      end;

    if result then
      break;
  end;
end;
//==============================================================================
function CreateControl(var pc: pointer; pClassType: TComponentClass; pOwner: TComponent;
  pParent: TWinControl; pName: string; pVisible: boolean = true; pAlign: TAlign = alNone): boolean;
begin
  pc := pOwner.FindComponent(pName){ as TControl};
  result := pc = nil;
  if pc = nil then begin
    pc := pClassType.Create( pOwner ){ as TControl};
    TControl(pc).Name    := pName;
    TControl(pc).Visible := pVisible;
    TControl(pc).Parent  := pParent;
    TControl(pc).Align   := pAlign;
    if pClassType = TPanel then begin
      TPanel(pc).Caption := '';
      TPanel(pc).ParentBackground := false;
    end;
  end;
end;
//==============================================================================
procedure MsgErro(sMsg1: string; sMsg2: string = ''; bmp: TBitmap = nil);
begin
  Mensagem(tmErro,sMsg1,sMsg2,0,bmp,false);
end;
//==============================================================================
function MsgAtencao(sMsg1: string; sMsg2: string = ''): boolean;
begin
  result := Mensagem(tmAtencao,sMsg1,sMsg2,0,nil,false) = mrOk;
end;
//==============================================================================
procedure MsgInformacao(sMsg1: string; sMsg2: string = ''; bmp: TBitmap = nil);
begin
  Mensagem(tmInformacao,sMsg1,sMsg2,0,bmp,false);
end;
//==============================================================================
function MsgInterrogacao(sMsg1: string; sMsg2: string = ''; bmp: TBitmap = nil): boolean;
begin
  result := Mensagem(tmInterrogacao,sMsg1,sMsg2,0,bmp,false) = mrYes;
end;
//==============================================================================
function MsgComp(cp: TWinControl; sMsg1: string = ''; sMsg2: string = ''; bmp: TBitmap = nil;
         CancelButton: boolean = false; OkButton: boolean = true): boolean;
var svparent: TWinControl;
    svbounds: TRect;
    svvisible: boolean;
begin
  svparent         := cp.parent;
  svbounds         := cp.BoundsRect;
  svvisible        := cp.visible;
//  result           := false;
  try
    Msg_WinControl := cp;
    result := Mensagem(tmMsgComp,sMsg1,sMsg2,0,bmp,CancelButton,OkButton) = mrOk;
  finally
    cp.visible     := svvisible;
    cp.parent      := svparent;
    cp.BoundsRect  := svbounds;
    Msg_WinControl := nil;
  end;
end;
//==============================================================================
function MsgAguarde(sMsg: string = ''; posGauge: integer = -1; CancelGauge: boolean = false; fr: TForm = nil): boolean;
begin
  if (fr <> nil) and (fr <> Screen.ActiveForm) then
    exit;
  if (Screen.ActiveForm <> nil) and (Screen.ActiveForm = frMsg) then
    exit;
  if sMsg = '' then
     sMsg := 'Aguarde...';
  try
    result := not(Mensagem(tmAguarde,sMsg,'',posGauge,nil,CancelGauge,false) = mrCancel);
  except
    showmessage('falha no aguarde');
    result:=false;
  end;
end;
//==============================================================================
procedure RetiraAguarde(fr: TForm = nil);
var pnMsg: TPanel;
begin
  if (fr = nil) and (Screen.ActiveForm <> nil) then
    fr := Screen.ActiveForm;
  if (fr <> nil) and fr.visible then begin
    pnMsg := fr.FindComponent('pnExternoMsg_') as TPanel;
    if pnMsg <> nil  then
      pnMsg.visible := false;
  end;
end;
//==============================================================================
function Mensagem(TpMsg: TTipoMensagem; sMsg1,sMsg2: string; posGauge: integer; bmpIcone: TBitmap;
         CancelButton: boolean; OkButton: boolean = true): TModalResult;
const ButtonWidth = 50; ButtonHeight = 26;
      Botao_Cor = $00FFFFD9;
      Botao_CorTexto = clBlack;
      Botao_Estilo = [];//fsBold];
      MaxHeightMsg = 500;
var pnExternoMsg, pnMsg: TPanel;
    imIcone: TImage;
    MaxWidthMsg : integer;
    lbMsg1, lbMsg2: TLabel;
    frBase: TForm;
    w, i, iLeftCopy, Gap, GapBorder, iHeight, iWidth, iWidthButtons, MsgLeft, MsgTop, MsgWidth, MsgHeight: integer;
    sbSim, sbNao, sbOk, sbCancelar: TButton;
    sbMsg: TScrollBox;
    shDiv: TShape;
begin
  MaxWidthMsg := 700;
//  result := -1;
  if frMsg = nil then
    Application.CreateForm(TfrMsg, frMsg);

  frMsg.tag := integer(TpMsg);

  frMsg.Position := poScreenCenter;

  //formatando mensagem...
  while pos(';',sMsg1) > 0 do
    sMsg1[ pos(';',sMsg1) ] := #13;
  while pos(';',sMsg2) > 0 do
    sMsg2[ pos(';',sMsg2) ] := #13;

  if TpMsg in [tmAguarde] then begin
    frBase := Screen.ActiveForm;
    MaxWidthMsg := Screen.ActiveForm.Width-100;
    gap := 5;
  end
  else begin
    frBase := frMsg;
    gap := 10;
  end;

  //Criando componentes comuns a todas as mensagens...
  if CreateControl(pointer(pnExternoMsg),TPanel,frBase,frBase,'pnExternoMsg_',false) then begin
    with pnExternoMsg do begin
      BevelOuter  := bvRaised;
      BevelInner  := bvLowered;
      BorderWidth := 2;
      Color       := RGB(217,214,197);
      Cursor      := crSizeAll;
      TabStop     := false;
    end;
  end;

  if CreateControl(pointer(pnMsg),TPanel,frBase,pnExternoMsg,'pnMsg_',true,alClient) then begin
    pnMsg.BevelOuter := bvNone;
    pnMsg.TabStop    := false;
  end;

  pnMsg.Color := MsgCor;

  GapBorder := Gap + pnExternoMsg.BorderWidth + 2;

  if CreateControl(pointer(imIcone),TImage,frBase,pnMsg,'imIcone_') then begin
    imIcone.AutoSize := true;
    imIcone.Transparent := true;
    imIcone.tag := -1;
    imIcone.Left := gap;
    imIcone.Top := gap;
  end;

  imIcone.visible := true;
  if bmpIcone <> nil then begin
    imIcone.Picture.Bitmap.Assign(bmpIcone);
    imIcone.tag := -1;
  end else
  if TpMsg = tmMsgComp then begin
    if imIcone.visible then
      imIcone.visible := false;
  end else begin
    imIcone.visible := true;
    if (imIcone.tag <> integer(TpMsg)) then begin
      imIcone.Picture.Bitmap.Assign(frMsg.imIcones.Picture.Bitmap);
      if imIcone.Picture.Bitmap = nil then
        imIcone.Picture.Bitmap := TBitmap.Create;
      imIcone.Picture.Bitmap.Width  := frMsg.imIcones.Height;
      imIcone.Picture.Bitmap.Height := frMsg.imIcones.Height;
      iLeftCopy := integer(TpMsg) * (imIcone.Height + 1);
      imIcone.Picture.Bitmap.Canvas.CopyRect(Rect(0,0,imIcone.Width,imIcone.Height),
                                             frMsg.imIcones.Picture.Bitmap.Canvas,
                                             Rect(iLeftCopy,0,iLeftCopy+imIcone.Width,imIcone.Height));
      imIcone.Transparent := true;
      imIcone.tag := integer(TpMsg);
    end;
  end;

  if CreateControl(pointer(lbMsg1),TLabel,frBase,pnMsg,'lbMsg1_',true) then begin
    lbMsg1.Autosize := true;
    lbMsg1.Font.Size := 12;
    lbMsg1.Transparent := true;
  end;

  lbMsg1.Font.Name := 'Arial';
  lbMsg1.Font.Size := 12;
  lbMsg1.Font.Style := [fsBold];
  lbMsg1.Parent := pnMsg;
  lbMsg1.Caption := sMsg1;

  if CreateControl(pointer(lbMsg2),TLabel,frBase,pnMsg,'lbMsg2_',true) then begin
    lbMsg2.Autosize := true;
    lbMsg2.Transparent := true;
  end;

  lbMsg2.Font.Name := 'Arial';
  lbMsg2.Font.Size := 12;
  lbMsg2.Font.Style := [];
  lbMsg2.Parent := pnMsg;
  lbMsg2.Caption := sMsg2;

  if sMsg2 = '' then begin
    lbMsg2.visible := false;
    MsgWidth := lbMsg1.Width;
    MsgHeight := lbMsg1.Height;
  end
  else begin
    lbMsg2.visible := true;
    MsgWidth := max(lbMsg1.Width, lbMsg2.Width);
    MsgHeight := lbMsg1.Height + lbMsg2.Height + gap;
  end;

  if (TpMsg in [tmInformacao, tmMsgComp]) and (Msg_WinControl <> nil) then begin
    MsgHeight := Msg_WinControl.Height + MsgHeight + 2;
    if MsgWidth < Msg_WinControl.width then
      MsgWidth := Msg_WinControl.width;
  end;

  MsgLeft := imIcone.Width + gap * 2;
  if (imIcone.Height > MsgHeight) and (imIcone.Width >= imIcone.Height) then
    MsgTop := (imIcone.Height - MsgHeight) div 2 + gap
  else
    MsgTop := imIcone.Top + 2;

  //Utiliza ScrollBar quando mensagem ultrapassa tamanho máximo
  if (MsgWidth > MaxWidthMsg) or (MsgHeight > MaxHeightMsg) then begin
    CreateControl(pointer(sbMsg),TScrollBox,frBase,pnMsg,'sbMsg_');
    sbMsg.BorderStyle := bsNone;
    lbMsg1.Parent := sbMsg;
    lbMsg2.Parent := sbMsg;
    lbMsg1.SetBounds(0,0,lbMsg1.Width,lbMsg1.Height);

    if (TpMsg in [tmInformacao, tmMsgComp]) and (Msg_WinControl <> nil) then
      lbMsg2.SetBounds(0,MsgHeight - lbMsg2.Height - 6,lbMsg2.Width,lbMsg2.Height)
    else
      lbMsg2.SetBounds(0,lbMsg1.Height + gap - 2,lbMsg2.Width,lbMsg2.Height);

    sbMsg.visible := true;
    sbMsg.HorzScrollBar.Visible := MsgWidth > MaxWidthMsg;
    sbMsg.VertScrollBar.Visible := MsgHeight > MaxHeightMsg;
    if MsgWidth > MaxWidthMsg then begin
      MsgWidth := MaxWidthMsg;
      MsgHeight := MsgHeight + 20;
    end;
    if MsgHeight > MaxHeightMsg then begin
      MsgHeight := MaxHeightMsg;
      MsgWidth := MsgWidth + 20;
    end;
    sbMsg.SetBounds(MsgLeft,MsgTop,MsgWidth,MsgHeight);
    MsgTop := 0;
    MsgLeft := 0;
  end
  else begin
    sbMsg := frBase.FindComponent('sbMsg_') as TScrollBox;
    if sbMsg <> nil then
      sbMsg.visible := false;
    lbMsg1.SetBounds(MsgLeft,MsgTop,lbMsg1.Width,lbMsg1.Height);
    if (TpMsg in [tmInformacao, tmMsgComp]) and (Msg_WinControl <> nil) then
      lbMsg2.SetBounds(MsgLeft,MsgTop + MsgHeight - lbMsg2.Height - 4,lbMsg2.Width,lbMsg2.Height)
    else
      lbMsg2.SetBounds(MsgLeft,MsgTop + lbMsg1.Height + gap - 2,lbMsg2.Width,lbMsg2.Height);
  end;

  //componentes adicionais para MsgAguarde e MsgProcessamento
  if TpMsg in [tmAguarde] then begin
    if posGauge < 0 then
      iHeight := max(imIcone.Height,MsgHeight) + gapBorder * 2
    else
      iHeight := imIcone.Height + gapBorder * 2;

    iWidth := imIcone.Width + gap + MsgWidth + gapBorder * 2;

    gaProc := frBase.FindComponent('gaProc_') as TGauge;
    sbCancelar := frBase.FindComponent('sbCancelar_') as TButton;
    if (gaProc = nil) and (posGauge >= 0) then begin
      CreateControl(pointer(gaProc),TGauge,frBase,pnMsg,'gaProc_',true);
      gaProc.ForeColor := clNavy;
    end;

    if (gaProc <> nil) then begin
      gaProc.visible := (posGauge >= 0);
      if gaProc.visible then begin
        gaProc.SetBounds(imIcone.Width + MsgWidth + gap * 3,MsgTop-1,82,MsgHeight+2);
        gaProc.Progress := posGauge;
        iWidth := iWidth + gaProc.Width + gap * 2;
      end;
      if CancelButton then begin
        if CreateControl(pointer(sbCancelar),TButton,frBase,pnMsg,'sbCancelar_',true) then begin
          sbCancelar.Caption := 'Cancelar';
          sbCancelar.Cursor := crHandPoint;
          sbCancelar.Width := 84;
          sbCancelar.OnClick := frMsg.sbCancelar_Click;
          sbCancelar.Font.Color := Botao_CorTexto;
          sbCancelar.Font.Style :=  sbCancelar.Font.Style + Botao_Estilo;
        end;
        iHeight := iHeight + Gap + sbCancelar.Height + 8;
        sbCancelar.SetBounds(iWidth-gapBorder-sbCancelar.Width-3,iHeight-gapBorder-ButtonHeight-3,sbCancelar.width,ButtonHeight);
      end;
//      Msg_InGauge := gaProc.visible;
    end;

    if (sbCancelar <> nil) then begin
      sbCancelar.visible := (gaProc <> nil) and gaProc.visible and CancelButton;
      if sbCancelar.visible then
        Application.ProcessMessages;
    end;
    pnExternoMsg.SetBounds((frBase.Width - iWidth) DIV 2,(frBase.Height - iHeight) DIV 2,iWidth,iHeight);
    pnExternoMsg.visible := true;
  end
  //componentes para as demais mensagens...
  else begin
  //componentes para as demais mensagens...
    if CreateControl(pointer(sbSim),TButton,frBase,pnMsg,'sbSim_',true) then begin
      sbSim.Caption     := '&Sim';
      sbSim.Cursor      := crHandPoint;
      sbSim.OnClick     := frMsg.sbSim_Click;
      sbSim.Width       := ButtonWidth;
      sbSim.Font.Color  := Botao_CorTexto;
      sbSim.Font.Style  :=  sbSim.Font.Style + Botao_Estilo;
    end;
    sbSim.visible       := TpMsg in [tmInterrogacao];

    if CreateControl(pointer(sbNao),TButton,frBase,pnMsg,'sbNao_',true) then begin
      sbNao.Caption     := '&Não';
      sbNao.Cursor      := crHandPoint;
      sbNao.OnClick     := frMsg.sbNao_Click;
      sbNao.Width       := ButtonWidth;
      sbNao.Font.Color  := Botao_CorTexto;
      sbNao.Font.Style  :=  sbNao.Font.Style + Botao_Estilo;
    end;
    sbNao.visible       := sbSim.visible;

    if CreateControl(pointer(sbOk),TButton,frBase,pnMsg,'sbOk_',true) then begin
      sbOk.Caption      := 'Ok';
      sbOk.Cursor       := crHandPoint;
      sbOk.OnClick      := frMsg.sbOk_Click;
      sbOk.Width        := ButtonWidth;
      sbOk.Font.Color   := Botao_CorTexto;
      sbOk.Font.Style   :=  sbOk.Font.Style + Botao_Estilo;
    end;
    sbOk.visible        := not sbSim.visible;

    if ((TpMsg in [tmInformacao, tmMsgComp]) and CancelButton) then  begin
      if CreateControl(pointer(sbCancelar),TButton,frBase,pnMsg,'sbCancelar_',true) then begin
        sbCancelar.Caption     := 'Cancelar';
        sbCancelar.Cursor      := crHandPoint;
        sbCancelar.Width       := 84;
        sbCancelar.OnClick     := frMsg.sbCancelar_Click;
        sbCancelar.Font.Color  := Botao_CorTexto;
        sbCancelar.Font.Style  :=  sbCancelar.Font.Style + Botao_Estilo;
      end;
      sbCancelar.visible       := true;
      iWidthButtons            := sbOk.Width + Gap + sbCancelar.Width + 8;
    end
    else begin
      sbCancelar := frBase.FindComponent('sbCancelar_') as TButton;
      if sbCancelar <> nil then
        sbCancelar.visible := false;
      if sbOk.visible then
        iWidthButtons := sbOk.Width + 8
      else
        iWidthButtons := sbSim.Width + Gap + sbNao.Width + 8;
    end;

    iHeight := max(imIcone.Height,MsgHeight + gap) + ButtonHeight+6 + gapBorder * 2;
    iWidth := imIcone.Width + gap + max(MsgWidth,iWidthButtons) + gapBorder * 2;

    if (TpMsg in [tmInformacao, tmMsgComp]) and (Msg_WinControl <> nil) then begin
      if lbMsg1.parent = sbMsg then
        Msg_WinControl.SetBounds(0,lbMsg1.Top+lbMsg1.Height+gap,Msg_WinControl.width,Msg_WinControl.Height)
      else
        Msg_WinControl.SetBounds(MsgLeft,lbMsg1.Top+lbMsg1.Height+gap,Msg_WinControl.width,Msg_WinControl.Height);
      Msg_WinControl.parent := lbMsg1.parent;
      Msg_WinControl.visible := true;
      iHeight := max(imIcone.Height,MsgHeight + gap) + ButtonHeight+6 + gapBorder * 2;
      iWidth := imIcone.Width + gap + max(MsgWidth,iWidthButtons) + gapBorder * 2;
    end;

    if (sbCancelar <> nil) and sbCancelar.visible then begin
      sbCancelar.SetBounds(iWidth-gapBorder-sbCancelar.Width-3,iHeight-gapBorder-ButtonHeight-0,sbCancelar.width,ButtonHeight);
      sbOk.SetBounds(sbCancelar.Left-ButtonWidth-gap,sbCancelar.Top,ButtonWidth,ButtonHeight);
    end
    else
      sbOk.SetBounds(iWidth-gapBorder-ButtonWidth-3,iHeight-gapBorder-ButtonHeight-0,ButtonWidth,ButtonHeight);
    sbNao.BoundsRect := sbOk.BoundsRect;
    sbSim.SetBounds(sbNao.Left-ButtonWidth-gap,sbNao.Top,ButtonWidth,ButtonHeight);

    pnExternoMsg.SetBounds(0,0,iWidth,iHeight);

    CreateControl(pointer(shDiv),TShape,frBase,pnMsg,'shDiv_',false);
    shDiv.SetBounds(imIcone.Left+imIcone.width+gap,sbOk.Top-gap,iWidth-(imIcone.Left+imIcone.width+gap*3-2),1);
    shDiv.visible := true;

    if not OkButton then
      iHeight := iHeight - 40;

    if Screen.ActiveForm = nil then
      frBase.SetBounds((Screen.Width - iWidth) DIV 2,(Screen.Height - iHeight) DIV 2,iWidth,iHeight)
    else
      with Screen.ActiveForm do
        frBase.SetBounds(Left + (Width - iWidth) DIV 2,Top + (Height - iHeight) DIV 2,iWidth,iHeight);
  end;

  pnExternoMsg.visible := true;
  if frBase = frMsg then begin
    if SCreen.ActiveForm <> nil then
      SCreen.ActiveForm.refresh;

    if TpMsg in [tmErro,tmAtencao] then
      MessageBeep(MB_ICONERROR)
    else
      MessageBeep(MB_OK);

    frMsg.Close;

    result := frMsg.ShowModal;
  end
  else begin
    result := mrOk;
    pnExternoMsg.refresh;
  end;
end;
//==============================================================================
procedure TfrMsg.sbSim_Click(Sender: TObject);
begin
  ModalResult := mrYes;
end;
//==============================================================================
procedure TfrMsg.sbNao_Click(Sender: TObject);
begin
  ModalResult := mrNo;
end;
//==============================================================================
procedure TfrMsg.sbOk_Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;
//==============================================================================
procedure TfrMsg.sbCancelar_Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;
//==============================================================================
procedure TfrMsg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var sbSim, sbNao, sbOk, sbCancelar: TButton;
    TipoMsg: TTipoMensagem;
begin
  TipoMsg := TTipoMensagem(frMsg.tag);
  sbSim      := frMsg.FindComponent('sbSim_'     ) as TButton;
  sbNao      := frMsg.FindComponent('sbNao_'     ) as TButton;
  sbOk       := frMsg.FindComponent('sbOk_'      ) as TButton;
  sbCancelar := frMsg.FindComponent('sbCancelar_') as TButton;
  case key of
    ord('S'),ord('s'): if TipoMsg in [tmInterrogacao] then
                         sbSim_Click( nil );
    ord('N'),ord('n'): if TipoMsg in [tmInterrogacao] then
                         sbNao_Click( nil );
    vk_left:begin
              if (TipoMsg in [tmInterrogacao]) and (sbSim <> nil) then begin
                key := 0;
                if ProgramaEmPrimeiroPlano and sbSim.CanFocus then
                  sbSim.SetFocus;
              end;       
            end;  
    vk_right:begin
               if (TipoMsg in [tmInterrogacao]) and (sbNao <> nil) then begin
                 key := 0;
                 if ProgramaEmPrimeiroPlano and sbNao.CanFocus then
                   sbNao.SetFocus;
               end;
             end;
    vk_Return: begin
                 if TipoMsg in [tmInterrogacao] then begin
                   if (sbSim <> nil) and (sbNao <> nil) and (not sbSim.Focused) and (not sbNao.Focused) then
                   begin
                     key := 0;
                     sbSim_Click( nil );
                   end;
                 end
                 else
                 if TipoMsg in [tmInformacao] then begin
                   if (sbOk <> nil) {and (sbCancelar <> nil) and (not sbOk.Focused) and (not sbCancelar.Focused)} then
                   begin
                     key := 0;
                     sbOk_Click( nil );
                   end else if (sbCancelar <> nil) {and (not sbOk.Focused) and (not sbCancelar.Focused)} then
                   begin
                     key := 0;
                     sbCancelar_Click( nil );
                   end;
                 end else begin
                   key := 0;
                   if Msg_WinControl<> nil then;
                   sbOk_Click( nil );
                 end;
               end;
    vk_Escape: begin
                 key := 0;
                 if TipoMsg in [tmInterrogacao] then
                   sbNao_Click( nil )
                 else
                   sbCancelar_Click( nil );
               end;
  end;
end;
procedure TfrMsg.imIconesClick(Sender: TObject);
begin

end;

//==============================================================================
procedure TfrMsg.FormActivate(Sender: TObject);
var sbSim, {sbNao,} sbOk{, sbCancelar}: TButton;
    TipoMsg: TTipoMensagem;
begin
  TipoMsg := TTipoMensagem(frMsg.tag);

  sbSim      := frMsg.FindComponent('sbSim_'      ) as TButton;
//  sbNao      := frMsg.FindComponent('sbNao_'      ) as TButton;
  sbOk       := frMsg.FindComponent('sbOk_'       ) as TButton;
//  sbCancelar := frMsg.FindComponent('sbCancelar_' ) as TButton;

  if (TipoMsg in [tmInterrogacao]) and (sbSim <> nil) then begin
    if ProgramaEmPrimeiroPlano and sbSim.CanFocus then
      sbSim.SetFocus
  end
  else
  if (TipoMsg <> tmMsgComp) or (not SetFirstFocus(Msg_WinControl)) then begin
    if ProgramaEmPrimeiroPlano and sbOk.CanFocus then
      sbOk.SetFocus;
  end;
end;
//==============================================================================
procedure TfrMsg.FormCreate(Sender: TObject);
begin
//  MsgCor := $00DAFAFA;
  MsgCor := $FFFFFF;
end;
//==============================================================================
initialization
  Msg_WinControl  := nil;
end.



