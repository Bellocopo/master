unit Cheques;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ComCtrls, StrUtils,
  dxGDIPlusClasses, JvComponentBase, JvThread, Vcl.WinXCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData,
  cxImageComboBox, System.ImageList, Vcl.ImgList, cxImageList,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, Vcl.Samples.Spin, Vcl.ValEdit,
  Vcl.CategoryButtons, System.Actions, Vcl.ActnList, cxCheckBox, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, fastrep,
  cxCustomPivotGrid, cxDBPivotGrid, DateUtils, Math, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxDBEdit, Vcl.DBCtrls, ShellApi;

type
  TfrmCheques = class(TForm)
    cxImageGrid: TcxImageList;
    pnlToolbar: TPanel;
    lblTitle: TLabel;
    Panel1: TPanel;
    catMenuItems: TCategoryButtons;
    stbar: TStatusBar;
    ListBox1: TListBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxImageList1: TcxImageList;
    ActionList1: TActionList;
    actConsultar: TAction;
    actBaixar: TAction;
    actBaixarTodos: TAction;
    actSair: TAction;
    cxGrid1DBTableView1Numero_do_pedido__c: TcxGridDBColumn;
    colComissao: TcxGridDBColumn;
    cxGrid1DBTableView1Numero_do_cheque__c: TcxGridDBColumn;
    cxGrid1DBTableView1Data_nota_fiscal__c: TcxGridDBColumn;
    cxGrid1DBTableView1Data_comissao_paga_bon__c: TcxGridDBColumn;
    ncolData_comissao_paga_nota__c: TcxGridDBColumn;
    cxGrid1DBTableView1Nome_do_cliente__c: TcxGridDBColumn;
    cxGrid1DBTableView1Representante__c: TcxGridDBColumn;
    colValor_pago_cheque__c: TcxGridDBColumn;
    colValor_pago_comissao_bon__c: TcxGridDBColumn;
    ncolValor_pago_fatura__c: TcxGridDBColumn;
    ncolValor_pago_comissao_nota__c: TcxGridDBColumn;
    ncolComissao_nota_paga__c: TcxGridDBColumn;
    colComissao_bon_paga__c: TcxGridDBColumn;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    ncolComissao_nota__c: TcxGridDBColumn;
    colComissao_bon__c: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyleFat: TcxStyle;
    cxStyleBon: TcxStyle;
    cxStyleQuitado: TcxStyle;
    colStatusNota: TcxGridDBColumn;
    colStatusBon: TcxGridDBColumn;
    dxComponentPrinter1: TdxComponentPrinter;
    dxRelConferencia: TdxGridReportLink;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    actRelRepresentante: TAction;
    actRelComissoes: TAction;
    colValorParcCheque: TcxGridDBColumn;
    colComissaoTotal: TcxGridDBColumn;
    colVencFatura: TcxGridDBColumn;
    colPrevistoNota: TcxGridDBColumn;
    colVencCheque: TcxGridDBColumn;
    colPrevistoBon: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    colVFat: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    DBGrid1: TDBGrid;
    pnlRelatorio: TPanel;
    Label1: TLabel;
    btnOK: TBitBtn;
    BitBtn1: TBitBtn;
    cbRepresentante: TDBLookupComboBox;
    actExportRel: TAction;
    cxStyleGrupo: TcxStyle;
    procedure edtLocIDKeyPress(Sender: TObject; var Key: Char);
    procedure actConsultarExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure actBaixarExecute(Sender: TObject);
    procedure actRelRepresentanteExecute(Sender: TObject);
    procedure actRelComissoesExecute(Sender: TObject);
    procedure colValor_pago_cheque__cCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure colComissaoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormShow(Sender: TObject);
    procedure actBaixarTodosExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure actExportRelExecute(Sender: TObject);
    procedure SelecionaPagamentos;
  private
    { Private declarations }
    LDataFim : TDateTime;
  public
    { Public declarations }
  end;

var
  frmCheques: TfrmCheques;

implementation

uses dmAPI, msglib, globais, rotinas;

{$R *.dfm}

