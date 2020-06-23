object api: Tapi
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 785
  Width = 887
  object RESTClientClientes: TRESTClient
    Authenticator = OAuth2AuthenticatorClientes
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://bellocopo.my.salesforce.com/services/data/v20.0/query/'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 48
    Top = 79
  end
  object RESTRequestClientes: TRESTRequest
    Client = RESTClientClientes
    Params = <
      item
        Name = 'q'
        Options = [poDoNotEncode]
        Value = 'select+id,cnpj__c,name+from+account+order+by+name'
      end
      item
        Kind = pkHTTPHEADER
        Name = 'Authorization'
        Options = [poDoNotEncode]
        Value = 
          'Bearer 00D1N000002CAyN!AQkAQCyS9YpABL1gphhJpjhNgSrRSGOpKJ3NHTqxY' +
          'XzkV8UbYeslf3KA07Z3o9qfUz1tm1IlQ1A3xWIopv9zKhF7WjSlgysz'
      end>
    Response = RESTResponseClientes
    SynchronizedEvents = False
    Left = 160
    Top = 79
  end
  object RESTResponseClientes: TRESTResponse
    ContentType = 'application/json'
    RootElement = 'records'
    Left = 281
    Top = 79
  end
  object RESTResponseDataSetAdapterClientes: TRESTResponseDataSetAdapter
    Dataset = Clientes
    FieldDefs = <>
    Response = RESTResponseClientes
    Left = 439
    Top = 79
  end
  object Clientes: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 720
    Top = 79
    object Clientesattributes: TWideStringField
      FieldName = 'attributes'
      Visible = False
      Size = 255
    end
    object ClientesId: TWideStringField
      DisplayWidth = 20
      FieldName = 'Id'
      Size = 255
    end
    object ClientesCNPJ__c: TWideStringField
      DisplayLabel = 'CNPJ'
      DisplayWidth = 15
      FieldName = 'CNPJ__c'
      Size = 255
    end
    object ClientesName: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'Name'
      Size = 255
    end
  end
  object OAuth2AuthenticatorClientes: TOAuth2Authenticator
    Left = 617
    Top = 79
  end
  object dtsClientes: TDataSource
    AutoEdit = False
    DataSet = Clientes
    Left = 776
    Top = 79
  end
  object RESTClientAcesso: TRESTClient
    Authenticator = OAuth2AuthenticatorPedidos
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://login.salesforce.com/services/oauth2/token'
    ContentType = 'application/x-www-form-urlencoded'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 48
    Top = 16
  end
  object RESTRequestAcesso: TRESTRequest
    Client = RESTClientAcesso
    Method = rmPOST
    Params = <
      item
        Name = 'username'
        Value = 'adm@bellocopo.com.br'
      end
      item
        Name = 'password'
        Value = 'sdfg456*qGB2CnmMDP4gqEukLLAYFfFg2'
      end
      item
        Name = 'grant_type'
        Value = 'password'
      end
      item
        Name = 'client_id'
        Value = 
          '3MVG9mclR62wycM3NZNxnfTKn7PhiVE5dHpYVj1I2qewwz9wMUh54P5oddv51W3m' +
          'VKQxcaXeKFr6hpImQS_vk'
      end
      item
        Name = 'client_secret'
        Value = '68C9A49AFFECFF444D883026B585FDEFD55C293FCEFD1064FA6E87EC62AF1D7E'
      end>
    Response = RESTResponseAcesso
    OnAfterExecute = RESTRequestAcessoAfterExecute
    SynchronizedEvents = False
    Left = 160
    Top = 16
  end
  object RESTResponseAcesso: TRESTResponse
    ContentType = 'application/json'
    RootElement = 'access_token'
    Left = 281
    Top = 16
  end
  object RESTResponseDataSetAdapterAcesso: TRESTResponseDataSetAdapter
    Dataset = Acesso
    FieldDefs = <>
    Response = RESTResponseAcesso
    Left = 439
    Top = 16
  end
  object Acesso: TFDMemTable
    FieldDefs = <
      item
        Name = 'JSONString'
        DataType = ftWideString
        Size = 255
      end>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 720
    Top = 16
  end
  object dtsAcesso: TDataSource
    AutoEdit = False
    DataSet = Acesso
    Left = 776
    Top = 16
  end
  object RESTClientPedidos: TRESTClient
    Authenticator = OAuth2AuthenticatorPedidos
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://bellocopo.my.salesforce.com/services/data/v20.0/query/'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 48
    Top = 143
  end
  object RESTRequestPedidos: TRESTRequest
    Client = RESTClientPedidos
    Params = <
      item
        Name = 'q'
        Options = [poDoNotEncode]
        Value = 
          'SELECT+OrderNumber,Data_para_programacao__c,Order.Id,Order.Pedid' +
          'o_TID__c,Order.Representante__c,Order.StatusDataProgramada__c,Or' +
          'der.TotalAmount+FROM+ORDER+WHERE+Data_para_programacao__c=2020-0' +
          '3-17'
      end
      item
        Kind = pkHTTPHEADER
        Name = 'Authorization'
        Options = [poDoNotEncode]
        Value = 
          'Bearer 00D1N000002CAyN!AQkAQGNVn9FzoCAnLEvQeXjygg7HX_35zwwF_x9aY' +
          'wCFCsUEOBPUzBj7LgJR3zhkQO5Gtz3x2pVY99zdkuwQbVrOWm0EAlAI'
      end>
    Response = RESTResponsePedidos
    SynchronizedEvents = False
    Left = 160
    Top = 143
  end
  object RESTResponsePedidos: TRESTResponse
    ContentType = 'application/json'
    RootElement = 'records'
    Left = 281
    Top = 143
  end
  object RESTResponseDataSetAdapterPedidos: TRESTResponseDataSetAdapter
    Dataset = Pedidos
    FieldDefs = <>
    Response = RESTResponsePedidos
    Left = 439
    Top = 143
  end
  object Pedidos: TFDMemTable
    AfterScroll = PedidosAfterScroll
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 720
    Top = 143
    object PedidosSinc: TBooleanField
      FieldName = 'Sinc'
    end
    object PedidosOperacao: TStringField
      DisplayLabel = 'Opera'#231#227'o'
      FieldName = 'Operacao'
      Size = 10
    end
    object Pedidosattributes: TWideStringField
      DisplayWidth = 20
      FieldName = 'attributes'
      Visible = False
      Size = 255
    end
    object PedidosOrderNumber: TWideStringField
      DisplayLabel = 'N'#186' Pedido'
      DisplayWidth = 20
      FieldName = 'OrderNumber'
      Size = 255
    end
    object PedidosData_para_programacao__c: TWideStringField
      DisplayLabel = 'Dt. Programa'#231#227'o'
      DisplayWidth = 20
      FieldName = 'Data_para_programacao__c'
      Size = 255
    end
    object PedidosId: TWideStringField
      DisplayWidth = 20
      FieldName = 'Id'
      Visible = False
      Size = 255
    end
    object PedidosPedido_TID__c: TWideStringField
      DisplayWidth = 20
      FieldName = 'Pedido_TID__c'
      Visible = False
      Size = 255
    end
    object PedidosRepresentante__c: TWideStringField
      DisplayLabel = 'Representante'
      DisplayWidth = 20
      FieldName = 'Representante__c'
      Size = 255
    end
    object PedidosStatusDataProgramada__c: TWideStringField
      DisplayLabel = 'Status/Data Prog.'
      DisplayWidth = 20
      FieldName = 'StatusDataProgramada__c'
      Size = 255
    end
    object PedidosTotalAmount: TWideStringField
      DisplayLabel = 'Total'
      DisplayWidth = 20
      FieldName = 'TotalAmount'
      Size = 255
    end
    object PedidosErro: TStringField
      FieldKind = fkCalculated
      FieldName = 'Erro'
      Visible = False
      Size = 255
      Calculated = True
    end
  end
  object OAuth2AuthenticatorPedidos: TOAuth2Authenticator
    Left = 617
    Top = 143
  end
  object dtsPedidos: TDataSource
    AutoEdit = False
    DataSet = Pedidos
    Left = 776
    Top = 143
  end
  object RESTClientItens: TRESTClient
    Authenticator = OAuth2AuthenticatorItens
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://bellocopo.my.salesforce.com/services/data/v20.0/query/'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 48
    Top = 207
  end
  object RESTRequestItens: TRESTRequest
    Client = RESTClientItens
    Params = <
      item
        Name = 'q'
        Options = [poDoNotEncode]
        Value = 
          'SELECT+id_odoo__c,origin__c,move_lines_location_dest_id_id__c,mo' +
          've_lines_location_id_id__c,move_lines_name__c,move_lines_product' +
          '_uom_id__c,nameOdoo__c,move_lines_date_expected__c,orderItem.Ord' +
          'erId,orderItem.OrderItemNumber,orderitem.Codigo_do_produto__c,or' +
          'der_line_product_id_odoo__c,orderitem.Nome_do_produto__c,orderit' +
          'em.date_order__c,OrderItem.Quantity,OrderItem.UnitPrice,OrderIte' +
          'm.TotalPrice,move_type__c+FROM+ORDERitem+WHERE+move_lines_date_e' +
          'xpected__c='#39'2020-03-24'#39
      end
      item
        Kind = pkHTTPHEADER
        Name = 'Authorization'
        Options = [poDoNotEncode]
        Value = 
          'Bearer 00D1N000002CAyN!AQkAQKoZNZp3lFvKDvX6ifYfVu40MJF2uSGgcvwql' +
          'QbSwC17DgEHX33NDZd77DvlTQCdIZztSk2T7yt__UsfHp4.0OL9aAvX'
      end>
    Response = RESTResponseItens
    SynchronizedEvents = False
    Left = 160
    Top = 207
  end
  object RESTResponseItens: TRESTResponse
    ContentType = 'application/json'
    RootElement = 'records'
    Left = 281
    Top = 207
  end
  object RESTResponseDataSetAdapterItens: TRESTResponseDataSetAdapter
    Dataset = ITEM
    FieldDefs = <>
    Response = RESTResponseItens
    Left = 439
    Top = 207
  end
  object ITEM: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 720
    Top = 207
    object ITEMattributes: TWideStringField
      FieldName = 'attributes'
      Visible = False
      Size = 255
    end
    object ITEMID_Odoo__c: TWideStringField
      DisplayWidth = 15
      FieldName = 'ID_Odoo__c'
      Visible = False
      Size = 255
    end
    object ITEMorigin__c: TWideStringField
      DisplayWidth = 15
      FieldName = 'origin__c'
      Visible = False
      Size = 255
    end
    object ITEMmove_lines_location_dest_id_id__c: TWideStringField
      DisplayWidth = 15
      FieldName = 'move_lines_location_dest_id_id__c'
      Visible = False
      Size = 255
    end
    object ITEMmove_lines_location_id_id__c: TWideStringField
      DisplayWidth = 15
      FieldName = 'move_lines_location_id_id__c'
      Visible = False
      Size = 255
    end
    object ITEMmove_lines_name__c: TWideStringField
      DisplayWidth = 15
      FieldName = 'move_lines_name__c'
      Visible = False
      Size = 255
    end
    object ITEMmove_lines_product_uom_id__c: TWideStringField
      DisplayWidth = 15
      FieldName = 'move_lines_product_uom_id__c'
      Visible = False
      Size = 255
    end
    object ITEMnameOdoo__c: TWideStringField
      DisplayWidth = 15
      FieldName = 'nameOdoo__c'
      Visible = False
      Size = 255
    end
    object ITEMmove_lines_date_expected__c: TWideStringField
      DisplayWidth = 15
      FieldName = 'move_lines_date_expected__c'
      Visible = False
      Size = 255
    end
    object ITEMOrderId: TWideStringField
      DisplayWidth = 15
      FieldName = 'OrderId'
      Visible = False
      Size = 255
    end
    object ITEMOrderItemNumber: TWideStringField
      DisplayWidth = 15
      FieldName = 'OrderItemNumber'
      Visible = False
      Size = 255
    end
    object ITEMCodigo_do_produto__c: TWideStringField
      DisplayLabel = 'C'#243'd. produto'
      DisplayWidth = 15
      FieldName = 'Codigo_do_produto__c'
      Size = 255
    end
    object ITEMorder_line_product_id_odoo__c: TWideStringField
      DisplayWidth = 15
      FieldName = 'order_line_product_id_odoo__c'
      Visible = False
      Size = 255
    end
    object ITEMNome_do_produto__c: TWideStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 30
      FieldName = 'Nome_do_produto__c'
      Size = 255
    end
    object ITEMdate_order__c: TWideStringField
      DisplayWidth = 15
      FieldName = 'date_order__c'
      Visible = False
      Size = 255
    end
    object ITEMQuantity: TWideStringField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 15
      FieldName = 'Quantity'
      Size = 255
    end
    object ITEMUnitPrice: TWideStringField
      DisplayLabel = 'Pre'#231'o Unit.'
      DisplayWidth = 15
      FieldName = 'UnitPrice'
      Size = 255
    end
    object ITEMTotalPrice: TWideStringField
      DisplayLabel = 'Total R$'
      DisplayWidth = 15
      FieldName = 'TotalPrice'
      Size = 255
    end
    object ITEMmove_type__c: TWideStringField
      DisplayWidth = 15
      FieldName = 'move_type__c'
      Visible = False
      Size = 255
    end
  end
  object OAuth2AuthenticatorItens: TOAuth2Authenticator
    Left = 617
    Top = 207
  end
  object dtsItem: TDataSource
    AutoEdit = False
    DataSet = ITEM
    Left = 776
    Top = 207
  end
  object RESTClient1: TRESTClient
    Authenticator = OAuth2AuthenticatorCheques
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://bellocopo-staging-942777.dev.odoo.com/jsonrpc'
    ContentType = 'application/json'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 48
    Top = 352
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'body'
        Options = [poDoNotEncode]
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 144
    Top = 352
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 248
    Top = 352
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = Resultado
    FieldDefs = <>
    Response = RESTResponse1
    Left = 384
    Top = 352
  end
  object Resultado: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 520
    Top = 352
  end
  object DataSource1: TDataSource
    DataSet = Resultado
    Left = 608
    Top = 352
  end
  object RESTClientCheques: TRESTClient
    Authenticator = OAuth2AuthenticatorCheques
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://bellocopo.my.salesforce.com/services/data/v20.0/query/'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 48
    Top = 279
  end
  object RESTRequestCheques: TRESTRequest
    Client = RESTClientCheques
    Params = <
      item
        Name = 'q'
        Options = [poDoNotEncode]
        Value = 
          'Select+ID,Numero_do_pedido__c,Numero_do_cheque__c,Saldo_cheques_' +
          '_c,CreatedDate,Data_da_fatura__c,Data_comissao_paga_bon__c,Data_' +
          'comissao_paga_nota__c,Name,Nome_do_cliente__c,Representante__c,V' +
          'alor__c,Valor_fatura__c,Valor_pago_cheque__c,Valor_pago_comissao' +
          '_bon__c,Valor_pago_comissao_nota__c,Valor_pago_fatura__c,Baixa_t' +
          'otal_Cheque__c,Baixa_total_fatura__c+FROM+Cheque__c+WHERE+Data_d' +
          'a_fatura__c>=2020-02-01+AND+((Valor__c>0+AND+ Baixa_total_Cheque' +
          '__c=False)+OR+(Valor_fatura__c>0+AND+Baixa_total_fatura__c=False' +
          '))+order+by+Numero_do_pedido__c,Numero_do_cheque__c'
      end
      item
        Kind = pkHTTPHEADER
        Name = 'Authorization'
        Options = [poDoNotEncode]
        Value = 
          'Bearer 00D1N000002CAyN!AQkAQESJ27vEh1zUoZjSjpteB0O_VWWDdh4fQBxrp' +
          'er3BcWsK56eaJ0vjVOwKF0EMlubynM0zyfuL6GJqGHDiljomf.STN20'
      end>
    Response = RESTResponseCheques
    SynchronizedEvents = False
    Left = 160
    Top = 279
  end
  object RESTResponseCheques: TRESTResponse
    ContentType = 'application/json'
    RootElement = 'records'
    Left = 281
    Top = 279
  end
  object RESTResponseDataSetAdapterCheques: TRESTResponseDataSetAdapter
    Dataset = Cheques
    FieldDefs = <>
    Response = RESTResponseCheques
    Left = 439
    Top = 279
  end
  object Cheques: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 720
    Top = 279
    object ChequesSelecionado: TBooleanField
      FieldName = 'Selecionado'
    end
    object Chequesattributes: TWideStringField
      FieldName = 'attributes'
      Visible = False
      Size = 255
    end
    object ChequesId: TWideStringField
      DisplayLabel = 'ID'
      DisplayWidth = 20
      FieldName = 'Id'
      Size = 255
    end
    object Chequescomissao__c: TFloatField
      DisplayLabel = 'Comiss'#227'o %'
      FieldName = 'comissao__c'
      DisplayFormat = '##,##0.00%'
    end
    object ChequesName: TWideStringField
      DisplayLabel = 'N'#186' Cheque'
      DisplayWidth = 20
      FieldName = 'Name'
      Size = 255
    end
    object ChequesNumero_do_pedido__c: TFloatField
      DisplayLabel = 'N'#186' do Pedido'
      FieldName = 'Numero_do_pedido__c'
      DisplayFormat = '00000000'
    end
    object ChequesNumero_do_cheque__c: TWideStringField
      DisplayLabel = 'N'#186' parcela cheque'
      DisplayWidth = 20
      FieldName = 'Numero_do_cheque__c'
      Size = 255
    end
    object ChequesSaldo_cheques__c: TWideStringField
      DisplayLabel = 'Saldo cheques/Notas'
      DisplayWidth = 20
      FieldName = 'Saldo_cheques_notas_pedido__c'
      Size = 255
    end
    object ChequesCreatedDate: TWideStringField
      DisplayLabel = 'Data de cria'#231#227'o'
      DisplayWidth = 20
      FieldName = 'CreatedDate'
      Size = 255
    end
    object ChequesNome_do_cliente__c: TWideStringField
      DisplayLabel = 'Cliente'
      DisplayWidth = 30
      FieldName = 'Nome_do_cliente__c'
      Size = 100
    end
    object ChequesRepresentante__c: TWideStringField
      DisplayLabel = 'Representante'
      DisplayWidth = 20
      FieldName = 'Representante__c'
      Size = 255
    end
    object ChequesBaixa_total_Cheque__c: TWideStringField
      DisplayLabel = 'Baixa total cheque'
      DisplayWidth = 20
      FieldName = 'Baixa_total_Cheque__c'
      Size = 255
    end
    object ChequesBaixa_total_fatura__c: TWideStringField
      DisplayLabel = 'Baixa total fatura'
      DisplayWidth = 20
      FieldName = 'Baixa_total_fatura__c'
      Size = 255
    end
    object ChequesValor_pago_fatura__c: TCurrencyField
      DisplayLabel = 'Valor pago fat.'
      FieldName = 'Valor_pago_fatura__c'
    end
    object ChequesValor__c: TCurrencyField
      DisplayLabel = 'Valor parc. cheque R$'
      FieldName = 'Valor__c'
    end
    object ChequesValor_fatura__c: TCurrencyField
      DisplayLabel = 'Valor fatura R$'
      FieldName = 'Valor_fatura__c'
    end
    object ChequesValor_pago_cheque__c: TCurrencyField
      DisplayLabel = 'Valor pago cheque R$'
      FieldName = 'Valor_pago_cheque__c'
    end
    object ChequesValor_pago_comissao_bon__c: TCurrencyField
      DisplayLabel = 'Valor pago com. bon. R$'
      FieldName = 'Valor_pago_comissao_bon__c'
    end
    object ChequesValor_pago_comissao_nota__c: TCurrencyField
      DisplayLabel = 'Valor pago com. nota'
      FieldName = 'Valor_pago_comissao_nota__c'
    end
    object ChequesComissao_bon__c: TCurrencyField
      FieldName = 'Comissao_bon__c'
    end
    object ChequesComissao_nota__c: TCurrencyField
      FieldName = 'Comissao_nota__c'
    end
    object ChequesData_nota_fiscal__c: TDateTimeField
      DisplayLabel = 'Data Nota Fiscal'
      FieldName = 'Data_nota_fiscal__c'
    end
    object ChequesData_comissao_paga_bon__c: TDateTimeField
      DisplayLabel = 'Dt. pag. com. bon.'
      FieldName = 'Data_comissao_paga_bon__c'
    end
    object ChequesData_comissao_paga_nota__c: TDateTimeField
      DisplayLabel = 'Dt. pag. nota'
      FieldName = 'Data_comissao_paga_nota__c'
    end
    object ChequesComissao_bon_paga__c: TStringField
      DisplayLabel = 'Comiss'#227'o bon. paga'
      FieldName = 'Comissao_bon_paga__c'
      Size = 10
    end
    object ChequesComissao_nota_paga__c: TStringField
      DisplayLabel = 'Comiss'#227'o nota paga'
      FieldName = 'Comissao_nota_paga__c'
      Visible = False
      Size = 10
    end
    object ChequesComissaoTotal: TCurrencyField
      FieldName = 'ComissaoTotal'
    end
    object ChequesStatusNota: TSmallintField
      DisplayLabel = 'Status'
      FieldName = 'StatusNota'
    end
    object ChequesStatusBon: TSmallintField
      DisplayLabel = 'Status'
      FieldName = 'StatusBon'
    end
    object ChequesNF100__c: TBooleanField
      FieldName = 'NF100__c'
    end
    object ChequesData_deposito__c: TDateTimeField
      DisplayLabel = 'Venc. Cheque'
      FieldName = 'Data_deposito__c'
    end
    object ChequesData_deposito_fatura__c: TDateTimeField
      DisplayLabel = 'Venc. Fatura'
      FieldName = 'Data_deposito_fatura__c'
    end
    object ChequesValorAtraso: TCurrencyField
      FieldName = 'ValorAtraso'
    end
    object ChequesPrevistoBon: TStringField
      DisplayLabel = 'Previs'#227'o'
      FieldName = 'PrevistoBon'
      Size = 7
    end
    object ChequesPrevistoNota: TStringField
      FieldName = 'PrevistoNota'
      Size = 7
    end
    object ChequesNota_fiscal__c: TStringField
      DisplayLabel = 'N'#186' Nota Fiscal'
      FieldName = 'Nota_fiscal__c '
    end
    object ChequesTvalor_pago_nota: TAggregateField
      FieldName = 'Tvalor_pago_nota'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(valor_pago_fatura__c)'
    end
    object ChequesTcom_nota: TAggregateField
      FieldName = 'Tcom_nota'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(comissao_nota__c)'
    end
    object ChequesTpago_com_nota: TAggregateField
      FieldName = 'Tpago_com_nota'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(valor_pago_comissao_nota__c)'
    end
    object ChequesTvalor_pago_bon: TAggregateField
      FieldName = 'Tvalor_pago_bon'
      currency = True
      DisplayName = ''
      Expression = 'sum(valor_pago_cheque__c)'
    end
    object ChequesTvalor_com_bon: TAggregateField
      FieldName = 'Tvalor_com_bon'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(comissao_bon__c)'
    end
    object ChequesTpago_com_bon: TAggregateField
      FieldName = 'Tpago_com_bon'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(valor_pago_comissao_bon__c)'
    end
    object ChequesTParcCheque: TAggregateField
      FieldName = 'TParcCheque'
      currency = True
      DisplayName = ''
      Expression = 'sum(Valor__c)'
    end
  end
  object OAuth2AuthenticatorCheques: TOAuth2Authenticator
    Left = 617
    Top = 279
  end
  object DtsCheques: TDataSource
    DataSet = Cheques
    Left = 776
    Top = 279
  end
  object RESTClientSF: TRESTClient
    Authenticator = OAuth2AuthenticatorChequesFuturo
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 
      'https://bellocopo.my.salesforce.com/services/data/v20.0/sobjects' +
      '/cheque__c/a003l00001afwFWAAY'
    ContentType = 'application/json'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 48
    Top = 416
  end
  object RESTRequestSF: TRESTRequest
    Client = RESTClientSF
    Method = rmPATCH
    Params = <
      item
        Kind = pkHTTPHEADER
        Name = 'Authorization'
        Options = [poDoNotEncode]
        Value = 
          'Bearer 00D1N000002CAyN!AQkAQIxlA3hfJz87Aq8PS9vQD5dnBepVPkPO3xVeV' +
          'cFzWlOjcBb5ibgGBJDtlZMWqFp8NXNhOS1DWdGP.nMJ2UUPv4U.FUZQ'
      end
      item
        Kind = pkREQUESTBODY
        Name = 'body'
        Options = [poDoNotEncode]
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponseSF
    SynchronizedEvents = False
    Left = 136
    Top = 416
  end
  object RESTResponseSF: TRESTResponse
    Left = 248
    Top = 424
  end
  object RESTResponseDataSetAdapterSF: TRESTResponseDataSetAdapter
    Dataset = ResultadoSF
    FieldDefs = <>
    Response = RESTResponseSF
    Left = 376
    Top = 424
  end
  object ResultadoSF: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 520
    Top = 416
  end
  object RESTClientChequesFuturo: TRESTClient
    Authenticator = OAuth2AuthenticatorChequesFuturo
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://bellocopo.my.salesforce.com/services/data/v20.0/query/'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 56
    Top = 511
  end
  object RESTRequestChequesFuturo: TRESTRequest
    Client = RESTClientChequesFuturo
    Params = <
      item
        Name = 'q'
        Options = [poDoNotEncode]
        Value = 
          'Select+ID,Numero_do_pedido__c,Numero_do_cheque__c,Saldo_cheques_' +
          '_c,CreatedDate,Data_da_fatura__c,Data_comissao_paga_bon__c,Data_' +
          'comissao_paga_nota__c,Name,Nome_do_cliente__c,Representante__c,V' +
          'alor__c,Valor_fatura__c,Valor_pago_cheque__c,Valor_pago_comissao' +
          '_bon__c,Valor_pago_comissao_nota__c,Valor_pago_fatura__c,Baixa_t' +
          'otal_Cheque__c,Baixa_total_fatura__c+FROM+Cheque__c+WHERE+Data_d' +
          'a_fatura__c>=2020-02-01+AND+((Valor__c>0+AND+ Baixa_total_Cheque' +
          '__c=False)+OR+(Valor_fatura__c>0+AND+Baixa_total_fatura__c=False' +
          '))+order+by+Numero_do_pedido__c,Numero_do_cheque__c'
      end
      item
        Kind = pkHTTPHEADER
        Name = 'Authorization'
        Options = [poDoNotEncode]
        Value = 
          'Bearer 00D1N000002CAyN!AQkAQESJ27vEh1zUoZjSjpteB0O_VWWDdh4fQBxrp' +
          'er3BcWsK56eaJ0vjVOwKF0EMlubynM0zyfuL6GJqGHDiljomf.STN20'
      end>
    Response = RESTResponseChequesFuturo
    SynchronizedEvents = False
    Left = 168
    Top = 511
  end
  object RESTResponseChequesFuturo: TRESTResponse
    ContentType = 'application/json'
    RootElement = 'records'
    Left = 289
    Top = 511
  end
  object RESTResponseDataSetAdapterChequesFuturo: TRESTResponseDataSetAdapter
    Dataset = ChequesFuturo
    FieldDefs = <>
    Response = RESTResponseChequesFuturo
    Left = 447
    Top = 511
  end
  object ChequesFuturo: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 728
    Top = 511
    object ChequesFuturoSelecionado: TBooleanField
      FieldName = 'Selecionado'
    end
    object ChequesFuturoattributes: TWideStringField
      FieldName = 'attributes'
      Visible = False
      Size = 255
    end
    object ChequesFuturoId: TWideStringField
      DisplayLabel = 'ID'
      DisplayWidth = 20
      FieldName = 'Id'
      Size = 255
    end
    object ChequesFuturoNumero_do_pedido__c: TWideStringField
      DisplayLabel = 'N'#186' do pedido'
      DisplayWidth = 20
      FieldName = 'Numero_do_pedido__c'
      Size = 255
    end
    object ChequesFuturocomissao__c: TFloatField
      DisplayLabel = 'Comiss'#227'o %'
      FieldName = 'comissao__c'
      DisplayFormat = '##,##0.00%'
    end
    object ChequesFuturoName: TWideStringField
      DisplayLabel = 'N'#186' Cheque'
      DisplayWidth = 20
      FieldName = 'Name'
      Size = 255
    end
    object ChequesFuturoNumero_do_cheque__c: TWideStringField
      DisplayLabel = 'N'#186' parcela cheque'
      DisplayWidth = 20
      FieldName = 'Numero_do_cheque__c'
      Size = 255
    end
    object ChequesFuturoSaldo_cheques__c: TWideStringField
      DisplayLabel = 'Saldo cheques/Notas'
      DisplayWidth = 20
      FieldName = 'Saldo_cheques_notas_pedido__c'
      Size = 255
    end
    object ChequesFuturoCreatedDate: TWideStringField
      DisplayLabel = 'Data de cria'#231#227'o'
      DisplayWidth = 20
      FieldName = 'CreatedDate'
      Size = 255
    end
    object ChequesFuturoNome_do_cliente__c: TWideStringField
      DisplayLabel = 'Cliente'
      DisplayWidth = 30
      FieldName = 'Nome_do_cliente__c'
      Size = 255
    end
    object ChequesFuturoRepresentante__c: TWideStringField
      DisplayLabel = 'Representante'
      DisplayWidth = 20
      FieldName = 'Representante__c'
      Size = 255
    end
    object ChequesFuturoBaixa_total_Cheque__c: TWideStringField
      DisplayLabel = 'Baixa total cheque'
      DisplayWidth = 20
      FieldName = 'Baixa_total_Cheque__c'
      Size = 255
    end
    object ChequesFuturoBaixa_total_fatura__c: TWideStringField
      DisplayLabel = 'Baixa total fatura'
      DisplayWidth = 20
      FieldName = 'Baixa_total_fatura__c'
      Size = 255
    end
    object ChequesFuturoValor_pago_fatura__c: TCurrencyField
      DisplayLabel = 'Valor pago fat.'
      FieldName = 'Valor_pago_fatura__c'
    end
    object ChequesFuturoValor__c: TCurrencyField
      DisplayLabel = 'Valor R$'
      FieldName = 'Valor__c'
    end
    object ChequesFuturoValor_fatura__c: TCurrencyField
      DisplayLabel = 'Valor fatura R$'
      FieldName = 'Valor_fatura__c'
    end
    object ChequesFuturoValor_pago_cheque__c: TCurrencyField
      DisplayLabel = 'Valor pago cheque R$'
      FieldName = 'Valor_pago_cheque__c'
    end
    object ChequesFuturoValor_pago_comissao_bon__c: TCurrencyField
      DisplayLabel = 'Valor pago com. bon. R$'
      FieldName = 'Valor_pago_comissao_bon__c'
    end
    object ChequesFuturoValor_pago_comissao_nota__c: TCurrencyField
      DisplayLabel = 'Valor pago com. nota'
      FieldName = 'Valor_pago_comissao_nota__c'
    end
    object ChequesFuturoComissao_bon__c: TCurrencyField
      FieldName = 'Comissao_bon__c'
    end
    object ChequesFuturoComissao_nota__c: TCurrencyField
      FieldName = 'Comissao_nota__c'
    end
    object ChequesFuturoData_nota_fiscal__c: TDateTimeField
      DisplayLabel = 'Data Nota Fiscal'
      FieldName = 'Data_nota_fiscal__c'
    end
    object ChequesFuturoData_comissao_paga_bon__c: TDateTimeField
      DisplayLabel = 'Dt. pag. com. bon.'
      FieldName = 'Data_comissao_paga_bon__c'
    end
    object ChequesFuturoData_comissao_paga_nota__c: TDateTimeField
      DisplayLabel = 'Dt. pag. nota'
      FieldName = 'Data_comissao_paga_nota__c'
    end
    object ChequesFuturoComissao_bon_paga__c: TStringField
      DisplayLabel = 'Comiss'#227'o bon. paga'
      FieldName = 'Comissao_bon_paga__c'
      Size = 10
    end
    object ChequesFuturoComissao_nota_paga__c: TStringField
      DisplayLabel = 'Comiss'#227'o nota paga'
      FieldName = 'Comissao_nota_paga__c'
      Visible = False
      Size = 10
    end
    object ChequesFuturoComissaoTotal: TCurrencyField
      FieldName = 'ComissaoTotal'
    end
    object ChequesFuturoQuitadoNota: TBooleanField
      DisplayLabel = 'Quitado Nota'
      FieldName = 'QuitadoNota'
    end
    object ChequesFuturoQuitadoBon: TBooleanField
      DisplayLabel = 'Quitado Bon.'
      FieldName = 'QuitadoBon'
    end
    object ChequesFuturoTvalor_pago_nota: TAggregateField
      FieldName = 'Tvalor_pago_nota'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(valor_pago_fatura__c)'
    end
    object ChequesFuturoTcom_nota: TAggregateField
      FieldName = 'Tcom_nota'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(comissao_nota__c)'
    end
    object ChequesFuturoTpago_com_nota: TAggregateField
      FieldName = 'Tpago_com_nota'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(valor_pago_comissao_nota__c)'
    end
    object ChequesFuturoTvalor_pago_bon: TAggregateField
      FieldName = 'Tvalor_pago_bon'
      currency = True
      DisplayName = ''
      Expression = 'sum(valor_pago_cheque__c)'
    end
    object ChequesFuturoTvalor_com_bon: TAggregateField
      FieldName = 'Tvalor_com_bon'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(comissao_bon__c)'
    end
    object ChequesFuturoTpago_com_bon: TAggregateField
      FieldName = 'Tpago_com_bon'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(valor_pago_comissao_bon__c)'
    end
  end
  object OAuth2AuthenticatorChequesFuturo: TOAuth2Authenticator
    Left = 625
    Top = 511
  end
  object DtsChequesFuturo: TDataSource
    DataSet = ChequesFuturo
    Left = 807
    Top = 511
  end
  object RESTClientPedidoWA: TRESTClient
    Authenticator = OAuth2AuthPedidoWA
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://bellocopo.my.salesforce.com/services/data/v20.0/query/'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 56
    Top = 615
  end
  object RESTRequestPedidoWA: TRESTRequest
    Client = RESTClientPedidoWA
    Params = <
      item
        Name = 'q'
        Options = [poDoNotEncode]
        Value = 
          'Select+ID,Numero_do_pedido__c,Numero_do_cheque__c,Saldo_cheques_' +
          '_c,CreatedDate,Data_da_fatura__c,Data_comissao_paga_bon__c,Data_' +
          'comissao_paga_nota__c,Name,Nome_do_cliente__c,Representante__c,V' +
          'alor__c,Valor_fatura__c,Valor_pago_cheque__c,Valor_pago_comissao' +
          '_bon__c,Valor_pago_comissao_nota__c,Valor_pago_fatura__c,Baixa_t' +
          'otal_Cheque__c,Baixa_total_fatura__c+FROM+Cheque__c+WHERE+Data_d' +
          'a_fatura__c>=2020-02-01+AND+((Valor__c>0+AND+ Baixa_total_Cheque' +
          '__c=False)+OR+(Valor_fatura__c>0+AND+Baixa_total_fatura__c=False' +
          '))+order+by+Numero_do_pedido__c,Numero_do_cheque__c'
      end
      item
        Kind = pkHTTPHEADER
        Name = 'Authorization'
        Options = [poDoNotEncode]
        Value = 
          'Bearer 00D1N000002CAyN!AQkAQESJ27vEh1zUoZjSjpteB0O_VWWDdh4fQBxrp' +
          'er3BcWsK56eaJ0vjVOwKF0EMlubynM0zyfuL6GJqGHDiljomf.STN20'
      end>
    Response = RESTResponsePedidoWA
    SynchronizedEvents = False
    Left = 168
    Top = 615
  end
  object RESTResponsePedidoWA: TRESTResponse
    ContentType = 'application/json'
    RootElement = 'records'
    Left = 289
    Top = 615
  end
  object RESTRespDataSetAdapterPedidoWA: TRESTResponseDataSetAdapter
    Dataset = pedidoWA
    FieldDefs = <>
    Response = RESTResponsePedidoWA
    Left = 447
    Top = 615
  end
  object pedidoWA: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 728
    Top = 615
  end
  object OAuth2AuthPedidoWA: TOAuth2Authenticator
    Left = 625
    Top = 615
  end
  object dtsPedidoWA: TDataSource
    DataSet = pedidoWA
    Left = 807
    Top = 615
  end
  object FDConnSQLite: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 592
    Top = 456
  end
  object dtsTemp: TDataSource
    DataSet = Temp
    Left = 408
    Top = 704
  end
  object Temp: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 448
    Top = 703
    object TempRepresentante__c: TWideStringField
      DisplayLabel = 'Representante'
      DisplayWidth = 20
      FieldName = 'Representante__c'
      Size = 255
    end
    object TempNumero_do_pedido__c: TFloatField
      DisplayLabel = 'N'#186' do Pedido'
      FieldName = 'Numero_do_pedido__c'
      DisplayFormat = '00000000'
    end
    object TempNome_do_cliente__c: TWideStringField
      DisplayLabel = 'Cliente'
      DisplayWidth = 30
      FieldName = 'Nome_do_cliente__c'
      Size = 100
    end
    object TempData_nota_fiscal__c: TDateTimeField
      DisplayLabel = 'Data Nota Fiscal'
      FieldName = 'Data_nota_fiscal__c'
    end
    object Tempcomissao__c: TFloatField
      DisplayLabel = 'Comiss'#227'o %'
      FieldName = 'comissao__c'
      DisplayFormat = '##,##0.00%'
    end
    object TempValor__c: TCurrencyField
      DisplayLabel = 'Valor parc. cheque R$'
      FieldName = 'Valor__c'
    end
    object TempValor_fatura__c: TCurrencyField
      DisplayLabel = 'Valor fatura R$'
      FieldName = 'Valor_fatura__c'
    end
    object TempComissao_bon__c: TCurrencyField
      FieldName = 'Comissao_bon__c'
    end
    object TempComissao_nota__c: TCurrencyField
      FieldName = 'Comissao_nota__c'
    end
    object TempComissaoTotal: TCurrencyField
      FieldName = 'ComissaoTotal'
    end
    object TempNF100__c: TBooleanField
      FieldName = 'NF100__c'
    end
    object TempValorAtraso: TCurrencyField
      FieldName = 'ValorAtraso'
    end
    object TempNota_fiscal__c: TStringField
      FieldName = 'Nota_fiscal__c'
    end
    object TempPrevisto: TCurrencyField
      FieldName = 'Previsto'
    end
    object TempPrev1: TCurrencyField
      FieldName = 'Prev1'
    end
    object TempPrev2: TCurrencyField
      FieldName = 'Prev2'
    end
    object TempPrev3: TCurrencyField
      FieldName = 'Prev3'
    end
    object TempPrev4: TCurrencyField
      FieldName = 'Prev4'
    end
  end
  object dtsProjecao: TDataSource
    DataSet = Projecao
    Left = 552
    Top = 704
  end
  object Projecao: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 611
    Top = 705
    object ProjecaoRepresentante__c: TWideStringField
      DisplayLabel = 'Representante'
      DisplayWidth = 20
      FieldName = 'Representante__c'
      Size = 255
    end
    object ProjecaoPeriodo: TStringField
      FieldName = 'Periodo'
      Size = 7
    end
    object ProjecaoComissaoTotal: TCurrencyField
      FieldName = 'ComissaoTotal'
    end
  end
  object Representantes: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    IndexFieldNames = 'nome'
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 267
    Top = 697
    object RepresentantesNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object RepresentantesEmail: TStringField
      FieldName = 'Email'
      Size = 255
    end
  end
  object dtsRep: TDataSource
    DataSet = Representantes
    Left = 208
    Top = 696
  end
  object PedidosPagos: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 72
    Top = 687
    object PedidosPagosNumero: TFloatField
      FieldName = 'Numero'
    end
  end
end
