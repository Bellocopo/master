object api2: Tapi2
  OldCreateOrder = False
  Height = 338
  Width = 514
  object RESTClient1: TRESTClient
    Authenticator = HTTPBasicAuthenticator1
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://sandbox.boletocloud.com/api/v1/boletos'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 144
    Top = 88
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Method = rmPOST
    Params = <
      item
        Kind = pkHTTPHEADER
        Name = 'Authorization'
        Value = 
          'Basic YXBpLWtleV9zeThxVzBBTWV4ZHhGdFc1OWE5Nmd6bG9zR0lwNWpnbHNtM0' +
          'VCVUlVMlpzPTp0b2tlbg=='
      end
      item
        Name = 'boleto.conta.banco'
        Value = '104'
      end
      item
        Name = 'boleto.conta.agencia'
        Value = '2987'
      end
      item
        Name = 'boleto.conta.numero'
        Value = '00200059-9'
      end
      item
        Name = 'boleto.conta.carteira'
        Value = '1'
      end
      item
        Name = 'boleto.beneficiario.nome'
        Value = 'Ronaldo Bicca'
      end
      item
        Name = 'boleto.beneficiario.cprf'
        Value = '474.889.480-68'
      end
      item
        Name = 'boleto.beneficiario.endereco.cep'
        Value = '69067-332'
      end
      item
        Name = 'boleto.beneficiario.endereco.uf'
        Value = 'AM'
      end
      item
        Name = 'boleto.beneficiario.endereco.localidade'
        Value = 'MANAUS'
      end
      item
        Name = 'boleto.beneficiario.endereco.bairro'
        Value = 'PETROPOLIS'
      end
      item
        Name = 'boleto.beneficiario.endereco.logradouro'
        Value = 'RUA TESTE'
      end
      item
        Name = 'boleto.beneficiario.endereco.numero'
        Value = '295'
      end
      item
        Name = 'boleto.emissao'
        Value = '2020-05-09'
      end
      item
        Name = 'boleto.vencimento'
        Value = '2020-05-11'
      end
      item
        Name = 'boleto.documento'
        Value = '123456'
      end
      item
        Name = 'boleto.titulo'
        Value = 'DM'
      end
      item
        Name = 'boleto.valor'
        Value = '4.00'
      end
      item
        Name = 'boleto.pagador.nome'
        Value = 'DAVID BANDEIRA'
      end
      item
        Name = 'boleto.pagador.cprf'
        Value = '751.537.772-00'
      end
      item
        Name = 'boleto.pagador.endereco.cep'
        Value = '05541-030'
      end
      item
        Name = 'boleto.pagador.endereco.uf'
        Value = 'SP'
      end
      item
        Name = 'boleto.pagador.endereco.localidade'
        Value = 'S'#195'O PAULO'
      end
      item
        Name = 'boleto.pagador.endereco.bairro'
        Value = 'JARDIM DAS VERTENTES'
      end
      item
        Name = 'boleto.pagador.endereco.logradouro'
        Value = 'RUA TRAJANO REIS'
      end
      item
        Name = 'boleto.pagador.endereco.numero'
        Value = '47'
      end
      item
        Name = 'boleto.instrucao'
        Value = 'SOMENTE TESTE'
      end
      item
        Name = 'boleto.instrucao'
        Value = 'N'#195'O PAGAR'
      end
      item
        Name = 'boleto.instrucao'
        Value = 'TESTE API'
      end
      item
        Name = 'boleto.conta.convenio'
        Value = '123456-7'
      end
      item
        Name = 'boleto.sequencial'
        Value = '1'
      end>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 208
    Top = 88
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/pdf'
    Left = 304
    Top = 88
  end
  object HTTPBasicAuthenticator1: THTTPBasicAuthenticator
    Username = 'api-key_sy8qW0AMexdxFtW59a96gzlosGIp5jglsm3EBUIU2Zs='
    Password = 'token'
    Left = 410
    Top = 88
  end
end