procedure TfrmCheques.actBaixarExecute(Sender: TObject);
begin
  if api.cheques.IsEmpty then
    exit;

  if not confirma('Deseja baixar a comissão selecionada ?') then exit;

  if api.PatchDataSF
  (
   'https://bellocopo.my.salesforce.com/services/data/v20.0/sobjects/cheque__c/'+api.ChequesId.AsString,
   api.JSONChequeSF
  ) then
     showmessage('Baixado com sucesso');
end;

procedure TfrmCheques.actBaixarTodosExecute(Sender: TObject);
begin
  if api.cheques.IsEmpty then
    exit;

  if not confirma('Deseja baixar todas a comissões selecionadas ?') then exit;
  

  api.Cheques.First;
  api.Cheques.DisableControls;
  api.ConsultaToken;
  try
    while not api.Cheques.Eof do
    begin
      try
        if (api.ChequesSelecionado.AsBoolean) then
        begin
          MsgAguarde('Baixando comissão;Representante:'+api.ChequesRepresentante__c.AsString+';Pedido:'+api.ChequesNumero_do_pedido__c.AsString+';');
          api.PatchDataSF
         (
           'https://bellocopo.my.salesforce.com/services/data/v20.0/sobjects/cheque__c/'+api.ChequesId.AsString,
           api.JSONChequeSF
          );
        end;
      except
        on e : Exception do
        begin
          retiraAguarde;
          MsgAguarde('Baixando comissão;Representante:'+api.ChequesRepresentante__c.AsString+
          ';Pedido:'+api.ChequesNumero_do_pedido__c.AsString+';Falha:'+e.Message
          );
        end;
      end;
//      sleep(300);
      retiraAguarde;
      api.Cheques.Next;
    end;
  finally
    api.Cheques.EnableControls;
    retiraAguarde;
    MsgInformacao('Concluído.');
    api.Cheques.Close;
    actConsultar.Execute;
  end;
end;

procedure TfrmCheques.actConsultarExecute(Sender: TObject);
var
  LFatorPagamento: Integer;
  LNumeroPedido: Real;
  LDataPrev: TDateTime;
  LDataPag: TDateTime;
  teste : string;
  FRateioCheques: Boolean;

  procedure AjustaValores;
  begin
    if api.ChequesComissao_bon__c.IsNull then
      api.ChequesComissao_bon__c.Value := 0;

    if api.ChequesComissao_nota__c.IsNull then
      api.ChequesComissao_nota__c.Value := 0;

    if api.ChequesValor__c.IsNull then
      api.ChequesValor__c.Value := 0;

    if api.ChequesValor_fatura__c.IsNull then
      api.ChequesValor_fatura__c.Value := 0;

    if api.ChequesValor_pago_fatura__c.IsNull then
      api.ChequesValor_pago_fatura__c.Value := 0;

    if api.ChequesValor_pago_cheque__c.IsNull then
      api.ChequesValor_pago_cheque__c.Value := 0;

    if api.ChequesValor_pago_comissao_bon__c.IsNull then
      api.ChequesValor_pago_comissao_bon__c.Value := 0;

    if api.ChequesValor_pago_comissao_nota__c.IsNull then
      api.ChequesValor_pago_comissao_nota__c.Value := 0;

    api.ChequesComissaoTotal.AsCurrency :=
      api.ChequesComissao_bon__c.AsCurrency+api.ChequesComissao_nota__c.AsCurrency;
  end;



  procedure MarcaStatusNota;
  begin
    if upperCase(api.ChequesComissao_nota_paga__c.Value)='TRUE' then
      api.ChequesStatusNota.AsInteger := 1
    else
      if (api.ChequesData_nota_fiscal__c.AsDateTime<=LDatafim) and
         (api.ChequesValor_pago_fatura__c.AsFloat>0)   and
         (api.ChequesComissao_nota__c.AsFloat>0)
      then
        api.ChequesStatusNota.AsInteger := 0
      else
        api.ChequesStatusNota.AsInteger := 2;
  end;

  procedure MarcaStatusCheque;
  begin
    if upperCase(api.ChequesComissao_Bon_paga__c.Value)='TRUE' then
      api.ChequesStatusBon.AsInteger := 1
    else
    if (api.ChequesData_nota_fiscal__c.AsDateTime<=LDatafim) and
     (api.ChequesValor_pago_cheque__c.AsFloat>0)   and
     (api.ChequesComissao_Bon__c.AsFloat>0)
    then
      api.ChequesStatusBon.AsInteger := 0
    else
      api.ChequesStatusBon.AsInteger := 2;
  end;

  procedure SetaPrevisaoPagamento;
  begin
    if not api.ChequesData_deposito_fatura__c.IsNull then
      api.ChequesPrevistoNota.AsString := PeridoPrevisto(api.ChequesData_deposito_fatura__c.AsDateTime);

    if not api.ChequesData_deposito__c.IsNull then
      api.ChequesPrevistoBon.AsString := PeridoPrevisto(api.ChequesData_deposito__c.AsDateTime);
  end;

  procedure CalculaAtrasos;
  begin
    //Valores em atraso
    api.ChequesValorAtraso.AsCurrency := 0;

    //Bonificação
    if (Trim(api.ChequesPrevistoBon.AsString)<>'') and
       (api.ChequesValor_pago_cheque__c.AsCurrency=0) and
       (api.ChequesComissao_bon__c.AsCurrency>0) then
    begin
      LDataPrev := StrToDateTime('01/'+api.ChequesPrevistoBon.AsString);
      LDataPag  := LDataFim+1;

      if LDataPrev<=LDataPag then
        api.ChequesValorAtraso.AsCurrency := api.ChequesComissao_bon__c.AsCurrency;
    end;

    //Faturas
    if (Trim(api.ChequesPrevistoNota.AsString)<>'') and
       (api.ChequesValor_pago_fatura__c.AsCurrency=0) and
       (api.ChequesComissao_nota__c.AsCurrency>0) then
    begin
      LDataPrev := StrToDateTime('01/'+api.ChequesPrevistoNota.AsString);
      LDataPag  := LDataFim+1;

      if LDataPrev<=LDataPag then
        api.ChequesValorAtraso.AsCurrency :=
          api.ChequesValorAtraso.AsCurrency+api.ChequesComissao_nota__c.AsCurrency;
    end;
  end;

