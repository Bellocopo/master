unit Pesquisa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, ExtCtrls, Buttons, Db,
  DBClient, DBCtrls, relatorioP,  Data.Win.ADODB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,StrUtils;

type
  TFrmPesquisa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    mePesquisa: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnIncluir: TBitBtn;
    btnAlterar: TBitBtn;
    dbGridPesquisa: TDBGrid;
    BitBtn1: TBitBtn;
    Campos: TClientDataSet;
    CamposIndice: TSmallintField;
    Timer1: TTimer;
    CamposTituloCampo: TStringField;
    DsCampos: TDataSource;
    CamposnomeCampo: TStringField;
    lcbPesquisa: TDBLookupComboBox;
    btnImpressao: TBitBtn;
    dsPesquisa: TDataSource;
    qryPesquisa: TFDQuery;
    procedure Pesquisa;
    procedure Timer1Timer(Sender: TObject);
    procedure mePesquisaChange(Sender: TObject);
    procedure TituloColunas;
    procedure pegaCamposTabela;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure mePesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbGridPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure dbGridPesquisaDblClick(Sender: TObject);
    procedure dbGridPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lcbPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbGridPesquisaTitleClick(Column: TColumn);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnImpressaoClick(Sender: TObject);
    procedure lcbPesquisaClick(Sender: TObject);
    procedure mePesquisaEnter(Sender: TObject);

  private
    { Private declarations }
  public
     tabelaPesq : String;
     sqlPesquisa : String;
     filtroPesquisa, filtro2 : String;
     ordemPesquisa : String;
     retornoPesquisa : string;
     titulo : String;
     chave_pesq : string;
  end;

var
  FrmPesquisa: TFrmPesquisa;
  qtdTempo : integer;
  qrRelatorioP: TqrRelatorioP;

implementation

uses dm, globais, rotinas, Relatorio;



{$R *.DFM}

{ TFrmPesquisaPadrao }

procedure TFrmPesquisa.Pesquisa;
var
 tipoString : boolean;
begin
  tipoString:=false;
//  if TrPesquisa.Active then TrPesquisa.CommitRetaining;

  sqlPesquisa:='SELECT * FROM '+tabelaPesq;

  if trim(filtroPesquisa)<>'' then begin
    sqlPesquisa:=SqlPesquisa+' WHERE '+filtroPesquisa;
  end;

  if trim(filtro2)<>'' then begin
    sqlPesquisa:=SqlPesquisa+ifthen(trim(filtroPesquisa)<>'',' AND ',' WHERE ')+filtro2;
  end;


  qryPesquisa.SQL.Text:=SqlPesquisa;
  if ordemPesquisa<>'' then
    qryPesquisa.SQL.Add('ORDER BY '+ordemPesquisa)
  else
    qryPesquisa.SQL.Add('ORDER BY 1');

  if trim(filtroPesquisa)<>'' then begin
    tipoString:=(a.FindComponent(tabelaPesq) as TFDQuery).FieldByName(CamposnomeCampo.AsString) is TStringField;
    if  not tipoString then
       qryPesquisa.ParamByName(CamposnomeCampo.Text).value:=mePesquisa.Text;
  end;
//  if TrPesquisa.Active then TrPesquisa.Commit;
  if qryPesquisa.Active then qryPesquisa.Close;
  qryPesquisa.Open;
  TituloColunas;
end;


procedure TFrmPesquisa.TituloColunas;
var
  i : Byte;
begin
  try
    with (a.findcomponent(tabelaPesq) as TFDQuery) do begin
      for i := 0 to DBGridPesquisa.Columns.count-1 do begin
        DBGridPesquisa.Columns.Items[i].Title.Caption  :=FieldByName(DBGridPesquisa.Columns.Items[i].FieldName).displayLabel;
        qryPesquisa.FieldByName(DBGridPesquisa.Columns.Items[i].FieldName).DisplayWidth:=FieldByName(DBGridPesquisa.Columns.Items[i].FieldName).DisplayWidth;
        DBGridPesquisa.Columns.Items[i].Visible:=FieldByName(DBGridPesquisa.Columns.Items[i].FieldName).Visible;
        if FieldByName(DBGridPesquisa.Columns.Items[i].FieldName) is TnumericField then
          (qryPesquisa.FieldByName(DBGridPesquisa.Columns.Items[i].FieldName) as TnumericField).DisplayFormat:=(FieldByName(DBGridPesquisa.Columns.Items[i].FieldName) as TnumericField).DisplayFormat;
      end;
    end;
  except
  end;
end;

procedure TFrmPesquisa.Timer1Timer(Sender: TObject);
begin
  inc(qtdTempo);
  if qtdTempo=3 then begin
    Pesquisa;
    Timer1.enabled:=false;
    qtdTempo:=0;
  end;
end;

procedure TFrmPesquisa.mePesquisaChange(Sender: TObject);
begin
  if trim(mePesquisa.Text)='' then
    filtroPesquisa:=''
  else begin
    if (a.FindComponent(tabelaPesq) as TFDQuery).FieldByName(CamposnomeCampo.AsString) is TStringField then
        filtroPesquisa:=CamposnomeCampo.AsString+' like '+#39+trim(mePesquisa.text)+'%'+#39
    else
      filtroPesquisa:=CamposnomeCampo.AsString+'=:'+CamposnomeCampo.AsString;
  end;

  Timer1.Enabled:=true;
end;

procedure TFrmPesquisa.mePesquisaEnter(Sender: TObject);
begin
//  mePesquisa.EditMask:=(a.findcomponent(tabelaPesq) as TFDQuery).FieldByName(CamposnomeCampo.AsString).EditMask;
end;

