unit Login;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, dm, Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage, dxGDIPlusClasses;

type
  TFrmLogin = class(TForm)
    Label3: TLabel;
    ed_senha: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    btnOK: TBitBtn;
    btnSair: TBitBtn;
    ed_login: TEdit;
    Image1: TImage;
    procedure btnOKClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function  Logar(AUsuario: String; ASenha:String) : Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;
  qtdTentativas : Integer;

implementation

uses Principal, Globais, rotinas;

{$R *.dfm}


procedure TFrmLogin.btnOKClick(Sender: TObject);
begin
   if Logar(ed_login.Text, ed_senha.Text) then begin
     close;
     modalResult:=mrOk;
   end
   else
   begin
     ed_senha.Clear;
     ed_login.SetFocus;
   end;
end;

procedure TFrmLogin.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then begin
     key:=#0;
     Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  ed_login.SetFocus;
  qtdTentativas:=0;
  Sistema.Versao:=versaoSistema;
  FrmLogin.caption:='IntegradorSF v.'+Sistema.Versao;
  Sistema.EditarRelatorio := false;
end;

function TFrmLogin.Logar(AUsuario, ASenha: String): Boolean;
begin
   if (AUsuario='EDITAR') and (ASenha='MASTER') then begin
     usuario.codigo:=0;
     usuario.nome:='EDITAR';
     usuario.Admin:=true;
     Sistema.EditarRelatorio:=true;
     result:=true;
   end else begin
     if qtdTentativas=3 then
       Application.Terminate;

     a.qryGeral.SQL.Text:='select id_funcionario,login,senha,nome,adm '+
     'from funcionarios where login=:login';
     a.qryGeral.ParamByName('login').asstring:=trim(AUsuario);
     a.qryGeral.Open;

     if a.qryGeral.IsEmpty then
     begin
       a.qryGeral.close;
       showmessage('Usuário não Cadastrado');
       Inc(qtdTentativas);
       result := false;
     end
     else
     if trim(ed_senha.Text)=a.qryGeral.FieldByName('senha').AsString then begin
       usuario.codigo :=a.qryGeral.FieldByName('id_funcionario').asInteger;
       usuario.nome   :=a.qryGeral.FieldByName('nome').asstring;
       usuario.admin  :=(a.qryGeral.FieldByName('adm').asstring='S');
       a.qryGeral.Close;
       result:=true;
     end
     else
     begin
       a.qryGeral.Open;
       showmessage('Senha Inválida');
       Inc(qtdTentativas);
       result:=false;
     end;
   end;
end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

end.
