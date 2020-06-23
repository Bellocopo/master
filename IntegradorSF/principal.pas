unit principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, jpeg, ExtCtrls, ToolWin, StdCtrls, XPMan, ImgList,
  IBX.IBDatabase, Vcl.Menus, Vcl.Imaging.pngimage,System.ImageList, vfuncionarios,
  dxGDIPlusClasses, cxImageList, cxGraphics,  IOUtils, REST.Types;

type
  TfrmPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    Timer1: TTimer;
    ToolBarMain: TToolBar;
    tbFuncion: TToolButton;
    tbSair: TToolButton;
    ImageListMenu: TcxImageList;
    imgFundo: TImage;
    tbPedidos: TToolButton;
    tbComissoes: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure fechaForms;
    procedure tbFuncionClick(Sender: TObject);
    procedure tbSairClick(Sender: TObject);
    procedure tbPedidosClick(Sender: TObject);
    procedure tbComissoesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses login, globais, funcionarios, rotinas, dm, pedidos, cheques, dmboleto, ShellAPI;

{$R *.dfm}

procedure TfrmPrincipal.tbSairClick(Sender: TObject);
begin
  if not confirma('Deseja sair do sistema.') then
    exit;
  fechaForms;
  Close;
end;

procedure TfrmPrincipal.fechaForms;
var
  i: Integer;
begin
  try
    if mdiChildCount=0 then exit;
    for i:=0 to MDIChildCount-1 do
      MDIChildren[i].close;
  except on e: exception do
    begin
      if Sistema.EditarRelatorio then
        showmessage('FecharForms: '+e.Message);
    end;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  statusbar1.Panels[0].Text:=formatDateTime('ddddddd',date);
  statusbar1.Panels[2].Text:='[Versão: '+Sistema.Versao+']';
  FrmPrincipal.caption:='IntegradorSF v.'+Sistema.Versao;

  Top := 0;
  Left := 0;
  Width := Screen.Width;
  Height := Screen.Height;
  formPrincipal := frmPrincipal;
  if FileExists(pastaTrabalho+'\logo.png') then
  begin
    imgFundo.Align := alClient;
    imgFundo.Picture.LoadFromFile(pastaTrabalho+'\logo.png');
  end;
  Refresh;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  statusbar1.Panels[1].Text:=formatDateTime('hh:mm:ss',now);
end;

procedure TfrmPrincipal.tbComissoesClick(Sender: TObject);
begin
  fechaForms;
  Modulo.Tabela        := '';
  Modulo.ChavePrimaria := '';
  Modulo.Titulo        := '';
  Modulo.FormularioCadastro := nil;
  frmCheques :=  TfrmCheques.Create(nil);
end;

procedure TfrmPrincipal.tbFuncionClick(Sender: TObject);
begin
  fechaForms;
  Modulo.Tabela        := 'funcionarios';
  Modulo.ChavePrimaria := 'id_funcionario';
  Modulo.Titulo        := 'Funcionários / Usuários';
  Modulo.FormularioCadastro := TFrmFuncionarios;
  frmvFuncionarios :=  TfrmvFuncionarios.Create(nil);
end;

procedure TfrmPrincipal.tbPedidosClick(Sender: TObject);
begin
  fechaForms;
  Modulo.Tabela        := '';
  Modulo.ChavePrimaria := '';
  Modulo.Titulo        := '';
  Modulo.FormularioCadastro := nil;
  frmPedidos :=  TfrmPedidos.Create(nil);
end;

end.