begin
  api.Acesso.Close;
  api.cheques.close;
  api.Representantes.Close;

  cxGrid1DBTableView1.OptionsView.Footer := False;
  try
    MsgAguarde('Obtendo Token');
    api.ConsultaToken;
  finally
    RetiraAguarde;
  end;

  try
    api.Cheques.Close;
    MsgAguarde('Consultando cheques');
    api.ObterChequesEmAberto;
    stbar.Panels[1].Text := formatFloat('000000',api.Cheques.RecordCount);
  finally
    RetiraAguarde;
  end;

  try
    if not api.Cheques.IsEmpty then
    begin
      MsgAguarde('Processando dados...');
      Sleep(1000);
      api.Cheques.DisableControls;
      api.ChequesSelecionado.OnValidate := nil;
      api.Cheques.BeforePost := nil;
      api.Cheques.First;
      api.Representantes.Open;

      while not api.Cheques.Eof do
      begin

      if api.ChequesNumero_do_pedido__c.AsFloat=21756 then
        teste:='';

       if not api.Representantes.Locate('nome',api.ChequesRepresentante__c.AsString,[]) then
       begin
         api.Representantes.Append;
         api.RepresentantesNome.AsString := api.ChequesRepresentante__c.AsString;
         api.Representantes.post;
       end;

        api.Cheques.Edit;

        //Ajusta valores nulos e valores iniciais;
        AjustaValores;

        //Seta as previsões de pagamentos
        SetaPrevisaoPagamento;

        //Calcula os valores de atraso
        CalculaAtrasos;

        //Status comissões faturas
        MarcaStatusNota;


        // Status comissões bon.
        FRateioCheques := False;
        if upperCase(api.ChequesComissao_Bon_paga__c.Value)='TRUE' then
          api.ChequesStatusBon.AsInteger := 1
        else
        if ( RoundTo(api.ChequesValor_pago_cheque__c.Asfloat,-2) > RoundTo(api.ChequesValor__c.AsFloat,-2) ) and
           ( Trunc(api.ChequesValor__c.AsFloat)>0 ) then
        begin
          LFatorPagamento := Trunc(api.ChequesValor_pago_cheque__c.Asfloat/api.ChequesValor__c.AsFloat);
          LNumeroPedido   := api.ChequesNumero_do_pedido__c.AsFloat;
          if LFatorPagamento>1 then
          begin
            FRateioCheques := True;
            while LNumeroPedido=api.ChequesNumero_do_pedido__c.AsFloat do
            begin
              api.Cheques.Edit;

              //Ajusta valores nulos e valores iniciais;
              AjustaValores;

              //Seta as previsões de pagamentos
              SetaPrevisaoPagamento;

              //Calcula os valores de atraso
              CalculaAtrasos;

              //Status comissões faturas
              MarcaStatusNota;


              if api.ChequesNumero_do_cheque__c.AsInteger<=LFatorPagamento then
                api.ChequesStatusBon.AsInteger := 0
              else
              begin
                MarcaStatusCheque;
              end;
              api.Cheques.Next;
              if api.ChequesNumero_do_pedido__c.AsFloat=21756 then
                teste:='';
            end;
          end
          else
            MarcaStatusCheque;
        end
        else
          MarcaStatusCheque;

        if (not FRateioCheques) then
          api.Cheques.Next;
      end;
    end;
  finally
    api.Cheques.First;
    api.Cheques.EnableControls;
    cxGrid1DBTableView1.OptionsView.Footer := True;
    RetiraAguarde;
    cxGrid1.SetFocus;
    api.ChequesSelecionado.OnValidate := api.ChequesSelecionadoValidate;
    api.Representantes.First;
    Application.ProcessMessages;
  end;

  SelecionaPagamentos;