procedure TFrmPesquisa.pegaCamposTabela;
var
  i : integer;
begin
  Campos.CreateDataSet;

  for i:=0 to (a.findcomponent(tabelaPesq) as TFDQuery).FieldCount-1 do begin
    with (a.findcomponent(tabelaPesq) as TFDQuery) do begin
      if FieldByName(Fields[i].FieldName).Visible then begin
        Campos.Append;
        CamposIndice.asInteger:=FieldByName(Fields[i].FieldName).Index;
        CamposnomeCampo.AsString:=FieldByName(Fields[i].FieldName).FieldName;
        CamposTituloCampo.AsString:=FieldByName(Fields[i].FieldName).DisplayLabel;
        Campos.Post;
      end;
    end;
  end;

{  if pos('CLIENTE',upperCase(tabelaPesq))>0 then
    lcbPesquisa.KeyValue:=3
  else
    lcbPesquisa.KeyValue:=1;}

  if campos.Locate('nomecampo','DESCRICAO',[]) then
    lcbPesquisa.KeyValue:=2
  else if not Campos.Locate('nomecampo','NOME',[]) then
    lcbPesquisa.KeyValue:=2
  else // if Campos.Locate('Indice',1,[]) then
    lcbPesquisa.KeyValue:=1;
end;

procedure TFrmPesquisa.BitBtn1Click(Sender: TObject);
begin
  retornoPesquisa:='0';
  ModalResult:=mrCancel;
  Close;
end;

procedure TFrmPesquisa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Campos.Close;
end;

procedure TFrmPesquisa.FormShow(Sender: TObject);
begin
  pegaCamposTabela;
  if trim(titulo)<>'' then
    FrmPesquisa.Caption:=titulo;

  mePesquisa.SetFocus;
end;

procedure TFrmPesquisa.mePesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 40 then DBGridPesquisa.setfocus;
  if key = 13 then lcbPesquisa.SetFocus;
end;

procedure TFrmPesquisa.dbGridPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then DBGridPesquisaDblClick(nil);
end;

procedure TFrmPesquisa.dbGridPesquisaDblClick(Sender: TObject);
begin
  if upperCase(tabelaPesq)='CLIENTES' then
    retornoPesquisa:=qryPesquisa.Fields[1].asstring
  else
    retornoPesquisa:=qryPesquisa.Fields[0].asstring;

  qryPesquisa.close;
  modalResult:=mrok;
  Close;
end;

procedure TFrmPesquisa.dbGridPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then DBGridPesquisaDblClick(nil);
end;

procedure TFrmPesquisa.lcbPesquisaClick(Sender: TObject);
begin
  mePesquisa.SetFocus;
end;

procedure TFrmPesquisa.lcbPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then mePesquisa.setfocus
end;

procedure TFrmPesquisa.dbGridPesquisaTitleClick(Column: TColumn);
begin
  if ordemPesquisa<>'' then
      DBGridPesquisa.columns[qryPesquisa.FieldByName(ordemPesquisa).Index].Title.Color:=DBGridPesquisa.FixedColor;

  ordemPesquisa:=Column.FieldName;
  Pesquisa;
  DBGridPesquisa.columns[qryPesquisa.FieldByName(ordemPesquisa).Index].Title.Color:=clSilver;
end;

procedure TFrmPesquisa.btnIncluirClick(Sender: TObject);
var
  Frm : TForm;
  oldTabela : string;
begin
  oldTabela    := Modulo.Tabela;
  Modulo.Tabela:= tabelapesq;
  TFDQuery(a.FindComponent(tabelapesq)).append;
  Application.CreateForm(TFormClass(FindClass('TFrm'+tabelapesq)), frm);
  Modulo.Operacao:=toInclusao;
  Pesquisa;
  qryPesquisa.Last;
  Modulo.Tabela:=oldtabela;
  dbGridPesquisa.SetFocus;
end;

procedure TFrmPesquisa.FormCreate(Sender: TObject);
begin
  qrRelatorioP := NIL;
  qrRelatorioP := TqrRelatorioP.Create(NIL);
end;

procedure TFrmPesquisa.btnAlterarClick(Sender: TObject);
var
  Frm : TForm;
  oldTabela: string;
begin
  oldTabela:=Modulo.Tabela;
  Modulo.Tabela:=tabelapesq;
  Application.CreateForm(TFormClass(FindClass('TFrm'+tabelaPesq)), Frm);
  Frm.tag:=2;
  Modulo.Operacao:=toAlteracao;
  id_alteracao:=qryPesquisa.FieldByName('ID_'+copy(tabelaPesq,1,length(tabelaPesq)-1)).value;
  if not TFDQuery(a.FindComponent(tabelaPesq)).active then TFDQuery(a.FindComponent(tabelaPesq)).open;
  TFDQuery(a.FindComponent(tabelaPesq)).Locate('ID_'+copy(tabelaPesq,1,length(tabelaPesq)-1),id_alteracao,[]);
  TFDQuery(a.FindComponent(tabelaPesq)).edit;
  Modulo.Tabela:=oldtabela;
  Pesquisa;
end;

procedure TFrmPesquisa.btnImpressaoClick(Sender: TObject);
var
  campoOrdem : String;
//  tamanho : Integer;
begin
  campoOrdem:='';
//  tamanho:=120;

//  if UpperCase(tabelapesq)='PARTIDO' then
//    tamanho:=240;


  if ordemPesquisa<>'' then
    campoOrdem:=qryPesquisa.FieldByName(ordemPesquisa).DisplayName;

  qrRelatorioP.PrintDBGrid(DBGridPesquisa,
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
end;

end.

