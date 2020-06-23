program IntegradorSF;

uses
  Vcl.Forms,
  Vcl.Controls,
  System.SysUtils,
  Pedidos in 'Pedidos.pas' {frmPedidos},
  dmAPI in 'dmAPI.pas' {api: TDataModule},
  Globais in 'Globais.pas',
  Rotinas in 'Rotinas.pas',
  MsgLib in 'MsgLib.pas' {frMsg},
  Vcl.Themes,
  Vcl.Styles,
  dm in 'dm.pas' {a: TDataModule},
  navegar in 'navegar.pas' {frmNavegar},
  Padrao in 'Padrao.pas' {FrmPadrao},
  Login in 'Login.pas' {FrmLogin},
  Pesquisa in 'Pesquisa.pas' {FrmPesquisa},
  Relatorio in 'Relatorio.pas' {qrRelatorio},
  RelatorioP in 'RelatorioP.pas' {qrRelatorioP: TQuickRep},
  RelatorioPadrao in 'RelatorioPadrao.pas' {qrRelatorioPadrao: TQuickRep},
  filtro in 'filtro.pas' {frmFiltro},
  fastRep in 'fastRep.pas' {fr: TDataModule},
  vfuncionarios in 'vfuncionarios.pas' {frmVFuncionarios},
  funcionarios in 'funcionarios.pas' {frmFuncionarios},
  principal in 'principal.pas' {frmPrincipal},
  Cheques in 'Cheques.pas' {frmCheques};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Light');
  Application.CreateForm(Ta, a);
  Application.CreateForm(Tapi, api);
  Application.CreateForm(Tfr, fr);
  FrmLogin := TFrmLogin.Create(nil);
  if FrmLogin.ShowModal = mrOk then
  begin
    FreeAndNil(FrmLogin);
    Application.CreateForm(TFrmPrincipal, FrmPrincipal);
    Application.Run;
  end
  else
    Application.Terminate;
end.
