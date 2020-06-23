unit Pedidos;

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
  cxClasses, cxGridCustomView, cxGrid, Vcl.Samples.Spin, Vcl.ValEdit;

type
  TfrmPedidos = class(TForm)
    pnlTop: TPanel;
    btnConsultar: TBitBtn;
    Label2: TLabel;
    edtDataI: TDateTimePicker;
    Timer1: TTimer;
    cxImageList1: TcxImageList;
    ToggleSwitch1: TToggleSwitch;
    pnlGrids: TPanel;
    PageControl1: TPageControl;
    TabLog: TTabSheet;
    mlog: TMemo;
    TabJSONOdoo: TTabSheet;
    btnCopy: TBitBtn;
    memo_json: TMemo;
    TabConfig: TTabSheet;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtURL: TEdit;
    edtAPI: TEdit;
    btnSalvarConfig: TBitBtn;
    spePartinerID: TEdit;
    speProductUom: TEdit;
    TabPedidos: TTabSheet;
    pnlGridsClient: TPanel;
    DBGrid3: TDBGrid;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Sinc: TcxGridDBColumn;
    cxGrid1DBTableView1OrderNumber: TcxGridDBColumn;
    cxGrid1DBTableView1Data_para_programacao__c: TcxGridDBColumn;
    cxGrid1DBTableView1Representante__c: TcxGridDBColumn;
    cxGrid1DBTableView1StatusDataProgramada__c: TcxGridDBColumn;
    cxGrid1DBTableView1TotalAmount: TcxGridDBColumn;
    cxGrid1DBTableView1Erro: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    gridOdoo: TDBGrid;
    btnAdd: TBitBtn;
    edtLocID: TEdit;
    edtLocDestID: TEdit;
    Label8: TLabel;
    edtDataF: TDateTimePicker;
    btnEnvTodos: TBitBtn;
    cxGrid1DBTableView1Operacao: TcxGridDBColumn;
    btnSair: TBitBtn;
    Label9: TLabel;
    edtStateItens: TEdit;
    Label10: TLabel;
    edtState: TEdit;
    procedure btnConsultarClick(Sender: TObject);
    procedure edtCNPJKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ToggleSwitch1Click(Sender: TObject);
    procedure JvThread1Execute(Sender: TObject; Params: Pointer);
    procedure LerConfig;
    procedure SalvaConfig;
    procedure btnSalvarConfigClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure edtLocIDKeyPress(Sender: TObject; var Key: Char);
    procedure edtDataIChange(Sender: TObject);
    procedure EnviarTodos;
    procedure btnEnvTodosClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;

implementation

uses dmAPI, msglib, globais, rotinas;

{$R *.dfm}

procedure TfrmPedidos.btnAddClick(Sender: TObject);
begin
   api.PostDataOdoo(FURL, api.ConverterSFToOdoo);
end;

procedure TfrmPedidos.btnConsultarClick(Sender: TObject);
begin
  api.Acesso.Close;
  api.Clientes.Close;
  api.Pedidos.Close;
  api.Item.Close;

  try
    MsgAguarde('Obtendo Token');
    api.ConsultaToken;
  finally
    RetiraAguarde;
  end;

  try
    MsgAguarde('Consultando pedidos');
    api.ObterPedidosPorPeriodo(edtDataI.Date,edtDataF.Date);
  finally
    RetiraAguarde;
  end;

  try
    MsgAguarde('Consultando itens dos pedidos');
    api.ObterItensPorPeriodo(edtDataI.Date, edtDataF.Date);
  finally
    RetiraAguarde;
  end;
end;

procedure TfrmPedidos.btnCopyClick(Sender: TObject);
begin
  memo_json.text := api.ConverterSFToOdoo;
  CopyText(memo_json.Text);
end;

procedure TfrmPedidos.btnEnvTodosClick(Sender: TObject);
begin
  EnviarTodos;
end;

procedure TfrmPedidos.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPedidos.btnSalvarConfigClick(Sender: TObject);
begin
  SalvaConfig;
end;

procedure TfrmPedidos.edtCNPJKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnConsultarClick(nil);
  end;
end;

procedure TfrmPedidos.edtDataIChange(Sender: TObject);
begin
  edtDataF.Date := edtDataI.Date+7;
end;

procedure TfrmPedidos.edtLocIDKeyPress(Sender: TObject; var Key: Char);
begin
  if  not ( Key in ['0'..'9', Chr(8)] ) then
    Key := #0
