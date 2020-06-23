inherited frmFuncionarios: TfrmFuncionarios
  Caption = 'Cadastro de funcion'#225'rio/usu'#225'rio'
  ClientHeight = 214
  ClientWidth = 374
  ExplicitWidth = 380
  ExplicitHeight = 243
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotao: TPanel
    Top = 164
    Width = 374
    ExplicitTop = 164
    ExplicitWidth = 374
    inherited SpeedButton2: TSpeedButton
      Left = 362
      ExplicitLeft = 362
    end
    inherited SpeedButton3: TSpeedButton
      Left = 224
      ExplicitLeft = 224
    end
    inherited btnCancelar: TBitBtn
      Left = 238
      ExplicitLeft = 238
    end
    inherited btnGravar: TBitBtn
      Left = 100
      ExplicitLeft = 100
    end
  end
  inherited pnlLinha: TPanel
    Top = 157
    Width = 374
    ExplicitTop = 157
    ExplicitWidth = 374
  end
  inherited pnlCentro: TPanel
    Width = 374
    Height = 157
    ExplicitWidth = 374
    ExplicitHeight = 157
    object Label1: TLabel
      Left = 11
      Top = 8
      Width = 40
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 66
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Nome'
      FocusControl = edtNome
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lb_im: TLabel
      Left = 182
      Top = 64
      Width = 37
      Height = 13
      Caption = 'Senha'
      FocusControl = edtSenha
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 11
      Top = 64
      Width = 32
      Height = 13
      Caption = 'Login'
      FocusControl = edtLogin
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 257
      Top = 64
      Width = 99
      Height = 13
      Caption = 'Confirme a senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 11
      Top = 24
      Width = 47
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clInactiveCaption
      DataField = 'ID_FUNCIONARIO'
      DataSource = a.dsFuncionarios
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtNome: TDBEdit
      Left = 66
      Top = 24
      Width = 255
      Height = 24
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = a.dsFuncionarios
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtSenha: TDBEdit
      Left = 182
      Top = 80
      Width = 64
      Height = 24
      CharCase = ecUpperCase
      DataField = 'SENHA'
      DataSource = a.dsFuncionarios
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 3
    end
    object edtLogin: TDBEdit
      Left = 11
      Top = 80
      Width = 160
      Height = 24
      CharCase = ecUpperCase
      DataField = 'LOGIN'
      DataSource = a.dsFuncionarios
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object ckbAdm: TDBCheckBox
      Left = 11
      Top = 124
      Width = 161
      Height = 17
      Caption = '&Administrador'
      DataField = 'ADM'
      DataSource = a.dsFuncionarios
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object edtConf: TEdit
      Left = 257
      Top = 80
      Width = 64
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 4
      Text = 'ED_CONF'
    end
  end
  inherited ActionList1: TActionList
    Left = 296
    Top = 16
  end
end