end;

procedure TfrmCheques.actExportRelExecute(Sender: TObject);
var
  LPastaDestino : String;
begin


  LPastaDestino:=PastaTrabalho+'\'+formatDateTime('YYYYMM',LDataFim+1);
  if not DirectoryExists(LPastaDestino) then
    ForceDirectories(LPastaDestino);

  msgAguarde('Exportando relatórios');

  try
    fr.frxReport.PrintOptions.ShowDialog := False;
    fr.frxPDFExp.ShowDialog              := false;
    api.Cheques.DisableControls;
    api.Temp.DisableControls;
    api.Representantes.First;

    while not api.Representantes.Eof do
    begin
      api.Cheques.Filter:='Representante__c='+QuotedStr(api.RepresentantesNome.AsString);
      api.Cheques.Filtered :=true;
      api.MontaRelatorioComissoes;

      fr.frxPDFExp.FileName := LPastaDestino+'\'+
        api.RepresentantesNome.AsString+
        formatDateTime('mm_yyyy',LDataFim+1)+'.pdf';

      fr.frxReport.loadFromFile(PastaTrabalho+'\comissoesr.fr3');
      fr.frxReport.Variables['titulo'] := QuotedStr('Comissões '+mes[StrToInt(formatDateTime('mm',LDataFim+1))]+'/'+formatDateTime('yyyy',LDataFim+1));
      fr.frxReport.Variables['mes'] := QuotedStr(mes[StrToInt(formatDateTime('mm',LDataFim+1))]);
      fr.frxReport.Variables['m1'] := QuotedStr('Prev. '+mes[StrToInt(formatDateTime('mm',LDataFim+1))+1]);
      fr.frxReport.Variables['m2'] := QuotedStr('Prev. '+mes[StrToInt(formatDateTime('mm',LDataFim+1))+2]);
      fr.frxReport.Variables['m3'] := QuotedStr('Prev. '+mes[StrToInt(formatDateTime('mm',LDataFim+1))+3]);
      fr.frxReport.Variables['m4'] := QuotedStr('Prev. '+mes[StrToInt(formatDateTime('mm',LDataFim+1))+4]);
      fr.tab1.DataSet := api.Temp;
      fr.frxReport.PrepareReport();
      fr.frxReport.Export(fr.frxPDFExp);

      api.Representantes.Next;
    end;
  finally
     api.Cheques.Filtered :=false;
     api.Cheques.Filter:='';
     api.Cheques.EnableControls;
     api.Temp.EnableControls;
     fr.frxReport.PrintOptions.ShowDialog := True;
     fr.frxPDFExp.ShowDialog              := True;
     retiraAguarde;
     application.ProcessMessages;
     ShellExecute(Application.HANDLE, 'open', PChar(LPastaDestino+'\'),nil,nil,SW_SHOWNORMAL);
  end;
end;

procedure TfrmCheques.actRelComissoesExecute(Sender: TObject);
begin
 { try
    MsgAguarde('Consultando lançamentos futuros');
    api.ObterChequesFuturos;

    // Ajusta valores

 while not api.ChequesFuturo.Eof do
    begin
      api.ChequesFuturo.Edit;
      api.ChequesFuturoQuitadoNota.AsBoolean :=
        (api.ChequesFuturoComissao_nota_paga__c.Value='True');

      api.ChequesFuturoQuitadoBon.AsBoolean :=
        (api.ChequesFuturoComissao_bon_paga__c.Value='True');

      api.ChequesFuturoSelecionado.AsBoolean :=
        ( (api.ChequesFuturoComissao_nota_paga__c.Value='True') and
          (api.ChequesFuturoComissao_bon_paga__c.Value='True') );


     if api.ChequesFuturoComissao_bon__c.IsNull then
       api.ChequesFuturoComissao_bon__c.Value := 0;

     if api.ChequesFuturoComissao_nota__c.IsNull then
       api.ChequesFuturoComissao_nota__c.Value := 0;

     if api.ChequesFuturoValor__c.IsNull then
       api.ChequesFuturoValor__c.Value := 0;

     if api.ChequesFuturoValor_fatura__c.IsNull then
       api.ChequesFuturoValor_fatura__c.Value := 0;

     if api.ChequesFuturoValor_pago_fatura__c.IsNull then
       api.ChequesFuturoValor_pago_fatura__c.Value := 0;

     if api.ChequesFuturoValor_pago_cheque__c.IsNull then
       api.ChequesFuturoValor_pago_cheque__c.Value := 0;

     if api.ChequesFuturoValor_pago_comissao_bon__c.IsNull then
       api.ChequesFuturoValor_pago_comissao_bon__c.Value := 0;

     if api.ChequesFuturoValor_pago_comissao_nota__c.IsNull then
       api.ChequesFuturoValor_pago_comissao_nota__c.Value := 0;

     api.ChequesFuturoComissaoTotal.AsCurrency :=
       api.ChequesFuturoComissao_bon__c.AsCurrency+api.ChequesFuturoComissao_nota__c.AsCurrency;

      api.ChequesFuturo.Next;
    end;
  finally
    RetiraAguarde;
  end;
         }
 if api.cheques.IsEmpty then
    exit;


  try
    msgAguarde('Gerando relatório.');
    api.MontaRelatorioComissoes;
    fr.frxReport.loadFromFile(PastaTrabalho+'\comissoes.fr3');
    fr.frxReport.Variables['titulo'] := QuotedStr('Comissões '+mes[StrToInt(formatDateTime('mm',LDataFim+1))]+'/'+formatDateTime('yyyy',LDataFim+1));
    fr.frxReport.Variables['mes'] := QuotedStr(mes[StrToInt(formatDateTime('mm',LDataFim+1))]);
    fr.tab1.DataSet := api.Temp;
    fr.tab2.DataSet := api.Projecao;
  finally
    RetiraAguarde;
  end;
  if sistema.EditarRelatorio then
    fr.frxReport.DesignReport
  else
    fr.frxReport.ShowReport;
end;

procedure TfrmCheques.actRelRepresentanteExecute(Sender: TObject);
begin
//  dxComponentPrinter1.Preview;
  if api.cheques.IsEmpty then
    exit;

  pnlRelatorio.visible := true;
  cbRepresentante.SetFocus;
end;

procedure TfrmCheques.actSairExecute(Sender: TObject);
begin
  api.Cheques.Close;
  Close;
end;

procedure TfrmCheques.BitBtn1Click(Sender: TObject);
begin
  pnlRelatorio.visible := false;
  cxgrid1.setfocus;
end;

procedure TfrmCheques.btnOKClick(Sender: TObject);
begin
  if Trim(cbRepresentante.Text)='' then
  begin
    showmessage('Selecione o Representante.');
    cbRepresentante.SetFocus;
    exit;
  end;

  try
    try
      msgAguarde('Gerando relatório.');
      api.Cheques.Filter:='Representante__c='+QuotedStr(cbRepresentante.Text);
      api.Cheques.Filtered :=true;
      api.MontaRelatorioComissoes;
      fr.frxReport.loadFromFile(PastaTrabalho+'\comissoesr.fr3');
      fr.frxReport.Variables['titulo'] := QuotedStr('Comissões '+mes[StrToInt(formatDateTime('mm',LDataFim+1))]+'/'+formatDateTime('yyyy',LDataFim+1));
      fr.frxReport.Variables['mes'] := QuotedStr(mes[StrToInt(formatDateTime('mm',LDataFim+1))]);
      fr.frxReport.Variables['m1'] := QuotedStr('Prev. '+mes[StrToInt(formatDateTime('mm',LDataFim+1))+1]);
      fr.frxReport.Variables['m2'] := QuotedStr('Prev. '+mes[StrToInt(formatDateTime('mm',LDataFim+1))+2]);
      fr.frxReport.Variables['m3'] := QuotedStr('Prev. '+mes[StrToInt(formatDateTime('mm',LDataFim+1))+3]);
      fr.frxReport.Variables['m4'] := QuotedStr('Prev. '+mes[StrToInt(formatDateTime('mm',LDataFim+1))+4]);
      fr.tab1.DataSet := api.Temp;
    finally
      RetiraAguarde;
    end;
    if sistema.EditarRelatorio then
      fr.frxReport.DesignReport
    else
      fr.frxReport.ShowReport;
  finally
    api.Cheques.Filtered :=false;
    api.Cheques.Filter:='';
  end;
end;

procedure TfrmCheques.colComissaoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if (AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('statusnota').Index] = 1)
  then
  begin
    ACanvas.Font.Color  := clNavy;
    ACanvas.Brush.Color := clWhite;
  end
  else
  if (AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('statusnota').Index] = 2)
  then
  begin
    ACanvas.Font.Color  := clGray;
    ACanvas.Brush.Color := clWhite;
  end;

  if (AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('statusnota').Index] = 0) and
     (AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('selecionado').Index] = True)
  then
    ACanvas.Font.Style  := [fsBold];
