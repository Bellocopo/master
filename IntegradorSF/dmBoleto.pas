unit dmBoleto;

interface

uses
  System.SysUtils, System.Classes, REST.Types, REST.Client,
  REST.Authenticator.Basic, Data.Bind.Components, Data.Bind.ObjectScope;

type
  Tapi2 = class(TDataModule)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    HTTPBasicAuthenticator1: THTTPBasicAuthenticator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  api2: Tapi2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
