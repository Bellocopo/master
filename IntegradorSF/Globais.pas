unit Globais;


interface

uses Vcl.StdCtrls, forms;

type
  TOperacao = (toSemOperacao, toInclusao, toAlteracao, toPesquisa);

  TSistema = record
    Nome : string;
    Versao: string;
    EditarRelatorio : boolean;
  end;

  TUsuario = record
    Codigo : real;
    Nome: string;
    Admin : boolean;
  end;

  TModulo = record
    Nome : string;
    Titulo : String;
    Tabela : String;
    ChavePrimaria : String;
    Gravou : Boolean;
    Operacao: TOperacao;
    FormularioCadastro : TFormClass;
  end;

var
  PastaTrabalho: String;
  mes: array [1 .. 12] of string = (
    'JANEIRO',
    'FEVEREIRO',
    'MARCO',
    'ABRIL',
    'MAIO',
    'JUNHO',
    'JULHO',
    'AGOSTO',
    'SETEMBRO',
    'OUTUBRO',
    'NOVEMBRO',
    'DEZEMBRO'
  );

  FormPrincipal : TForm;
  Sistema : TSistema;
  Usuario : TUsuario;
  Modulo  : TModulo;


  // API
  memo_log : TMemo;
  FArquivoINI : String;
  FBearer: String;
  FAPI : String;
  FURL : String;
  FLocation_id : String;
  FLocation_dest_id : String;
  FPartner_id : String;
  FProduct_uom : String;
  FState : String;
  FStateItens : String;

  // Sistema
  id_alteracao    : real = 0;
  chave_fk : string;
  tecla : boolean = false;
  salto : string = #13#10;

implementation

end.
