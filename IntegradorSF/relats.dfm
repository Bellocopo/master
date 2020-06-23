object frmRelats: TfrmRelats
  Left = 0
  Top = 0
  Caption = 'frmRelats'
  ClientHeight = 345
  ClientWidth = 662
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 662
    Height = 345
    Align = alClient
    TabOrder = 0
    object frxPreview1: TfrxPreview
      Left = 1
      Top = 1
      Width = 660
      Height = 343
      Align = alClient
      OutlineVisible = False
      OutlineWidth = 120
      ThumbnailVisible = False
      UseReportHints = True
    end
    object HotKey1: THotKey
      Left = 664
      Top = 314
      Width = 0
      Height = 19
      HotKey = 32833
      TabOrder = 0
    end
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 144
    Top = 160
  end
  object frxPDFExport1: TfrxPDFExport
    FileName = 'relat.pdf'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport (http://www.fast-report.com)'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 208
    Top = 160
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PictureType = gpPNG
    ExportPictures = False
    Wysiwyg = False
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 272
    Top = 160
  end
  object tabela1_0: TfrxDBDataset
    UserName = 'tabela1_0'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 176
    Top = 192
  end
  object frxCheckBoxObject1: TfrxCheckBoxObject
    Left = 144
    Top = 192
  end
  object frxReport1: TfrxReport
    Version = '5.5.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintMode = pmSplit
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41229.659258182910000000
    ReportOptions.LastChange = 42176.660818576390000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 144
    Top = 256
    Datasets = <
      item
        DataSet = tabela1_0
        DataSetName = 'tabela1_0'
      end
      item
        DataSet = tabela2_0
        DataSetName = 'tabela2_0'
      end>
    Variables = <
      item
        Name = 'filtros'
        Value = #39'Per'#237'odo de vendas: 26/05/2015 a 26/05/2015'#13#10#39
      end
      item
        Name = 'dordem'
        Value = #39'Produto'#39
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 100.000000000000000000
      PaperHeight = 120.000000000000000000
      PaperSize = 256
      LeftMargin = 1.000000000000000000
      RightMargin = 1.000000000000000000
      TopMargin = 1.000000000000000000
      BottomMargin = 1.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 370.393940000000000000
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Width = 355.275820000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de vendas')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Top = 22.015770000000000000
          Width = 151.181200000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[<filtros>]'
            '[<dordem>]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 211.653680000000000000
          Top = 21.456710000000000000
          Width = 147.401670000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Emiss'#227'o: [date] [time]'
            'P'#225'g. [page#]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 200.315090000000000000
        Width = 370.393940000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = tabela1_0
        DataSetName = 'tabela1_0'
        RowCount = 0
        object tabela1_0DATAI: TfrxMemoView
          Left = 247.228510000000000000
          Top = 1.000000000000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          DataSet = tabela1_0
          DataSetName = 'tabela1_0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[<tabela1_0."QUANT">]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 296.362400000000000000
          Top = 1.000000000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataSet = tabela1_0
          DataSetName = 'tabela1_0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[formatFloat('#39'##,##0.00'#39',<tabela1_0."total">)]')
          ParentFont = False
        end
        object tabela1_0DESCRICAO: TfrxMemoView
          Left = 5.220470000000000000
          Top = 2.000000000000000000
          Width = 238.110390000000000000
          Height = 15.118120000000000000
          DataField = 'DESCRICAO'
          DataSet = tabela1_0
          DataSetName = 'tabela1_0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[tabela1_0."DESCRICAO"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 41.574830000000000000
        Top = 136.063080000000000000
        Width = 370.393940000000000000
        Condition = 'tabela1_0."DATA"'
        object Memo8: TfrxMemoView
          Left = 5.220470000000000000
          Top = 21.677180000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = tabela1_0
          DataSetName = 'tabela1_0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 248.228510000000000000
          Top = 20.677180000000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          DataSet = tabela1_0
          DataSetName = 'tabela1_0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'QUANT.')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 297.362400000000000000
          Top = 20.677180000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataSet = tabela1_0
          DataSetName = 'tabela1_0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL R$')
          ParentFont = False
        end
        object tabela1_0DATA: TfrxMemoView
          Left = 4.000000000000000000
          Width = 351.496290000000000000
          Height = 18.897650000000000000
          DataField = 'DATA'
          DataSet = tabela1_0
          DataSetName = 'tabela1_0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = cl3DLight
          Memo.UTF8W = (
            '[tabela1_0."DATA"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 200.315090000000000000
        Top = 241.889920000000000000
        Width = 370.393940000000000000
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 2.779530000000000000
          Width = 351.496290000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo5: TfrxMemoView
          Left = 247.228510000000000000
          Top = 7.338590000000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          DataSet = tabela1_0
          DataSetName = 'tabela1_0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[sum(<tabela1_0."QUANT">)]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 296.362400000000000000
          Top = 7.338590000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataSet = tabela1_0
          DataSetName = 'tabela1_0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[formatFloat('#39'##,##0.00'#39',sum(<tabela1_0."total">))]')
          ParentFont = False
        end
        object r_forpag: TfrxSubreport
          Left = 3.000000000000000000
          Top = 48.913420000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = frxReport1.Page2
        end
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 100.000000000000000000
      PaperHeight = 120.000000000000000000
      PaperSize = 256
      LeftMargin = 1.000000000000000000
      RightMargin = 1.000000000000000000
      TopMargin = 1.000000000000000000
      BottomMargin = 1.000000000000000000
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 18.897650000000000000
        Width = 370.393940000000000000
        object Memo1: TfrxMemoView
          Top = 0.779530000000000000
          Width = 347.716760000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'RESUMO POR FORMA DE PAGAMENTO')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 60.472480000000000000
        Width = 370.393940000000000000
        DataSet = tabela2_0
        DataSetName = 'tabela2_0'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 268.685220000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = tabela1_0
          DataSetName = 'tabela1_0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[formatFloat('#39'##,##0.00'#39',<tabela2_0."total">)]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 3.779530000000000000
          Top = 4.779530000000000000
          Width = 260.787570000000000000
          Height = 15.118120000000000000
          DataSet = tabela1_0
          DataSetName = 'tabela1_0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[tabela2_0."DESCRICAO"]')
          ParentFont = False
        end
      end
      object Footer2: TfrxFooter
        FillType = ftBrush
        Height = 41.574830000000000000
        Top = 105.826840000000000000
        Width = 370.393940000000000000
        object Line3: TfrxLineView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 351.496290000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo16: TfrxMemoView
          Left = 270.126160000000000000
          Top = 8.338590000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DataSet = tabela1_0
          DataSetName = 'tabela1_0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[formatFloat('#39'##,##0.00'#39',sum(<tabela2_0."total">))]')
          ParentFont = False
        end
      end
    end
  end
  object tabela1_1: TfrxDBDataset
    UserName = 'tabela1_1'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 208
    Top = 192
  end
  object frxDotMatrixExport1: TfrxDotMatrixExport
    UseFileCache = False
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EscModel = 0
    GraphicFrames = False
    SaveToFile = False
    UseIniSettings = False
    Left = 336
    Top = 160
  end
  object tabela1_2: TfrxDBDataset
    UserName = 'tabela1_2'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 240
    Top = 192
  end
  object tabela1_3: TfrxDBDataset
    UserName = 'tabela1_3'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 272
    Top = 192
  end
  object tabela1_4: TfrxDBDataset
    UserName = 'tabela1_4'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 304
    Top = 192
  end
  object tabela2_0: TfrxDBDataset
    UserName = 'tabela2_0'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 176
    Top = 222
  end
  object tabela2_1: TfrxDBDataset
    UserName = 'tabela2_1'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 208
    Top = 222
  end
  object tabela2_2: TfrxDBDataset
    UserName = 'tabela2_2'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 240
    Top = 222
  end
  object tabela2_3: TfrxDBDataset
    UserName = 'tabela2_3'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 272
    Top = 222
  end
  object tabela2_4: TfrxDBDataset
    UserName = 'tabela2_4'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 304
    Top = 222
  end
  object tabela1_5: TfrxDBDataset
    UserName = 'tabela1_5'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 336
    Top = 192
  end
  object tabela2_5: TfrxDBDataset
    UserName = 'tabela2_5'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 336
    Top = 222
  end
  object tabela1_6: TfrxDBDataset
    UserName = 'tabela1_6'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 368
    Top = 192
  end
  object tabela2_6: TfrxDBDataset
    UserName = 'tabela2_6'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 368
    Top = 222
  end
  object tabela1_7: TfrxDBDataset
    UserName = 'tabela1_7'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 400
    Top = 192
  end
  object tabela1_8: TfrxDBDataset
    UserName = 'tabela1_8'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 432
    Top = 192
  end
  object tabela2_7: TfrxDBDataset
    UserName = 'tabela2_7'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 400
    Top = 222
  end
  object tabela2_8: TfrxDBDataset
    UserName = 'tabela2_8'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 432
    Top = 222
  end
  object tabela1_9: TfrxDBDataset
    UserName = 'tabela1_9'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 464
    Top = 192
  end
  object tabela2_9: TfrxDBDataset
    UserName = 'tabela2_9'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 464
    Top = 222
  end
  object tabela2_10: TfrxDBDataset
    UserName = 'tabela2_10'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 496
    Top = 222
  end
  object tabela1_10: TfrxDBDataset
    UserName = 'tabela1_10'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 496
    Top = 192
  end
  object frxSimpleTextExport1: TfrxSimpleTextExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PageBreaks = False
    Frames = False
    EmptyLines = False
    OEMCodepage = False
    DeleteEmptyColumns = True
    Left = 400
    Top = 160
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Left = 304
    Top = 160
  end
  object frxOLEObject1: TfrxOLEObject
    Left = 604
    Top = 176
  end
  object frxGZipCompressor1: TfrxGZipCompressor
    Left = 604
    Top = 128
  end
  object frxCheckBoxObject2: TfrxCheckBoxObject
    Left = 568
    Top = 128
  end
  object frxRichObject1: TfrxRichObject
    Left = 604
    Top = 96
  end
  object frxChartObject1: TfrxChartObject
    Left = 264
    Top = 88
  end
end
