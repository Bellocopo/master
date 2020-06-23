object fr: Tfr
  OldCreateOrder = False
  Height = 311
  Width = 747
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 400
    Top = 144
  end
  object frxCheckBoxObj: TfrxCheckBoxObject
    Left = 48
    Top = 144
  end
  object frxReport: TfrxReport
    Tag = 1
    Version = '6.2.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40401.475989294000000000
    ReportOptions.LastChange = 43753.602653113430000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      
        '  DADOS_ENDERECO   : String;                                    ' +
        '             '
      '  DESCR_CST        : String;'
      '  intTotalPaginas  : integer;  '
      '  ContNF           : integer;'
      '  NumMaxNF         : integer;'
      '  ChildDocAnterior_: boolean;'
      
        '  qtdValores       : Integer;                                   ' +
        '                   '
      '    '
      'procedure Footer1OnBeforePrint(Sender: TfrxComponent);'
      
        'var Tam: currency;                                              ' +
        '     '
      'begin'
      '  tam := PageFooter1.Height;                  '
      '  if <Page> = 1 then'
      '  begin'
      '    if <Identificacao."modal">='#39'02'#39' then'
      '       begin                                        '
      
        '          tam := Tam + ChildObs.Height + ChildAereo.Height + Chi' +
        'ldFisco.Height;  '
      
        '             if <Parametros."PrintCanhoto">= '#39'1'#39' then    {0- Cab' +
        'e'#231'alho; 1- Rodap'#233'}    '
      
        '                tam := tam + ChildCabecalhoRodapeAereo.Height;  ' +
        '                            '
      '       end                           '
      '    else if <Identificacao."modal">='#39'03'#39' then'
      '       begin                                        '
      
        '          tam := Tam + ChildObs.Height + ChildAquaviario.Height ' +
        '+ ChildFisco.Height;  '
      '          if <Parametros."PrintCanhoto">= '#39'1'#39' then'
      
        '             tam := tam + ChildCabecalhoRodape.Height;          ' +
        '    '
      '       end                           '
      '    else'
      '       begin                                        '
      
        '          tam := Tam + ChildObs.Height + ChildRodo.Height + Chil' +
        'dFisco.Height;'
      '          if <Parametros."PrintCanhoto">= '#39'1'#39' then'
      
        '             tam := tam + ChildCabecalhoRodape.Height;          ' +
        '    '
      '       end;                             '
      '        '
      '    if (<ModalRodoviario."LOTACAO"> = '#39'Sim'#39') then'
      
        '       Tam := Tam + ChildRodoviarioLotacao.Height + ChildMotoris' +
        'taRodovLotacao.Height                          '
      '    else'
      '       Tam := Tam + ChildRodoviarioValePedagio.Height;'
      '         '
      '    if <DocAnterior."CNPJCPF"><>'#39#39' then'
      '       Tam := Tam + ChildDocAnterior.Height;'
      '         '
      
        '    if (<Identificacao."TpCT">='#39'Anula'#231#227'o'#39')or(<Identificacao."TpC' +
        'T">='#39'Complemento'#39') then'
      '       Tam := Tam + ChildAnuladoComple.Height;'
      '         '
      '  end;'
      '  while Engine.FreeSpace > tam do'
      '  begin              '
      '     Engine.ShowBand(Child1);'
      '  end;'
      'end;'
      '  '
      'procedure PageHeader1OnBeforePrint(Sender: TfrxComponent);'
      'var'
      '  intNr_Nota : String;'
      'begin'
      '  if <Identificacao."TpCT"> = '#39'Complemento'#39' then'
      '     IdentificacaoTpCT.Text := '#39'Complemento de Valores'#39
      
        '  else if <Identificacao."TpCT"> = '#39'Anula'#231#227'o'#39' then              ' +
        '                                                   '
      '     IdentificacaoTpCT.Text := '#39'Anula'#231#227'o'#39
      
        '  else if <Identificacao."TpCT"> = '#39'Normal'#39' then                ' +
        '                                                 '
      '     IdentificacaoTpCT.Text := '#39'Normal'#39
      
        '  else if <Identificacao."TpCT"> = '#39'Substituto'#39' then            ' +
        '                                                     '
      '     IdentificacaoTpCT.Text := '#39'Substituto'#39';    '
      '  '
      '  if IntNr_Nota <> <Identificacao."NCT"> then'
      '  Begin'
      '     intTotalPaginas := 1;'
      
        '     Set('#39'varTotalPaginas'#39','#39#39#39#39'+InTToStr(intTotalPaginas)+'#39#39#39#39');' +
        '                                                                ' +
        '         '
      '     IntNr_Nota :=  <Identificacao."NCT">;'
      '  end'
      '  else'
      '  begin'
      '    Inc(intTotalPaginas);'
      
        '     Set('#39'varTotalPaginas'#39','#39#39#39#39'+InTToStr(intTotalPaginas)+'#39#39#39#39');' +
        '        '
      '  end;'
      '  //'
      '  if (<page> > 1) and (ChildDocAnterior_) then'
      
        '     PageHeader1.Child := ChildDocAnterior                      ' +
        '               '
      '  else if <Page> > 1 then'
      '     PageHeader1.Child := ChildNF;'
      '       '
      '  if Trim(<Parametros."Imagem">) <> '#39#39' then'
      '    imgLogomarca.Picture.LoadFromFile(<Parametros."Imagem">);'
      'end;'
      ''
      'procedure Overlay1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  Overlay1.Visible := (<Parametros."Mensagem0"> <> '#39#39');'
      '  if Overlay1.Visible then'
      '  begin              '
      '    Overlay1.Height        := Engine.PageHeight;'
      
        '    memWatermark.Width     := Overlay1.Width;                   ' +
        '               '
      '    memWatermark.Height    := Engine.PageHeight;'
      '    memWatermark.Font.Size := 40;'
      '  end;                  '
      'end;'
      ''
      'procedure Memo11OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   DADOS_ENDERECO := Trim('
      '    <Emitente."XLgr"> + '#39', '#39' + <Emitente."Nro"> + #13 +       '
      
        '    <Emitente."XBairro"> + '#39' - '#39' + <Emitente."XMun"> + '#39' - '#39' + <' +
        'Emitente."UF"> + #13 +                   '
      
        '    '#39'Fone: '#39' + <Emitente."Fone"> + '#39' CEP: '#39' + <Emitente."CEP"> +' +
        ' #13 +       '
      '    <Parametros."Site"> + '#39'  '#39' +<Parametros."Email">+ #13 +'
      
        '    '#39'CNPJ: '#39'+<Emitente."CNPJ">+'#39'      IE:'#39'+<Emitente."IE">      ' +
        '                                                      '
      '  );  '
      'end;'
      ''
      'procedure ChildRodoOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <ModalRodoviario."LOTACAO"> = '#39'Sim'#39' then'
      '  begin'
      
        '    ChildRodo.Child                  := ChildRodoviarioLotacao; ' +
        '             '
      '    ChildRodoviarioLotacao.Visible   := True;'
      '    //ChildRodoviarioLotacao.Child   := ChildFisco;'
      
        '    ChildMotoristaRodovLotacao.Child := ChildFisco;             ' +
        '                                                                ' +
        '                                     '
      
        '    //ChildRodoviarioLotacao.Child   := <Identificacao."Identifi' +
        'cacao">ChildFisco;                            '
      '  end'
      '  else'
      '  begin'
      
        '    ChildRodo.Child                    := ChildRodoviarioValePed' +
        'agio;              '
      '    ChildRodoviarioValePedagio.Visible := True;'
      
        '    ChildRodoviarioValePedagio.Child   := ChildFisco;           ' +
        '  '
      '  end;            '
      'end;      '
      ''
      'procedure MasterData3OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  Inc(ContNF);'
      '  if (ContNF >= NumMaxNF) and (<Page> = 1) then'
      '  begin'
      '     Child3.Visible   := false;'
      '     Engine.ShowBand(ChildObs);'
      '     Footer1.Child    := nil;'
      
        '     ChildObs.Visible := False;                                 ' +
        '  '
      '  end;      '
      'end;'
      ''
      'procedure Footer1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      
        '  if (<DocAnterior."CNPJCPF"> <> '#39#39') and (<Identificacao."tpServ' +
        '"> = '#39'Normal'#39') then'
      '  begin              '
      '    Footer1.Child          := ChildDocAnterior;'
      
        '    ChildDocAnterior.Child := ChildObs;                         ' +
        '                                                   '
      '  end else'
      '    Footer1.Child          := ChildObs;        '
      'end;'
      ''
      'procedure ChildImpostoOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if (<Identificacao."tpServ"> <> '#39'Normal'#39') then'
      '  begin'
      '    ChildImposto.Child := ChildDocAnterior;'
      '    ChildDocAnterior.Child := ChildNF;'
      
        '    if (<Identificacao."tpServ"> = '#39'Intermedi'#225'rio'#39') or (<Identif' +
        'icacao."tpServ"> = '#39'Vinc. Multimodal'#39') then        '
      
        '       MasterData3.DataSetName := '#39'Emitente'#39';                   ' +
        '                                                                ' +
        '     '
      '  end;  '
      '  '
      
        '  if (<Identificacao."TpCT">='#39'Anula'#231#227'o'#39')or(<Identificacao."TpCT"' +
        '>='#39'Complemento'#39') then'
      '  begin'
      '    if (<Identificacao."tpServ"> <> '#39'Normal'#39') then'
      '    begin'
      '      ChildImposto.Child     := ChildDocAnterior;'
      '      ChildDocAnterior.Child := ChildAnuladoComple'
      '    end'
      '    else                  '
      '      ChildImposto.Child := ChildAnuladoComple;'
      '        '
      '    ChildAnuladoComple.Child := ChildObs;        '
      '    ChildObs.Child           := ChildFisco;'
      '//    ChildAnuladoComple.Child := ChildFisco;'
      '      '
      '    if <Identificacao."TpCT">='#39'Complemento'#39' then'
      '      Memo181.Text := '#39'CHAVE DO CT-E COMPLEMENTADO'#39
      
        '    else if <Identificacao."TpCT">='#39'Anula'#231#227'o'#39' then              ' +
        '                                                   '
      '      Memo181.Text := '#39'CHAVE DO CT-E ANULADO'#39';'
      '  end;              '
      'end;'
      '  '
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <Identificacao."modal"> = '#39'01'#39' then'
      '     begin                                               '
      '        Memo108.Text := '#39'RODOVI'#193'RIO'#39';  '
      
        '        ChildCabecalho.Visible := <Parametros."PrintCanhoto">='#39'0' +
        #39';                                                              ' +
        '                                        '
      '     end             '
      
        '  else if<Identificacao."modal"> = '#39'02'#39' then                    ' +
        '   '
      '     begin'
      
        '        ReportTitle1.Child                 := ChildCabecalhoAere' +
        'o;'
      
        '        ChildCabecalhoAereo.Visible        := <Parametros."Print' +
        'Canhoto">='#39'0'#39';            '
      
        '        Memo108.Text                       := '#39'A'#201'REO'#39';          ' +
        '   '
      '        ChildCabecalho.Visible             := false;'
      '        ChildRodo.Visible                  := false;'
      '        ChildRodoviarioLotacao.Visible     := false;'
      '        ChildRodoviarioValePedagio.Visible := false;          '
      '     end'
      '  else if <Identificacao."modal"> = '#39'03'#39' then'
      '     begin                                '
      '        Memo108.Text := '#39'AQUAVI'#193'RIO'#39';'
      
        '        ChildCabecalho.Visible := <Parametros."PrintCanhoto">='#39'0' +
        #39';         '
      '     end             '
      '  else if <Identificacao."modal"> = '#39'04'#39' then'
      '     begin                                '
      '        Memo108.Text := '#39'FERROVI'#193'RIO'#39';'
      
        '        ChildCabecalho.Visible := <Parametros."PrintCanhoto">='#39'0' +
        #39';            '
      '     end             '
      '  else if <Identificacao."modal"> = '#39'05'#39' then'
      '     begin                                         '
      '        Memo108.Text := '#39'DUTOVI'#193'RIO'#39';'
      
        '        ChildCabecalho.Visible := <Parametros."PrintCanhoto">='#39'0' +
        #39';'
      '     end             '
      '  else if <Identificacao."modal"> = '#39'06'#39' then'
      '     begin                                '
      '        Memo108.Text := '#39'MULTMODAL'#39';'
      
        '        ChildCabecalho.Visible := <Parametros."PrintCanhoto">='#39'0' +
        #39';'
      '     end;               '
      'end;'
      ''
      'procedure ChildObsOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <Identificacao."modal"> = '#39'02'#39' then                       '
      '     begin'
      
        '        if (<Identificacao."TpCT"> <> '#39'Anula'#231#227'o'#39') and (<Identifi' +
        'cacao."TpCT"> <> '#39'Complemento'#39') then         '
      '           begin'
      '              ChildObs.Child    := ChildAereo;'
      '              ChildRodo.Visible := false;'
      '              ChildAereo.Child  := ChildFisco;'
      '           end;                          '
      '        if not ChildCabecalhoAereo.Visible then'
      '           begin'
      '              ChildCabecalhoRodapeAereo.Visible := True;'
      
        '              ChildFisco.Child                  := ChildCabecalh' +
        'oRodapeAereo;                                                   ' +
        '                '
      '           end;                     '
      '     end'
      '  else if <Identificacao."modal"> = '#39'03'#39' then'
      '     begin'
      
        '        if (<Identificacao."TpCT"> <> '#39'Anula'#231#227'o'#39') and (<Identifi' +
        'cacao."TpCT"> <> '#39'Complemento'#39') then         '
      '           begin                  '
      '              ChildObs.Child          := ChildAquaviario;'
      '              ChildRodo.Visible       := false;            '
      '              ChildAquaviario.Visible := True;'
      '              ChildAquaviario.Child   := ChildFisco;'
      '           end;                    '
      '        if not ChildCabecalho.Visible then'
      '           begin'
      
        '              ChildCabecalhoRodape. Visible := true;            ' +
        '                                                                ' +
        '                         '
      
        '              ChildFisco.Child              := ChildCabecalhoRod' +
        'ape;'
      '           end;            '
      '      end'
      '  else if <Identificacao."modal"> = '#39'06'#39' then'
      '     begin'
      
        '        if (<Identificacao."TpCT"> <> '#39'Anula'#231#227'o'#39') and (<Identifi' +
        'cacao."TpCT"> <> '#39'Complemento'#39') then'
      '           begin                    '
      '              ChildObs.Child         := ChildMultModal;'
      '              ChildRodo.Visible      := false;            '
      '              ChildMultModal.Visible := True;'
      '              ChildMultModal.Child   := ChildFisco;'
      '           end;                  '
      '        if not ChildCabecalho.Visible then'
      '           begin'
      
        '              ChildCabecalhoRodape. Visible := true;            ' +
        '                                                                ' +
        '                         '
      
        '              ChildFisco.Child              := ChildCabecalhoRod' +
        'ape;'
      '           end;            '
      '     end                   '
      '  else      '
      '     begin'
      
        '        if (<Identificacao."TpCT"> <> '#39'Anula'#231#227'o'#39') and (<Identifi' +
        'cacao."TpCT"> <> '#39'Complemento'#39') then'
      '           begin                    '
      '              ChildObs.Child    := ChildRodo;'
      '              ChildRodo.Visible := True;'
      '              ChildRodo.Child   := ChildFisco;'
      '           end;             '
      '        if not ChildCabecalho.Visible then'
      '           begin'
      
        '              ChildCabecalhoRodape.Visible := true;             ' +
        '                                                                ' +
        '                        '
      
        '              ChildFisco.Child             := ChildCabecalhoRoda' +
        'pe;'
      '           end;                     '
      '     end;    '
      'end;           '
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  inc(qtdValores);'
      
        '  MasterData1.Visible := qtdValores <= 12;                      ' +
        '                                                  '
      'end;'
      ''
      'procedure ColumnFooter1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   if(<Page#> = 1) then'
      '       ColumnFooter1.Visible := False'
      '   else'
      '       ColumnFooter1.Visible := True;                     '
      'end;'
      ''
      'procedure ChildMultModalOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if (<MultiModal."indNegociavel"> = '#39'0'#39') then'
      '     begin'
      '        mNaoNegociavel.Clear;'
      
        '        mNaoNegociavel.Text := '#39' X'#39';                            ' +
        '        '
      '     end             '
      '  else'
      '     begin                                '
      '        mNegociavel.Clear;  '
      '        mNegociavel.Text := '#39' X'#39';              '
      '     end;                                                       '
      'end;'
      ''
      
        'procedure ChildAnuladoCompleOnBeforePrint(Sender: TfrxComponent)' +
        ';'
      'begin'
      '  if <Identificacao."modal"> = '#39'02'#39' then'
      '     begin              '
      '        if not ChildCabecalhoAereo.Visible then    '
      
        '           ChildAnuladoComple.Height := Engine.FreeSpace - (Chil' +
        'dObs.Height + ChildFisco.Height + PageFooter1.Height + ChildCabe' +
        'calhoRodapeAereo.Height)'
      '        else'
      
        '           ChildAnuladoComple.Height := Engine.FreeSpace - (Chil' +
        'dObs.Height + ChildFisco.Height + PageFooter1.Height);          ' +
        '      '
      '     end'
      '  else'
      '     begin'
      '        if not ChildCabecalho.Visible then'
      
        '           ChildAnuladoComple.Height := Engine.FreeSpace - (Chil' +
        'dObs.Height + ChildFisco.Height + PageFooter1.Height + ChildCabe' +
        'calhoRodape.Height)'
      '        else                    '
      
        '           ChildAnuladoComple.Height := Engine.FreeSpace - (Chil' +
        'dObs.Height + ChildFisco.Height + PageFooter1.Height);'
      '     end;         '
      'end;'
      ''
      'begin'
      ' ContNF := 0;'
      ' qtdValores := 0;'
      ' if <identificacao."modal"> = '#39'06'#39' then'
      '    NumMaxNF := 26       '
      
        ' else if  (<ModalRodoviario."LOTACAO"> = '#39'Sim'#39') then            ' +
        '             '
      '    NumMaxNF := 8        '
      
        ' else if (<ModalRodoviario."LOTACAO"> = '#39'N'#227'o'#39') or (<identificaca' +
        'o."modal"> = '#39'06'#39') then'
      '    NumMaxNF := 16                  '
      
        ' else if (<Identificacao."TpCT">='#39'Anula'#231#227'o'#39')or(<Identificacao."T' +
        'pCT">='#39'Complemento'#39') then'
      '    NumMaxNF := 8'
      ' else if <identificacao."modal"> = '#39'02'#39' then'
      '    NumMaxNF := 10'
      ' else if <identificacao."modal"> = '#39'03'#39' then'
      '    NumMaxNF := 18'
      '  else if (<Identificacao."tpServ"> <> '#39'Normal'#39') then'
      
        '    NumMaxNF := 16 - ((MasterData8.DataSet.RecordCount - 1) * 2)' +
        '        '
      ' else'
      '    NumMaxNF := 12;'
      'end.  ')
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 48
    Top = 16
    Datasets = <
      item
        DataSetName = 'Identificacao'
      end
      item
        DataSetName = 'Emitente'
      end
      item
        DataSetName = 'Destinatario'
      end
      item
        DataSetName = 'DadosNotasFiscais'
      end
      item
        DataSetName = 'Parametros'
      end
      item
        DataSetName = 'Volumes'
      end
      item
        DataSetName = 'InformacoesAdicionais'
      end
      item
        DataSetName = 'Tomador'
      end
      item
        DataSetName = 'Expedidor'
      end
      item
        DataSetName = 'Recebedor'
      end
      item
        DataSetName = 'Remetente'
      end
      item
        DataSetName = 'CalculoImposto'
      end
      item
        DataSetName = 'ComponentesPrestacao'
      end
      item
        DataSetName = 'Seguro'
      end
      item
        DataSetName = 'ModalRodoviario'
      end
      item
        DataSetName = 'ModalAquaviario'
      end
      item
        DataSetName = 'ModalAereo'
      end
      item
        DataSetName = 'MultiModal'
      end
      item
        DataSetName = 'Veiculos'
      end
      item
        DataSetName = 'ValePedagio'
      end
      item
        DataSetName = 'Motorista'
      end
      item
        DataSetName = 'DocAnterior'
      end
      item
        DataSetName = 'AnuladoComple'
      end
      item
        DataSetName = 'Eventos'
      end>
    Variables = <
      item
        Name = ' Acbr'
        Value = Null
      end
      item
        Name = 'varTotalPaginas'
        Value = Null
      end>
    Style = <
      item
        Name = 'Style1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.ShadowWidth = 2.000000000000000000
        Frame.Typ = []
        Frame.LeftLine.Width = 0.100000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 7.000000000000000000
      RightMargin = 6.000000000000000000
      TopMargin = 7.000000000000000000
      BottomMargin = 7.000000000000000000
      BackPictureVisible = False
      Frame.Typ = []
      LargeDesignHeight = True
      VGuides.Strings = (
        '170,07885')
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 173.858267720000000000
        ParentFont = False
        Top = 139.842610000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'PageHeader1OnBeforePrint'
        Child = frxReport.Child3
        object Shape3: TfrxShapeView
          AllowVectorExport = True
          Left = 347.716760000000000000
          Top = 56.692913389999900000
          Width = 396.850650000000000000
          Height = 54.803149610000000000
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 347.716535430000000000
          Top = 56.251975830000000000
          Width = 98.267780000000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'C'#243'digo de Barra da Chave Acesso')
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          AllowVectorExport = True
          Width = 347.716760000000000000
          Height = 124.724409450000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 638.740157480000000000
          Width = 105.826840000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'MODAL')
          ParentFont = False
        end
        object BarCode1: TfrxBarCodeView
          AllowVectorExport = True
          Left = 506.641860430000000000
          Top = 69.252010000000000000
          Width = 79.000000000000000000
          Height = 39.685039370000000000
          BarType = bcCode128C
          Expression = '<Identificacao."ID">'
          Frame.Typ = []
          HAlign = haCenter
          Rotation = 0
          ShowText = False
          TestLine = False
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 347.716535430000000000
          Top = 111.496062990000000000
          Width = 396.850650000000000000
          Height = 37.795275590551200000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            
              'Chave de acesso para cosulta de autenticidade no site www.cte.fa' +
              'zenda.gov.br')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 364.724420430000000000
          Top = 127.385900000000000000
          Width = 362.834880000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Identificacao."Chave"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 347.716535430000000000
          Width = 291.023724570000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'DACTE')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 1.779530000000000000
          Top = 2.338590000000000000
          Width = 343.937230000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Emitente."XNome"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 98.157704880000000000
          Top = 29.456710000000000000
          Width = 247.559055120000000000
          Height = 88.818931810000000000
          OnBeforePrint = 'Memo11OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          LineSpacing = 4.000000000000000000
          Memo.UTF8W = (
            '[DADOS_ENDERECO]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 357.165317720000000000
          Top = 17.338590000000000000
          Width = 272.126160000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Documento Auxiliar do Conhecimento de Transporte Eletr'#244'nico')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Top = 149.291338580000000000
          Width = 347.716760000000000000
          Height = 24.566929130000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'CFOP - NATUREZA DA OPERA'#199#195'O')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 4.338590000000000000
          Top = 159.189000790000000000
          Width = 340.157700000000000000
          Height = 13.228344020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Identificacao."CFOP"] - [Identificacao."NatOp"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 347.716535430000000000
          Top = 149.291338580000000000
          Width = 396.850650000000000000
          Height = 24.566929130000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            '[Parametros."Contingencia_Descricao"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 364.724420430000000000
          Top = 159.189000790000000000
          Width = 362.834880000000000000
          Height = 13.228344020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Parametros."Contingencia_Valor"]')
          ParentFont = False
        end
        object imgLogomarca: TfrxPictureView
          AllowVectorExport = True
          Left = 1.779530000000000000
          Top = 29.456710000000000000
          Width = 94.488188980000000000
          Height = 61.984251970000000000
          Center = True
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 347.716535430000000000
          Top = 30.236220470000000000
          Width = 37.795300000000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'MODELO')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 385.512060000000000000
          Top = 30.236220470000000000
          Width = 30.236240000000000000
          Height = 26.456692913385800000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'S'#201'RIE')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 415.764070000000000000
          Top = 30.236220470000000000
          Width = 86.929190000000000000
          Height = 26.456692913385800000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'N'#218'MERO')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 502.677150710000000000
          Top = 30.236220470000000000
          Width = 30.236240000000000000
          Height = 26.456692913385800000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'FL')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 532.913368740000000000
          Top = 30.236220470000000000
          Width = 105.826840000000000000
          Height = 26.456692913385800000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'DATA E HORA EMISS'#195'O')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 638.740157480000000000
          Top = 30.236220470000000000
          Width = 105.826840000000000000
          Height = 26.456692913385800000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'INSC. SUFRAMA DESTINATARIO')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 260.787401570000000000
          Top = 124.724409450000000000
          Width = 86.929190000000000000
          Height = 24.566929130000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'FORMA DE PAGAMENTO')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 173.858267720000000000
          Top = 124.724409448819000000
          Width = 86.929190000000000000
          Height = 24.566929130000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'TOMADOR DO SERVI'#199'O')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 102.047244090000000000
          Top = 124.724409450000000000
          Width = 71.811023620000000000
          Height = 24.566929130000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'TIPO DO SERVI'#199'O')
          ParentFont = False
        end
        object Memo192: TfrxMemoView
          AllowVectorExport = True
          Top = 124.724409450000000000
          Width = 102.047244090000000000
          Height = 24.566929130000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'TIPO DO CT-E')
          ParentFont = False
        end
        object IdentificacaoMod_: TfrxMemoView
          AllowVectorExport = True
          Left = 352.071120000000000000
          Top = 39.685039370000000000
          Width = 30.236240000000000000
          Height = 15.118110240000000000
          DataField = 'Mod_'
          DataSetName = 'Identificacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Identificacao."Mod_"]')
          ParentFont = False
          WordWrap = False
        end
        object IdentificacaoSerie: TfrxMemoView
          AllowVectorExport = True
          Left = 389.071120000000000000
          Top = 39.685039370000000000
          Width = 22.677180000000000000
          Height = 15.118110236220500000
          DataField = 'Serie'
          DataSetName = 'Identificacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Identificacao."Serie"]')
          ParentFont = False
          WordWrap = False
        end
        object IdentificacaoNCT: TfrxMemoView
          AllowVectorExport = True
          Left = 417.882190000000000000
          Top = 39.685039370000000000
          Width = 83.149660000000000000
          Height = 15.118110236220500000
          DataField = 'NCT'
          DataSetName = 'Identificacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Identificacao."NCT"]')
          ParentFont = False
          WordWrap = False
        end
        object IdentificacaoTpCT: TfrxMemoView
          AllowVectorExport = True
          Left = 1.889763770000000000
          Top = 135.118110240000000000
          Width = 98.267716540000000000
          Height = 13.228346460000000000
          DataSetName = 'Identificacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          ParentFont = False
        end
        object IdentificacaotpServ: TfrxMemoView
          AllowVectorExport = True
          Left = 103.937007870000000000
          Top = 135.118110240000000000
          Width = 68.031496060000000000
          Height = 13.228346460000000000
          DataField = 'tpServ'
          DataSetName = 'Identificacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Identificacao."tpServ"]')
          ParentFont = False
          WordWrap = False
        end
        object Identificacaotoma: TfrxMemoView
          AllowVectorExport = True
          Left = 177.535560000000000000
          Top = 135.118110240000000000
          Width = 79.370130000000000000
          Height = 13.228346460000000000
          DataField = 'toma'
          DataSetName = 'Identificacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Identificacao."toma"]')
          ParentFont = False
          WordWrap = False
        end
        object IdentificacaoforPag: TfrxMemoView
          AllowVectorExport = True
          Left = 263.126160000000000000
          Top = 135.118110240000000000
          Width = 83.149660000000000000
          Height = 13.228346460000000000
          DataField = 'forPag'
          DataSetName = 'Identificacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Identificacao."forPag"]')
          ParentFont = False
        end
        object TotalPaginas: TfrxMemoView
          AllowVectorExport = True
          Left = 504.354670000000000000
          Top = 39.685039370000000000
          Width = 26.456710000000000000
          Height = 15.118110236220500000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Page]/[TotalPages#]')
          ParentFont = False
          WordWrap = False
        end
        object Memo108: TfrxMemoView
          AllowVectorExport = True
          Left = 650.078747480000000000
          Top = 14.118120000000000000
          Width = 83.149660000000000000
          Height = 17.007876460000000000
          DataSetName = 'Identificacao'
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'RODOVI'#193'RIO')
          ParentFont = False
          WordWrap = False
        end
        object IdentificacaodhEmi1: TfrxMemoView
          AllowVectorExport = True
          Left = 536.693260000000000000
          Top = 39.685039370000000000
          Width = 98.267780000000000000
          Height = 15.118110236220500000
          DataField = 'dhEmi'
          DataSetName = 'Identificacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Identificacao."dhEmi"]')
          ParentFont = False
        end
        object Memo245: TfrxMemoView
          AllowVectorExport = True
          Left = 648.188982480000000000
          Top = 39.685039370000000000
          Width = 86.929190000000000000
          Height = 15.118110236220500000
          DataField = 'ISUF'
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Destinatario."ISUF"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -7
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 11.338582680000000000
        ParentFont = False
        Top = 2486.930740000000000000
        Width = 744.567410000000000000
        object Memo150: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 309.921460000000000000
          Height = 9.448816460000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            
              'DATA E HORA DA IMPRESS'#195'O: [Date #ddd/mm/yyyy] [Time #dhh:mm:ss] ' +
              '[Parametros."Usuario"]')
          ParentFont = False
        end
        object Memo151: TfrxMemoView
          AllowVectorExport = True
          Left = 309.921460000000000000
          Width = 389.291590000000000000
          Height = 9.448816460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Parametros."Sistema"]')
          ParentFont = False
        end
        object Memo158: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 699.213050000000000000
          Width = 45.354360000000000000
          Height = 9.448816460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Parametros."Versao"]')
          ParentFont = False
        end
      end
      object Overlay1: TfrxOverlay
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 37.795275590000000000
        ParentFont = False
        Top = 1035.591220000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'Overlay1OnBeforePrint'
        object memWatermark: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 744.567410000000000000
          Height = 37.795275590000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clSilver
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haCenter
          LineSpacing = 15.000000000000000000
          Memo.UTF8W = (
            '[Parametros."Mensagem0"]')
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Top = 1096.063700000000000000
        Width = 744.567410000000000000
        OnAfterPrint = 'Footer1OnAfterPrint'
        OnBeforePrint = 'Footer1OnBeforePrint'
        Child = frxReport.ChildObs
      end
      object Child1: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 9.448814020000000000
        ParentFont = False
        Top = 1481.575760000000000000
        Width = 744.567410000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo100: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 372.283464570000000000
          Height = 9.448814020000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          ParentFont = False
        end
        object Memo101: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 372.283945430000000000
          Width = 372.283464570000000000
          Height = 9.448814020000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          ParentFont = False
        end
      end
      object ChildComponentes: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 73.322834650000000000
        ParentFont = False
        Top = 789.921770000000000000
        Width = 744.567410000000000000
        Child = frxReport.ChildImposto
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 561.259842520000000000
          Top = 45.354330709999900000
          Width = 183.307086610000000000
          Height = 27.968503940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'VALOR A RECEBER')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 561.259842520000000000
          Top = 15.118110240000100000
          Width = 183.307086610000000000
          Height = 30.236220470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'VALOR TOTAL DO SERVI'#199'O')
          ParentFont = False
        end
        object ComponentesPrestacaoTotalServico: TfrxMemoView
          AllowVectorExport = True
          Left = 622.283860000000000000
          Top = 27.456710000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          DataField = 'TotalServico'
          DataSetName = 'ComponentesPrestacao'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[ComponentesPrestacao."TotalServico"]')
          ParentFont = False
          WordWrap = False
        end
        object ComponentesPrestacaoTotalReceber: TfrxMemoView
          AllowVectorExport = True
          Left = 622.283860000000000000
          Top = 55.692950000000000000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          DataField = 'TotalReceber'
          DataSetName = 'ComponentesPrestacao'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[ComponentesPrestacao."TotalReceber"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Width = 744.567410000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'COMPONENTES DO VALOR DA PRESTA'#199#195'O DE SERVI'#199'O')
          ParentFont = False
        end
        object Memo154: TfrxMemoView
          AllowVectorExport = True
          Top = 15.118110240000000000
          Width = 187.086614170000000000
          Height = 58.204714650000000000
          DataSetName = 'ComponentesPrestacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.500000000000000000
          ParentFont = False
        end
        object Memo155: TfrxMemoView
          AllowVectorExport = True
          Left = 187.086614170000000000
          Top = 15.118110240000000000
          Width = 187.086614170000000000
          Height = 58.204714650000000000
          DataSetName = 'ComponentesPrestacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.500000000000000000
          ParentFont = False
        end
        object Memo156: TfrxMemoView
          AllowVectorExport = True
          Left = 374.173228350000000000
          Top = 15.118110240000000000
          Width = 187.086614170000000000
          Height = 58.204714650000000000
          DataSetName = 'ComponentesPrestacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.500000000000000000
          ParentFont = False
        end
        object Subreport1: TfrxSubreport
          AllowVectorExport = True
          Top = 15.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = frxReport.Page3
        end
      end
      object ChildImposto: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 35.905511810000000000
        ParentFont = False
        Top = 884.410020000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'ChildImpostoOnBeforePrint'
        Child = frxReport.ChildNF
        ToNRows = 0
        ToNRowsMode = rmCount
        object Shape7: TfrxShapeView
          AllowVectorExport = True
          Width = 744.567410000000000000
          Height = 13.228346460000000000
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 274.905690000000000000
          Width = 196.535560000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'INFORMA'#199#213'ES RELATIVAS AO IMPOSTO')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Top = 13.228346460000000000
          Width = 372.283464570000000000
          Height = 22.677162910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'SITUA'#199#195'O TRIBUT'#193'RIA')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 372.283464570000000000
          Top = 13.228346460000000000
          Width = 103.937007870000000000
          Height = 22.677162910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'BASE DE C'#193'LCULO')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220472440000000000
          Top = 13.228346456692900000
          Width = 41.574781180000000000
          Height = 22.677165350000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'AL ICMS (%)')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          AllowVectorExport = True
          Left = 517.795273150000000000
          Top = 13.228346456692900000
          Width = 90.708720000000000000
          Height = 22.677162910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'VALOR ICMS')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          AllowVectorExport = True
          Left = 608.503937010000000000
          Top = 13.228346456692900000
          Width = 56.692950000000000000
          Height = 22.677162910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            '% RED.BC.CALC')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          AllowVectorExport = True
          Left = 665.197280000000000000
          Top = 13.228346456692900000
          Width = 79.370130000000000000
          Height = 22.677162910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'ICMS ST')
          ParentFont = False
        end
        object CalculoImpostoTXTSITTRIB: TfrxMemoView
          AllowVectorExport = True
          Left = 6.559060000000000000
          Top = 23.188578499999900000
          Width = 355.275820000000000000
          Height = 11.338590000000000000
          DataSetName = 'CalculoImposto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[CalculoImposto."TXTSITTRIB"]')
          ParentFont = False
          WordWrap = False
        end
        object CalculoImpostoVBC: TfrxMemoView
          AllowVectorExport = True
          Left = 389.905690000000000000
          Top = 23.188578500000000000
          Width = 83.149660000000000000
          Height = 11.338590000000000000
          DataSetName = 'CalculoImposto'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[IIF(<CalculoImposto."TXTSITTRIB">  = '#39'SN - SIMPLES NACIONAL'#39','#39#39 +
              ',<CalculoImposto."VBC">)]')
          ParentFont = False
          WordWrap = False
        end
        object CalculoImpostoPICMS: TfrxMemoView
          AllowVectorExport = True
          Left = 484.512060000000000000
          Top = 23.188578500000000000
          Width = 30.236240000000000000
          Height = 11.338590000000000000
          DataSetName = 'CalculoImposto'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[IIF(<CalculoImposto."TXTSITTRIB">  = '#39'SN - SIMPLES NACIONAL'#39','#39#39 +
              ',<CalculoImposto."PICMS">)]')
          ParentFont = False
          WordWrap = False
        end
        object CalculoImpostoVICMS: TfrxMemoView
          AllowVectorExport = True
          Left = 534.220780000000000000
          Top = 23.188578500000000000
          Width = 71.811070000000000000
          Height = 11.338590000000000000
          DataSetName = 'CalculoImposto'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[IIF( (<CalculoImposto."TXTSITTRIB">  = '#39'SN - SIMPLES NACIONAL'#39')' +
              ' or (<CalculoImposto."TXTSITTRIB">  = '#39'60 - ICMS COBRADO POR SUB' +
              'STIUI'#199#195'O TRIBUT'#193'RIA'#39') ,'#39#39',<CalculoImposto."VICMS">)]')
          ParentFont = False
          WordWrap = False
        end
        object CalculoImpostopRedBC: TfrxMemoView
          AllowVectorExport = True
          Left = 617.268090000000000000
          Top = 23.188578500000000000
          Width = 41.574830000000000000
          Height = 11.338590000000000000
          DataSetName = 'CalculoImposto'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[IIF(<CalculoImposto."TXTSITTRIB">  = '#39'SN - SIMPLES NACIONAL'#39','#39#39 +
              ',<CalculoImposto."pRedBC">)]')
          ParentFont = False
          WordWrap = False
        end
        object CalculoImpostoVICMSST: TfrxMemoView
          AllowVectorExport = True
          Left = 667.976810000000000000
          Top = 23.188578500000000000
          Width = 71.811070000000000000
          Height = 11.338590000000000000
          DataSetName = 'CalculoImposto'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[IIF(  (<CalculoImposto."TXTSITTRIB">  = '#39'60 - ICMS COBRADO POR ' +
              'SUBSTIUI'#199#195'O TRIBUT'#193'RIA'#39') ,<CalculoImposto."VICMS">,<CalculoImpos' +
              'to."VICMSST">)]')
          ParentFont = False
          WordWrap = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Top = 18.897650000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        Child = frxReport.ChildCabecalho
      end
      object ChildCabecalho: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 75.590551180000000000
        ParentFont = False
        Top = 41.574830000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'ChildCabecalhoOnBeforePrint'
        ToNRows = 0
        ToNRowsMode = rmCount
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 70.299212600000000000
          Width = 744.567410000000000000
          Color = clBlack
          Frame.Color = clSilver
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
        end
        object Memo89: TfrxMemoView
          AllowVectorExport = True
          Width = 744.567410000000000000
          Height = 12.850393700000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            
              'DECLARO QUE RECEBI OS VOLUMES DESTE CONHECIMENTO EM PERFEITO EST' +
              'ADO PELO QUE DOU POR CUMPRIDO O PRESENTE CONTRATO DE TRANSPORTE')
          ParentFont = False
        end
        object Memo92: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 215.433087950000000000
          Top = 27.968503940000000000
          Width = 268.346507950000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'ASSINATURA / CARIMBO')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo94: TfrxMemoView
          AllowVectorExport = True
          Left = 638.740157480000000000
          Top = 12.850393700000000000
          Width = 105.826771650000000000
          Height = 52.913385830000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          ParentFont = False
        end
        object Memo96: TfrxMemoView
          AllowVectorExport = True
          Left = 674.315400000000000000
          Top = 16.338590000000000000
          Width = 49.133890000000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.DropShadow = True
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'CT-e')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo97: TfrxMemoView
          AllowVectorExport = True
          Left = 661.417750000000000000
          Top = 36.015770000000000000
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          DataSetName = 'Identificacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Identificacao."NCT"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo98: TfrxMemoView
          AllowVectorExport = True
          Left = 672.756340000000000000
          Top = 51.354360000000000000
          Width = 68.031488740000000000
          Height = 13.228346460000000000
          DataSetName = 'Identificacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Identificacao."Serie"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo246: TfrxMemoView
          AllowVectorExport = True
          Top = 12.850393700000000000
          Width = 638.740157480000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo247: TfrxMemoView
          AllowVectorExport = True
          Left = 644.299630000000000000
          Top = 36.795300000000000000
          Width = 15.118110240000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#186'.')
          ParentFont = False
        end
        object Memo248: TfrxMemoView
          AllowVectorExport = True
          Left = 644.520100000000000000
          Top = 51.401574800000000000
          Width = 26.456700240000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'S'#233'rie.')
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Top = 27.968503940000000000
          Width = 215.433087950000000000
          Height = 18.897632910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'NOME:')
          ParentFont = False
        end
        object Memo91: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Top = 46.866141730000000000
          Width = 215.433087950000000000
          Height = 18.897632910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'RG:')
          ParentFont = False
        end
        object Memo93: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 483.779595900000000000
          Top = 27.968503940000000000
          Width = 154.960607950000000000
          Height = 18.897632910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'CHEGADA DATA / HORA')
          ParentFont = False
        end
        object Memo95: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 483.779595900000000000
          Top = 46.866141730000000000
          Width = 154.960629920000000000
          Height = 18.897632910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'SAIDA DATA / HORA')
          ParentFont = False
        end
        object Memo341: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 15.338590000000000000
          Width = 631.181510000000000000
          Height = 7.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Parametros."ResumoCanhoto"]')
          ParentFont = False
        end
      end
      object ChildRodo: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 35.905511810000000000
        Top = 1209.449600000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'ChildRodoOnBeforePrint'
        Child = frxReport.ChildFisco
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo133: TfrxMemoView
          AllowVectorExport = True
          Width = 744.567410000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'DADOS ESPECIFICOS DO MODAL RODOVI'#193'RIO')
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          AllowVectorExport = True
          Top = 13.228346460000000000
          Width = 120.944960000000000000
          Height = 22.677162910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'RNTRC DA EMPRESA')
          ParentFont = False
        end
        object Memo86: TfrxMemoView
          AllowVectorExport = True
          Left = 181.417322830000000000
          Top = 13.228346460000000000
          Width = 39.685039370000000000
          Height = 22.677165350000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'LOTA'#199#195'O')
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          AllowVectorExport = True
          Left = 221.102362200000000000
          Top = 13.228346460000000000
          Width = 151.181200000000000000
          Height = 22.677162910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'DATA PREVISTA DE ENTREGA')
          ParentFont = False
        end
        object Memo88: TfrxMemoView
          AllowVectorExport = True
          Left = 372.283464570000000000
          Top = 13.228346456692900000
          Width = 372.283464570000000000
          Height = 22.677162910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            
              '    ESSE CONHECIMENTO DE TRANSPORTE ATENDE '#192' LEGISLA'#199#195'O DE TRANS' +
              'PORTE RODOVI'#193'RIO EM VIGOR')
          ParentFont = False
          VAlign = vaCenter
        end
        object ModalRodoviarioRNTRC: TfrxMemoView
          AllowVectorExport = True
          Left = 4.559060000000000000
          Top = 22.228346460000000000
          Width = 113.385900000000000000
          Height = 13.228346460000000000
          DataField = 'RNTRC'
          DataSetName = 'ModalRodoviario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[ModalRodoviario."RNTRC"]')
          ParentFont = False
          WordWrap = False
        end
        object ModalRodoviarioLOTACAO: TfrxMemoView
          AllowVectorExport = True
          Left = 184.251957520000000000
          Top = 22.228346460000000000
          Width = 34.015770000000000000
          Height = 13.228346460000000000
          DataField = 'LOTACAO'
          DataSetName = 'ModalRodoviario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[ModalRodoviario."LOTACAO"]')
          ParentFont = False
          WordWrap = False
        end
        object ModalRodoviarioDATAPREVISTA: TfrxMemoView
          AllowVectorExport = True
          Left = 230.220478540000000000
          Top = 22.228346460000000000
          Width = 132.283550000000000000
          Height = 13.228346460000000000
          DataField = 'DATAPREVISTA'
          DataSetName = 'ModalRodoviario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[ModalRodoviario."DATAPREVISTA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo127: TfrxMemoView
          AllowVectorExport = True
          Left = 120.944881890000000000
          Top = 13.228346456692900000
          Width = 60.472480000000000000
          Height = 22.677162910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'CIOT')
          ParentFont = False
        end
        object Memo128: TfrxMemoView
          AllowVectorExport = True
          Left = 122.165430000000000000
          Top = 22.228346460000000000
          Width = 60.472480000000000000
          Height = 13.228346460000000000
          DataSetName = 'ModalRodoviario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[ModalRodoviario."CIOT"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object ChildObs: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 68.031496060000000000
        Top = 1118.740880000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'ChildObsOnBeforePrint'
        Child = frxReport.ChildRodo
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo82: TfrxMemoView
          AllowVectorExport = True
          Top = 15.118110240000000000
          Width = 744.567287950000000000
          Height = 52.913385826771700000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          AllowVectorExport = True
          Width = 744.567410000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'OBSERVA'#199#213'ES')
          ParentFont = False
        end
        object InformacoesAdicionaisOBS: TfrxMemoView
          AllowVectorExport = True
          Left = 5.559060000000000000
          Top = 18.897637800000000000
          Width = 733.228820000000000000
          Height = 45.354330710000000000
          DataSetName = 'InformacoesAdicionais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[InformacoesAdicionais."OBS"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object ChildFisco: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 64.251968500000000000
        Top = 1269.922080000000000000
        Width = 744.567410000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo129: TfrxMemoView
          AllowVectorExport = True
          Width = 449.764070000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'USO EXCLUSIVO DO EMISSOR DO CT-e')
          ParentFont = False
        end
        object Memo130: TfrxMemoView
          AllowVectorExport = True
          Left = 449.764070000000000000
          Width = 294.803340000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'RESERVADO AO FISCO')
          ParentFont = False
        end
        object Memo131: TfrxMemoView
          AllowVectorExport = True
          Top = 15.118110240000000000
          Width = 449.764070000000000000
          Height = 49.133858270000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[InformacoesAdicionais."infAdFisco"]'
            '[InformacoesAdicionais."ObsCont"]')
          ParentFont = False
        end
        object Memo132: TfrxMemoView
          AllowVectorExport = True
          Left = 449.764070000000000000
          Top = 15.118110240000000000
          Width = 294.803340000000000000
          Height = 49.133858267716500000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          ParentFont = False
        end
      end
      object ChildRodoviarioLotacao: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 75.590600000000000000
        Top = 1515.591530000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'ChildRodoviarioLotacaoOnBeforePrint'
        Child = frxReport.ChildMotoristaRodovLotacao
        Stretched = True
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo159: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897637800000200000
          Width = 60.472480000000000000
          Height = 56.692940240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          ParentFont = False
        end
        object Memo237: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Top = 30.220469999999800000
          Width = 517.795610000000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.ShadowWidth = 1.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          ParentFont = False
        end
        object Subreport2: TfrxSubreport
          AllowVectorExport = True
          Top = 18.897650000000300000
          Width = 60.472480000000000000
          Height = 7.559060000000000000
          Page = frxReport.Page2
        end
        object Memo84: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771653540000000000
          Width = 517.795610000000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.ShadowWidth = 1.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'INFORMA'#199#213'ES REFERENTES AO VALE PED'#193'GIO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo143: TfrxMemoView
          AllowVectorExport = True
          Width = 226.771800000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'IDENTIFICA'#199#195'O DO CONJUNTO TRANSPORTADOR')
          ParentFont = False
        end
        object Memo144: TfrxMemoView
          AllowVectorExport = True
          Top = 9.448818897637920000
          Width = 60.472480000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'TIPO')
          ParentFont = False
        end
        object Memo145: TfrxMemoView
          AllowVectorExport = True
          Left = 60.472480000000000000
          Top = 9.448818899999880000
          Width = 68.031540000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'PLACA')
          ParentFont = False
        end
        object Memo146: TfrxMemoView
          AllowVectorExport = True
          Left = 147.401670000000000000
          Top = 9.448818899999880000
          Width = 79.370130000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'RNTRC')
          ParentFont = False
        end
        object Memo147: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Top = 9.448818899999880000
          Width = 18.897650000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'UF')
          ParentFont = False
        end
        object Memo160: TfrxMemoView
          AllowVectorExport = True
          Left = 60.472480000000000000
          Top = 18.897637800000200000
          Width = 68.031540000000000000
          Height = 56.692940240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          ParentFont = False
        end
        object Memo161: TfrxMemoView
          AllowVectorExport = True
          Left = 147.401670000000000000
          Top = 18.897659759999900000
          Width = 79.370130000000000000
          Height = 56.692940240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          ParentFont = False
        end
        object Memo162: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Top = 18.897659759999900000
          Width = 18.897650000000000000
          Height = 56.692940240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          ParentFont = False
        end
        object Subreport7: TfrxSubreport
          AllowVectorExport = True
          Left = 226.771800000000000000
          Top = 32.015770000000000000
          Width = 94.488250000000000000
          Height = 18.897637800000000000
          Hyperlink.Kind = hkDetailPage
          Page = frxReport.Page8
        end
        object Memo135: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Top = 18.897674410000000000
          Width = 134.551156690000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '  CNPJ FORNECEDOR:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo136: TfrxMemoView
          AllowVectorExport = True
          Left = 361.322956690000000000
          Top = 18.897662200000000000
          Width = 157.228336690000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '  N'#218'MERO COMPROVANTE:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo137: TfrxMemoView
          AllowVectorExport = True
          Left = 518.551181100000000000
          Top = 18.897650000000300000
          Width = 134.551181100000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '  CNPJ RESPONS'#193'VEL:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo236: TfrxMemoView
          AllowVectorExport = True
          Left = 653.102362200000000000
          Top = 18.897650000000300000
          Width = 91.464566929133900000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'VALOR:')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Top = 767.244590000000000000
        Width = 744.567410000000000000
        Child = frxReport.ChildComponentes
        DataSetName = 'ComponentesPrestacao'
        RowCount = 0
      end
      object Child3: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 247.181102360000000000
        Top = 336.378170000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'Child3OnBeforePrint'
        ToNRows = 0
        ToNRowsMode = rmCount
        object Shape6: TfrxShapeView
          AllowVectorExport = True
          Left = 372.283945430000000000
          Top = 99.779527560000100000
          Width = 372.283464570000000000
          Height = 75.590551180000000000
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
        end
        object Shape5: TfrxShapeView
          AllowVectorExport = True
          Left = 372.283945430000000000
          Top = 24.188976377952700000
          Width = 372.283464570000000000
          Height = 75.590582910000000000
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
        end
        object Shape4: TfrxShapeView
          AllowVectorExport = True
          Top = 99.779527559055200000
          Width = 372.283464570000000000
          Height = 75.590551180000000000
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
        end
        object TomadorXNome: TfrxMemoView
          AllowVectorExport = True
          Left = 78.826840000000000000
          Top = 179.495980000000000000
          Width = 294.803340000000000000
          Height = 11.338590000000000000
          DataSetName = 'Tomador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Tomador."XNome"]')
          ParentFont = False
        end
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Top = 175.370078740000000000
          Width = 744.566929130000000000
          Height = 45.354330710000000000
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
        end
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Top = 24.188976377952700000
          Width = 372.283464570000000000
          Height = 75.590582910000000000
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Width = 372.283464570000000000
          Height = 24.188976380000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'ORIGEM DA PRESTA'#199#195'O')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 372.283945430000000000
          Width = 372.283464570000000000
          Height = 24.188976380000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'DESTINO DA PRESTA'#199#195'O')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Top = 220.724409450000000000
          Width = 362.834880000000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'PRODUTO PREDOMINANTE')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 362.834645670000000000
          Top = 220.724409448819000000
          Width = 234.330860000000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'OUTRAS  CARACTERISTICAS DA CARGA')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 597.165740000000000000
          Top = 220.724409448819000000
          Width = 147.401670000000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'VALOR TOTAL DA MERCADORIA')
          ParentFont = False
        end
        object IdentificacaoxMunIni: TfrxMemoView
          AllowVectorExport = True
          Left = 4.338590000000000000
          Top = 9.637600000000020000
          Width = 359.055350000000000000
          Height = 13.228346460000000000
          DataSetName = 'Identificacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Identificacao."xMunIni"] - [Identificacao."UFIni"]')
          ParentFont = False
          WordWrap = False
        end
        object IdentificacaoxMunFim: TfrxMemoView
          AllowVectorExport = True
          Left = 382.850650000000000000
          Top = 9.448818897637920000
          Width = 366.614410000000000000
          Height = 13.228346460000000000
          DataSetName = 'Identificacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Identificacao."xMunFim"] - [Identificacao."UFFim"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo54: TfrxMemoView
          AllowVectorExport = True
          Left = 46.252010000000000000
          Top = 27.456709999999900000
          Width = 321.260050000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Remetente."XNome"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo55: TfrxMemoView
          AllowVectorExport = True
          Left = 46.252010000000000000
          Top = 39.226785320000100000
          Width = 321.260050000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[Remetente."XLgr"] [IIF(<Remetente."Nro"> <> '#39#39','#39', N'#186#39','#39#39')] [Rem' +
              'etente."Nro"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo57: TfrxMemoView
          AllowVectorExport = True
          Left = 46.252010000000000000
          Top = 50.996860640000000000
          Width = 207.874150000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Remetente."XBairro"]')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          AllowVectorExport = True
          Left = 46.252010000000000000
          Top = 62.766935970000100000
          Width = 192.756030000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Remetente."XMun"]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          AllowVectorExport = True
          Left = 46.252010000000000000
          Top = 73.537011290000000000
          Width = 139.842610000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Remetente."CNPJ"]')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          AllowVectorExport = True
          Left = 112.252010000000000000
          Top = 85.307086609999900000
          Width = 143.622140000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Remetente."XPais"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo61: TfrxMemoView
          AllowVectorExport = True
          Left = 228.771800000000000000
          Top = 73.537011290000000000
          Width = 136.063080000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Remetente."IE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo62: TfrxMemoView
          AllowVectorExport = True
          Left = 279.905690000000000000
          Top = 85.307086609999900000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Remetente."Fone"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo63: TfrxMemoView
          AllowVectorExport = True
          Left = 279.905690000000000000
          Top = 62.766935970000100000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Remetente."CEP"]')
          ParentFont = False
          WordWrap = False
        end
        object TomadorXLgr: TfrxMemoView
          AllowVectorExport = True
          Left = 44.811070000000000000
          Top = 193.055040000000000000
          Width = 480.000310000000000000
          Height = 11.338590000000000000
          DataSetName = 'Tomador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            
              '[Tomador."XLgr"] [IIF(<Tomador."Nro"> <> '#39#39','#39', N'#186#39','#39#39')] [Tomador' +
              '."Nro"] [Tomador."XCpl"] - [Tomador."XBairro"]      ')
          ParentFont = False
        end
        object TomadorCNPJ: TfrxMemoView
          AllowVectorExport = True
          Left = 44.811070000000000000
          Top = 205.393630000000000000
          Width = 158.740260000000000000
          Height = 11.338590000000000000
          DataSetName = 'Tomador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Tomador."CNPJ"] ')
          ParentFont = False
        end
        object TomadorXMun: TfrxMemoView
          AllowVectorExport = True
          Left = 413.527830000000000000
          Top = 179.495980000000000000
          Width = 196.535560000000000000
          Height = 11.338590000000000000
          DataSetName = 'Tomador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Tomador."XMun"]')
          ParentFont = False
          WordWrap = False
        end
        object TomadorCEP: TfrxMemoView
          AllowVectorExport = True
          Left = 671.756340000000000000
          Top = 179.495980000000000000
          Width = 71.811070000000000000
          Height = 11.338590000000000000
          DataSetName = 'Tomador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Tomador."CEP"]')
          ParentFont = False
          WordWrap = False
        end
        object TomadorXPais: TfrxMemoView
          AllowVectorExport = True
          Left = 543.929500000000000000
          Top = 193.055040000000000000
          Width = 196.535560000000000000
          Height = 11.338590000000000000
          DataSetName = 'Tomador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Tomador."XPais"]')
          ParentFont = False
        end
        object VolumesProduto: TfrxMemoView
          AllowVectorExport = True
          Left = 5.338590000000000000
          Top = 230.551181102362000000
          Width = 351.496290000000000000
          Height = 13.228346460000000000
          DataField = 'Produto'
          DataSetName = 'Volumes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Volumes."Produto"]')
          ParentFont = False
          WordWrap = False
        end
        object VolumesCaracteristicaCarga: TfrxMemoView
          AllowVectorExport = True
          Left = 371.512060000000000000
          Top = 230.551181102362000000
          Width = 219.212740000000000000
          Height = 13.228346460000000000
          DataField = 'CaracteristicaCarga'
          DataSetName = 'Volumes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Volumes."CaracteristicaCarga"]')
          ParentFont = False
          WordWrap = False
        end
        object VolumesValorServico: TfrxMemoView
          AllowVectorExport = True
          Left = 631.740570000000000000
          Top = 230.551181102362000000
          Width = 105.826840000000000000
          Height = 13.228346460000000000
          DataField = 'ValorServico'
          DataSetName = 'Volumes'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Volumes."ValorServico"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo109: TfrxMemoView
          AllowVectorExport = True
          Left = 46.252010000000000000
          Top = 85.307086609999900000
          Width = 41.574830000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Remetente."UF"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo64: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Top = 102.937068900000000000
          Width = 321.260050000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Expedidor."XNome"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo65: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Top = 114.707144220000000000
          Width = 321.260050000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[Expedidor."XLgr"] [IIF(<Expedidor."Nro"> <> '#39#39','#39', N'#186#39','#39#39')] [Exp' +
              'edidor."Nro"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo66: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Top = 126.477219540000000000
          Width = 207.874150000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Expedidor."XBairro"]')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Top = 138.247294870000000000
          Width = 192.756030000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Expedidor."XMun"]')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Top = 149.017370190000000000
          Width = 139.842610000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Expedidor."CNPJ"]')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          AllowVectorExport = True
          Left = 111.354360000000000000
          Top = 160.787445510000000000
          Width = 143.622140000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Expedidor."XPais"]')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          AllowVectorExport = True
          Left = 227.874150000000000000
          Top = 149.017370190000000000
          Width = 136.063080000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Expedidor."IE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo71: TfrxMemoView
          AllowVectorExport = True
          Left = 279.008040000000000000
          Top = 160.787445510000000000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Expedidor."Fone"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo72: TfrxMemoView
          AllowVectorExport = True
          Left = 279.008040000000000000
          Top = 138.247294870000000000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Expedidor."CEP"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo73: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Top = 160.787445510000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Expedidor."UF"]')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          AllowVectorExport = True
          Left = 427.086890000000000000
          Top = 27.346468900000000000
          Width = 313.700990000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Destinatario."XNome"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo75: TfrxMemoView
          AllowVectorExport = True
          Left = 427.086890000000000000
          Top = 39.116544219999900000
          Width = 313.700990000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[Destinatario."XLgr"] [IIF(<Destinatario."Nro"> <> '#39#39','#39', N'#186#39','#39#39')' +
              '] [Destinatario."Nro"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo76: TfrxMemoView
          AllowVectorExport = True
          Left = 427.086890000000000000
          Top = 50.886619540000100000
          Width = 207.874150000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Destinatario."XBairro"]')
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          AllowVectorExport = True
          Left = 427.086890000000000000
          Top = 62.656694870000100000
          Width = 192.756030000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Destinatario."XMun"]')
          ParentFont = False
        end
        object Memo78: TfrxMemoView
          AllowVectorExport = True
          Left = 427.086890000000000000
          Top = 73.426770190000100000
          Width = 128.504020000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Destinatario."CNPJCPF"]')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          AllowVectorExport = True
          Left = 487.086890000000000000
          Top = 85.196845510000000000
          Width = 143.622140000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Destinatario."XPais"]')
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          AllowVectorExport = True
          Left = 600.606680000000000000
          Top = 73.426770190000100000
          Width = 136.063080000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Destinatario."IE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo81: TfrxMemoView
          AllowVectorExport = True
          Left = 654.740570000000000000
          Top = 85.196845510000000000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Destinatario."Fone"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo110: TfrxMemoView
          AllowVectorExport = True
          Left = 654.740570000000000000
          Top = 62.656694870000100000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Destinatario."CEP"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo111: TfrxMemoView
          AllowVectorExport = True
          Left = 427.086890000000000000
          Top = 85.196845510000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Destinatario."UF"]')
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          AllowVectorExport = True
          Left = 427.086890000000000000
          Top = 103.157538900000000000
          Width = 313.700990000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Recebedor."XNome"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo113: TfrxMemoView
          AllowVectorExport = True
          Left = 427.086890000000000000
          Top = 114.927614220000000000
          Width = 313.700990000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[Recebedor."XLgr"] [IIF(<Recebedor."Nro"> <> '#39#39','#39', N'#186#39','#39#39')] [Rec' +
              'ebedor."Nro"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo114: TfrxMemoView
          AllowVectorExport = True
          Left = 427.086890000000000000
          Top = 126.697689540000000000
          Width = 207.874150000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Recebedor."XBairro"]')
          ParentFont = False
        end
        object Memo115: TfrxMemoView
          AllowVectorExport = True
          Left = 427.086890000000000000
          Top = 138.467764870000000000
          Width = 192.756030000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Recebedor."XMun"]')
          ParentFont = False
        end
        object Memo116: TfrxMemoView
          AllowVectorExport = True
          Left = 427.086890000000000000
          Top = 149.237840190000000000
          Width = 128.504020000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Recebedor."CNPJ"]')
          ParentFont = False
        end
        object Memo117: TfrxMemoView
          AllowVectorExport = True
          Left = 487.086890000000000000
          Top = 161.007915510000000000
          Width = 143.622140000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Recebedor."XPais"]')
          ParentFont = False
        end
        object Memo118: TfrxMemoView
          AllowVectorExport = True
          Left = 600.606680000000000000
          Top = 149.237840190000000000
          Width = 136.063080000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Recebedor."IE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo119: TfrxMemoView
          AllowVectorExport = True
          Left = 654.740570000000000000
          Top = 161.007915510000000000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Recebedor."Fone"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo120: TfrxMemoView
          AllowVectorExport = True
          Left = 654.740570000000000000
          Top = 138.467764870000000000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Recebedor."CEP"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo121: TfrxMemoView
          AllowVectorExport = True
          Left = 427.086890000000000000
          Top = 161.007915510000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Recebedor."UF"]')
          ParentFont = False
        end
        object Memo122: TfrxMemoView
          AllowVectorExport = True
          Left = 627.181510000000000000
          Top = 179.495980000000000000
          Width = 26.456710000000000000
          Height = 11.338590000000000000
          DataSetName = 'Tomador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Tomador."UF"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo123: TfrxMemoView
          AllowVectorExport = True
          Left = 245.669450000000000000
          Top = 204.393630000000000000
          Width = 120.944960000000000000
          Height = 11.338590000000000000
          DataSetName = 'Tomador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Tomador."IE"]')
          ParentFont = False
        end
        object Memo124: TfrxMemoView
          AllowVectorExport = True
          Left = 396.850650000000000000
          Top = 204.393630000000000000
          Width = 128.504020000000000000
          Height = 11.338590000000000000
          DataSetName = 'Tomador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Tomador."Fone"]')
          ParentFont = False
        end
        object Memo255: TfrxMemoView
          AllowVectorExport = True
          Top = 29.346481099999900000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'REMETENTE:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo262: TfrxMemoView
          AllowVectorExport = True
          Top = 41.116556420000100000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'ENDERE'#199'O:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo268: TfrxMemoView
          AllowVectorExport = True
          Top = 52.886631740000000000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'BAIRRO:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo269: TfrxMemoView
          AllowVectorExport = True
          Top = 64.656707070000000000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'MUNICIPIO:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo270: TfrxMemoView
          AllowVectorExport = True
          Top = 75.426782390000000000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CNPJ/CPF:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo271: TfrxMemoView
          AllowVectorExport = True
          Top = 87.196857710000100000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'UF:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo272: TfrxMemoView
          AllowVectorExport = True
          Left = 92.976377950000000000
          Top = 85.307086609999900000
          Width = 20.787401570000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'PA'#205'S:')
          ParentFont = False
        end
        object Memo273: TfrxMemoView
          AllowVectorExport = True
          Left = 260.409448820000000000
          Top = 63.522848800000000000
          Width = 18.897650000000000000
          Height = 10.582677170000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CEP:')
          ParentFont = False
        end
        object Memo274: TfrxMemoView
          AllowVectorExport = True
          Left = 256.629933470000000000
          Top = 85.307086609999900000
          Width = 24.566929130000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FONE:')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Top = 181.385751100000000000
          Width = 83.149660000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TOMADOR DO SERVI'#199'O:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo275: TfrxMemoView
          AllowVectorExport = True
          Top = 194.944811100000000000
          Width = 41.574830000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'ENDERE'#199'O:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo276: TfrxMemoView
          AllowVectorExport = True
          Top = 207.283401100000000000
          Width = 41.574830000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CNPJ/CPF:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo277: TfrxMemoView
          AllowVectorExport = True
          Left = 209.094620000000000000
          Top = 206.283401100000000000
          Width = 37.795300000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'INSC.EST.:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo278: TfrxMemoView
          AllowVectorExport = True
          Left = 374.173470000000000000
          Top = 206.283401100000000000
          Width = 26.456710000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FONE:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo279: TfrxMemoView
          AllowVectorExport = True
          Left = 374.173470000000000000
          Top = 181.385751100000000000
          Width = 41.574830000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'MUNICIPIO:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo280: TfrxMemoView
          AllowVectorExport = True
          Left = 525.354670000000000000
          Top = 193.055040000000000000
          Width = 22.677180000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'PA'#205'S:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo281: TfrxMemoView
          AllowVectorExport = True
          Left = 613.283860000000000000
          Top = 181.417440000000000000
          Width = 15.118120000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'UF:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo282: TfrxMemoView
          AllowVectorExport = True
          Left = 653.638220000000000000
          Top = 181.417440000000000000
          Width = 18.897650000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CEP:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Top = 104.826840000000000000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'EXPEDIDOR:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo283: TfrxMemoView
          AllowVectorExport = True
          Top = 116.596915320000000000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'ENDERE'#199'O:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo284: TfrxMemoView
          AllowVectorExport = True
          Top = 128.366990640000000000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'BAIRRO:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo285: TfrxMemoView
          AllowVectorExport = True
          Top = 140.137065970000000000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'MUNICIPIO:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo286: TfrxMemoView
          AllowVectorExport = True
          Top = 150.907141290000000000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CNPJ/CPF:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo287: TfrxMemoView
          AllowVectorExport = True
          Top = 162.677216610000000000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'UF:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo288: TfrxMemoView
          AllowVectorExport = True
          Left = 93.488250000000000000
          Top = 160.787445510000000000
          Width = 20.787401570000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'PA'#205'S:')
          ParentFont = False
        end
        object Memo289: TfrxMemoView
          AllowVectorExport = True
          Left = 260.409448820000000000
          Top = 139.003207700000000000
          Width = 18.897650000000000000
          Height = 10.582677170000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CEP:')
          ParentFont = False
        end
        object Memo290: TfrxMemoView
          AllowVectorExport = True
          Left = 258.008040000000000000
          Top = 160.787445510000000000
          Width = 24.566929130000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FONE:')
          ParentFont = False
        end
        object Memo291: TfrxMemoView
          AllowVectorExport = True
          Left = 185.976500000000000000
          Top = 149.773283020000000000
          Width = 43.464579130000000000
          Height = 10.582677170000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'INSCR. EST.:')
          ParentFont = False
        end
        object Memo292: TfrxMemoView
          AllowVectorExport = True
          Left = 185.976500000000000000
          Top = 74.292924119999900000
          Width = 43.464579130000000000
          Height = 10.582677170000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'INSCR. EST.:')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 372.283945430000000000
          Top = 29.236240000000000000
          Width = 56.692950000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DESTINATARIO')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo293: TfrxMemoView
          AllowVectorExport = True
          Left = 372.283945430000000000
          Top = 41.006315319999900000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'ENDERE'#199'O:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo294: TfrxMemoView
          AllowVectorExport = True
          Left = 372.283945430000000000
          Top = 52.776390640000000000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'BAIRRO:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo295: TfrxMemoView
          AllowVectorExport = True
          Left = 372.283945430000000000
          Top = 64.546465970000100000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'MUNICIPIO:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo296: TfrxMemoView
          AllowVectorExport = True
          Left = 372.283945430000000000
          Top = 75.316541290000000000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CNPJ/CPF:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo297: TfrxMemoView
          AllowVectorExport = True
          Left = 372.283945430000000000
          Top = 87.086616610000000000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'UF:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo298: TfrxMemoView
          AllowVectorExport = True
          Left = 466.378028430000000000
          Top = 85.196845510000000000
          Width = 20.787401570000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'PA'#205'S:')
          ParentFont = False
        end
        object Memo299: TfrxMemoView
          AllowVectorExport = True
          Left = 633.299227250000000000
          Top = 63.412607700000100000
          Width = 18.897650000000000000
          Height = 10.582677170000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CEP:')
          ParentFont = False
        end
        object Memo300: TfrxMemoView
          AllowVectorExport = True
          Left = 630.897818430000000000
          Top = 85.196845510000000000
          Width = 24.566929130000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FONE:')
          ParentFont = False
        end
        object Memo301: TfrxMemoView
          AllowVectorExport = True
          Left = 558.866278430000000000
          Top = 74.182683020000000000
          Width = 43.464579130000000000
          Height = 10.582677170000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'INSCR. EST.:')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 372.283945430000000000
          Top = 105.047310000000000000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'RECEBEDOR:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo302: TfrxMemoView
          AllowVectorExport = True
          Left = 372.283945430000000000
          Top = 116.817385320000000000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'ENDERE'#199'O:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo303: TfrxMemoView
          AllowVectorExport = True
          Left = 372.283945430000000000
          Top = 128.587460640000000000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'BAIRRO:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo304: TfrxMemoView
          AllowVectorExport = True
          Left = 372.283945430000000000
          Top = 140.357535970000000000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'MUNICIPIO:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo305: TfrxMemoView
          AllowVectorExport = True
          Left = 372.283945430000000000
          Top = 151.127611290000000000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CNPJ/CPF:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo306: TfrxMemoView
          AllowVectorExport = True
          Left = 372.283945430000000000
          Top = 162.897686610000000000
          Width = 45.354360000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'UF:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo307: TfrxMemoView
          AllowVectorExport = True
          Left = 465.598498430000000000
          Top = 161.007915510000000000
          Width = 20.787401570000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'PA'#205'S:')
          ParentFont = False
        end
        object Memo308: TfrxMemoView
          AllowVectorExport = True
          Left = 633.031569300000000000
          Top = 139.223677700000000000
          Width = 18.897650000000000000
          Height = 10.582677170000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CEP:')
          ParentFont = False
        end
        object Memo309: TfrxMemoView
          AllowVectorExport = True
          Left = 629.252053950000000000
          Top = 161.007915510000000000
          Width = 24.566929130000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FONE:')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 558.866278430000000000
          Top = 149.993753020000000000
          Width = 43.464579130000000000
          Height = 10.582677170000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'INSCR. EST.:')
          ParentFont = False
        end
      end
      object ChildNF: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 28.346456690000000000
        Top = 944.882500000000000000
        Width = 744.567410000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo56: TfrxMemoView
          AllowVectorExport = True
          Top = 17.007874020000000000
          Width = 372.283464570000000000
          Height = 11.338572910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            
              'TP DOC.                 CNPJ/CPF EMITENTE                       ' +
              '                                  S'#201'RIE / NUMERO DOCUMENTO'
            '  ')
          ParentFont = False
          WordWrap = False
        end
        object Memo53: TfrxMemoView
          AllowVectorExport = True
          Width = 744.567410000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'DOCUMENTOS ORIGIN'#193'RIOS')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 372.283464570000000000
          Top = 17.007874020000100000
          Width = 372.283464570000000000
          Height = 11.338572910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            
              'TP DOC.                 CNPJ/CPF EMITENTE                       ' +
              '                                  S'#201'RIE / NUMERO DOCUMENTO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object MasterData3: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 13.118102910000000000
        ParentFont = False
        Top = 997.795920000000000000
        Width = 744.567410000000000000
        OnAfterPrint = 'MasterData3OnAfterPrint'
        AllowSplit = True
        Columns = 2
        ColumnWidth = 372.283464566929000000
        DataSetName = 'DadosNotasFiscais'
        KeepHeader = True
        RowCount = 0
        object DadosNotasFiscaisTextoImpressao: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 744.567410000000000000
          Height = 13.118102910000000000
          DataField = 'TextoImpressao'
          DataSetName = 'DadosNotasFiscais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[DadosNotasFiscais."TextoImpressao"]')
          ParentFont = False
        end
        object Memo103: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = -372.283464570000000000
          Width = 372.283464570000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          ParentFont = False
        end
        object Memo157: TfrxMemoView
          AllowVectorExport = True
          Left = 372.283464570000000000
          Width = 744.567410000000000000
          Height = 13.118102910000000000
          DataSetName = 'DadosNotasFiscais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          ParentFont = False
        end
      end
      object MasterData7: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Top = 642.520100000000000000
        Width = 744.567410000000000000
        Child = frxReport.ChildQtdCarga
        DataSetName = 'Volumes'
        RowCount = 0
      end
      object ChildQtdCarga: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 80.881889760000000000
        Top = 665.197280000000000000
        Width = 744.567410000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 418.015748030000000000
          Top = 40.440944880000000000
          Width = 105.070866140000000000
          Height = 40.440944880000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'RESPONS'#193'VEL')
          ParentFont = False
          WordBreak = True
        end
        object Memo312: TfrxMemoView
          AllowVectorExport = True
          Left = 418.015748030000000000
          Width = 326.551181100000000000
          Height = 40.440944880000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'NOME DA SEGURADORA')
          ParentFont = False
        end
        object Memo311: TfrxMemoView
          AllowVectorExport = True
          Left = 368.881889760000000000
          Width = 49.133858270000000000
          Height = 80.881889760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'QTD. VOL')
          ParentFont = False
        end
        object Memo313: TfrxMemoView
          AllowVectorExport = True
          Left = 319.748031500000000000
          Width = 49.133858270000000000
          Height = 80.881889760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'CUBAGEM(M'#179')')
          ParentFont = False
        end
        object Memo315: TfrxMemoView
          AllowVectorExport = True
          Left = 213.165354330000000000
          Width = 106.582677170000000000
          Height = 80.881889760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'TIPO MEDIDA   QTD/UN.MEDIDA')
          ParentFont = False
        end
        object Memo314: TfrxMemoView
          AllowVectorExport = True
          Left = 106.582677170000000000
          Width = 106.582677170000000000
          Height = 80.881889760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'TIPO MEDIDA   QTD/UN.MEDIDA')
          ParentFont = False
        end
        object Memo310: TfrxMemoView
          AllowVectorExport = True
          Width = 106.582677170000000000
          Height = 80.881889760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'TIPO MEDIDA   QTD/UN.MEDIDA')
          ParentFont = False
        end
        object Memo126: TfrxMemoView
          AllowVectorExport = True
          Left = 323.527820230000000000
          Top = 13.008044880000000000
          Width = 42.330708660000000000
          Height = 64.251992910000000000
          DataSetName = 'Seguro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Volumes."MCub"]')
          ParentFont = False
        end
        object Memo166: TfrxMemoView
          AllowVectorExport = True
          Left = 373.039632470000000000
          Top = 13.008044880000000000
          Width = 42.330708660000000000
          Height = 64.251968500000000000
          DataSetName = 'Seguro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Volumes."QVol"]')
          ParentFont = False
        end
        object Subreport4: TfrxSubreport
          AllowVectorExport = True
          Left = 0.244162830000000000
          Top = 12.850393700000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = frxReport.Page5
        end
        object Subreport8: TfrxSubreport
          AllowVectorExport = True
          Left = 421.527830000000000000
          Top = 7.559055118110240000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = frxReport.Page9
        end
        object Subreport9: TfrxSubreport
          AllowVectorExport = True
          Left = 421.527830000000000000
          Top = 48.354360000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = frxReport.Page10
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 523.086614170000000000
          Top = 40.440944880000000000
          Width = 105.070866140000000000
          Height = 40.440944880000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'N'#218'MERO DA AP'#211'LICE')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 628.157480310000000000
          Top = 40.440944880000000000
          Width = 116.409448820000000000
          Height = 40.440944880000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'N'#218'MERO DA AVERBA'#199#195'O')
          ParentFont = False
        end
      end
      object ChildDocAnterior: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 32.795300000000000000
        Top = 1424.882810000000000000
        Width = 744.567410000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo170: TfrxMemoView
          AllowVectorExport = True
          Width = 744.567410000000000000
          Height = 13.228344020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 3.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'DOCUMENTOS DE TRANSPORTE ANTERIOR')
          ParentFont = False
          VAlign = vaCenter
        end
        object Subreport5: TfrxSubreport
          AllowVectorExport = True
          Top = 13.228346460000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = frxReport.Page6
        end
      end
      object ChildAnuladoComple: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 45.354330710000000000
        Top = 1356.851270000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'ChildAnuladoCompleOnBeforePrint'
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo181: TfrxMemoView
          AllowVectorExport = True
          Width = 744.567410000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'CHAVE DO CT-E ANULADO/COMPLEMENTADO')
          ParentFont = False
        end
        object Memo182: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 744.567410000000000000
          Height = 45.354330710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
        end
        object Memo183: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 22.677175120000000000
          Width = 514.016080000000000000
          Height = 15.118120000000000000
          DataSetName = 'CalculoImposto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[AnuladoComple."Chave"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object ChildAereo: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 109.606370000000000000
        Top = 1768.820040000000000000
        Width = 744.567410000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo195: TfrxMemoView
          AllowVectorExport = True
          Left = 336.377952760000000000
          Top = 71.811023620000000000
          Width = 113.385821890000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'N'#218'MERO DA MINUTA')
          ParentFont = False
        end
        object Memo198: TfrxMemoView
          AllowVectorExport = True
          Left = 449.764070000000000000
          Top = 71.811023620000000000
          Width = 139.842610000000000000
          Height = 37.795275590551200000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'IDENTIFICA'#199#195'O INTERNA DO TOMADOR')
          ParentFont = False
        end
        object Memo184: TfrxMemoView
          AllowVectorExport = True
          Width = 744.567410000000000000
          Height = 13.228344020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'INFORMA'#199#213'ES ESPEC'#205'FICAS DO MODAL A'#201'REO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo185: TfrxMemoView
          AllowVectorExport = True
          Left = 109.606370000000000000
          Top = 13.228346460000000000
          Width = 226.771800000000000000
          Height = 24.566938900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'CARACTERISTICAS ADICIONAIS DO SERVI'#199'O')
          ParentFont = False
        end
        object Memo186: TfrxMemoView
          AllowVectorExport = True
          Left = 336.378170000000000000
          Top = 13.228346460000000000
          Width = 192.756030000000000000
          Height = 24.566938900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'DATA PREVISTA DA  ENTREGA')
          ParentFont = False
        end
        object Memo187: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Top = 13.228346456693100000
          Width = 215.433210000000000000
          Height = 24.566938900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'N'#218'MERO OPERACIONAL')
          ParentFont = False
        end
        object Memo188: TfrxMemoView
          AllowVectorExport = True
          Top = 37.795300000000200000
          Width = 336.378170000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'DADOS DA TARIFA')
          ParentFont = False
        end
        object Memo189: TfrxMemoView
          AllowVectorExport = True
          Left = 75.590600000000000000
          Top = 81.259842519999900000
          Width = 90.708720000000000000
          Height = 28.346456692913400000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'PASSAGEM')
          ParentFont = False
        end
        object Memo190: TfrxMemoView
          AllowVectorExport = True
          Top = 47.244094490000000000
          Width = 102.047310000000000000
          Height = 24.566938900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'CLASSE')
          ParentFont = False
        end
        object Memo191: TfrxMemoView
          AllowVectorExport = True
          Left = 102.047310000000000000
          Top = 47.244094488188700000
          Width = 120.944960000000000000
          Height = 24.566938900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'C'#211'DIGO DA TARIFA')
          ParentFont = False
        end
        object Memo193: TfrxMemoView
          AllowVectorExport = True
          Left = 222.992270000000000000
          Top = 47.244094488188700000
          Width = 113.385900000000000000
          Height = 24.566938900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'VALOR DA TARIFA')
          ParentFont = False
        end
        object Memo194: TfrxMemoView
          AllowVectorExport = True
          Left = 336.378170000000000000
          Top = 37.795275590000100000
          Width = 408.189240000000000000
          Height = 34.015748030000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'DADOS RELATIVOS A RETIRADA DA CARGA')
          ParentFont = False
        end
        object Memo199: TfrxMemoView
          AllowVectorExport = True
          Left = 531.134200000000000000
          Top = 24.566929130000100000
          Width = 313.700990000000000000
          Height = 11.338590000000000000
          DataField = 'nOCA'
          DataSetName = 'ModalAereo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAereo."nOCA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo201: TfrxMemoView
          AllowVectorExport = True
          Left = 340.157700000000000000
          Top = 93.354330710000300000
          Width = 102.047310000000000000
          Height = 11.338590000000000000
          DataField = 'nMinu'
          DataSetName = 'ModalAereo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAereo."nMinu"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo203: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 57.448818897637900000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          DataField = 'CL'
          DataSetName = 'ModalAereo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAereo."CL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo204: TfrxMemoView
          AllowVectorExport = True
          Left = 106.826840000000000000
          Top = 57.448818899999900000
          Width = 113.385900000000000000
          Height = 11.338590000000000000
          DataField = 'cTar'
          DataSetName = 'ModalAereo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAereo."cTar"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo205: TfrxMemoView
          AllowVectorExport = True
          Left = 225.771800000000000000
          Top = 57.448818899999900000
          Width = 105.826840000000000000
          Height = 11.338590000000000000
          DataField = 'vTar'
          DataSetName = 'ModalAereo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAereo."vTar"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo215: TfrxMemoView
          AllowVectorExport = True
          Top = 13.228346460000000000
          Width = 109.606370000000000000
          Height = 24.566938900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'INF DE MANUSEIO')
          ParentFont = False
        end
        object Memo216: TfrxMemoView
          AllowVectorExport = True
          Top = 81.259842519999900000
          Width = 75.590600000000000000
          Height = 28.346456690000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'ORIGEM')
          ParentFont = False
        end
        object Memo219: TfrxMemoView
          AllowVectorExport = True
          Top = 71.811023620000000000
          Width = 264.567100000000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'TRECHO')
          ParentFont = False
        end
        object Memo217: TfrxMemoView
          AllowVectorExport = True
          Left = 166.299320000000000000
          Top = 81.259842519999900000
          Width = 98.267780000000000000
          Height = 28.346456692913400000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'DESTINO')
          ParentFont = False
        end
        object Memo202: TfrxMemoView
          AllowVectorExport = True
          Left = 340.157700000000000000
          Top = 54.692950000000100000
          Width = 15.118120000000000000
          Height = 13.228348900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          ParentFont = False
        end
        object Memo220: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Top = 54.692950000000100000
          Width = 15.118120000000000000
          Height = 13.228348900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          ParentFont = False
        end
        object Memo221: TfrxMemoView
          AllowVectorExport = True
          Left = 358.055350000000000000
          Top = 55.692950000000100000
          Width = 15.118120000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'SIM')
          ParentFont = False
        end
        object Memo222: TfrxMemoView
          AllowVectorExport = True
          Left = 396.850650000000000000
          Top = 55.692950000000100000
          Width = 18.897650000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#195'O')
          ParentFont = False
        end
        object Memo223: TfrxMemoView
          AllowVectorExport = True
          Left = 264.567100000000000000
          Top = 71.811023620000000000
          Width = 71.811023620000000000
          Height = 37.795275590551200000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'CARGA ESPECIAL')
          ParentFont = False
        end
        object Memo224: TfrxMemoView
          AllowVectorExport = True
          Left = 589.606680000000000000
          Top = 71.811023620000000000
          Width = 154.960730000000000000
          Height = 37.795275590551200000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'IDENTIFICA'#199#195'O INTERNA DO EMISSOR')
          ParentFont = False
        end
        object Memo196: TfrxMemoView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 93.354330708661600000
          Width = 68.031540000000000000
          Height = 11.338590000000000000
          DataField = 'xOrig'
          DataSetName = 'ModalAereo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAereo."xOrig"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo197: TfrxMemoView
          AllowVectorExport = True
          Left = 79.590600000000000000
          Top = 93.354330708661600000
          Width = 71.811070000000000000
          Height = 11.338590000000000000
          DataField = 'xRota'
          DataSetName = 'ModalAereo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAereo."xRota"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo200: TfrxMemoView
          AllowVectorExport = True
          Left = 169.299320000000000000
          Top = 93.354330708661600000
          Width = 71.811070000000000000
          Height = 11.338590000000000000
          DataField = 'xDest'
          DataSetName = 'ModalAereo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAereo."xDest"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo225: TfrxMemoView
          AllowVectorExport = True
          Left = 267.346630000000000000
          Top = 93.354330708661600000
          Width = 64.252010000000000000
          Height = 11.338590000000000000
          DataField = 'cIMP'
          DataSetName = 'ModalAereo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAereo."cIMP"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo226: TfrxMemoView
          AllowVectorExport = True
          Left = 453.323130000000000000
          Top = 93.354330708661600000
          Width = 124.724490000000000000
          Height = 11.338590000000000000
          DataField = 'IdT'
          DataSetName = 'ModalAereo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAereo."IdT"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo227: TfrxMemoView
          AllowVectorExport = True
          Left = 593.386210000000000000
          Top = 93.354330708661600000
          Width = 147.401670000000000000
          Height = 11.338590000000000000
          DataField = 'xLAgEmi'
          DataSetName = 'ModalAereo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAereo."xLAgEmi"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo228: TfrxMemoView
          AllowVectorExport = True
          Left = 1.779530000000000000
          Top = 24.566929130000100000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          DataField = 'cinfManu'
          DataSetName = 'ModalAereo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAereo."cinfManu"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object ChildCabecalhoAereo: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 105.826771650000000000
        ParentFont = False
        Top = 2071.182440000000000000
        Width = 744.567410000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo208: TfrxMemoView
          AllowVectorExport = True
          Top = 37.795275589999600000
          Width = 188.976377950000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'EXPEDIDOR / REMETENTE')
          ParentFont = False
        end
        object Memo209: TfrxMemoView
          AllowVectorExport = True
          Top = 56.692913390000300000
          Width = 188.976377950000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'DESTINATARIO / RECEBEDOR')
          ParentFont = False
        end
        object Memo218: TfrxMemoView
          AllowVectorExport = True
          Left = 188.976377950000000000
          Top = 37.795275589999600000
          Width = 15.117997950000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          ParentFont = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Top = 102.826840000000000000
          Width = 744.567410000000000000
          Color = clBlack
          Frame.Color = clSilver
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
        end
        object Memo211: TfrxMemoView
          AllowVectorExport = True
          Left = 204.094488190000000000
          Top = 37.795275589999600000
          Width = 540.472667950000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            
              'NOME:                                                           ' +
              '                                                                ' +
              '                                                                ' +
              '                                      ASSINATURA'
            ''
            ''
            
              'RG:                                                             ' +
              '                                                                ' +
              '                                                                ' +
              '                                          DATA / HORA: ')
          ParentFont = False
        end
        object Memo212: TfrxMemoView
          AllowVectorExport = True
          Top = 75.590551179999700000
          Width = 204.094497950000000000
          Height = 24.566929130000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'NUMERO OPERACIONAL:')
          ParentFont = False
        end
        object Memo213: TfrxMemoView
          AllowVectorExport = True
          Left = 204.094488190000000000
          Top = 75.590551179999700000
          Width = 306.141807950000000000
          Height = 24.566929130000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'CHAVE DE ACESSO:')
          ParentFont = False
        end
        object Memo214: TfrxMemoView
          AllowVectorExport = True
          Left = 510.236550000000000000
          Top = 75.590551180000600000
          Width = 234.330737950000000000
          Height = 24.566929130000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'DATA / HORA EMISS'#195'O:')
          ParentFont = False
        end
        object Memo229: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 85.039370080000000000
          Width = 192.756030000000000000
          Height = 11.338590000000000000
          DataField = 'nOCA'
          DataSetName = 'ModalAereo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAereo."nOCA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo230: TfrxMemoView
          AllowVectorExport = True
          Left = 206.874150000000000000
          Top = 85.039370080000000000
          Width = 294.803340000000000000
          Height = 11.338590000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Identificacao."Chave"]')
          ParentFont = False
        end
        object Memo231: TfrxMemoView
          AllowVectorExport = True
          Left = 513.016080000000000000
          Top = 85.039370080000000000
          Width = 226.771800000000000000
          Height = 11.338590000000000000
          DataField = 'dhEmi'
          DataSetName = 'Identificacao'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Identificacao."dhEmi"]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 188.976500000000000000
          Top = 56.692950000000100000
          Width = 15.117997950000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          ParentFont = False
        end
        object Memo206: TfrxMemoView
          AllowVectorExport = True
          Width = 744.567410000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            
              'DECLARO QUE RECEBI OS VOLUMES DESTE CONHECIMENTO EM PERFEITO EST' +
              'ADO PELO QUE DOU POR CUMPRIDO O PRESENTE CONTRATO DE TRANSPORTE')
          ParentFont = False
        end
        object Memo207: TfrxMemoView
          AllowVectorExport = True
          Top = 13.228346460000000000
          Width = 744.567410000000000000
          Height = 24.566936460000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            
              'O TRANSPORTE COBERTO POR ESTE CONHECIMENTO SE REGE PELO C'#211'DIGO B' +
              'RASILEIRO DE AERON'#193'UTICA (LEI 7.565 DE 19/12/1986), ESPECIALMENT' +
              'E PELAS REGRAS RELATIVAS A RESPONSABILIDADE CIVIL PREVISTA NOS A' +
              'RTIGOS 293, 241, 244, 262 E 264, DE CUJO TEOR O EXPEDIDOR/REMETE' +
              'NTE DECORA CONCORDAR E TER PLENA CI'#202'NCIA. O EXPEDIDOR/REMETENTE ' +
              'ACEITA COMO CORRETAS TODAS AS ESPECIFICA'#199#213'ES IMPRESSAS, MANUSCRI' +
              'TAS, DATILOGRAFADAS OU CARIMBADAS NESTE CONHECIMENTO, CERTIFICAN' +
              'DO QUE OS ARTIGOS PERIGOSOS DESCRITOS PELA REGULAMENTA'#199#195'O DA I.C' +
              '.A.O. FORAM DEVIDAMENTE INFORMADOS E ACONDICIONADOS PARA TRANSPO' +
              'RTE A'#201'REO.')
          ParentFont = False
        end
      end
      object ChildRodoviarioValePedagio: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 69.921296460000000000
        Top = 1674.331790000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'ChildRodoviarioLotacaoOnBeforePrint'
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo238: TfrxMemoView
          AllowVectorExport = True
          Top = 13.228346460000000000
          Width = 744.567410000000000000
          Height = 56.692913390000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo232: TfrxMemoView
          AllowVectorExport = True
          Width = 744.567410000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'INFORMA'#199#213'ES REFERENTES AO VALE PED'#193'GIO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Subreport6: TfrxSubreport
          AllowVectorExport = True
          Top = 24.566936459999900000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = frxReport.Page7
        end
        object Memo239: TfrxMemoView
          AllowVectorExport = True
          Top = 13.228346460000000000
          Width = 171.968455120000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '  CNPJ FORNECEDOR:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo240: TfrxMemoView
          AllowVectorExport = True
          Left = 171.968503940000000000
          Top = 13.228346456692600000
          Width = 249.448818900000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '  N'#218'MERO COMPROVANTE:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo241: TfrxMemoView
          AllowVectorExport = True
          Left = 421.417322830000000000
          Top = 13.228346456692600000
          Width = 171.968455120000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '  CNPJ RESPONS'#193'VEL:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo234: TfrxMemoView
          AllowVectorExport = True
          Left = 593.385826770000000000
          Top = 13.228346456692600000
          Width = 151.181200000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'VALOR:')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ChildMotoristaRodovLotacao: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 1613.859310000000000000
        Width = 744.567410000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo140: TfrxMemoView
          AllowVectorExport = True
          Width = 249.448980000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            ' NOME DO MOTORISTA')
          ParentFont = False
        end
        object Memo141: TfrxMemoView
          AllowVectorExport = True
          Left = 249.448980000000000000
          Width = 173.858380000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            ' CPF DO MOTORISTA')
          ParentFont = False
        end
        object Memo142: TfrxMemoView
          AllowVectorExport = True
          Left = 423.307360000000000000
          Width = 321.260050000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            ' IDENTIFICA'#199#195'O DOS LACRES EM TR'#194'NSITO')
          ParentFont = False
        end
        object Memo163: TfrxMemoView
          AllowVectorExport = True
          Left = 427.086890000000000000
          Top = 7.559108819999890000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          DataSetName = 'ModalRodoviario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalRodoviario."LACRES"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Subreport3: TfrxSubreport
          AllowVectorExport = True
          Top = 11.338638820000100000
          Width = 90.708720000000000000
          Height = 7.559060000000000000
          Page = frxReport.Page4
        end
      end
      object ChildAquaviario: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 86.929116770000000000
        Top = 1901.103590000000000000
        Width = 744.567410000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo99: TfrxMemoView
          AllowVectorExport = True
          Left = 372.173470000000000000
          Top = 37.795300000000000000
          Width = 96.377774570000000000
          Height = 24.566938900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'VR DA B. DE CALC. AFRMM')
          ParentFont = False
        end
        object Memo249: TfrxMemoView
          AllowVectorExport = True
          Width = 744.567410000000000000
          Height = 13.228344020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'INFORMA'#199#213'ES ESPEC'#205'FICAS DO MODAL AQUAVI'#193'RIO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo250: TfrxMemoView
          AllowVectorExport = True
          Top = 13.228346460000000000
          Width = 372.283464570000000000
          Height = 24.566938900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'PORTO DE EMBARQUE')
          ParentFont = False
        end
        object Memo251: TfrxMemoView
          AllowVectorExport = True
          Left = 372.283464570000000000
          Top = 13.228346460000000000
          Width = 372.283464570000000000
          Height = 24.566938900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'PORTO DE DESTINO')
          ParentFont = False
        end
        object Memo252: TfrxMemoView
          AllowVectorExport = True
          Top = 37.795275590000100000
          Width = 372.283464570000000000
          Height = 24.566938900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'IDENTIFICA'#199#195'O DO NAVIO / REBOCADOR')
          ParentFont = False
        end
        object Memo253: TfrxMemoView
          AllowVectorExport = True
          Top = 62.362204719999900000
          Width = 744.566929130000000000
          Height = 24.566938900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'IDENTIFICA'#199#195'O DA(S) BALSA(S)')
          ParentFont = False
        end
        object Memo256: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661417320000000000
          Top = 37.795300000000000000
          Width = 96.377774570000000000
          Height = 24.566938900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'VLR DO AFRMM')
          ParentFont = False
        end
        object Memo257: TfrxMemoView
          AllowVectorExport = True
          Left = 565.039370080000000000
          Top = 37.795300000000200000
          Width = 96.377774570000000000
          Height = 24.566938900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'TIPO DE NAVEGA'#199#195'O')
          ParentFont = False
        end
        object Memo258: TfrxMemoView
          AllowVectorExport = True
          Left = 661.417322830000000000
          Top = 37.795300000000200000
          Width = 83.149606300000000000
          Height = 24.566938900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'DIRE'#199#195'O')
          ParentFont = False
        end
        object Memo259: TfrxMemoView
          AllowVectorExport = True
          Left = 1.779530000000000000
          Top = 22.677179999999900000
          Width = 366.614410000000000000
          Height = 11.338590000000000000
          DataSetName = 'ModalAquaviario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAquaviario."prtEmb"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo260: TfrxMemoView
          AllowVectorExport = True
          Left = 1.889763780000000000
          Top = 46.110236220472400000
          Width = 366.614410000000000000
          Height = 11.338590000000000000
          DataSetName = 'ModalAquaviario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[ModalAquaviario."xNavio"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo261: TfrxMemoView
          AllowVectorExport = True
          Left = 2.779530000000000000
          Top = 72.590600000000000000
          Width = 737.008350000000000000
          Height = 11.338590000000000000
          DataSetName = 'ModalAquaviario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAquaviario."xBalsa"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo263: TfrxMemoView
          AllowVectorExport = True
          Left = 374.173470000000000000
          Top = 46.244094490000000000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          DataSetName = 'ModalAquaviario'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAquaviario."vPrest"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo264: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441250000000000000
          Top = 46.244094490000000000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          DataSetName = 'ModalAquaviario'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAquaviario."vAFRMM"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo265: TfrxMemoView
          AllowVectorExport = True
          Left = 569.929500000000000000
          Top = 46.110236220472400000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DataSetName = 'ModalAquaviario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAquaviario."tpNav"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo266: TfrxMemoView
          AllowVectorExport = True
          Left = 664.417750000000000000
          Top = 46.110236220472400000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataSetName = 'ModalAquaviario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAquaviario."direc"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo267: TfrxMemoView
          AllowVectorExport = True
          Left = 374.173470000000000000
          Top = 22.677180000000100000
          Width = 366.614410000000000000
          Height = 11.338590000000000000
          DataSetName = 'ModalAquaviario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAquaviario."prtDest"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object ColumnFooter1: TfrxColumnFooter
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Top = 2464.253560000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'ColumnFooter1OnBeforePrint'
        object Line3: TfrxLineView
          AllowVectorExport = True
          Width = 744.566929133858000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object ChildMultModal: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795226770000000000
        Top = 2010.709960000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'ChildMultModalOnBeforePrint'
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Width = 744.567410000000000000
          Height = 13.228344020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'INFORMA'#199#213'ES ESPEC'#205'FICAS DO TRANSPORTE MULTMODAL DE CARGAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Top = 13.228346460000000000
          Width = 372.283464570000000000
          Height = 24.566938900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'COTM')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 372.283464570000000000
          Top = 13.228346460000000000
          Width = 372.283464570000000000
          Height = 24.566938900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          ParentFont = False
        end
        object mNegociavel: TfrxMemoView
          AllowVectorExport = True
          Left = 430.866420000000000000
          Top = 18.897650000000100000
          Width = 15.118120000000000000
          Height = 13.228348900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          ParentFont = False
        end
        object mNaoNegociavel: TfrxMemoView
          AllowVectorExport = True
          Left = 604.724800000000000000
          Top = 18.897650000000100000
          Width = 15.118120000000000000
          Height = 13.228348900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          ParentFont = False
        end
        object Memo125: TfrxMemoView
          AllowVectorExport = True
          Left = 448.764070000000000000
          Top = 21.897650000000100000
          Width = 49.133890000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'NEGOCI'#193'VEL')
          ParentFont = False
        end
        object Memo210: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Top = 21.897650000000100000
          Width = 71.811070000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#195'O NEGOCI'#193'VEL')
          ParentFont = False
        end
        object Memo316: TfrxMemoView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 22.677179999999900000
          Width = 362.834880000000000000
          Height = 11.338590000000000000
          DataSetName = 'ModalAquaviario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[MultiModal."COTM"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object ChildCabecalhoRodape: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 75.590551180000000000
        ParentFont = False
        Top = 2328.190480000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'ChildCabecalhoOnBeforePrint'
        ToNRows = 0
        ToNRowsMode = rmCount
        object Line4: TfrxLineView
          AllowVectorExport = True
          Top = 5.047202600000000000
          Width = 744.567410000000000000
          Color = clBlack
          Frame.Color = clSilver
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
        end
        object Memo102: TfrxMemoView
          AllowVectorExport = True
          Top = 9.338590000000000000
          Width = 744.567410000000000000
          Height = 12.850393700000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            
              'DECLARO QUE RECEBI OS VOLUMES DESTE CONHECIMENTO EM PERFEITO EST' +
              'ADO PELO QUE DOU POR CUMPRIDO O PRESENTE CONTRATO DE TRANSPORTE')
          ParentFont = False
        end
        object Memo254: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 215.433087950000000000
          Top = 37.307093940000000000
          Width = 268.346507950000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'ASSINATURA / CARIMBO')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo317: TfrxMemoView
          AllowVectorExport = True
          Left = 638.740157480000000000
          Top = 22.188983700000000000
          Width = 105.826771650000000000
          Height = 52.913385830000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          ParentFont = False
        end
        object Memo318: TfrxMemoView
          AllowVectorExport = True
          Left = 674.315400000000000000
          Top = 25.677180000000000000
          Width = 49.133890000000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.DropShadow = True
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'CT-e')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo319: TfrxMemoView
          AllowVectorExport = True
          Left = 661.417750000000000000
          Top = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          DataSetName = 'Identificacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Identificacao."NCT"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo320: TfrxMemoView
          AllowVectorExport = True
          Left = 672.756340000000000000
          Top = 60.692950000000000000
          Width = 68.031488740000000000
          Height = 13.228346460000000000
          DataSetName = 'Identificacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Identificacao."Serie"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo321: TfrxMemoView
          AllowVectorExport = True
          Top = 22.188983700000000000
          Width = 638.740157480000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo322: TfrxMemoView
          AllowVectorExport = True
          Left = 644.299630000000000000
          Top = 46.133890000000000000
          Width = 15.118110240000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#186'.')
          ParentFont = False
        end
        object Memo323: TfrxMemoView
          AllowVectorExport = True
          Left = 644.520100000000000000
          Top = 60.740164800000000000
          Width = 26.456700240000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'S'#233'rie.')
          ParentFont = False
        end
        object Memo324: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Top = 37.307093940000000000
          Width = 215.433087950000000000
          Height = 18.897632910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'NOME:')
          ParentFont = False
        end
        object Memo325: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Top = 56.204731730000000000
          Width = 215.433087950000000000
          Height = 18.897632910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'RG:')
          ParentFont = False
        end
        object Memo326: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 483.779595900000000000
          Top = 37.307093940000000000
          Width = 154.960607950000000000
          Height = 18.897632910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'CHEGADA DATA / HORA')
          ParentFont = False
        end
        object Memo327: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 483.779595900000000000
          Top = 56.204731730000000000
          Width = 154.960629920000000000
          Height = 18.897632910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'SAIDA DATA / HORA')
          ParentFont = False
        end
        object Memo342: TfrxMemoView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 26.456710000000000000
          Width = 631.181510000000000000
          Height = 7.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Parametros."ResumoCanhoto"]')
          ParentFont = False
        end
      end
      object ChildCabecalhoRodapeAereo: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 105.826771650000000000
        ParentFont = False
        Top = 2199.686460000000000000
        Width = 744.567410000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo328: TfrxMemoView
          AllowVectorExport = True
          Top = 43.354335590000000000
          Width = 188.976377950000000000
          Height = 18.897637800000000000
          GroupIndex = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'EXPEDIDOR / REMETENTE')
          ParentFont = False
        end
        object Memo329: TfrxMemoView
          AllowVectorExport = True
          Top = 62.251973390000000000
          Width = 188.976377950000000000
          Height = 18.897637800000000000
          GroupIndex = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'DESTINATARIO / RECEBEDOR')
          ParentFont = False
        end
        object Memo330: TfrxMemoView
          AllowVectorExport = True
          Left = 188.976377950000000000
          Top = 43.354335590000000000
          Width = 15.117997950000000000
          Height = 18.897637800000000000
          GroupIndex = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          ParentFont = False
        end
        object Memo331: TfrxMemoView
          AllowVectorExport = True
          Left = 204.094488190000000000
          Top = 43.354335590000000000
          Width = 540.472667950000000000
          Height = 37.795275590000000000
          GroupIndex = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            
              'NOME:                                                           ' +
              '                                                                ' +
              '                                                                ' +
              '                                      ASSINATURA'
            ''
            ''
            
              'RG:                                                             ' +
              '                                                                ' +
              '                                                                ' +
              '                                          DATA / HORA: ')
          ParentFont = False
        end
        object Memo332: TfrxMemoView
          AllowVectorExport = True
          Top = 81.149611180000000000
          Width = 204.094497950000000000
          Height = 24.566929130000000000
          GroupIndex = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'NUMERO OPERACIONAL:')
          ParentFont = False
        end
        object Memo333: TfrxMemoView
          AllowVectorExport = True
          Left = 204.094488190000000000
          Top = 81.149611180000000000
          Width = 306.141807950000000000
          Height = 24.566929130000000000
          GroupIndex = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'CHAVE DE ACESSO:')
          ParentFont = False
        end
        object Memo334: TfrxMemoView
          AllowVectorExport = True
          Left = 510.236550000000000000
          Top = 81.149611180000000000
          Width = 234.330737950000000000
          Height = 24.566929130000000000
          GroupIndex = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'DATA / HORA EMISS'#195'O:')
          ParentFont = False
        end
        object Memo335: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 90.598430080000000000
          Width = 192.756030000000000000
          Height = 11.338590000000000000
          GroupIndex = 3
          DataField = 'nOCA'
          DataSetName = 'ModalAereo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ModalAereo."nOCA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo336: TfrxMemoView
          AllowVectorExport = True
          Left = 206.874150000000000000
          Top = 90.598430080000000000
          Width = 294.803340000000000000
          Height = 11.338590000000000000
          GroupIndex = 3
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Identificacao."Chave"]')
          ParentFont = False
        end
        object Memo337: TfrxMemoView
          AllowVectorExport = True
          Left = 513.016080000000000000
          Top = 90.598430080000000000
          Width = 226.771800000000000000
          Height = 11.338590000000000000
          GroupIndex = 3
          DataField = 'dhEmi'
          DataSetName = 'Identificacao'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Identificacao."dhEmi"]')
          ParentFont = False
        end
        object Memo338: TfrxMemoView
          AllowVectorExport = True
          Left = 188.976500000000000000
          Top = 62.252010000000000000
          Width = 15.117997950000000000
          Height = 18.897637800000000000
          GroupIndex = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          ParentFont = False
        end
        object Memo339: TfrxMemoView
          AllowVectorExport = True
          Top = 5.559060000000000000
          Width = 744.567410000000000000
          Height = 13.228346460000000000
          GroupIndex = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            
              'DECLARO QUE RECEBI OS VOLUMES DESTE CONHECIMENTO EM PERFEITO EST' +
              'ADO PELO QUE DOU POR CUMPRIDO O PRESENTE CONTRATO DE TRANSPORTE')
          ParentFont = False
        end
        object Memo340: TfrxMemoView
          AllowVectorExport = True
          Top = 18.787406460000000000
          Width = 744.567410000000000000
          Height = 24.566936460000000000
          GroupIndex = 3
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            
              'O TRANSPORTE COBERTO POR ESTE CONHECIMENTO SE REGE PELO C'#211'DIGO B' +
              'RASILEIRO DE AERON'#193'UTICA (LEI 7.565 DE 19/12/1986), ESPECIALMENT' +
              'E PELAS REGRAS RELATIVAS A RESPONSABILIDADE CIVIL PREVISTA NOS A' +
              'RTIGOS 293, 241, 244, 262 E 264, DE CUJO TEOR O EXPEDIDOR/REMETE' +
              'NTE DECORA CONCORDAR E TER PLENA CI'#202'NCIA. O EXPEDIDOR/REMETENTE ' +
              'ACEITA COMO CORRETAS TODAS AS ESPECIFICA'#199#213'ES IMPRESSAS, MANUSCRI' +
              'TAS, DATILOGRAFADAS OU CARIMBADAS NESTE CONHECIMENTO, CERTIFICAN' +
              'DO QUE OS ARTIGOS PERIGOSOS DESCRITOS PELA REGULAMENTA'#199#195'O DA I.C' +
              '.A.O. FORAM DEVIDAMENTE INFORMADOS E ACONDICIONADOS PARA TRANSPO' +
              'RTE A'#201'REO.')
          ParentFont = False
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Top = 2.779530000000000000
          Width = 744.567410000000000000
          Color = clBlack
          Frame.Color = clSilver
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
        end
      end
    end
    object Page3: TfrxReportPage
      PaperWidth = 148.500000000000000000
      PaperHeight = 15.400000000000000000
      PaperSize = 256
      Frame.Typ = []
      LargeDesignHeight = True
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 11.338582680000000000
        Top = 52.913420000000000000
        Width = 561.260205000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        Columns = 3
        ColumnWidth = 187.086614173228000000
        DataSetName = 'ComponentesPrestacao'
        RowCount = 0
        Stretched = True
        object ComponentesPrestacaoNome: TfrxMemoView
          AllowVectorExport = True
          Width = 94.488250000000000000
          Height = 11.338582680000000000
          DataField = 'Nome'
          DataSetName = 'ComponentesPrestacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          GapX = 4.000000000000000000
          Memo.UTF8W = (
            '[ComponentesPrestacao."Nome"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object ComponentesPrestacaoValor: TfrxMemoView
          AllowVectorExport = True
          Left = 115.228351340000000000
          Width = 69.811070000000000000
          Height = 11.338582680000000000
          DataField = 'Valor'
          DataSetName = 'ComponentesPrestacao'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[ComponentesPrestacao."Valor"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 9.448818900000000000
        Top = 18.897650000000000000
        Width = 561.260205000000000000
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Width = 94.488250000000000000
          Height = 9.448818900000000000
          DataSetName = 'ComponentesPrestacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          GapX = 4.000000000000000000
          Memo.UTF8W = (
            'NOME')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 113.488250000000000000
          Width = 69.811070000000000000
          Height = 9.448818900000000000
          DataSetName = 'ComponentesPrestacao'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'VALOR')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 187.094620000000000000
          Width = 94.488250000000000000
          Height = 9.448818900000000000
          DataSetName = 'ComponentesPrestacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          GapX = 4.000000000000000000
          Memo.UTF8W = (
            'NOME')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo104: TfrxMemoView
          AllowVectorExport = True
          Left = 302.905690000000000000
          Width = 69.811070000000000000
          Height = 9.448818900000000000
          DataSetName = 'ComponentesPrestacao'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'VALOR')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo105: TfrxMemoView
          AllowVectorExport = True
          Left = 373.614410000000000000
          Width = 83.149660000000000000
          Height = 9.448818900000000000
          DataSetName = 'ComponentesPrestacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          GapX = 4.000000000000000000
          Memo.UTF8W = (
            'NOME')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo106: TfrxMemoView
          AllowVectorExport = True
          Left = 490.543600000000000000
          Width = 69.811070000000000000
          Height = 9.448818900000000000
          DataSetName = 'ComponentesPrestacao'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'VALOR')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 60.000000000000000000
      PaperHeight = 20.000000000000000000
      PaperSize = 256
      Frame.Typ = []
      object MasterData5: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 11.338582680000000000
        Top = 18.897650000000000000
        Width = 226.771800000000000000
        DataSetName = 'Veiculos'
        RowCount = 4
        Stretched = True
        object Memo148: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 60.472480000000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Veiculos."tpVeic"]')
          ParentFont = False
        end
        object Memo149: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 60.472480000000000000
          Width = 68.031540000000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Veiculos."PLACA"]')
          ParentFont = False
        end
        object Memo152: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 147.401670000000000000
          Width = 79.370130000000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Veiculos."RNTRC"]')
          ParentFont = False
        end
        object Memo153: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 128.504020000000000000
          Width = 18.897650000000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Veiculos."UF"]')
          ParentFont = False
        end
      end
    end
    object Page4: TfrxReportPage
      PaperWidth = 112.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      Frame.Typ = []
      object MasterData4: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 11.338590000000000000
        Top = 18.897650000000000000
        Width = 423.307360000000000000
        DataSetName = 'Motorista'
        RowCount = 0
        object Memo164: TfrxMemoView
          AllowVectorExport = True
          Width = 238.110390000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Motorista."xNome"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo165: TfrxMemoView
          AllowVectorExport = True
          Left = 249.448980000000000000
          Width = 162.519790000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Motorista."CPF"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page5: TfrxReportPage
      PaperWidth = 85.000000000000000000
      PaperHeight = 10.000000000000000000
      PaperSize = 256
      Frame.Typ = []
      object MasterData6: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 11.338590000000000000
        Top = 18.897650000000000000
        Width = 321.260050000000000000
        Columns = 3
        ColumnWidth = 106.582677165354000000
        DataSetName = 'Volumes'
        RowCount = 0
        object Memo168: TfrxMemoView
          AllowVectorExport = True
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          DataSetName = 'Seguro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Volumes."DescTipo"]')
          ParentFont = False
        end
        object Memo169: TfrxMemoView
          AllowVectorExport = True
          Left = 60.472480000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          DataSetName = 'Seguro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Volumes."QMedida"]/[Volumes."UnMedida"]')
          ParentFont = False
        end
      end
    end
    object Page6: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 50.000000000000000000
      PaperSize = 256
      Frame.Typ = []
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 11.338590000000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        Condition = 'DocAnterior."CNPJCPF"'
        object Memo167: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 793.701300000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            
              'NOME:                                                           ' +
              '                                          CNPJ:                 ' +
              '                                        IE:                     ' +
              '                               UF:')
          ParentFont = False
        end
        object Memo171: TfrxMemoView
          AllowVectorExport = True
          Left = 34.015770000000000000
          Width = 196.535560000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DocAnterior."xNome"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo172: TfrxMemoView
          AllowVectorExport = True
          Left = 260.787570000000000000
          Width = 109.606370000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DocAnterior."CNPJCPF"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo173: TfrxMemoView
          AllowVectorExport = True
          Left = 389.291590000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DocAnterior."IE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo174: TfrxMemoView
          AllowVectorExport = True
          Left = 510.236550000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DocAnterior."UF"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object MasterData8: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 11.338590000000000000
        Top = 52.913420000000000000
        Width = 793.701300000000000000
        DataSetName = 'DocAnterior'
        RowCount = 0
        object Memo175: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 793.701300000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            
              'TIPO:                         S'#201'RIE:                     N'#218'MERO:' +
              '                                        EMISS'#195'O:                ' +
              '                        CHAVE:')
          ParentFont = False
        end
        object Memo176: TfrxMemoView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 1.000000000000000000
          Width = 41.574830000000000000
          Height = 10.000000000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DocAnterior."Tipo"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo177: TfrxMemoView
          AllowVectorExport = True
          Left = 102.047310000000000000
          Top = 1.000000000000000000
          Width = 34.015770000000000000
          Height = 10.000000000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DocAnterior."Serie"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo178: TfrxMemoView
          AllowVectorExport = True
          Left = 181.417440000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 10.000000000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DocAnterior."nDoc"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo179: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Top = 1.000000000000000000
          Width = 71.811070000000000000
          Height = 10.000000000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DocAnterior."dEmi"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo180: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Top = 1.000000000000000000
          Width = 230.551330000000000000
          Height = 10.000000000000000000
          DataSetName = 'Destinatario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DocAnterior."Chave"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
    object Page7: TfrxReportPage
      PaperWidth = 197.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      Frame.Typ = []
      LargeDesignHeight = True
      object MasterData9: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 11.338594880000000000
        Top = 18.897650000000000000
        Width = 744.567410000000000000
        DataSetName = 'ValePedagio'
        RowCount = 4
        object Memo242: TfrxMemoView
          AllowVectorExport = True
          Top = 0.000012200000000462
          Width = 171.968460000000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[ValePedagio."CNPJForn"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo243: TfrxMemoView
          AllowVectorExport = True
          Left = 171.968455120000000000
          Top = 0.000012200000000462
          Width = 249.448818900000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[ValePedagio."NCOMPRA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo244: TfrxMemoView
          AllowVectorExport = True
          Left = 421.307360000000000000
          Width = 171.968457560000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[ValePedagio."CNPJPG"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo134: TfrxMemoView
          AllowVectorExport = True
          Left = 593.386210000000000000
          Width = 151.181200000000000000
          Height = 11.338590000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[ValePedagio."VVALEPED"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page8: TfrxReportPage
      Visible = False
      PaperWidth = 137.000000000000000000
      PaperHeight = 50.000000000000000000
      PaperSize = 256
      Frame.Typ = []
      LargeDesignHeight = True
      object MasterData10: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 11.338594880000000000
        Top = 18.897650000000000000
        Width = 517.795610000000000000
        DataSetName = 'ValePedagio'
        RowCount = 4
        object Memo138: TfrxMemoView
          AllowVectorExport = True
          Top = 0.000012200000000000
          Width = 134.551156690000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[ValePedagio."CNPJForn"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo139: TfrxMemoView
          AllowVectorExport = True
          Left = 134.551156690000000000
          Top = 0.000012200000000462
          Width = 157.228336690000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[ValePedagio."NCOMPRA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo233: TfrxMemoView
          AllowVectorExport = True
          Left = 292.157480310000000000
          Width = 134.551181100000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[ValePedagio."CNPJPG"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo235: TfrxMemoView
          AllowVectorExport = True
          Left = 426.708661420000000000
          Width = 91.086614170000000000
          Height = 11.338590000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[ValePedagio."VVALEPED"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page9: TfrxReportPage
      PaperWidth = 85.000000000000000000
      PaperHeight = 5.000000000000000000
      PaperSize = 256
      Frame.Typ = []
      LargeDesignHeight = True
      object MasterData11: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 10.582677165354300000
        Top = 18.897650000000000000
        Width = 321.260050000000000000
        DataSetName = 'Seguro'
        RowCount = 3
        object Memo343: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 309.921423390000000000
          Height = 10.582677170000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Seguro."NOMESEGURADORA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
    object Page10: TfrxReportPage
      PaperWidth = 85.000000000000000000
      PaperHeight = 5.000000000000000000
      PaperSize = 256
      Frame.Typ = []
      LargeDesignHeight = True
      object MasterData12: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 10.582677165354300000
        Top = 18.897650000000000000
        Width = 321.260050000000000000
        DataSetName = 'Seguro'
        RowCount = 3
        object Memo344: TfrxMemoView
          AllowVectorExport = True
          Left = 6.000000000000000000
          Width = 90.708683390000000000
          Height = 10.582677170000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Seguro."RESPONSAVEL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo345: TfrxMemoView
          AllowVectorExport = True
          Left = 103.291338580000000000
          Width = 102.047244090000000000
          Height = 10.582677165354300000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Seguro."NUMEROAPOLICE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo346: TfrxMemoView
          AllowVectorExport = True
          Left = 212.448877480000000000
          Width = 102.803149610000000000
          Height = 10.582677165354300000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Seguro."NUMEROAVERBACAO"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxRichObj: TfrxRichObject
    Left = 136
    Top = 144
  end
  object frxGZipComp: TfrxGZipCompressor
    Left = 224
    Top = 144
  end
  object frxOLEObj: TfrxOLEObject
    Left = 312
    Top = 144
  end
  object frxTXTExp: TfrxSimpleTextExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PageBreaks = False
    Frames = False
    EmptyLines = False
    OEMCodepage = False
    OpenAfterExport = False
    DeleteEmptyColumns = True
    Left = 348
    Top = 80
  end
  object frxDotMatrixExp: TfrxDotMatrixExport
    UseFileCache = False
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EscModel = 0
    GraphicFrames = False
    SaveToFile = False
    UseIniSettings = False
    Left = 273
    Top = 80
  end
  object frxJPEGExp: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Left = 198
    Top = 80
  end
  object frxRTFExp: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PictureType = gpPNG
    ExportPictures = False
    OpenAfterExport = False
    Wysiwyg = False
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 123
    Top = 80
  end
  object frxPDFExp: TfrxPDFExport
    FileName = 'ralatorio.pdf'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbeddedFonts = True
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Title = 'Exportar PDF'
    Author = 'FastReport'
    Subject = 'Exportar PDF'
    Creator = 'FastReport (http://www.fast-report.com)'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 48
    Top = 80
  end
  object tab1: TfrxDBDataset
    UserName = 'tab1'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 198
    Top = 16
  end
  object tab2: TfrxDBDataset
    UserName = 'tab2'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 273
    Top = 16
  end
  object tab3: TfrxDBDataset
    UserName = 'tab3'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 348
    Top = 16
  end
  object tab4: TfrxDBDataset
    UserName = 'tab4'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 423
    Top = 16
  end
  object tab5: TfrxDBDataset
    UserName = 'tab5'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 499
    Top = 16
  end
  object frxCSVExp: TfrxCSVExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Separator = ';'
    OEMCodepage = False
    UTF8 = False
    OpenAfterExport = False
    NoSysSymbols = True
    ForcedQuotes = False
    Left = 424
    Top = 80
  end
  object frxDesigner: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    Left = 123
    Top = 16
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 360
    Top = 208
  end
  object tab6: TfrxDBDataset
    UserName = 'tab6'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 563
    Top = 16
  end
  object frxXLSXExport1: TfrxXLSXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ChunkSize = 0
    OpenAfterExport = False
    PictureType = gpPNG
    Left = 512
    Top = 72
  end
  object frxMailExport1: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ShowExportDialog = True
    SmtpPort = 25
    UseIniFile = True
    TimeOut = 60
    ConfurmReading = False
    UseMAPI = SMTP
    MAPISendFlag = 0
    Left = 496
    Top = 144
  end
end
