unit Padrao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, Db, StdCtrls, DBCtrls,
  DBGrids, Data.Win.ADODB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Phys.ODBCBase,
  FireDAC.Comp.DataSet, Data.SqlExpr, System.Actions, Vcl.ActnList, Vcl.Mask,
  Variants, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, strUtils;

type
  TFrmPadrao = class(TForm)
    pnlBotao: TPanel;
    pnlLinha: TPanel;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    pnlCentro: TPanel;
    SpeedButton1: TSpeedButton;
    sbLocalizar: TSpeedButton;
    ActionList1: TActionList;
    actLocalizar: TAction;
    actCancelar: TAction;
    actGravar: TAction;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    function ValidaCampos(tabelaBanco: string): Boolean;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function pesquisaCampo(nomeTabela: String; campo_retorno: string = '';
      naoAtribuir: Boolean = false): string;
    procedure PadraoOnEnter(Sender: TObject);
    procedure PadraoOnExit(Sender: TObject);
    procedure MudaFoco;
    procedure actLocalizarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    function PegaAlteracoes(ATabela: TFDQuery): String;
  private
    { Private declarations }
  public
    { Public declarations }
    FNomeTabelaFK: String;
    FIDTabela: Real;
  end;

var
  FrmPadrao: TFrmPadrao;

implementation

uses dm, Rotinas, Globais, pesquisa;

{$R *.DFM}

procedure TFrmPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if tecla then
    exit;

  if Key = 13 then
  begin
    if (ActiveControl is TDBGrid)  then
    begin
      Key := 0;
      Key := 9
    end else
      if not (ActiveControl is TCxGrid) then
      begin
        Key := 0;
        Perform(WM_NEXTDLGCTL, 0, 0);
      end;
  end;
end;

procedure TFrmPadrao.FormCreate(Sender: TObject);
begin
  tag := 0;
end;

function TFrmPadrao.ValidaCampos(tabelaBanco: string): Boolean;
var
  i: integer;
  msgAviso: string;
begin
  result := true;
  if Modulo.Operacao = toInclusao then
  begin
    for i := 0 to TFDQuery(a.FindComponent(tabelaBanco)).FieldCount - 1 do
    begin
      with a.qryGeral do
      begin
        // Campos setados com a propriedade TAG = 1 são unicos e obrigatorios
        // Campos setados com a propriedade TAG = 2 são campos obrigatórios
        if TFDQuery(a.FindComponent(tabelaBanco))
          .FieldByName(TFDQuery(a.FindComponent(tabelaBanco))
          .Fields[i].FieldName).tag > 0 then
        begin

          // Verifica se existe campo com o valor já cadastrado na tabelaBanco
          if TFDQuery(a.FindComponent(tabelaBanco))
            .FieldByName(TFDQuery(a.FindComponent(tabelaBanco))
            .Fields[i].FieldName).tag = 1 then
          begin
            SQL.text := 'SELECT ' + TFDQuery(a.FindComponent(tabelaBanco))
              .FieldByName(TFDQuery(a.FindComponent(tabelaBanco))
              .Fields[i].FieldName).FieldName + '  FROM ' +
              TFDQuery(a.FindComponent(tabelaBanco)).name + '  WHERE ' +
              TFDQuery(a.FindComponent(tabelaBanco))
              .FieldByName(TFDQuery(a.FindComponent(tabelaBanco))
              .Fields[i].FieldName).FieldName + '=:valorCampo';
            ParamByName('valorCampo').value :=
              TFDQuery(a.FindComponent(tabelaBanco))
              .FieldByName(TFDQuery(a.FindComponent(tabelaBanco))
              .Fields[i].FieldName).value;
            Open;

            if not IsEmpty then
            begin
              msgAviso := msgAviso + TFDQuery(a.FindComponent(tabelaBanco))
                .FieldByName(TFDQuery(a.FindComponent(tabelaBanco))
                .Fields[i].FieldName).DisplayLabel + ' "' +
                TFDQuery(a.FindComponent(tabelaBanco))
                .FieldByName(TFDQuery(a.FindComponent(tabelaBanco))
                .Fields[i].FieldName).value + '"' + ' já possui cadastrado.'
                + #13 + #10;
            end;
          end;

          // Verifica se o campo esta vazio
          if trim(TFDQuery(a.FindComponent(tabelaBanco))
            .FieldByName(TFDQuery(a.FindComponent(tabelaBanco))
            .Fields[i].FieldName).AsString) = '' then
          begin
            msgAviso := msgAviso + 'Informe um valor para ' +
              TFDQuery(a.FindComponent(tabelaBanco))
              .FieldByName(TFDQuery(a.FindComponent(tabelaBanco))
              .Fields[i].FieldName).DisplayLabel + #13 + #10;
          end;

          SQL.Clear;
          Close;
        end;
      end;
    end;

    if trim(msgAviso) <> '' then
    begin
      showmessage(msgAviso);
      result := false;
    end;

  end;
end;

