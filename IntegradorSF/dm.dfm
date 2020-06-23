object a: Ta
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 222
  Width = 440
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\fontes\IntegradorSF\DADOS\DADOS.FDB'
      'Server=LOCALHOST'
      'Port=3052'
      'User_Name=SYSDBA'
      'Password=master'
      'Protocol=TCPIP'
      'DriverID=FB')
    LoginPrompt = False
    Left = 56
    Top = 16
  end
  object Log: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from log')
    Left = 56
    Top = 95
    object LogID: TFloatField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object LogDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object LogID_FUNCIONARIO: TSmallintField
      FieldName = 'ID_FUNCIONARIO'
      Origin = 'ID_FUNCIONARIO'
    end
    object LogUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 50
    end
    object LogMODULO: TStringField
      FieldName = 'MODULO'
      Origin = 'MODULO'
      Size = 50
    end
    object LogOPERACAO: TMemoField
      FieldName = 'OPERACAO'
      Origin = 'OPERACAO'
      BlobType = ftMemo
    end
    object LogCOMPUTADOR: TStringField
      FieldName = 'COMPUTADOR'
      Origin = 'COMPUTADOR'
      Size = 50
    end
    object LogVERSAO: TStringField
      FieldName = 'VERSAO'
      Origin = 'VERSAO'
      Size = 10
    end
    object LogCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
    end
  end
  object dtsLog: TDataSource
    DataSet = Log
    Left = 104
    Top = 95
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 160
    Top = 16
  end
  object qryGeral: TFDQuery
    Connection = FDConnection1
    Left = 312
    Top = 16
  end
  object qry: TFDQuery
    Connection = FDConnection1
    Left = 368
    Top = 16
  end
  object funcionarios: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM FUNCIONARIOS')
    Left = 184
    Top = 96
    object funcionariosID_FUNCIONARIO: TSmallintField
      DisplayLabel = 'ID'
      FieldName = 'ID_FUNCIONARIO'
      Origin = 'ID_FUNCIONARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object funcionariosNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 45
    end
    object funcionariosLOGIN: TStringField
      DisplayLabel = 'Login'
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Visible = False
      Size = 15
    end
    object funcionariosSENHA: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Visible = False
      Size = 6
    end
    object funcionariosADM: TStringField
      FieldName = 'ADM'
      Origin = 'ADM'
      Visible = False
      Size = 1
    end
  end
  object dsFuncionarios: TDataSource
    DataSet = funcionarios
    Left = 264
    Top = 96
  end
  object Cheques__c: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM cheques__c')
    Left = 192
    Top = 152
    object Cheques__cID: TStringField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Cheques__cNUMERO_DO_PEDIDO__C: TFloatField
      DisplayLabel = 'N'#186' Pedido'
      FieldName = 'NUMERO_DO_PEDIDO__C'
      Origin = 'NUMERO_DO_PEDIDO__C'
      DisplayFormat = '000000'
    end
    object Cheques__cCOMISSAO__C: TCurrencyField
      DisplayLabel = 'Comiss'#227'o%'
      FieldName = 'COMISSAO__C'
      Origin = 'COMISSAO__C'
      DisplayFormat = '##,##0.00%'
    end
    object Cheques__cNAME: TFloatField
      DisplayLabel = 'N'#186' Cheque'
      FieldName = 'NAME'
      Origin = 'NAME'
    end
    object Cheques__cNUMERO_DO_CHEQUE__C: TSmallintField
      DisplayLabel = 'Cheque'
      FieldName = 'NUMERO_DO_CHEQUE__C'
      Origin = 'NUMERO_DO_CHEQUE__C'
    end
    object Cheques__cSALDO_CHEQUES_NOTAS_PEDIDO__C: TFloatField
      DisplayLabel = 'Saldos cheques/notas'
      FieldName = 'SALDO_CHEQUES_NOTAS_PEDIDO__C'
      Origin = 'SALDO_CHEQUES_NOTAS_PEDIDO__C'
    end
    object Cheques__cNOME_DO_CLIENTE__C: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_DO_CLIENTE__C'
      Origin = 'NOME_DO_CLIENTE__C'
      Size = 200
    end
    object Cheques__cREPRESENTANTE__C: TStringField
      DisplayLabel = 'Representante'
      FieldName = 'REPRESENTANTE__C'
      Origin = 'REPRESENTANTE__C'
      Size = 200
    end
    object Cheques__cBAIXA_TOTAL_CHEQUE__C: TStringField
      DisplayLabel = 'Baixa total cheque'
      FieldName = 'BAIXA_TOTAL_CHEQUE__C'
      Origin = 'BAIXA_TOTAL_CHEQUE__C'
      Size = 1
    end
    object Cheques__cBAIXA_TOTAL_FATURA__C: TStringField
      DisplayLabel = 'Baixa total fatura'
      FieldName = 'BAIXA_TOTAL_FATURA__C'
      Origin = 'BAIXA_TOTAL_FATURA__C'
      Size = 1
    end
    object Cheques__cVALOR_PAGO_FATURA__C: TFloatField
      DisplayLabel = 'Valor Pago Fatura'
      FieldName = 'VALOR_PAGO_FATURA__C'
      Origin = 'VALOR_PAGO_FATURA__C'
      currency = True
    end
    object Cheques__cVALOR__C: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR__C'
      Origin = 'VALOR__C'
      currency = True
    end
    object Cheques__cVALOR_FATURA__C: TFloatField
      DisplayLabel = 'Valor Fatura'
      FieldName = 'VALOR_FATURA__C'
      Origin = 'VALOR_FATURA__C'
      currency = True
    end
    object Cheques__cVALOR_PAGO_CHEQUE__C: TFloatField
      DisplayLabel = 'Valor pago cheque'
      FieldName = 'VALOR_PAGO_CHEQUE__C'
      Origin = 'VALOR_PAGO_CHEQUE__C'
      currency = True
    end
    object Cheques__cVALOR_PAGO_COMISSAO_BON__C: TFloatField
      DisplayLabel = 'Valor pago comiss'#227'o bon.'
      FieldName = 'VALOR_PAGO_COMISSAO_BON__C'
      Origin = 'VALOR_PAGO_COMISSAO_BON__C'
      currency = True
    end
    object Cheques__cVALOR_PAGO_COMISSAO_NOTA__C: TFloatField
      DisplayLabel = 'Valor pago comiss'#227'o nota'
      FieldName = 'VALOR_PAGO_COMISSAO_NOTA__C'
      Origin = 'VALOR_PAGO_COMISSAO_NOTA__C'
      currency = True
    end
    object Cheques__cCOMISSAO_BON__C: TFloatField
      DisplayLabel = 'Valor comiss'#227'o bon.'
      FieldName = 'COMISSAO_BON__C'
      Origin = 'COMISSAO_BON__C'
    end
    object Cheques__cCOMISSAO_NOTA__C: TFloatField
      DisplayLabel = 'Valor comiss'#227'o nota'
      FieldName = 'COMISSAO_NOTA__C'
      Origin = 'COMISSAO_NOTA__C'
    end
    object Cheques__cDATA_NOTA_FISCAL__C: TSQLTimeStampField
      DisplayLabel = 'Data nota fiscal'
      FieldName = 'DATA_NOTA_FISCAL__C'
      Origin = 'DATA_NOTA_FISCAL__C'
    end
    object Cheques__cDATA_COMISSAO_PAGA_BON__C: TSQLTimeStampField
      DisplayLabel = 'Data pag. com. bon.'
      FieldName = 'DATA_COMISSAO_PAGA_BON__C'
      Origin = 'DATA_COMISSAO_PAGA_BON__C'
    end
    object Cheques__cDATA_COMISSAO_PAGA_NOTA__C: TSQLTimeStampField
      DisplayLabel = 'Data pag. com. nota'
      FieldName = 'DATA_COMISSAO_PAGA_NOTA__C'
      Origin = 'DATA_COMISSAO_PAGA_NOTA__C'
    end
    object Cheques__cDATA_ALTERACAO: TSQLTimeStampField
      DisplayLabel = 'Ult. Altera'#231#227'o'
      FieldName = 'DATA_ALTERACAO'
      Origin = 'DATA_ALTERACAO'
    end
    object Cheques__cCOMISSAO_BON_PAGA__C: TStringField
      DisplayLabel = 'Comiss'#227'o paga'
      FieldName = 'COMISSAO_BON_PAGA__C'
      Origin = 'COMISSAO_BON_PAGA__C'
      Size = 1
    end
    object Cheques__cCOMISSAO_NOTA_PAGA__C: TStringField
      DisplayLabel = 'Comiss'#227'o nota paga'
      FieldName = 'COMISSAO_NOTA_PAGA__C'
      Origin = 'COMISSAO_NOTA_PAGA__C'
      Size = 1
    end
    object Cheques__cCOMISSAOTOTAL: TFloatField
      DisplayLabel = 'Total comiss'#227'o R$'
      FieldName = 'COMISSAOTOTAL'
      Origin = 'COMISSAOTOTAL'
    end
    object Cheques__cQUITADONOTA: TStringField
      DisplayLabel = 'Quitado Nota'
      FieldName = 'QUITADONOTA'
      Origin = 'QUITADONOTA'
      Size = 1
    end
    object Cheques__cQUITADOBON: TStringField
      DisplayLabel = 'Quitado Bon.'
      FieldName = 'QUITADOBON'
      Origin = 'QUITADOBON'
      Size = 1
    end
  end
  object dsCheques__c: TDataSource
    DataSet = Cheques__c
    Left = 264
    Top = 152
  end
end
