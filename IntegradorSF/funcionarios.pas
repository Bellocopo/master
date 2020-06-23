unit funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Padrao, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, msgLib;

type
  TfrmFuncionarios = class(TFrmPadrao)
    Label1: TLabel;
    Label10: TLabel;
    lb_im: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    edtNome: TDBEdit;
    edtSenha: TDBEdit;
    edtLogin: TDBEdit;
    ckbAdm: TDBCheckBox;
    edtConf: TEdit;
    procedure actGravarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFuncionarios: TfrmFuncionarios;

implementation

uses globais, rotinas, dm;


{$R *.dfm}

procedure TfrmFuncionarios.actGravarExecute(Sender: TObject);
begin
  if trim(edtSenha.text)<>trim(edtConf.text) then begin
    msgErro('Senha e confirmação não conferem.;Verifique sua senha.');
    exit;
  end;

  inherited;
end;

procedure TfrmFuncionarios.FormShow(Sender: TObject);
begin
  inherited;
  edtNome.setfocus;
  edtConf.text  := edtsenha.text;
  ckbAdm.visible:= usuario.Admin;
end;

end.
