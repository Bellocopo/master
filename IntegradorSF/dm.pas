unit dm;

interface

uses
  SysUtils, Classes, DB, ibx.IBDatabase, ibx.IBQuery, Dialogs,
  ibx.IBCustomDataSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, dmAPI, StrUtils;

type
  Ta = class(TDataModule)
    FDConnection1: TFDConnection;
    Log: TFDQuery;
    dtsLog: TDataSource;
    LogID: TFloatField;
    LogDATA: TSQLTimeStampField;
    LogID_FUNCIONARIO: TSmallintField;
    LogUSUARIO: TStringField;
    LogMODULO: TStringField;
    LogOPERACAO: TMemoField;
    LogCOMPUTADOR: TStringField;
    LogVERSAO: TStringField;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    qryGeral: TFDQuery;
    qry: TFDQuery;
    LogCHAVE: TStringField;
    funcionarios: TFDQuery;
    dsFuncionarios: TDataSource;
    funcionariosID_FUNCIONARIO: TSmallintField;
    funcionariosNOME: TStringField;
    funcionariosLOGIN: TStringField;
    funcionariosSENHA: TStringField;
    funcionariosADM: TStringField;
    Cheques__c: TFDQuery;
    dsCheques__c: TDataSource;
    Cheques__cID: TStringField;
    Cheques__cNUMERO_DO_PEDIDO__C: TFloatField;
    Cheques__cCOMISSAO__C: TCurrencyField;
    Cheques__cNAME: TFloatField;
    Cheques__cNUMERO_DO_CHEQUE__C: TSmallintField;
    Cheques__cSALDO_CHEQUES_NOTAS_PEDIDO__C: TFloatField;
    Cheques__cNOME_DO_CLIENTE__C: TStringField;
    Cheques__cREPRESENTANTE__C: TStringField;
    Cheques__cBAIXA_TOTAL_CHEQUE__C: TStringField;
    Cheques__cBAIXA_TOTAL_FATURA__C: TStringField;
    Cheques__cVALOR_PAGO_FATURA__C: TFloatField;
    Cheques__cVALOR__C: TFloatField;
    Cheques__cVALOR_FATURA__C: TFloatField;
    Cheques__cVALOR_PAGO_CHEQUE__C: TFloatField;
    Cheques__cVALOR_PAGO_COMISSAO_BON__C: TFloatField;
    Cheques__cVALOR_PAGO_COMISSAO_NOTA__C: TFloatField;
    Cheques__cCOMISSAO_BON__C: TFloatField;
    Cheques__cCOMISSAO_NOTA__C: TFloatField;
    Cheques__cDATA_NOTA_FISCAL__C: TSQLTimeStampField;
    Cheques__cDATA_COMISSAO_PAGA_BON__C: TSQLTimeStampField;
    Cheques__cDATA_COMISSAO_PAGA_NOTA__C: TSQLTimeStampField;
    Cheques__cDATA_ALTERACAO: TSQLTimeStampField;
    Cheques__cCOMISSAO_BON_PAGA__C: TStringField;
    Cheques__cCOMISSAO_NOTA_PAGA__C: TStringField;
    Cheques__cCOMISSAOTOTAL: TFloatField;
    Cheques__cQUITADONOTA: TStringField;
    Cheques__cQUITADOBON: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure AtualizaEstruturaBanco;
    procedure CriaUsuarioMaster;
    function ConectaBanco: Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  a: Ta;

implementation

uses globais, rotinas;

{$R *.dfm}

function Ta.ConectaBanco: Boolean;
begin
  FDConnection1.Connected := false;
  FDConnection1.Params.Clear;
  FDConnection1.DriverName := 'FB';
  FDConnection1.Params.Add('DriverID=FB');
  FDConnection1.Params.Add('Database=' + ValorIni(PastaTrabalho + '\banco.ini',
    'BANCO', 'database', PastaTrabalho + '\dados\dados.fdb'));
    FDConnection1.Params.Add('Protocol=' + ValorIni(PastaTrabalho +
    '\banco.ini', 'BANCO', 'Protocol', 'TCPIP'));
    FDConnection1.Params.Add('Server=' + ValorIni(PastaTrabalho + '\banco.ini',
    'BANCO', 'Server', 'localhost'));
    FDConnection1.Params.Add('Port=' + ValorIni(PastaTrabalho + '\banco.ini',
    'BANCO', 'Port', '3052'));

    FDConnection1.Params.Add('User_Name=SYSDBA');
    FDConnection1.Params.Add('Password=master');

    try
      FDConnection1.Open;
      result := true;
    except on  E: Exception do
      begin
        result := false;
        showmessage(
          'Falha na comunicação com o banco de dados.' + #13 +
          'Favor entrar em contato com o administrador do sistema.' + #13 + 'Erro:' +
         E.Message );
      end;
    end;
