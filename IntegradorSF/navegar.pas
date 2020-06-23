unit navegar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids, DB,
  Vcl.Menus, Vcl.StdCtrls, relatorioP,
  System.ImageList, adodb, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Buttons, System.Actions, Vcl.ActnList,
  Vcl.Imaging.pngimage, Vcl.CategoryButtons, Vcl.DBCtrls, Datasnap.Provider,
  Datasnap.DBClient,  msgLib, IdComponent,
  IdBaseComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP, Vcl.Samples.Gauges, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxContainer, cxTextEdit, cxMemo,   cxDBEdit, JvExDBGrids, JvDBGrid,
  dxSkinTheBezier, cxDataControllerConditionalFormattingRulesManagerDialog,
  ComObj, cxImageList, strUtils;

type
  TfrmNavegar = class(TForm)
    Panel1: TPanel;
    grid: TJVDBGrid;
    ActionList1: TActionList;
    actIncluir: TAction;
    actAlterar: TAction;
    actExcluir: TAction;
    actFiltrar: TAction;
    actPesquisar: TAction;
    actImprimir: TAction;
    actSair: TAction;
    pnlToolbar: TPanel;
    lblTitle: TLabel;
    catMenuItems: TCategoryButtons;
    stbar: TStatusBar;
    DBNavigator1: TDBNavigator;
    actReplicar: TAction;
    actRestaurar: TAction;
    ListBox1: TListBox;
    pnlLog: TPanel;
    gridLog: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Log: TFDQuery;
    LogID_LOG: TFDAutoIncField;
    LogDATA: TSQLTimeStampField;
    LogID_COLABORADOR: TIntegerField;
    LogUSUARIO: TStringField;
    LogMODULO: TStringField;
    LogOPERACAO: TMemoField;
    LogCOMPUTADOR: TStringField;
    LogVERSAO: TStringField;
    Logchave: TStringField;
    dtsLog: TDataSource;
    actLog: TAction;
    gridLogDATA: TcxGridDBColumn;
    gridLogUSUARIO: TcxGridDBColumn;
    gridLogCOMPUTADOR: TcxGridDBColumn;
    gridLogVERSAO: TcxGridDBColumn;
    gridLogColumn1: TcxGridDBColumn;
    cxDBMemo1: TcxDBMemo;
    actExportXLS: TAction;
    sbExpXLS: TSpeedButton;
    cxImageList1: TcxImageList;
    procedure FormShow(Sender: TObject);
    procedure gridDblClick(Sender: TObject);
    procedure gridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Imprimir;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridTitleClick(Column: TColumn);
    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actFiltrarExecute(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
    procedure gridEnter(Sender: TObject);
    procedure actExportXLSExecute(Sender: TObject);
  private
    { Private declarations }
    colecao : TButtonCollection;
    btnIncluir   : TButtonItem;
    btnAlterar   : TButtonItem;
    btnExcluir   : TButtonItem;
    btnPesquisar : TButtonItem;
    btnFiltrar   : TButtonItem;
    btnImprimir  : TButtonItem;
    btnLog       : TButtonItem;
    btnSair      : TButtonItem;
    function TemAcesso(Aid_colaborador:real; Amodulo : string; Aoperacao:string) : Boolean;
  public
    { Public declarations }
     tabelaPesq : String;
     sqlPesquisa : String;
     filtroPesquisa, filtro2 : String;
     ordemPesquisa : String;
     retornoPesquisa : string;
     titulo : String;
  end;

var
  frmNavegar: TfrmNavegar;
  qrRelatoriop : TqrRelatorioP;

implementation

uses dm, Pesquisa, rotinas, globais, padrao, filtro, fastrep;

{$R *.dfm}

procedure TfrmNavegar.actAlterarExecute(Sender: TObject);
var
  frm : TForm;
begin
  if (usuario.codigo>0) and (not usuario.Admin) then
  begin
    if not TemAcesso(Usuario.Codigo, Modulo.Nome, 'alteracao') then
    begin
      MsgAtencao('Acesso negado.');
      exit;
    end;
  end;

  if TFDQuery(a.FindComponent(modulo.Tabela)).isempty then exit;
  Modulo.Operacao:=toAlteracao;
  TFDQuery(a.FindComponent(Modulo.Tabela)).edit;
  Application.CreateForm(Modulo.FormularioCadastro, frm);
end;

procedure TfrmNavegar.actExcluirExecute(Sender: TObject);
begin
  if (usuario.codigo>0) and (not usuario.Admin) then
  begin
    if not TemAcesso(usuario.codigo, Modulo.Nome, 'exclusao') then
    begin
      MsgAtencao('Acesso negado.');
      exit;
    end;
  end;

  if Confirma('Confirma a exclusão do registro ?') then begin
     GravaLog(Modulo.Nome,TFDQuery(a.FindComponent(Modulo.Tabela)).FieldByName(Modulo.ChavePrimaria).AsString,'Exclusão');
     TFDQuery(a.FindComponent(Modulo.Tabela)).Delete;
     a.qryGeral.SQL.Text:='insert into exclusoes (data,tabela,chave,id) values '+
     '(:data,:tabela,:chave,:id)';
     a.qryGeral.ParamByName('data').AsDateTime:=date;
     a.qryGeral.ParamByName('tabela').AsString:=Modulo.Tabela;
     a.qryGeral.ParamByName('chave').AsString:=Modulo.ChavePrimaria;
     a.qryGeral.ParamByName('id').value:=TFDQuery(a.FindComponent(Modulo.Tabela)).FieldByName(Modulo.ChavePrimaria).value;
     a.qryGeral.ExecSQL;
     TFDQuery(a.FindComponent(MOdulo.Tabela)).open;
  end;
end;

procedure TfrmNavegar.actExportXLSExecute(Sender: TObject);
var linha, coluna : integer;
var planilha : variant;
var valorcampo : string;
begin
  planilha:= CreateoleObject('Excel.Application');
  planilha.WorkBooks.add(1);
  planilha.caption := Modulo.Nome;
  planilha.visible := false;

  TFDQuery(a.FindComponent(Modulo.Tabela)).DisableControls;
  MsgAguarde('Aguarde.');
  try
    TFDQuery(a.FindComponent(Modulo.Tabela)).First;
    for linha := 0 to TFDQuery(a.FindComponent(Modulo.Tabela)).RecordCount - 1 do
    begin
      for coluna := 1 to TFDQuery(a.FindComponent(Modulo.Tabela)).FieldCount do
      begin
        valorcampo := TFDQuery(a.FindComponent(Modulo.Tabela)).Fields[coluna - 1].AsString;
        planilha.cells[linha + 2,coluna] := valorCampo;
      end;
      TFDQuery(a.FindComponent(Modulo.Tabela)).Next;
    end;
    for coluna := 1 to TFDQuery(a.FindComponent(Modulo.Tabela)).FieldCount do
    begin
      valorcampo := TFDQuery(a.FindComponent(Modulo.Tabela)).Fields[coluna - 1].DisplayLabel;
      planilha.cells[1,coluna] := valorcampo;
    end;
    planilha.columns.Autofit;
  finally
    retiraAguarde;
    TFDQuery(a.FindComponent(Modulo.Tabela)).EnableControls;
    planilha.visible := True;
  end;
end;

procedure TfrmNavegar.actFiltrarExecute(Sender: TObject);
begin
  application.CreateForm(TfrmFiltro,frmFiltro);
  if frmFiltro.showmodal=mrOK then
    filtroPesquisa:=frmFiltro.resultadoFiltro;

    if trim(filtroPesquisa)<>'' then begin
      if TFDQuery(a.FindComponent(Modulo.Tabela)).Active then TFDQuery(a.FindComponent(Modulo.Tabela)).Close;
      TFDQuery(a.FindComponent(Modulo.Tabela)).sql.Text:='SELECT * FROM '+TFDQuery(a.FindComponent(Modulo.Tabela)).Name+
      ' WHERE '+filtroPesquisa;
      TFDQuery(a.FindComponent(Modulo.Tabela)).open;
    end;
    freeAndNil(frmFiltro);
end;

procedure TfrmNavegar.actImprimirExecute(Sender: TObject);
begin
  imprimir;
end;

procedure TfrmNavegar.actIncluirExecute(Sender: TObject);
var
  frm : TForm;
begin
  if (usuario.codigo>0) and (not usuario.Admin) then
  begin
    if not TemAcesso(usuario.codigo, Modulo.Nome, 'inclusao') then
    begin
      MsgAtencao('Acesso negado.');
      exit;
    end;
  end;

  Modulo.Operacao:=toInclusao;
  TFDQuery(a.FindComponent(Modulo.Tabela)).append;
  TFDQuery(a.FindComponent(Modulo.Tabela)).FieldByName(Modulo.ChavePrimaria).Value := 0;
  Application.CreateForm(MOdulo.FormularioCadastro, frm);
end;

procedure TfrmNavegar.actLogExecute(Sender: TObject);
begin
  if not pnlLog.Visible then
  begin
    log.Close;
    log.SQL.Text := 'select * from log where modulo=:modulo and chave=:chave order by data';
    log.ParamByName('modulo').AsString := Modulo.Nome;
    log.ParamByName('chave').AsString  := TFDQuery(a.FindComponent(Modulo.Tabela)).FieldByName(Modulo.ChavePrimaria).asstring;
    log.Open;
    pnlLog.Visible := true;
    gridLog.Controller.FocusFirstAvailableItem;
  end
  else
  begin
    log.Close;
    pnlLog.Visible := false;
    grid.SetFocus;
  end;
end;

procedure TfrmNavegar.actPesquisarExecute(Sender: TObject);
var
  ok : boolean;
begin
  Application.CreateForm(TFrmPesquisa, FrmPesquisa);
  with FrmPesquisa do begin
    retornoPesquisa:='0';
    tabelaPesq:=TFDQuery(a.FindComponent(Modulo.Tabela)).name;
    titulo:='Pesquisa de '+TFDQuery(a.FindComponent(Modulo.Tabela)).name;
    ok:=showModal=mrOK;
    if ok then Pesquisa;
    if retornoPesquisa<>'0' then begin
      if TFDQuery(a.FindComponent(Modulo.Tabela)).Active then TFDQuery(a.FindComponent(Modulo.Tabela)).Close;
      TFDQuery(a.FindComponent(Modulo.Tabela)).sql.Text:='SELECT * FROM '+TFDQuery(a.FindComponent(Modulo.Tabela)).Name+
      ' WHERE '+MOdulo.ChavePrimaria
      +'='+retornoPesquisa;//+FloatToSTr(retornoPesquisa);
      TFDQuery(a.FindComponent(Modulo.Tabela)).Active:=true;
    end;
  end;

end;

procedure TfrmNavegar.actSairExecute(Sender: TObject);
begin
  if pnlLog.Visible then
    actLogExecute(nil)
  else
    close;
end;

procedure TfrmNavegar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if TFDQuery(a.FindComponent(Modulo.Tabela)).active then
    TFDQuery(a.FindComponent(Modulo.Tabela)).close;

  Modulo := Default(TMOdulo);
  action:=cafree;
  FreeAndNil(frmNavegar);
end;

procedure TfrmNavegar.FormCreate(Sender: TObject);
begin
  qrRelatorioP := NIL;
  qrRelatorioP := TqrRelatorioP.Create(NIL);
  colecao := TButtonCollection.Create(catMenuItems.Categories[0]);
  btnIncluir:=TButtonItem.Create(colecao);
  btnAlterar:=TButtonItem.Create(colecao);
  btnExcluir:=TButtonItem.Create(colecao);
  btnPesquisar:=TButtonItem.Create(colecao);
  btnFiltrar:=TButtonItem.Create(colecao);
  btnImprimir:=TButtonItem.Create(colecao);
  btnLog:=TButtonItem.Create(colecao);
  btnSair:=TButtonItem.Create(colecao);

  btnIncluir.Action:=actIncluir;
  btnAlterar.Action:=actAlterar;
  btnExcluir.Action:=actExcluir;
  btnPesquisar.Action:=actPesquisar;
  btnFiltrar.Action:=actFiltrar;
  btnImprimir.Action:=actImprimir;
  btnLog.Action := actLog;
  btnSair.Action:=actSair;
end;

procedure TfrmNavegar.FormShow(Sender: TObject);
begin
  catMenuItems.Categories[0].Items.AddItem(btnIncluir,0);
  catMenuItems.Categories[0].Items.AddItem(btnAlterar,1);
  catMenuItems.Categories[0].Items.AddItem(btnExcluir,2);
  catMenuItems.Categories[0].Items.AddItem(btnPesquisar,3);
  catMenuItems.Categories[0].Items.AddItem(btnFiltrar,4);
  catMenuItems.Categories[0].Items.AddItem(btnImprimir,5);
  catMenuItems.Categories[0].Items.AddItem(btnLog,6);
  catMenuItems.Categories[0].Items.AddItem(btnSair,7);

  grid.DataSource        := TDataSource(a.FindComponent('ds'+Modulo.Tabela));
  DBNavigator1.DataSource:= TDataSource(a.FindComponent('ds'+Modulo.Tabela));
  if TFDQuery(a.FindComponent(Modulo.Tabela)).active then
    TFDQuery(a.FindComponent(Modulo.Tabela)).close;

  TFDQuery(a.FindComponent(Modulo.Tabela)).SQL.Text:='SELECT * FROM '+TFDQuery(a.FindComponent(Modulo.Tabela)).Name+' order by 1 ';
  TFDQuery(a.FindComponent(Modulo.Tabela)).Open;
  TFDQuery(a.FindComponent(Modulo.Tabela)).last;
  stbar.Panels[1].Text:=formatFloat('##,##0',TFDQuery(a.FindComponent(Modulo.Tabela)).RecordCount);
  lblTitle.Caption := Modulo.Titulo;
  grid.SetFocus;
end;

procedure TfrmNavegar.gridDblClick(Sender: TObject);
begin
  actAlterarExecute(nil);
end;

procedure TfrmNavegar.gridEnter(Sender: TObject);
begin
  if pnlLog.Visible then begin
    log.Close;
    pnlLog.Visible := false;
  end;
end;

procedure TfrmNavegar.gridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    actAlterarExecute(nil);
end;

procedure TfrmNavegar.gridTitleClick(Column: TColumn);
begin
  if TFDQuery(a.FindComponent(Modulo.Tabela)).active then TFDQuery(a.FindComponent(Modulo.Tabela)).close;
  TFDQuery(a.FindComponent(Modulo.Tabela)).SQL.clear;
  try
    TFDQuery(a.FindComponent(Modulo.Tabela)).SQL.Text:='SELECT * FROM '+
    TFDQuery(a.FindComponent(Modulo.Tabela)).Name+ifthen(trim(filtroPesquisa)<>'',' where '+filtroPesquisa,'')+
    ' order by '+TFDQuery(a.FindComponent(Modulo.Tabela)).Name+'.'+Column.Field.FieldName;
  except
     TFDQuery(a.FindComponent(Modulo.Tabela)).SQL.Text:='SELECT * FROM '+
     TFDQuery(a.FindComponent(Modulo.Tabela)).Name+
     ifthen(trim(filtroPesquisa)<>'',' where '+filtroPesquisa,'')+
     ' order by 1';
  end;

  TFDQuery(a.FindComponent(Modulo.Tabela)).Open;
  TFDQuery(a.FindComponent(Modulo.Tabela)).last;
  grid.SetFocus;
end;

procedure TfrmNavegar.Imprimir;
var
  campoOrdem : String;
  tamanho : Integer;
begin
  titulo:=' de '+Modulo.Tabela;
  campoOrdem:='';
  tamanho:=120;


 { if ordemPesquisa<>'' then
    campoOrdem:=qry.FieldByName(ordemPesquisa).DisplayName;
  }
{  if tabela<>'clientes' then begin
    qrRelatorio.PrintDBGrid(grid,
    'Listagem '+titulo,
    '',
    ifthen(trim(campoOrdem)<>'','Ordem do relatório: '+campoOrdem,''),
    '',
    '',
    '',
    '',
    '',
    '',
    false,tamanho);
  end else begin}
    qrRelatorioP.PrintDBGrid(grid,
    'Listagem '+titulo,
    '',
    ifthen(trim(campoOrdem)<>'','Ordem do relatório: '+campoOrdem,''),
    '',
    '',
    '',
    '',
    '',
    '',
    false);
//  end;
end;

function TfrmNavegar.TemAcesso(Aid_colaborador: real; Amodulo,
  Aoperacao: string): Boolean;
begin
  result := true;

 { a.qryAcesso.SQL.Text := 'select '+Aoperacao+' from acessos where '+
  'id_colaborador = :id_colaborador and modulo = :modulo and '+Aoperacao+'='+quotedStr('S');
  a.qryAcesso.ParamByName('id_colaborador').AsFloat := Aid_colaborador;
  a.qryAcesso.ParamByName('modulo').AsString := UpperCase(Amodulo);
  a.qryAcesso.Open;
  result := (not a.qryAcesso.IsEmpty);
  a.qryAcesso.Close;     }
end;


end.