end;

procedure TfrmCheques.colValor_pago_cheque__cCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('statusbon').Index] = 1)
  then
  begin
    ACanvas.Font.Color  := clNavy;
    ACanvas.Brush.Color := clWhite;
  end
  else
  if (AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('statusbon').Index] = 2)
  then
  begin
    ACanvas.Font.Color  := clGray;
    ACanvas.Brush.Color := clWhite;
  end;

  if (AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('statusbon').Index] = 0) and
     (AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('selecionado').Index] = True)
  then
    ACanvas.Font.Style  := [fsBold];
end;

procedure TfrmCheques.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  i: Integer;
  LQuitado: Boolean;
begin
  if (AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('comissao__c').Index]<1) then
  begin
    ACanvas.Font.Color  := clred;
    ACanvas.Brush.Color := clWhite;
  end;
end;

procedure TfrmCheques.edtLocIDKeyPress(Sender: TObject; var Key: Char);
begin
  if  not ( Key in ['0'..'9', Chr(8)] ) then
    Key := #0
end;

procedure TfrmCheques.FormShow(Sender: TObject);
var
  LDia: Word;
  LAno: Word;
  LMes: Word;
begin
  DecodeDate(Date, LAno, LMes, LDia);
  LDia      := DaysInAMonth(LAno,LMes-1);
  LMes      := LMes-1;
  LDataFim  := EncodeDate(LAno, LMes, LDia);
end;

procedure TfrmCheques.SelecionaPagamentos;
begin
  try
   MsgAguarde('Selecionando pagamentos');
    Sleep(1000);
    api.Cheques.DisableControls;
    api.Cheques.First;
    while not api.Cheques.Eof do
    begin
      if (api.ChequesStatusNota.AsInteger=0) or (api.ChequesStatusBon.AsInteger=0) then
      begin
        api.Cheques.Edit;
        api.ChequesSelecionado.AsBoolean := True;
      end;
      api.Cheques.Next;
    end;
  finally
    api.Cheques.First;
    api.Cheques.EnableControls;
    RetiraAguarde;
  end;
end;

end.