end;

procedure Ta.CriaUsuarioMaster;
begin
  qryGeral.SQL.Text :=
  { } 'SELECT id_funcionario ' +
  { } ' FROM FUNCIONARIOS ' +
  { } ' WHERE LOGIN="ADM" ';
  qryGeral.Open;

  if qryGeral.IsEmpty then
  begin
    qryGeral.close; qryGeral.SQL.Text :=
    { } 'INSERT INTO FUNCIONARIOS ' +
    { } ' (NOME,LOGIN,SENHA,ADM) values ("ADM","ADM","ADM","S") ';
    qryGeral.ExecSQL;
  end else
    qryGeral.close;
end;


procedure Ta.DataModuleCreate(Sender: TObject);
begin
  PastaTrabalho  := GetCurrentDir;
  sistema.versao := VersaoSistema;
  ConectaBanco;
  AtualizaEstruturaBanco;
end;

procedure Ta.AtualizaEstruturaBanco;
var
  i: Integer;
  LCampos : String;
begin
  // Atualiza a estrutura do banco de dados
  // Exemplo

  {
    try
    qryGeral.sql.Text:='select first 0 NOME_CAMPO from NOMETABELA';
    qryGeral.open;
    except
    qryGeral.close;
    qryGeral.sql.text:='alter table NOME_TABELA add NOME_CAMPO varchar(1)';
    qryGeral.ExecSQL;
    end;
  }



    try
      qryGeral.sql.Text:='select first 0 id from cheques__c';
      qryGeral.open;
    except
      qryGeral.close;
      qryGeral.sql.text:='CREATE TABLE cheques__c ('+
      ' Id VARCHAR(20) not null primary key'+
      ',Numero_do_pedido__c DOUBLE PRECISION'+
      ',comissao__c numeric(4,2)'+
      ',Name DOUBLE PRECISION'+
      ',Numero_do_cheque__c smallint'+
      ',Saldo_cheques_notas_pedido__c double precision'+
      ',Nome_do_cliente__c VARCHAR(200)'+
      ',Representante__c VARCHAR(200)'+
      ',Baixa_total_Cheque__c VARCHAR(1)'+
      ',Baixa_total_fatura__c VARCHAR(1)'+
      ',Valor_pago_fatura__c DOUBLE PRECISION'+
      ',Valor__c DOUBLE PRECISION'+
      ',Valor_fatura__c DOUBLE PRECISION'+
      ',Valor_pago_cheque__c DOUBLE PRECISION'+
      ',Valor_pago_comissao_bon__c DOUBLE PRECISION'+
      ',Valor_pago_comissao_nota__c DOUBLE PRECISION'+
      ',Comissao_bon__c DOUBLE PRECISION'+
      ',Comissao_nota__c DOUBLE PRECISION'+
      ',Data_nota_fiscal__c TIMESTAMP'+
      ',Data_comissao_paga_bon__c TIMESTAMP'+
      ',Data_comissao_paga_nota__c TIMESTAMP'+
      ',DATA_ALTERACAO timestamp default current_timestamp '+
      ',Comissao_bon_paga__c VARCHAR(1)'+
      ',Comissao_nota_paga__c VARCHAR(1)'+
      ',ComissaoTotal DOUBLE PRECISION'+
      ',QuitadoNota VARCHAR(1)'+
      ',QuitadoBon VARCHAR(1)'+
      ')';
      qryGeral.ExecSQL;

      qryGeral.sql.text:='create index IDX_ID on CHEQUES__C (ID)';
      qryGeral.ExecSQL;

      qryGeral.sql.text:='create index IDX_Numero_do_pedido__c on CHEQUES__C (Numero_do_pedido__c)';
      qryGeral.ExecSQL;

      qryGeral.sql.text:='create index IDX_NAME on CHEQUES__C (NAME)';
      qryGeral.ExecSQL;

      qryGeral.sql.text:='create index IDX_Data_nota_fiscal__c on CHEQUES__C (Data_nota_fiscal__c)';
      qryGeral.ExecSQL;

      qryGeral.sql.text:='create index IDX_Data_comissao_paga_bon__c on CHEQUES__C (Data_comissao_paga_bon__c)';
      qryGeral.ExecSQL;

      qryGeral.sql.text:='create index IDX_Data_comissao_paga_nota__c on CHEQUES__C (Data_comissao_paga_nota__c)';
      qryGeral.ExecSQL;
    end;
end;

end.