procedure TFrmPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Modulo.Gravou then
  begin
    if TFDQuery(a.FindComponent(Modulo.Tabela)).Active then
      TFDQuery(a.FindComponent(Modulo.Tabela)).Close;
    TFDQuery(a.FindComponent(Modulo.Tabela)).Open;
    TFDQuery(a.FindComponent(Modulo.Tabela)).locate(Modulo.ChavePrimaria, FIDTabela, [lopartialkey]);
  end;
  Action := cafree;
  FrmPadrao := nil;
end;

procedure TFrmPadrao.btnPesquisarClick(Sender: TObject);
var
  ok: Boolean;
begin
  Modulo.Operacao := toPesquisa;
  TrataControles(self);
  TFDQuery(a.FindComponent(Modulo.Tabela)).Active := true;
  Application.CreateForm(TFrmPesquisa, FrmPesquisa);
  with FrmPesquisa do
  begin
    retornoPesquisa := '0';
    tabelaPesq := TFDQuery(a.FindComponent(Modulo.Tabela)).name;
    titulo := 'Pesquisa de ' + TFDQuery(a.FindComponent(Modulo.Tabela)).name;
    ok := showModal = mrOK;
    if ok then
      pesquisa;
    // if retornoPesquisa>0 then begin
    if TFDQuery(a.FindComponent(Modulo.Tabela)).Active then
      TFDQuery(a.FindComponent(Modulo.Tabela)).Close;

    TFDQuery(a.FindComponent(Modulo.Tabela)).SQL.text := 'SELECT * FROM ' +
      TFDQuery(a.FindComponent(Modulo.Tabela)).name + ' WHERE  ' + Modulo.ChavePrimaria + '=' +
      retornoPesquisa; // FloatToSTr(retornoPesquisa);
    TFDQuery(a.FindComponent(Modulo.Tabela)).Active := true;
    // end;
  end;
end;

procedure TFrmPadrao.actCancelarExecute(Sender: TObject);
begin
  if not btnCancelar.Enabled then
    exit;
  if not confirma('Confirma cancelar a operação?') then
    exit;
  Modulo.Gravou := false;
  TFDQuery(a.FindComponent(Modulo.Tabela)).cancel;
  Close;
end;

procedure TFrmPadrao.actGravarExecute(Sender: TObject);
var
  Falteracoes: String;
