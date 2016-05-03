inherited frmCadAberturaInvertario: TfrmCadAberturaInvertario
  Left = 266
  Top = 122
  Caption = 'Abertura de Invent'#225'rio'
  ClientHeight = 501
  ClientWidth = 676
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 676
    Height = 480
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 32
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbeDescricao
        Transparent = True
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 72
        Width = 20
        Height = 13
        Caption = 'CPF'
        FocusControl = dbeCPF
        Transparent = True
      end
      object Label3: TLabel [2]
        Left = 168
        Top = 72
        Width = 21
        Height = 13
        Caption = 'CRF'
        FocusControl = dbeCRF
        Transparent = True
      end
      object Label4: TLabel [3]
        Left = 16
        Top = 112
        Width = 67
        Height = 13
        Caption = 'Nome da M'#227'e'
        FocusControl = DBEdit4
        Transparent = True
      end
      object Label5: TLabel [4]
        Left = 16
        Top = 152
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = DBEdit5
        Transparent = True
      end
      object Label6: TLabel [5]
        Left = 439
        Top = 152
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
        FocusControl = DBEdit6
        Transparent = True
      end
      object Label7: TLabel [6]
        Left = 16
        Top = 192
        Width = 33
        Height = 13
        Caption = 'Cidade'
        FocusControl = DBEdit7
        Transparent = True
      end
      object Label8: TLabel [7]
        Left = 439
        Top = 192
        Width = 14
        Height = 13
        Caption = 'UF'
        Transparent = True
      end
      object Label9: TLabel [8]
        Left = 16
        Top = 232
        Width = 27
        Height = 13
        Caption = 'Bairro'
        FocusControl = DBEdit8
        Transparent = True
      end
      object Label10: TLabel [9]
        Left = 16
        Top = 272
        Width = 41
        Height = 13
        Caption = 'Empresa'
        FocusControl = cmbEmpresa
        Transparent = True
      end
      object Label11: TLabel [10]
        Left = 16
        Top = 8
        Width = 270
        Height = 18
        Caption = 'Dados do Respons'#225'vel T'#233'cnico'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel [11]
        Left = 16
        Top = 312
        Width = 28
        Height = 13
        Caption = 'E-mail'
        FocusControl = DBEdit1
        Transparent = True
      end
      object Label13: TLabel [12]
        Left = 16
        Top = 352
        Width = 31
        Height = 13
        Caption = 'Senha'
        FocusControl = DBEdit2
        Transparent = True
      end
      inherited Panel1: TPanel
        Top = 411
        Width = 668
        inherited BtAdicionar: TBitBtn
          Left = 109
          Top = 24
          Visible = False
        end
        inherited BtEditar: TBitBtn
          Left = 16
        end
        inherited BtExcluir: TBitBtn
          Left = 101
          Visible = False
        end
        inherited BtPesquisar: TBitBtn
          Left = 136
          Top = 16
          Visible = False
        end
        inherited BtCancelar: TBitBtn
          Left = 385
        end
        inherited BtGravar: TBitBtn
          Left = 465
        end
        inherited BtSair: TBitBtn
          Left = 545
        end
        object btnAbrirInvertario: TBitBtn
          Left = 184
          Top = 8
          Width = 105
          Height = 25
          Hint = 'Clique aqui para confirmar abertura de invert'#225'rio'
          Caption = '&Abrir Invent'#225'rio'
          TabOrder = 7
          OnClick = btnAbrirInvertarioClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F07777777777
            7777F0FFFF78FFFFFFF7F0FFFF777777FFF70088888837778887077777778378
            82677FFFFFFF883787677FF888FFF083788778888888F08837807F88888FF0F8
            82007FFFFFFFF0FF83277F88F88FF0FF00717F88888FF080FF007F88888FF00F
            FFFF7F88888FF0FFFFFF7FFFFFFFF0FFFFFF0777777770FFFFFF}
        end
        object btnAbrirXML: TBitBtn
          Left = 299
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Abri &XML'
          TabOrder = 8
          OnClick = btnAbrirXMLClick
        end
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 48
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FAR_NOME'
        DataSource = dsCadastro
        TabOrder = 1
      end
      object dbeCPF: TDBEdit
        Left = 16
        Top = 88
        Width = 147
        Height = 21
        DataField = 'FAR_CPF'
        DataSource = dsCadastro
        TabOrder = 2
        OnExit = dbeCPFExit
        OnKeyPress = dbeCPFKeyPress
      end
      object dbeCRF: TDBEdit
        Left = 168
        Top = 88
        Width = 134
        Height = 21
        DataField = 'FAR_CRF'
        DataSource = dsCadastro
        MaxLength = 10
        TabOrder = 3
        OnKeyPress = dbeCRFKeyPress
      end
      object DBEdit4: TDBEdit
        Left = 16
        Top = 128
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FAR_NOME_MAE'
        DataSource = dsCadastro
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 16
        Top = 168
        Width = 416
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FAR_ENDERECO'
        DataSource = dsCadastro
        MaxLength = 30
        TabOrder = 5
      end
      object DBEdit6: TDBEdit
        Left = 439
        Top = 168
        Width = 76
        Height = 21
        DataField = 'FAR_NUMERO'
        DataSource = dsCadastro
        TabOrder = 6
        OnKeyPress = DBEdit6KeyPress
      end
      object DBEdit7: TDBEdit
        Left = 16
        Top = 208
        Width = 416
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FAR_CIDADE'
        DataSource = dsCadastro
        TabOrder = 7
      end
      object cmbUF: TDBComboBox
        Left = 439
        Top = 208
        Width = 76
        Height = 22
        Style = csOwnerDrawFixed
        DataField = 'FAR_UF'
        DataSource = dsCadastro
        ItemHeight = 16
        Items.Strings = (
          'AC'
          'AL'
          'AM'
          'AP'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MG'
          'MS'
          'MT'
          'PA'
          'PB'
          'PE'
          'PR'
          'PI'
          'RJ'
          'RN'
          'RO'
          'RR'
          'RS'
          'SC'
          'SE'
          'SP'
          'TO')
        TabOrder = 8
      end
      object DBEdit8: TDBEdit
        Left = 16
        Top = 248
        Width = 400
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FAR_BAIRRO'
        DataSource = dsCadastro
        TabOrder = 9
      end
      object cmbEmpresa: TDBLookupComboBox
        Left = 16
        Top = 288
        Width = 400
        Height = 21
        DataField = 'FAR_NOME_EMPRESA'
        DataSource = dsCadastro
        TabOrder = 10
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 328
        Width = 500
        Height = 21
        CharCase = ecLowerCase
        DataField = 'EMAIL'
        DataSource = dsCadastro
        TabOrder = 11
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 368
        Width = 137
        Height = 21
        DataField = 'SENHA'
        DataSource = dsCadastro
        TabOrder = 12
      end
      object DBGrid1: TDBGrid
        Left = 568
        Top = 0
        Width = 100
        Height = 411
        Align = alRight
        DataSource = dsInvertario
        TabOrder = 13
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        Width = 668
      end
      inherited grdConsultar: TDBGrid
        Width = 634
        Height = 393
      end
      inherited Panel3: TPanel
        Left = 634
        Height = 393
      end
    end
  end
  inherited Panel4: TPanel
    Width = 676
    inherited Image1: TImage
      Width = 672
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsFarmaceutico
    Left = 460
    Top = 141
  end
  object OpenD: TOpenDialog
    Filter = 'Arquivo xml | *.xml|*.xml'
    Left = 508
    Top = 293
  end
  object XmlD: TXMLDocument
    Left = 484
    Top = 301
    DOMVendorDesc = 'MSXML'
  end
  object XMLTransformProvider1: TXMLTransformProvider
    TransformRead.TransformationFile = 'D:\Sistemas\SNGPC\2013\bin\ToDp.xtr'
    XMLDataFile = 'D:\Sistemas\SNGPC\Dados\invertario.xml'
    Left = 348
    Top = 61
  end
  object cdsInvertario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'XMLTransformProvider1'
    Left = 396
    Top = 61
    object cdsInvertarioclasseTerapeutica: TStringField
      FieldName = 'classeTerapeutica'
      Size = 1
    end
    object cdsInvertarioregistroMSMedicamento: TStringField
      FieldName = 'registroMSMedicamento'
      Size = 13
    end
    object cdsInvertarionumeroLoteMedicamento: TStringField
      FieldName = 'numeroLoteMedicamento'
      Size = 10
    end
    object cdsInvertarioquantidadeMedicamento: TStringField
      FieldName = 'quantidadeMedicamento'
      Size = 3
    end
    object cdsInvertariounidadeMedidaMedicamento: TStringField
      FieldName = 'unidadeMedidaMedicamento'
      Size = 1
    end
  end
  object dsInvertario: TDataSource
    DataSet = cdsInvertario
    Left = 436
    Top = 61
  end
end