end;

procedure TfrmPedidos.EnviarTodos;
begin
  api.Pedidos.First;
  api.Pedidos.DisableControls;
  api.Item.DisableControls;
  MsgAguarde('Enviando pedidos.');
  try
    while not api.Pedidos.Eof do
    begin
      api.PostDataOdoo(FURL, api.ConverterSFToOdoo);
      sleep(500);
      api.Pedidos.Next;
    end;
  finally
    api.Pedidos.EnableControls;
    api.Item.EnableControls;
    retiraAguarde;
    MsgInformacao('Concluído.');
  end;
end;

procedure TfrmPedidos.FormCreate(Sender: TObject);
begin
  memo_log := mlog;
  ToggleSwitch1.State := tssOff;
end;

procedure TfrmPedidos.FormShow(Sender: TObject);
begin
  edtDataI.Date := Date;
  edtDataF.Date := Date+7;
  LerConfig;
end;

procedure TfrmPedidos.JvThread1Execute(Sender: TObject; Params: Pointer);
begin
  Timer1.Enabled := true;
  Timer1Timer(nil);
end;

procedure TfrmPedidos.LerConfig;
begin
  FArquivoINI       := PastaTrabalho + '\config.ini';
  FLocation_id      := ValorIni(FArquivoINI, 'DADOS', 'LOC_ID','8');
  FLocation_dest_id := ValorIni(FArquivoINI, 'DADOS', 'LOC_DEST_ID', '5');
  FPartner_id       := ValorIni(FArquivoINI, 'DADOS', 'PARTNER_ID', '1');
  FProduct_uom      := ValorIni(FArquivoINI, 'DADOS', 'PRODUCT_UOM','1');
  FAPI        := ValorIni(FArquivoINI, 'DADOS', 'API', 'bellocopo-odoo-oficial-master-837857');
  FURL        := ValorIni(FArquivoINI, 'DADOS', 'URL','https://bellocopo.odoo.com:443/jsonrpc');
  FState      := ValorIni(FArquivoINI, 'DADOS', 'STATE','waiting');
  FStateItens := ValorIni(FArquivoINI, 'DADOS', 'STATE_ITENS','draft');

  edtAPI.Text              := FAPI;
  edtURL.Text              := FURL;
  edtLocId.Text            := FLocation_id;
  edtLocDestId.Text        := FLocation_dest_id;
  spePartinerID.Text       := FPartner_id;
  speProductUom.Text       := FProduct_uom;
  edtState.Text            := FState;
  edtStateItens.Text       := FStateItens;
end;

procedure TfrmPedidos.SalvaConfig;
begin
  GravaIni(FArquivoINI, 'DADOS', 'URL', Trim(edtURL.Text));
  GravaIni(FArquivoINI, 'DADOS', 'API', Trim(edtAPI.Text));
  GravaIni(FArquivoINI, 'DADOS', 'LOC_ID', Trim( edtLocId.Text ) );
  GravaIni(FArquivoINI, 'DADOS', 'LOC_DEST_ID',Trim( edtLocDestId.Text  )  );
  GravaIni(FArquivoINI, 'DADOS', 'PARTNER_ID', Trim( spePartinerID.Text )  );
  GravaIni(FArquivoINI, 'DADOS', 'PRODUCT_UOM', Trim( speProductUom.Text ) );
  GravaIni(FArquivoINI, 'DADOS', 'STATE', Trim( edtState.Text )  );
  GravaIni(FArquivoINI, 'DADOS', 'STATE_ITENS', Trim( edtStateItens.Text )  );
  MsgInformacao('Salvo com sucesso.');
  LerConfig;
end;

procedure TfrmPedidos.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  btnConsultarClick(nil);
  api.Pedidos.First;
  api.Pedidos.DisableControls;
  api.Item.DisableControls;
  try
    while not api.Pedidos.Eof do
    begin
      api.PostDataOdoo(FURL, api.ConverterSFToOdoo);
      api.Pedidos.Next;
    end;
  finally
    api.Pedidos.EnableControls;
    api.Item.EnableControls;
    Timer1.Enabled := true;
  end;
end;

procedure TfrmPedidos.ToggleSwitch1Click(Sender: TObject);
begin
  if ToggleSwitch1.State = tssOn then
    Timer1Timer(nil)
  else
    Timer1.Enabled := false;
end;

end.