begin
  try
    if not btnGravar.Enabled then
      exit;

    Modulo.Gravou := false;
    if not ValidaCampos(Modulo.Tabela) then
      exit;

    if (TFDQuery(a.FindComponent(Modulo.Tabela)).State <> dsInsert) and
      (TFDQuery(a.FindComponent(Modulo.Tabela)).State <> dsEdit) then
      TFDQuery(a.FindComponent(Modulo.Tabela)).edit;

    if usuario.codigo > 0 then
    begin
      if Modulo.Operacao = toInclusao then
        GravaLog(Modulo.Nome, TFDQuery(a.FindComponent(Modulo.Tabela)).FieldByName(Modulo.ChavePrimaria)
          .AsString, 'Inclusão')
      else
      begin
        Falteracoes := PegaAlteracoes(TFDQuery(a.FindComponent(Modulo.Tabela)));
        GravaLog(Modulo.Nome, TFDQuery(a.FindComponent(Modulo.Tabela)).FieldByName(Modulo.ChavePrimaria)
          .AsString, 'Alteração: ' + Falteracoes);
      end;
    end;

    TFDQuery(a.FindComponent(Modulo.Tabela)).Post;
    Modulo.Gravou := true;
    FIDTabela := TFDQuery(a.FindComponent(Modulo.Tabela)).FieldByName(Modulo.ChavePrimaria).value;
    Close;
  except
    on e: exception do
    begin
{      if TFDQuery(a.FindComponent(Modulo.Tabela)).Transaction.Active then
        TFDQuery(a.FindComponent(Modulo.Tabela)).Transaction.Rollback;}
      showmessage('Falha ao gravar os dados.' + #13 + e.Message);
    end;
  end;
end;

procedure TFrmPadrao.actLocalizarExecute(Sender: TObject);
begin
  if trim(FNomeTabelaFK) <> '' then
    pesquisaCampo(FNomeTabelaFK, chave_fk);
end;

procedure TFrmPadrao.btnSairClick(Sender: TObject);
begin
  if confirma('Deseja sair ?') then
    Close;
end;

procedure TFrmPadrao.FormShow(Sender: TObject);
begin
  MudaFoco;
  Modulo.Gravou := false;

  if Modulo.Operacao = toInclusao then
    Caption := Caption + ' - Inclusão';

  if Modulo.Operacao = toAlteracao then
  begin
    FrmPadrao.Caption := FrmPadrao.Caption + ' - Alteração';
    FIDTabela := TFDQuery(a.FindComponent(Modulo.Tabela)).FieldByName(Modulo.ChavePrimaria).Value;
  end;
end;

function TFrmPadrao.pesquisaCampo(nomeTabela: String;
  campo_retorno: String = ''; naoAtribuir: Boolean = false): string;
begin
  Application.CreateForm(TFrmPesquisa, FrmPesquisa);
  with FrmPesquisa do
  begin
    retornoPesquisa := '0';
    tabelaPesq := nomeTabela;
    chave_pesq := ifthen(trim(campo_retorno) <> '', campo_retorno, chave_fk);
    titulo := 'Pesquisa de ' + nomeTabela;
    pesquisa;
    showModal;
    try
      result := retornoPesquisa;
      if (retornoPesquisa <> '0') and (not naoAtribuir) then
      begin
        TFDQuery(a.FindComponent(Modulo.Tabela))
          .FieldByName(ifthen(trim(campo_retorno) <> '', campo_retorno, chave_fk))
          .value := retornoPesquisa;
      end;
    except
      // Tratamento de erro
    end;
  end;
end;

procedure TFrmPadrao.PadraoOnEnter(Sender: TObject);
begin
  // altera a cor do componente quando entrar o foco
  if (Sender is TEdit) then
    (Sender as TEdit).Color := clInfoBk;

  if (Sender is TMemo) then
    (Sender as TMemo).Color := clInfoBk;

  if (Sender is TDBEdit) then
    (Sender as TDBEdit).Color := clInfoBk;

  if (Sender is TDBMemo) then
    (Sender as TDBMemo).Color := clInfoBk;

  // Pega a tabel estrangeira para habilitar pesquisa
  if (Sender is TDBLookupComboBox) then
  begin
    FNomeTabelaFK := (Sender as TDBLookupComboBox).ListSource.DataSet.name;
    chave_fk := (Sender as TDBLookupComboBox).DataField;
    sbLocalizar.Visible := true;
  end;
end;

procedure TFrmPadrao.PadraoOnExit(Sender: TObject);
begin
  // altera a cor do componente quando sair o foco

  if (Sender is TEdit) then
    (Sender as TEdit).Color := clWindow;

  if (Sender is TMemo) then
    (Sender as TMemo).Color := clWindow;

  if (Sender is TDBEdit) then
    (Sender as TDBEdit).Color := clWindow;

  if (Sender is TDBMemo) then
    (Sender as TDBMemo).Color := clWindow;

  if (Sender is TDBLookupComboBox) then
  begin
    FNomeTabelaFK := '';
    sbLocalizar.Visible := false;
  end
end;

function TFrmPadrao.PegaAlteracoes(ATabela: TFDQuery): String;
var
  Falteracoes: String;
  i: integer;
begin
  for i := 0 to ATabela.FieldCount - 1 do
  begin
    if ATabela.Fields[i].NewValue <> ATabela.Fields[i].OldValue then
    begin
      if (upperCase(ATabela.Fields[i].FieldName) <> 'INCL_DATA') and
        (upperCase(ATabela.Fields[i].FieldName) <> 'MODI_DATA') and
        (upperCase(ATabela.Fields[i].FieldName) <> 'EXCL_DATA') then
      begin
        try
          Falteracoes := Falteracoes + ATabela.Fields[i].DisplayName + ': ' +
            ifthen(ATabela.Fields[i].OldValue = null, '',
            ATabela.Fields[i].OldValue) + ' > ' +
            ifthen(ATabela.Fields[i].NewValue = null, '',
            ATabela.Fields[i].NewValue) + #13;
        except
          //
        end;
      end;
    end;
  end;
  result := trim(Falteracoes);
end;

procedure TFrmPadrao.MudaFoco;
var
  i: integer;
begin
  { : muda a cor dos componentes }
  for i := 0 to ComponentCount - 1 do
  begin
    { : se for um Edit }
    if (Components[i] is TEdit) then
    begin
      (Components[i] as TEdit).OnExit := PadraoOnExit;
      (Components[i] as TEdit).OnEnter := PadraoOnEnter;
    end;
    { : se for um Memo }
    if (Components[i] is TMemo) then
    begin
      (Components[i] as TMemo).OnExit := PadraoOnExit;
      (Components[i] as TMemo).OnEnter := PadraoOnEnter;
    end;
    { : se for um DBEdit }
    if (Components[i] is TDBEdit) then
    begin
      (Components[i] as TDBEdit).OnExit := PadraoOnExit;
      (Components[i] as TDBEdit).OnEnter := PadraoOnEnter;
    end;
    { : se for um DBMemo }
    if (Components[i] is TDBMemo) then
    begin
      (Components[i] as TDBMemo).OnExit := PadraoOnExit;
      (Components[i] as TDBMemo).OnEnter := PadraoOnEnter;
    end;

    { : se for um DBLookupComboBox }
    if (Components[i] is TDBLookupComboBox) then
    begin
      (Components[i] as TDBLookupComboBox).OnExit := PadraoOnExit;
      (Components[i] as TDBLookupComboBox).OnEnter := PadraoOnEnter;
    end;
  end;

end;

end.
