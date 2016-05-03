object FrmImportaDados: TFrmImportaDados
  Left = 259
  Top = 180
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Importar Cadastro de Produtos'
  ClientHeight = 251
  ClientWidth = 558
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 558
    Height = 210
    Align = alClient
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 556
      Height = 208
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Importar'
        object lblPercentual: TLabel
          Left = 32
          Top = 96
          Width = 49
          Height = 16
          Caption = '0,00%'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ProgressBar1: TProgressBar
          Left = 32
          Top = 72
          Width = 497
          Height = 17
          TabOrder = 0
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Dados'
        ImageIndex = 1
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 548
          Height = 180
          Align = alClient
          DataSource = dsProdutos
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 210
    Width = 558
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Importar'
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6696BA6696BA6696BA669
        6BA6696BA6696BA6696BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFA6696BF3D3A4F0CB97EFC68AEDC180EBBB76A6696BFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7756BF6DDBA707BCE0F2E
        F36E75BFEEC484A6696BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFBC8268F8E7CE0F30F7001EFF0F2FF3F0CC96A6696BFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1926DFBF2E27486E70F30
        F8727FD7F3D7ABA6696BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFDA9D75FEFAF3FBF4E7FAEEDCF8E7CFF6E1C0A6696BFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7AB79FFFFFFFEFBF8FCF7
        EEA6696AA6696AAC6C5AA46769A46769A46769A46769A46769A46769A46769A4
        6769FF00FFE7AB79FFFFFFFFFFFFFEFCFBA6696AC67F4EFF00FFA46769E9C49D
        D8A57BD8A373D59D66D1965AEAB66CA46769FF00FFE7AB79D1926DD1926DD192
        6DA6696AFF00FF005901A46769BB76507D1800821F00811F00811E00DCA162A4
        6769FF00FFFF00FF2D6718FF00FFFF00FFFF00FFFF00FF016405A7756BF6E9DD
        8A2A087F1A007B1600AB5B30FCDD9FA46769FF00FF005D03067F14FF00FFFF00
        FFFF00FF017707036506BC8268FFFFFFC99379791400892907E6BD99FFEAB5A4
        6769015A0630BD571A922F01550303600704780A05840C015804D1926DFFFFFF
        FBF4F299411EBF7D59FAEDD4D4BCA02A70272CC55841E07527BB4515A5280996
        13058C0D026606FF00FFDA9D75FFFFFFFFFFFFE7D0C4F7EEE3A46769A46769A4
        6A5A1C963122B63E149A2605700B036C07026005FF00FFFF00FFE7AB79FFFFFF
        FFFFFFFFFFFFFCFFFFA46769D18649FF00FFFF00FF0875110C8816FF00FFFF00
        FFFF00FFFF00FFFF00FFE7AB79D1926DD1926DD1926DD1926DA46769FF00FFFF
        00FFFF00FFFF00FF036307FF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object BitBtn2: TBitBtn
      Left = 464
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object qryProdutos: TQuery
    DatabaseName = 'SNGPC'
    SQL.Strings = (
      
        'Select PRO_CDPROD, PRO_CDBARR, PRO_CDFABR, PRO_CDFORN, PRO_VLVEN' +
        'D, PRO_NMPROD, PRO_NMORIG, PRO_REGIMS from "SACPRO.DBF" ORDER BY' +
        ' PRO_CDPROD')
    Left = 168
    Top = 24
    object qryProdutosPRO_CDPROD: TStringField
      FieldName = 'PRO_CDPROD'
      Origin = 'SNGPC."SACPRO.DBF".PRO_CDPROD'
      Size = 13
    end
    object qryProdutosPRO_CDBARR: TStringField
      FieldName = 'PRO_CDBARR'
      Origin = 'SNGPC."SACPRO.DBF".PRO_CDBARR'
      Size = 13
    end
    object qryProdutosPRO_CDFABR: TStringField
      FieldName = 'PRO_CDFABR'
      Origin = 'SNGPC."SACPRO.DBF".PRO_CDFABR'
      Size = 5
    end
    object qryProdutosPRO_CDFORN: TStringField
      FieldName = 'PRO_CDFORN'
      Origin = 'SNGPC."SACPRO.DBF".PRO_CDFORN'
      Size = 5
    end
    object qryProdutosPRO_NMPROD: TStringField
      FieldName = 'PRO_NMPROD'
      Origin = 'SNGPC."SACPRO.DBF".PRO_NMPROD'
      Size = 40
    end
    object qryProdutosPRO_NMORIG: TStringField
      FieldName = 'PRO_NMORIG'
      Origin = 'SNGPC."SACPRO.DBF".PRO_NMORIG'
      Size = 40
    end
    object qryProdutosPRO_REGIMS: TStringField
      FieldName = 'PRO_REGIMS'
      Origin = 'SNGPC."SACPRO.DBF".PRO_REGIMS'
      Size = 13
    end
    object qryProdutosPRO_VLVEND: TFloatField
      FieldName = 'PRO_VLVEND'
      Origin = 'SNGPC."SACPRO.DBF".PRO_VLVEND'
    end
  end
  object dsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 205
    Top = 25
  end
end
