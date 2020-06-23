unit dmAPI;

interface

uses
  System.SysUtils, System.Classes, REST.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Authenticator.OAuth, StrUtils,
  Vcl.StdCtrls, DateUtils, variants, math, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.DApt, FireDAC.Phys.SQLiteVDataSet, Datasnap.DBClient;

type
  Tapi = class(TDataModule)
    RESTClientClientes: TRESTClient;
    RESTRequestClientes: TRESTRequest;
    RESTResponseClientes: TRESTResponse;
    RESTResponseDataSetAdapterClientes: TRESTResponseDataSetAdapter;
    Clientes: TFDMemTable;
    OAuth2AuthenticatorClientes: TOAuth2Authenticator;
    dtsClientes: TDataSource;
    RESTClientAcesso: TRESTClient;
    RESTRequestAcesso: TRESTRequest;
    RESTResponseAcesso: TRESTResponse;
    RESTResponseDataSetAdapterAcesso: TRESTResponseDataSetAdapter;
    Acesso: TFDMemTable;
    dtsAcesso: TDataSource;
    Clientesattributes: TWideStringField;
    ClientesId: TWideStringField;
    ClientesCNPJ__c: TWideStringField;
    ClientesName: TWideStringField;
    RESTClientPedidos: TRESTClient;
    RESTRequestPedidos: TRESTRequest;
    RESTResponsePedidos: TRESTResponse;
    RESTResponseDataSetAdapterPedidos: TRESTResponseDataSetAdapter;
    Pedidos: TFDMemTable;
    OAuth2AuthenticatorPedidos: TOAuth2Authenticator;
    dtsPedidos: TDataSource;
    RESTClientItens: TRESTClient;
    RESTRequestItens: TRESTRequest;
    RESTResponseItens: TRESTResponse;
    RESTResponseDataSetAdapterItens: TRESTResponseDataSetAdapter;
    ITEM: TFDMemTable;
    OAuth2AuthenticatorItens: TOAuth2Authenticator;
    dtsItem: TDataSource;
    Pedidosattributes: TWideStringField;
    PedidosOrderNumber: TWideStringField;
    PedidosData_para_programacao__c: TWideStringField;
    PedidosId: TWideStringField;
    PedidosPedido_TID__c: TWideStringField;
    PedidosRepresentante__c: TWideStringField;
    PedidosStatusDataProgramada__c: TWideStringField;
    PedidosTotalAmount: TWideStringField;
    ITEMattributes: TWideStringField;
    ITEMID_Odoo__c: TWideStringField;
    ITEMorigin__c: TWideStringField;
    ITEMmove_lines_location_dest_id_id__c: TWideStringField;
    ITEMmove_lines_location_id_id__c: TWideStringField;
    ITEMmove_lines_name__c: TWideStringField;
    ITEMmove_lines_product_uom_id__c: TWideStringField;
    ITEMnameOdoo__c: TWideStringField;
    ITEMmove_lines_date_expected__c: TWideStringField;
    ITEMOrderId: TWideStringField;
    ITEMOrderItemNumber: TWideStringField;
    ITEMCodigo_do_produto__c: TWideStringField;
    ITEMorder_line_product_id_odoo__c: TWideStringField;
    ITEMNome_do_produto__c: TWideStringField;
    ITEMdate_order__c: TWideStringField;
    ITEMQuantity: TWideStringField;
    ITEMUnitPrice: TWideStringField;
    ITEMTotalPrice: TWideStringField;
    ITEMmove_type__c: TWideStringField;
    PedidosSinc: TBooleanField;
    PedidosErro: TStringField;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    Resultado: TFDMemTable;
    DataSource1: TDataSource;
    PedidosOperacao: TStringField;
    RESTClientCheques: TRESTClient;
    RESTRequestCheques: TRESTRequest;
    RESTResponseCheques: TRESTResponse;
    RESTResponseDataSetAdapterCheques: TRESTResponseDataSetAdapter;
    Cheques: TFDMemTable;
    OAuth2AuthenticatorCheques: TOAuth2Authenticator;
    DtsCheques: TDataSource;
    Chequesattributes: TWideStringField;
    ChequesId: TWideStringField;
    ChequesNumero_do_cheque__c: TWideStringField;
    ChequesSaldo_cheques__c: TWideStringField;
    ChequesCreatedDate: TWideStringField;
    ChequesName: TWideStringField;
    ChequesNome_do_cliente__c: TWideStringField;
    ChequesRepresentante__c: TWideStringField;
    ChequesBaixa_total_Cheque__c: TWideStringField;
    ChequesBaixa_total_fatura__c: TWideStringField;
    ChequesSelecionado: TBooleanField;
    ChequesValor_pago_fatura__c: TCurrencyField;
    ChequesValor__c: TCurrencyField;
    ChequesValor_fatura__c: TCurrencyField;
    ChequesValor_pago_cheque__c: TCurrencyField;
    ChequesValor_pago_comissao_bon__c: TCurrencyField;
    ChequesValor_pago_comissao_nota__c: TCurrencyField;
    ChequesComissao_bon__c: TCurrencyField;
    ChequesComissao_nota__c: TCurrencyField;
    ChequesData_nota_fiscal__c: TDateTimeField;
    ChequesData_comissao_paga_bon__c: TDateTimeField;
    ChequesData_comissao_paga_nota__c: TDateTimeField;
    ChequesComissao_bon_paga__c: TStringField;
    ChequesComissao_nota_paga__c: TStringField;
    ChequesTvalor_pago_nota: TAggregateField;
    ChequesTcom_nota: TAggregateField;
    ChequesTpago_com_nota: TAggregateField;
    ChequesTvalor_pago_bon: TAggregateField;
    ChequesTvalor_com_bon: TAggregateField;
    ChequesTpago_com_bon: TAggregateField;
    RESTClientSF: TRESTClient;
    RESTRequestSF: TRESTRequest;
    RESTResponseSF: TRESTResponse;
    RESTResponseDataSetAdapterSF: TRESTResponseDataSetAdapter;
    ResultadoSF: TFDMemTable;
    Chequescomissao__c: TFloatField;
    ChequesComissaoTotal: TCurrencyField;
    RESTClientChequesFuturo: TRESTClient;
    RESTRequestChequesFuturo: TRESTRequest;
    RESTResponseChequesFuturo: TRESTResponse;
    RESTResponseDataSetAdapterChequesFuturo: TRESTResponseDataSetAdapter;
    ChequesFuturo: TFDMemTable;
    ChequesFuturoSelecionado: TBooleanField;
    ChequesFuturoattributes: TWideStringField;
    ChequesFuturoId: TWideStringField;
    ChequesFuturoNumero_do_pedido__c: TWideStringField;
    ChequesFuturocomissao__c: TFloatField;
    ChequesFuturoName: TWideStringField;
    ChequesFuturoNumero_do_cheque__c: TWideStringField;
    ChequesFuturoSaldo_cheques__c: TWideStringField;
    ChequesFuturoCreatedDate: TWideStringField;
    ChequesFuturoNome_do_cliente__c: TWideStringField;
    ChequesFuturoRepresentante__c: TWideStringField;
    ChequesFuturoBaixa_total_Cheque__c: TWideStringField;
    ChequesFuturoBaixa_total_fatura__c: TWideStringField;
    ChequesFuturoValor_pago_fatura__c: TCurrencyField;
    ChequesFuturoValor__c: TCurrencyField;
    ChequesFuturoValor_fatura__c: TCurrencyField;
    ChequesFuturoValor_pago_cheque__c: TCurrencyField;
    ChequesFuturoValor_pago_comissao_bon__c: TCurrencyField;
    ChequesFuturoValor_pago_comissao_nota__c: TCurrencyField;
    ChequesFuturoComissao_bon__c: TCurrencyField;
    ChequesFuturoComissao_nota__c: TCurrencyField;
    ChequesFuturoData_nota_fiscal__c: TDateTimeField;
    ChequesFuturoData_comissao_paga_bon__c: TDateTimeField;
    ChequesFuturoData_comissao_paga_nota__c: TDateTimeField;
    ChequesFuturoComissao_bon_paga__c: TStringField;
    ChequesFuturoComissao_nota_paga__c: TStringField;
    ChequesFuturoComissaoTotal: TCurrencyField;
    ChequesFuturoQuitadoNota: TBooleanField;
    ChequesFuturoQuitadoBon: TBooleanField;
    ChequesFuturoTvalor_pago_nota: TAggregateField;
    ChequesFuturoTcom_nota: TAggregateField;
    ChequesFuturoTpago_com_nota: TAggregateField;
    ChequesFuturoTvalor_pago_bon: TAggregateField;
    ChequesFuturoTvalor_com_bon: TAggregateField;
    ChequesFuturoTpago_com_bon: TAggregateField;
    OAuth2AuthenticatorChequesFuturo: TOAuth2Authenticator;
    DtsChequesFuturo: TDataSource;
    RESTClientPedidoWA: TRESTClient;
    RESTRequestPedidoWA: TRESTRequest;
    RESTResponsePedidoWA: TRESTResponse;
    RESTRespDataSetAdapterPedidoWA: TRESTResponseDataSetAdapter;
    pedidoWA: TFDMemTable;
    OAuth2AuthPedidoWA: TOAuth2Authenticator;
    dtsPedidoWA: TDataSource;
    ChequesTParcCheque: TAggregateField;
    ChequesNumero_do_pedido__c: TFloatField;
    ChequesStatusNota: TSmallintField;
    ChequesStatusBon: TSmallintField;
    ChequesNF100__c: TBooleanField;
    ChequesData_deposito__c: TDateTimeField;
    ChequesData_deposito_fatura__c: TDateTimeField;
    ChequesValorAtraso: TCurrencyField;
    ChequesPrevistoBon: TStringField;
    ChequesPrevistoNota: TStringField;
    FDConnSQLite: TFDConnection;
    dtsTemp: TDataSource;
    Temp: TFDMemTable;
    Tempcomissao__c: TFloatField;
    TempNumero_do_pedido__c: TFloatField;
    TempNome_do_cliente__c: TWideStringField;
    TempRepresentante__c: TWideStringField;
    TempValor__c: TCurrencyField;
    TempValor_fatura__c: TCurrencyField;
    TempComissao_bon__c: TCurrencyField;
    TempComissao_nota__c: TCurrencyField;
    TempData_nota_fiscal__c: TDateTimeField;
    TempComissaoTotal: TCurrencyField;
    TempNF100__c: TBooleanField;
    TempValorAtraso: TCurrencyField;
    ChequesNota_fiscal__c: TStringField;
    TempNota_fiscal__c: TStringField;
    dtsProjecao: TDataSource;
    Projecao: TFDMemTable;
    ProjecaoRepresentante__c: TWideStringField;
    ProjecaoComissaoTotal: TCurrencyField;
    ProjecaoPeriodo: TStringField;
    Representantes: TFDMemTable;
    dtsRep: TDataSource;
    RepresentantesNome: TStringField;
    TempPrev1: TCurrencyField;
    TempPrev2: TCurrencyField;
    TempPrev3: TCurrencyField;
    TempPrev4: TCurrencyField;
    PedidosPagos: TFDMemTable;
    PedidosPagosNumero: TFloatField;
    RepresentantesEmail: TStringField;
    TempPrevisto: TCurrencyField;
    procedure DataModuleCreate(Sender: TObject);
    procedure PedidosAfterScroll(DataSet: TDataSet);
    procedure RESTRequestAcessoAfterExecute(Sender: TCustomRESTRequest);
    procedure ChequesSelecionadoValidate(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    function ObterIDCliente(ACNPJ: String): String;
    procedure ObterPedidosPorData(AData: TDateTime);
    procedure ObterPedidosPorPeriodo(ADataI, ADataF: TDateTime);
    procedure ObterItensPorID(AOrderID: String);
    procedure ObterItensPorData(AData: TDateTime);
    procedure ObterItensPorPeriodo(ADataI, ADataF: TDateTime);
    procedure ObterPedidosPorIDCliente(AIDCliente: String);
    procedure ConsultaToken;
    function ConverterSFToOdoo(AOperacao: String = 'create'): String;
    function PostDataOdoo(AURL: String; ABody: String): Boolean;
    function PedidoOdoo(APedido: String; var AItens: TStringList): Integer;
    procedure ObterChequesEmAberto;
    function PatchDataSF(AURL: String; ABody: String): Boolean;
    function JSONChequeSF: String;
    procedure ObterChequesFuturos;
    procedure ObterPedidosWA;
    procedure MontaRelatorioComissoes;
  end;

var
  api: Tapi;

implementation

uses globais, rotinas;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

function Tapi.ConverterSFToOdoo(AOperacao: String = 'create'): String;
var
  FJSONOdoo: String;
  FDocumento: String;
  FData: TDateTime;
  FAcao: String;
  FStatus: string;
  FPedidoOdoo: Integer;
  FMoveLines: TStringList;

  function AddItens: String;
  var
    FItens: String;
    i: Integer;
    FIDMovLine: String;
  begin
    try
      api.ITEM.DisableControls;
      api.ITEM.First;
      i := 0;
      while not api.ITEM.Eof do
      begin
        if FPedidoOdoo > 0 then
          FIDMovLine := Trim(FMoveLines.Strings[i])
        else
          FIDMovLine := '0';

        FItens := FItens + ',' +
        { } '[' +
        { } ifthen(FPedidoOdoo = 0, '0,', '1,') +
        { } FIDMovLine + ',' +
        { } '{' +
        { } '"name": "' + api.ITEM.FieldByName('order_line_product_id_odoo__c')
          .AsString + '",' +
        { } '"product_id":' + api.ITEM.FieldByName('id_odoo__c')
          .AsString + ',' +
        { } '"location_id": ' + FLocation_id + ',' +
        { } '"location_dest_id": ' + FLocation_dest_id + ',' +
        { } '"product_uom": ' + FProduct_uom + ',' +
        { } '"product_uom_qty": ' + api.ITEM.FieldByName('Quantity')
          .AsString + ',' +
        { } '"state": "' + FStateItens + '"' +
        // { } '"quantity_done": ' + api.ITEM.FieldByName('Quantity').AsString +
        { } '}' +
        { } ']';
        api.ITEM.Next;
        inc(i);
      end;
    finally
      api.ITEM.EnableControls;
    end;

    delete(FItens, 1, 1);
    result := FItens;
  end;

begin
  api.ITEM.First;
  FMoveLines := TStringList.Create;

  FPedidoOdoo := PedidoOdoo('SP/VND/' + api.PedidosOrderNumber.AsString,
    FMoveLines);

  if FPedidoOdoo > 0 then
    AOperacao := 'write';

  FData := StrToDateTime(copy(api.PedidosData_para_programacao__c.AsString, 9,
    2) + '/' + copy(api.PedidosData_para_programacao__c.AsString, 6, 2) + '/' +
    copy(api.PedidosData_para_programacao__c.AsString, 1, 4)

    );

  FData := FData + 1;
  FStatus := UpperCase
    (Trim(RemoveAcento(api.PedidosStatusDataProgramada__c.AsString)));

  if (pos('FATURADO', FStatus) > 0) or (pos('TRANSPORTADORA', FStatus) > 0) or
    (pos('TRANSITO', FStatus) > 0) or (pos('ENTREGUE', FStatus) > 0) then
    FAcao := 'Concluir'
  else
    FAcao := '';

  FJSONOdoo :=
  { } '{' +
  { } '"jsonrpc":"2.0",' +
  { } '"method":"call",' +
  { } '"params":{' +
  { } '"service":"object",' +
  { } '"method":"execute",' +
  { } '"args":[' +
  { } '"' + FAPI + '",' +
  { } '2,' +
  { } '"desBe11o!",' +
  { } '"stock.picking",' +
  { } '"' + AOperacao + '",' + ifthen(FPedidoOdoo > 0, intToStr(FPedidoOdoo) +
    ',', '') +

  { } ifthen(FPedidoOdoo = 0, '[', '') +

  { } '{' +
  { } '"name":"SP/VND/' + api.PedidosOrderNumber.AsString + '",' +
  { } '"x_acao_a_fazer":"' + FAcao + '", ' +
  { } '"location_id": ' + FLocation_id + ',' + // 8
  { } '"location_dest_id": ' + FLocation_dest_id + ',' + // 5

  { } ifthen(FPedidoOdoo = 0, '"picking_type_id":2,', '') +

  { } '"partner_id":1,' +
  { } '"origin":"' + api.PedidosOrderNumber.AsString + '",' +
  { } '"move_type":"direct",' +
  { } '"scheduled_date":"' + FormatDateTime('yyyy-mm-dd', FData) + '",' +
  { } '"move_lines":[' + AddItens + '],' +
  { } '"state":"' + FState + '" ' +
  { } '}' +
  { } ifthen(FPedidoOdoo = 0, ']', '') +
  { } ']' +
  { } '}' +
  { } '}';
  result := FormatJSON(FJSONOdoo);
end;

procedure Tapi.DataModuleCreate(Sender: TObject);
begin
  PastaTrabalho := GetCurrentDir;
end;

function Tapi.JSONChequeSF: String;
var
  LJSONSF: String;
  LJsonBon  : String;
  LJsonNota : String;
begin
 if LowerCase(Trim(ChequesComissao_bon_paga__c.AsString))='true' then
 begin
  LJsonBon :=
    { } '"Valor_pago_comissao_bon__c":' + TrataValorStr(ChequesValor_pago_comissao_bon__c.AsString) + ',' +
    { } '"Data_comissao_paga_bon__c":"' + FormatDateTime('yyyy-mm-dd',ChequesData_comissao_paga_bon__c.AsDateTime) + '",' +
    { } '"Comissao_bon_paga__c":"'+LowerCase(ChequesComissao_bon_paga__c.AsString) + '"';
 end
 else
   LJsonBon :='';

 if LowerCase(Trim(ChequesComissao_nota_paga__c.AsString))='true' then
 begin
   LJsonNota :=
    { } '"Valor_pago_comissao_nota__c":' + TrataValorStr(ChequesValor_pago_comissao_nota__c.AsString) + ',' +
    { } '"Data_comissao_paga_nota__c":"' + FormatDateTime('yyyy-mm-dd',ChequesData_comissao_paga_nota__c.AsDateTime) + '",' +
    { } '"Comissao_nota_paga__c":"' +LowerCase(ChequesComissao_nota_paga__c.AsString) + '"';
 end
 else
   LJsonNota := '';
  LJSONSF := '{' +LJsonBon +ifthen((trim(LJsonBon)<>'') and (trim(LJsonNota)<>''),',','')+LJsonNota+'}';
  result := FormatJSON(LJSONSF);
end;

procedure Tapi.MontaRelatorioComissoes;
var
  LNumeroPedido: Real;
  teste: string;
  LFatorDataPag: Real;
  LFatorDataVenc: Real;
  LNumeroPrevisao: Real;
  xdia: Word;
  mesAtual: Word;
  xano: Word;
  LDataProximoMes: TDateTime;
  LProximoVenc : String;
  LMesAnoPrevisaoPag : String;
begin
  DecodeDate(Date,xano, mesAtual, xdia );
  LDataProximoMes := EncodeDate(xano, mesAtual+1, 1);
  LProximoVenc := formatDateTime('mm/yyyy',LDataProximoMes);

  Temp.Close;
  Temp.Open;

//  PedidosPagos.Close;
//  PedidosPagos.Open;

  Projecao.Close;
  Projecao.Open;

  Cheques.First;
  LNumeroPedido := 0;
  while not Cheques.Eof do
  begin
//    if api.ChequesSelecionado.AsBoolean then begin
      if LNumeroPedido<>ChequesNumero_do_pedido__c.AsFloat then
      begin
        LNumeroPedido  := ChequesNumero_do_pedido__c.AsFloat;
        if LNumeroPedido=21756 then
          teste :='';
        Temp.Append;
        TempNumero_do_pedido__c.AsFloat    := ChequesNumero_do_pedido__c.AsFloat;
        Tempcomissao__c.AsFloat            := Chequescomissao__c.AsFloat;
        TempNome_do_cliente__c.AsString    := ChequesNome_do_cliente__c.AsString;
        TempData_nota_fiscal__c.AsDateTime := ChequesData_nota_fiscal__c.AsDateTime;
        TempRepresentante__c.AsString      := ChequesRepresentante__c.AsString;
        TempNota_fiscal__c.AsString        := ChequesNota_fiscal__c.AsString;
        TempValor__c.AsCurrency            := ChequesValor__c.AsCurrency;
        TempValor_fatura__c.AsCurrency     := ChequesValor_fatura__c.AsCurrency;
        TempNF100__c.AsBoolean             := ChequesNF100__c.AsBoolean;
      end
      else
        temp.Edit;

        if (ChequesStatusBon.AsInteger <> 1) and (ChequesValor_pago_comissao_bon__c.AsCurrency>0) then
        begin
          TempComissao_bon__c.AsCurrency := ChequesComissao_bon__c.AsCurrency;
          TempComissaoTotal.AsCurrency   := TempComissaoTotal.AsCurrency+ChequesComissao_bon__c.AsCurrency;
        end;

        if (ChequesStatusNota.AsInteger<>1) and (ChequesValor_pago_comissao_nota__c.AsCurrency>0) then
        begin
          TempComissao_nota__c.AsCurrency := ChequesComissao_nota__c.AsCurrency;
          TempComissaoTotal.AsCurrency    := TempComissaoTotal.AsCurrency+ChequesComissao_nota__c.AsCurrency;
        end;

        if ( (Trim(ChequesPrevistoBon.AsString)<=FormatDateTime('mm/yyyy',date)) and
           ( (ChequesStatusBon.AsInteger=0) or (ChequesStatusBon.AsInteger=2)) ) or
           (  (Trim(ChequesPrevistoBon.AsString)>FormatDateTime('mm/yyyy',date)) and
             (ChequesStatusBon.AsInteger<>1) and (ChequesValor_pago_comissao_bon__c.AsCurrency>0)  ) then // Não quitados
        begin
          TempPrevisto.AsCurrency := TempPrevisto.AsCurrency+ChequesComissao_bon__c.AsCurrency;
        end;

        if ( (Trim(ChequesPrevistoNota.AsString)<=FormatDateTime('mm/yyyy',date)) and
           ((ChequesStatusNota.AsInteger=0) or (ChequesStatusNota.AsInteger=2)) ) or
           (  (Trim(ChequesPrevistoNota.AsString)>FormatDateTime('mm/yyyy',date)) and
             (ChequesStatusNota.AsInteger<>1) and (ChequesValor_pago_comissao_Nota__c.AsCurrency>0)  ) then // Não quitados
        begin
          TempPrevisto.AsCurrency := TempPrevisto.AsCurrency+ChequesComissao_nota__c.AsCurrency;
        end;

        TempValorAtraso.AsCurrency := TempValorAtraso.AsCurrency + ChequesValorAtraso.AsCurrency;
        Temp.Post;

      {******************** Previsões ********************}

      // Bonificação
      if (Trim(ChequesPrevistoBon.AsString)<>'') and
         (  ( Trim(ChequesPrevistoBon.AsString)>FormatDateTime('mm/yyyy',date) ) or
            ( Trim(ChequesPrevistoBon.AsString)<=FormatDateTime('mm/yyyy',date) ) ) and
         (ChequesStatusBon.AsInteger=2) and
         (ChequesComissao_bon__c.AsCurrency>0) and
         (ChequesValor_pago_comissao_bon__c.AsCurrency=0) then
      begin
        LFatorDataPag   := ObterDataPag;
        LFatorDataVenc  := ObterDataPrevPag(api.ChequesData_deposito__c.AsDateTime);
        LNumeroPrevisao := LFatorDataVenc-LFatorDataPag;

         // Joga os atrasados para a primeira previsão (mês seguinte)
        if LNumeroPrevisao<=0 then
        begin
          LNumeroPrevisao := 1;
          LMesAnoPrevisaoPag :=  LProximoVenc;
        end else
          LMesAnoPrevisaoPag :=  ChequesPrevistoBon.AsString;

        if (Trunc(LNumeroPrevisao)>=1) and (Trunc(LNumeroPrevisao)<=4) then
        begin
          temp.Edit;
          api.Temp.FieldByName('Prev'+FloatToStr(Trunc(LNumeroPrevisao))).AsCurrency :=  api.Temp.FieldByName('Prev'+FloatToStr(Trunc(LNumeroPrevisao))).AsCurrency+ChequesComissao_bon__c.AsCurrency;
          temp.Post;
        end;

        if not Projecao.Locate('Representante__C;Periodo',
        VarArrayOf([ChequesRepresentante__c.AsString,LMesAnoPrevisaoPag]),[]) then
        begin
          projecao.Append;
          ProjecaoRepresentante__c.AsString := ChequesRepresentante__c.AsString;
          ProjecaoPeriodo.AsString := LMesAnoPrevisaoPag;
          ProjecaoComissaoTotal.AsCurrency := ChequesComissao_bon__c.AsCurrency;
          projecao.Post;
        end
        else
        begin
          projecao.Edit;
          ProjecaoComissaoTotal.AsCurrency := ProjecaoComissaoTotal.AsCurrency+ChequesComissao_bon__c.AsCurrency;
          projecao.Post;
        end;
      end;


      // Faturas
      if (Trim(ChequesPrevistoNota.AsString)<>'') and
         (  ( Trim(ChequesPrevistoNota.AsString)>FormatDateTime('mm/yyyy',date) ) or
            ( Trim(ChequesPrevistoNota.AsString)<=FormatDateTime('mm/yyyy',date) ) ) and
         (ChequesStatusNota.AsInteger=2) and
         (ChequesComissao_Nota__c.AsCurrency>0) and
         (ChequesValor_pago_comissao_nota__c.AsCurrency=0) then
      begin
        LFatorDataPag   := ObterDataPag;
        LFatorDataVenc  := ObterDataPrevPag(api.ChequesData_deposito_fatura__c.AsDateTime);
        LNumeroPrevisao := LFatorDataVenc-LFatorDataPag;

        // Joga os atrasados para a primeira previsão (mês seguinte)
        if LNumeroPrevisao<=0 then
        begin
          LNumeroPrevisao := 1;
          LMesAnoPrevisaoPag :=  LProximoVenc;
        end else
          LMesAnoPrevisaoPag :=  ChequesPrevistoNota.AsString;

        if (Trunc(LNumeroPrevisao)>=1) and (Trunc(LNumeroPrevisao)<=4) then
        begin
          temp.Edit;
          api.Temp.FieldByName('Prev'+FloatToStr(Trunc(LNumeroPrevisao))).AsCurrency :=
            api.Temp.FieldByName('Prev'+FloatToStr(Trunc(LNumeroPrevisao))).AsCurrency+
              ChequesComissao_nota__c.AsCurrency;

          temp.Post;
        end;


        if not Projecao.Locate('Representante__C;Periodo',
        VarArrayOf([ChequesRepresentante__c.AsString,LMesAnoPrevisaoPag]),[]) then
        begin
          projecao.Append;
          ProjecaoRepresentante__c.AsString := ChequesRepresentante__c.AsString;
          ProjecaoPeriodo.AsString := LMesAnoPrevisaoPag;
          ProjecaoComissaoTotal.AsCurrency := ChequesComissao_Nota__c.AsCurrency;
          projecao.Post;
        end
        else
        begin
          projecao.Edit;
          ProjecaoComissaoTotal.AsCurrency := ProjecaoComissaoTotal.AsCurrency+ChequesComissao_Nota__c.AsCurrency;
          projecao.Post;
        end;
      end;

    Cheques.Next;
  end;
  Temp.First;
  Temp.IndexFieldNames := 'representante__c;numero_do_pedido__c';
end;

procedure Tapi.ObterChequesEmAberto;
var
  ano, mes, dia: Word;
  LDataFim: TDateTime;
begin
  DecodeDate(Date, ano, mes, dia);
  dia := DaysInAMonth(ano, mes - 1);
  mes := mes - 1;
  LDataFim := EncodeDate(ano, mes, dia);

  api.RESTRequestCheques.Params[0].Value :=
  { } 'Select+ID,Numero_do_pedido__c,Nota_fiscal__c,comissao__c,Numero_do_cheque__c,Saldo_cheques_notas_pedido__c,'
    +
  { } 'CreatedDate,Data_nota_fiscal__c,Data_comissao_paga_bon__c,' +
  { } 'Data_comissao_paga_nota__c,Name,Nome_do_cliente__c,Representante__c,' +
  { } 'Valor__c,Valor_fatura__c,Valor_pago_cheque__c,' +
  { } 'Comissao_bon__c,Comissao_bon_paga__c,Comissao_nota__c,Comissao_nota_paga__c,'
    +
  { } 'Valor_pago_comissao_bon__c,Valor_pago_comissao_nota__c,' +
  { } 'Valor_pago_fatura__c,Baixa_total_Cheque__c,Baixa_total_fatura__c,' +
  { } 'Data_deposito__c,Data_deposito_fatura__c,NF100__c+' +
  { } 'FROM+Cheque__c+' +
  { } 'WHERE+Cheque__c.pedido__c+IN+(Select+id+FROM+Order+WHERE+Order.Diferenca_comissao__c>0.10)+'
    +
  { } 'AND+(Data_nota_fiscal__c>=2020-02-01)+' +
  { } 'AND+(Data_nota_fiscal__c<=' + FormatDateTime('yyyy-mm-dd',LDataFim) + ')+' +
  // { }'AND+((Valor_pago_cheque__c>0+AND+Valor_pago_comissao_bon__c=null)+'+
  // { }'OR+(Valor_pago_fatura__c>0+AND+Valor_pago_comissao_nota__c=null))+'+
  // { }'AND+((Comissao_bon_paga__c=FALSE)+OR+(Comissao_nota_paga__c=FALSE))+'+
  // { }'AND+(Comissao_nota__c>0+OR+Comissao_bon__c>0)+'+
  { } 'order+by+Numero_do_pedido__c,Numero_do_cheque__c';

  api.RESTRequestCheques.Params[1].Value := 'Bearer ' + FBearer;
  try
    api.RESTRequestCheques.Execute;
  Except
    on e: Exception do
    begin
      // log('Falha ao consultar cheques.' + #13 + 'Erro:' + e.Message);
    end;
  end;
end;

function Tapi.ObterIDCliente(ACNPJ: String): String;
var
  FIDCliente: String;
begin
  log('Consultando ID do Cliente: ' + ACNPJ);

  api.RESTRequestClientes.Params[0].Value :=
  { } 'select+id,name,cnpj__c+' +
  { } 'from+account+where+cnpj__c=' + QuotedStr(somenteNumeros(ACNPJ));

  api.RESTRequestClientes.Params[1].Value := 'Bearer ' + FBearer;

  try
    try
      api.RESTRequestClientes.Execute;
      if not api.Clientes.IsEmpty then
        FIDCliente := Trim(api.ClientesId.AsString);
    Except
      on e: Exception do
      begin
        log('Falha ObterIDCliente. Erro:' + e.Message);
        FIDCliente := '';
      end;
    end;
  finally
    result := FIDCliente;
  end;
end;

procedure Tapi.ObterItensPorData(AData: TDateTime);
begin
  log('Consultando itens dos pedidos data: ' +
    FormatDateTime('dd/mm/yyyy', AData));

  api.RESTRequestItens.Params[0].Value :=
  { } 'SELECT+id_odoo__c,origin__c,move_lines_location_dest_id_id__c,' +
  { } 'move_lines_location_id_id__c,move_lines_name__c,' +
  { } 'move_lines_product_uom_id__c,nameOdoo__c,move_lines_date_expected__c,' +
  { } 'orderItem.OrderId,orderItem.OrderItemNumber,' +
  { } 'orderitem.Codigo_do_produto__c,order_line_product_id_odoo__c,' +
  { } 'orderitem.Nome_do_produto__c,orderitem.date_order__c,' +
  { } 'OrderItem.Quantity,OrderItem.UnitPrice,' +
  { } 'OrderItem.TotalPrice,move_type__c+FROM+ORDERitem+' +
  { } 'WHERE+' +
  { } 'move_lines_date_expected__c=' +
  { } QuotedStr(FormatDateTime('yyyy-mm-dd', AData));

  api.RESTRequestItens.Params[1].Value := 'Bearer ' + FBearer;
  try
    api.RESTRequestItens.Execute;
  Except
    on e: Exception do
    begin
      log('Falha ao consultar os pedidos.' + #13 + 'Erro:' + e.Message);
      exit;
    end;
  end;
end;

procedure Tapi.ObterItensPorID(AOrderID: String);
begin
  log('Consultando itens por ID. OrderID:' + AOrderID);
  api.RESTRequestItens.Params[0].Value :=
  { } 'SELECT+id_odoo__c,origin__c,move_lines_location_dest_id_id__c,' +
  { } 'move_lines_location_id_id__c,move_lines_name__c,' +
  { } 'move_lines_product_uom_id__c,nameOdoo__c,move_lines_date_expected__c,' +
  { } 'orderItem.OrderId,orderItem.OrderItemNumber,' +
  { } 'orderitem.Codigo_do_produto__c,order_line_product_id_odoo__c,' +
  { } 'orderitem.Nome_do_produto__c,orderitem.date_order__c,' +
  { } 'OrderItem.Quantity,OrderItem.UnitPrice,' +
  { } 'OrderItem.TotalPrice,move_type__c+FROM+ORDERitem+' +
  { } 'WHERE+orderItem.OrderId=' + QuotedStr(AOrderID);

  api.RESTRequestItens.Params[1].Value := 'Bearer ' + FBearer;
  try
    api.RESTRequestItens.Execute;
  Except
    on e: Exception do
    begin
      log('Falha ao consultar os pedidos.' + #13 + 'Erro:' + e.Message);
      exit;
    end;
  end;
end;

procedure Tapi.ObterItensPorPeriodo(ADataI, ADataF: TDateTime);
begin
  log('Consultando itens dos pedidos período: ' + FormatDateTime('dd/mm/yyyy',
    ADataI) + ' a ' + FormatDateTime('dd/mm/yyyy', ADataF));

  api.RESTRequestItens.Params[0].Value :=
  { } 'SELECT+id_odoo__c,origin__c,move_lines_location_dest_id_id__c,' +
  { } 'move_lines_location_id_id__c,move_lines_name__c,' +
  { } 'move_lines_product_uom_id__c,nameOdoo__c,move_lines_date_expected__c,' +
  { } 'orderItem.OrderId,orderItem.OrderItemNumber,' +
  { } 'orderitem.Codigo_do_produto__c,order_line_product_id_odoo__c,' +
  { } 'orderitem.Nome_do_produto__c,orderitem.date_order__c,' +
  { } 'OrderItem.Quantity,OrderItem.UnitPrice,' +
  { } 'OrderItem.TotalPrice,move_type__c+FROM+ORDERitem+' +
  { } 'WHERE+' +
  { } 'move_lines_date_expected__c>=' +
  { } QuotedStr(FormatDateTime('yyyy-mm-dd', ADataI)) + '+and+' +
  { } 'move_lines_date_expected__c<=' +
  { } QuotedStr(FormatDateTime('yyyy-mm-dd', ADataF));

  api.RESTRequestItens.Params[1].Value := 'Bearer ' + FBearer;
  try
    api.RESTRequestItens.Execute;
  Except
    on e: Exception do
    begin
      log('Falha ao consultar os pedidos.' + #13 + 'Erro:' + e.Message);
      exit;
    end;
  end;
end;

procedure Tapi.ObterPedidosPorData(AData: TDateTime);
begin
  log('Consultando pedidos data: ' + FormatDateTime('dd/mm/yyyy', AData));

  api.RESTRequestPedidos.Params[0].Value :=
  { } 'SELECT+OrderNumber,Data_para_programacao__c,Order.Id,' +
  { } 'Order.Pedido_TID__c,' +
  { } 'Order.Representante__c,Order.StatusDataProgramada__c,' +
  { } 'Order.TotalAmount+FROM+ORDER+' +
  { } 'WHERE+Data_para_programacao__c=' + FormatDateTime('yyyy-mm-dd', AData) +
  { } '+and+probabilidade__c>=0.75' +
  { } '+order+by+OrderNumber';

  api.RESTRequestPedidos.Params[1].Value := 'Bearer ' + FBearer;
  try
    api.RESTRequestPedidos.Execute;
  Except
    on e: Exception do
    begin
      log('Falha ao consultar os pedidos.' + #13 + 'Erro:' + e.Message);
    end;
  end;
end;

procedure Tapi.ObterPedidosPorIDCliente(AIDCliente: String);
begin
  log('Consultando pedidos cliente ID:' + AIDCliente);
  api.RESTRequestPedidos.Params[0].Value :=
  { } 'SELECT+OrderNumber,Data_para_programacao__c,Order.Id,' +
  { } 'Order.Pedido_TID__c,' +
  { } 'Order.Representante__c,Order.StatusDataProgramada__c,' +
  { } 'Order.TotalAmount+FROM+ORDER+' +
  { } 'WHERE+ACCOUNT.ID=' + QuotedStr(AIDCliente) +
  { } '+order+by+OrderNumber';

  api.RESTRequestPedidos.Params[1].Value := 'Bearer ' + FBearer;
  try
    api.RESTRequestPedidos.Execute;
  Except
    on e: Exception do
    begin
      log('Falha ao consultar os pedidos.' + #13 + 'Erro:' + e.Message);
    end;
  end;
end;

procedure Tapi.ObterPedidosPorPeriodo(ADataI, ADataF: TDateTime);
begin
  log('Consultando pedidos período: ' + FormatDateTime('dd/mm/yyyy', ADataI) +
    ' a ' + FormatDateTime('dd/mm/yyyy', ADataF));

  api.RESTRequestPedidos.Params[0].Value :=
  { } 'SELECT+OrderNumber,Data_para_programacao__c,Order.Id,' +
  { } 'Order.Pedido_TID__c,' +
  { } 'Order.Representante__c,Order.StatusDataProgramada__c,' +
  { } 'Order.TotalAmount+FROM+ORDER+' +
  { } 'WHERE+Data_para_programacao__c>=' + FormatDateTime('yyyy-mm-dd', ADataI)
    + '+and+' +
  { } 'Data_para_programacao__c<=' + FormatDateTime('yyyy-mm-dd', ADataF) +
  { } '+and+probabilidade__c>=0.75' +
  { } '+order+by+OrderNumber';
  api.RESTRequestPedidos.Params[1].Value := 'Bearer ' + FBearer;
  try
    api.RESTRequestPedidos.Execute;
  Except
    on e: Exception do
    begin
      log('Falha ao consultar os pedidos (Período) .' + #13 + 'Erro:' +
        e.Message);
    end;
  end;

end;

procedure Tapi.ObterPedidosWA;
begin
  api.RESTRequestPedidoWA.Params[0].Value :=
    'select+id,orderNumber,celular_cliente__c+from+order+' +
    'where+nomecliente__c=''SIMULAÇÃO''+and+enviar_whatsapp__c=''S''';
  api.RESTRequestPedidoWA.Params[1].Value := 'Bearer ' + FBearer;
  try
    api.RESTRequestPedidoWA.Execute;
  Except
    on e: Exception do
    begin
      // log('Falha ao consultar PedidosWA.' + #13 + 'Erro:' + e.Message);
    end;
  end;
end;

function Tapi.PedidoOdoo(APedido: String; var AItens: TStringList): Integer;
var
  FErro: String;
  FJSON: String;
  lista: TStringList;
begin
  log('Consultando dados Odoo');
  log('JSON Gerado:  ');
  log('Pedido: ' + APedido);
  log('--------------------------------------------------');
  lista := TStringList.Create;

  try
    RESTClient1.BaseURL := Trim(FURL);
    RESTResponseDataSetAdapter1.RootElement := 'result';

    FJSON :=
    { } '{' +
    { } '"jsonrpc":"2.0",' +
    { } '"method":"call",' +
    { } '"params":{' +
    { } '"service":"object",' +
    { } '"method":"execute",' +
    { } '"args":[' + '"' + FAPI +
    { } '",' +
    { } '2,' +
    { } '"desBe11o!",' +
    { } '"stock.picking", "search_read",' +
    { } '[["name", "=", "' + APedido + '"]],' +
    { } '["id","move_lines"]' +
    { } ']' +
    { } '}' +
    { } '}';

    RESTRequest1.Params.ParameterByName('body').Value := FormatJSON(FJSON);
    FErro := '';

    try
      RESTRequest1.Execute;
      if Resultado.FindField('id') <> nil then
      begin
        if Trim(somenteNumeros(Resultado.FieldByName('id').AsString)) <> '' then
        begin
          result := StrToInt
            (Trim(somenteNumeros(Resultado.FieldByName('id').AsString)));

          if result > 0 then
          begin
            lista.Text := Trim(Resultado.FieldByName('move_lines').AsString);
            lista.Text := StringReplace(lista.Text, '[', '', [rfReplaceAll]);
            lista.Text := StringReplace(lista.Text, ']', '', [rfReplaceAll]);
            lista.Text := StringReplace(lista.Text, ',', #13, [rfReplaceAll]);
            AItens.Text := lista.Text;
          end
          else
            AItens.Text := '';
        end
        else
          result := 0;
      end
      else
      begin
        result := 0;
        AItens.Text := '';
      end;
    Except
      on e: Exception do
      begin
        log('Falha consultar dados via API Odoo.' + #13 + 'Erro:' + e.Message);
        log('--------------------------------------------------');
        result := 0;
        FErro := e.Message;
        AItens.Text := '';
      end;
    end;
  finally
    RESTResponseDataSetAdapter1.RootElement := '';
    if result > 0 then
    begin
      log('ID Pedido Odoo: ' + intToStr(result));
      log('--------------------------------------------------');
    end;
    log(RESTResponse1.JSONText);
    log('--------------------------------------------------');
    FreeAndNil(lista);
    api.Resultado.Close;
  end;
end;

procedure Tapi.PedidosAfterScroll(DataSet: TDataSet);
begin
  ITEM.Filter := 'orderid=' + QuotedStr(api.PedidosId.AsString);
  ITEM.Filtered := true;
end;

function Tapi.PostDataOdoo(AURL, ABody: String): Boolean;
var
  FErro: String;
begin
  log('Integrando pedido [Odoo]');
  log('JSON Gerado:  ');
  log('Pedido: ' + api.PedidosOrderNumber.AsString);
  log('--------------------------------------------------');

  try
    RESTClient1.BaseURL := Trim(AURL);
    RESTRequest1.Params.ParameterByName('body').Value := Trim(ABody);
    FErro := '';

    try
      RESTRequest1.Execute;
      if Resultado.FindField('result') <> nil then
        result := true
      else
        raise Exception.Create(Resultado.FieldByName('error').AsString);
    Except
      on e: Exception do
      begin
        log('Falha ao inserir dados via API Odoo.' + #13 + 'Erro:' + e.Message);
        log('--------------------------------------------------');
        result := false;
        FErro := e.Message
      end;
    end;
  finally
    if result then
    begin
      log('Dado inserido com sucesso.');
      log('--------------------------------------------------');
    end;
    log(RESTResponse1.JSONText);
    log('--------------------------------------------------');

    api.Pedidos.Edit;

    if result then
    begin
      if pos('"create",', ABody) > 0 then
        api.PedidosOperacao.AsString := 'Inserido'
      else if pos('"write",', ABody) > 0 then
        api.PedidosOperacao.AsString := 'Alterado';
    end;

    api.PedidosSinc.AsBoolean := result;
    api.PedidosErro.AsString := copy(FErro, 1, 255);
    api.Pedidos.Post;
  end;
end;

procedure Tapi.RESTRequestAcessoAfterExecute(Sender: TCustomRESTRequest);
begin
  log(Sender.ToString);
end;

procedure Tapi.ChequesSelecionadoValidate(Sender: TField);
var
  LBaixar : boolean;
  LFatorPagamento: Integer;
  LNumeroPedido: Real;
  teste: string;

  procedure MarcarDadosNota(ABaixarPagamento:Boolean);
  begin
    if ABaixarPagamento then
    begin
      // Faturas | StatusNota = 0 - Aberto | 1 - Quitado | 2 - Futuro/Outros
      if ChequesStatusNota.AsInteger = 0 then
      begin
        if (ChequesValor_pago_fatura__c.Value > 0) and
          (ChequesComissao_nota_paga__c.Value = 'False') then
        begin
          ChequesValor_pago_comissao_nota__c.AsCurrency := ChequesComissao_nota__c.AsCurrency;
          ChequesData_comissao_paga_nota__c.AsDateTime  := Date;
          ChequesComissao_nota_paga__c.Value            := 'True';
        end;
      end;
    end
    else
    begin
      if ChequesStatusNota.AsInteger = 0 then
      begin
        if ChequesComissao_nota_paga__c.Value = 'True' then
        begin
          ChequesValor_pago_comissao_nota__c.Clear;
          ChequesData_comissao_paga_nota__c.Clear;
          ChequesComissao_nota_paga__c.Value := 'False';
        end;
      end;
    end;
  end;

  procedure MarcarDadosCheque(ABaixarPagamento:Boolean);
  begin
    if ABaixarPagamento then
    begin
      // Cheques | StatusBon = 0 - Aberto | 1 - Quitado | 2 - Futuro/Outros
      if ChequesStatusBon.AsInteger = 0 then
      begin
        if (ChequesStatusBon.AsInteger=0) and //(ChequesValor_pago_cheque__c.Value > 0) and
           (ChequesComissao_bon_paga__c.Value = 'False') then
        begin
          ChequesValor_pago_comissao_bon__c.AsCurrency  := ChequesComissao_bon__c.AsCurrency;
          ChequesData_comissao_paga_bon__c.AsDateTime   := Date;
          ChequesComissao_bon_paga__c.Value            := 'True';
        end;
      end;
    end
    else
    begin
      if ChequesStatusBon.AsInteger = 0 then
      begin
        if ChequesComissao_bon_paga__c.Value = 'True' then
        begin
          ChequesValor_pago_comissao_bon__c.Clear;
          ChequesData_comissao_paga_bon__c.Clear;
          ChequesComissao_bon_paga__c.Value := 'False';
        end;
      end;
    end;
  end;


{
  procedure MarcarDadosCheque(ABaixarPagamento:Boolean);
  begin
    if ABaixarPagamento then
    begin
      // Cheques | StatusBon = 0 - Aberto | 1 - Quitado | 2 - Futuro/Outros
      if ChequesStatusBon.AsInteger = 0 then
      begin
        if (ChequesValor_pago_cheque__c.Value > 0) and
          (ChequesComissao_bon_paga__c.Value = 'False') then
        begin
          if (RoundTo(api.ChequesValor_pago_cheque__c.AsFloat, -2) >
            RoundTo(api.ChequesValor__c.AsFloat, -2)) and
            (Trunc(api.ChequesValor__c.AsFloat) > 0) then
          begin
            LFatorPagamento := Trunc(api.ChequesValor_pago_cheque__c.AsFloat/api.ChequesValor__c.AsFloat);
            LNumeroPedido   := api.ChequesNumero_do_pedido__c.AsFloat;
            if LFatorPagamento > 1 then
            begin
              try
                ChequesSelecionado.OnValidate := nil;
                while LNumeroPedido = api.ChequesNumero_do_pedido__c.AsFloat do
                begin
                 if not (api.Cheques.State in [dsEdit])  then
                   api.Cheques.Edit;

                  MarcarDadosNota(ABaixarPagamento);
                  if (api.ChequesNumero_do_cheque__c.AsInteger <= LFatorPagamento) and
                     ( LNumeroPedido = api.ChequesNumero_do_pedido__c.AsFloat)     then
                  begin
                    if ChequesSelecionado.AsBoolean<>ABaixarPagamento then
                      ChequesSelecionado.AsBoolean := ABaixarPagamento;

                    ChequesValor_pago_comissao_bon__c.Value := ChequesComissao_bon__c.Value;
                    ChequesData_comissao_paga_bon__c.Value  := Date;
                    ChequesComissao_bon_paga__c.Value := 'True';
                    cheques.Post;
                  end;
                  api.Cheques.Next;
                end;
              finally
                ChequesSelecionado.OnValidate := ChequesSelecionadoValidate;
              end;
            end
            else
            begin
              ChequesValor_pago_comissao_bon__c.Value := ChequesComissao_bon__c.Value;
              ChequesData_comissao_paga_bon__c.Value  := Date;
              ChequesComissao_bon_paga__c.Value       := 'True';
            end;
          end
          else
          begin
            ChequesValor_pago_comissao_bon__c.Value := ChequesComissao_bon__c.Value;
            ChequesData_comissao_paga_bon__c.Value  := Date;
            ChequesComissao_bon_paga__c.Value       := 'True';
          end;
        end;
      end;
    end
    else
    begin
      // Cheque | StatusBon = 0 - Aberto | 1 - Quitado | 2 - Futuro/Outros
      if ChequesStatusBon.AsInteger = 0 then
      begin
        if ChequesComissao_bon_paga__c.Value = 'True' then
        begin
          if (RoundTo(api.ChequesValor_pago_cheque__c.AsFloat, -2) >
            RoundTo(api.ChequesValor__c.AsFloat, -2)) and
            (Trunc(api.ChequesValor__c.AsFloat) > 0) then
          begin
            LFatorPagamento := Trunc(api.ChequesValor_pago_cheque__c.AsFloat/api.ChequesValor__c.AsFloat);
            LNumeroPedido := api.ChequesNumero_do_pedido__c.AsFloat;
            if LFatorPagamento > 1 then
            begin
              try
                ChequesSelecionado.OnValidate := nil;
                while LNumeroPedido = api.ChequesNumero_do_pedido__c.AsFloat do
                begin
                  if not (api.Cheques.State in [dsEdit])  then
                    api.Cheques.Edit;

                  MarcarDadosNota(ABaixarPagamento);
                  if api.ChequesNumero_do_cheque__c.AsInteger <= LFatorPagamento
                  then
                  begin
                    if ChequesSelecionado.AsBoolean=ABaixarPagamento then
                      ChequesSelecionado.AsBoolean := ABaixarPagamento;

                    ChequesValor_pago_comissao_bon__c.Value := 0;
                    ChequesData_comissao_paga_bon__c.Clear;
                    ChequesComissao_bon_paga__c.Value := 'False';
                  end;
                  api.Cheques.Next;
                end;
              finally
                ChequesSelecionado.OnValidate := ChequesSelecionadoValidate;
              end;
            end
            else
            begin
              ChequesValor_pago_comissao_bon__c.Value := 0;
              ChequesData_comissao_paga_bon__c.Clear;
              ChequesComissao_bon_paga__c.Value := 'False';
            end;
          end
          else
          begin
            ChequesValor_pago_comissao_bon__c.Value := 0;
            ChequesData_comissao_paga_bon__c.Clear;
            ChequesComissao_bon_paga__c.Value := 'False';
          end;
        end;
      end;
    end;
  end;
}
begin
  if api.ChequesNumero_do_pedido__c.AsFloat = 21756 then
    teste := '';

  if ((ChequesStatusBon.AsInteger = 0) or (ChequesStatusNota.AsInteger = 0))
  then
  begin
    LBaixar := ChequesSelecionado.AsBoolean;
    MarcarDadosNota(LBaixar);
    MarcarDadosCheque(LBaixar);
  end;
end;

procedure Tapi.ConsultaToken;
begin
  // Solicita o token
  try
    log('Consultando Token');
    api.RESTRequestAcesso.Execute;
    FBearer := api.Acesso.Fields[0].Value;
    api.Acesso.Close;
  Except
    on e: Exception do
    begin
      log('Falha ao solicitar token de acesso.' + #13 + 'Erro:' + e.Message);
      exit;
    end;
  end;
end;

function Tapi.PatchDataSF(AURL, ABody: String): Boolean;
var
  FErro: String;
begin
  try
    RESTClientSF.BaseURL := Trim(AURL);
    RESTRequestSF.Params[0].Value := 'Bearer ' + FBearer;
    RESTRequestSF.Params.ParameterByName('body').Value := Trim(ABody);
    FErro := '';

    try

      RESTRequestSF.Execute;
      result := true;
      { if Resultado.FindField('result') <> nil then
        result := true
        else
        raise Exception.Create(Resultado.FieldByName('error').AsString); }
    Except
      on e: Exception do
      begin
        // log('Falha ao inserir dados via API Odoo.' + #13 + 'Erro:' + e.Message);
        // log('--------------------------------------------------');
        result := false;
        FErro := e.Message
      end;
    end;
  finally
    if result then
    begin
      // log('Dado inserido com sucesso.');
      // log('--------------------------------------------------');
    end;
    // log(RESTResponseSF.JSONText);
    // log('--------------------------------------------------');
  end;
end;

procedure Tapi.ObterChequesFuturos;
var
  ano, mes, dia: Word;
  LDataFim: TDateTime;
begin
  DecodeDate(Date, ano, mes, dia);
  dia := DaysInAMonth(ano, mes - 1);
  mes := mes - 1;
  LDataFim := EncodeDate(ano, mes, dia);

  api.RESTRequestChequesFuturo.Params[0].Value :=
  { } 'Select+ID,Numero_do_pedido__c,comissao__c,Numero_do_cheque__c,Saldo_cheques_notas_pedido__c,'
    +
  { } 'CreatedDate,Data_nota_fiscal__c,Data_comissao_paga_bon__c,' +
  { } 'Data_comissao_paga_nota__c,Name,Nome_do_cliente__c,Representante__c,' +
  { } 'Valor__c,Valor_fatura__c,Valor_pago_cheque__c,' +
  { } 'Comissao_bon__c,Comissao_bon_paga__c,Comissao_nota__c,Comissao_nota_paga__c,'
    +
  { } 'Valor_pago_comissao_bon__c,Valor_pago_comissao_nota__c,' +
  { } 'Valor_pago_fatura__c,Baixa_total_Cheque__c,Baixa_total_fatura__c,' +
  { } 'Data_deposito__c,Data_deposito_fatura__c,NF100__c+' +
  { } 'FROM+Cheque__c+' +
  { } 'WHERE+Cheque__c.pedido__c+IN+(Select+id+FROM+Order+WHERE+Order.Saldo_cheques__c>0)+'
    +
  { } 'AND+(Data_nota_fiscal__c>' + FormatDateTime('yyyy-mm-dd',
    LDataFim) + ')+' +
  // { }'AND+((Valor_pago_cheque__c>0+AND+Valor_pago_comissao_bon__c=null)+'+
  // { }'OR+(Valor_pago_fatura__c>0+AND+Valor_pago_comissao_nota__c=null))+'+
  { } 'AND+((Comissao_bon_paga__c=FALSE)+OR+(Comissao_nota_paga__c=FALSE))+' +
  { } 'AND+(Comissao_nota__c<>null+OR+Comissao_bon__c<>null)+' +
  { } 'order+by+Numero_do_pedido__c,Numero_do_cheque__c';

  api.RESTRequestChequesFuturo.Params[1].Value := 'Bearer ' + FBearer;
  try
    api.RESTRequestChequesFuturo.Execute;
  Except
    on e: Exception do
    begin
      // log('Falha ao consultar cheques.' + #13 + 'Erro:' + e.Message);
    end;
  end;
end;

end.
