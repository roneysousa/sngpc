inherited frmCadComprador: TfrmCadComprador
  Left = 241
  Top = 146
  Caption = 'Cadastro de Comprador'
  ClientHeight = 404
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 383
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 13
        Top = 8
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Transparent = True
      end
      object DBText1: TDBText [1]
        Left = 13
        Top = 32
        Width = 79
        Height = 22
        AutoSize = True
        DataField = 'ID_COMPRADOR'
        DataSource = dsCadastro
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label2: TLabel [2]
        Left = 13
        Top = 64
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbeDescricao
        Transparent = True
      end
      object Label3: TLabel [3]
        Left = 13
        Top = 104
        Width = 94
        Height = 13
        Caption = 'Tipo de Documento'
        FocusControl = cmbTpDocumento
        Transparent = True
      end
      object Label4: TLabel [4]
        Left = 13
        Top = 144
        Width = 70
        Height = 13
        Caption = 'N'#186' Documento'
        FocusControl = dbeNRDoc
        Transparent = True
      end
      object Label5: TLabel [5]
        Left = 13
        Top = 184
        Width = 79
        Height = 13
        Caption = #211'rg'#227'o Expedidor'
        FocusControl = cmbExpedidor
        Transparent = True
      end
      object Label6: TLabel [6]
        Left = 13
        Top = 224
        Width = 111
        Height = 13
        Caption = 'UF Emissor Documento'
        FocusControl = cmbExpedidor
        Transparent = True
      end
      inherited Panel1: TPanel
        Top = 314
      end
      object dbeDescricao: TDBEdit
        Left = 13
        Top = 80
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME_COMPRADOR'
        DataSource = dsCadastro
        TabOrder = 1
      end
      object cmbTpDocumento: TDBLookupComboBox
        Left = 13
        Top = 120
        Width = 500
        Height = 21
        DataField = 'DESC_TPDOC'
        DataSource = dsCadastro
        TabOrder = 2
      end
      object dbeNRDoc: TDBEdit
        Left = 13
        Top = 160
        Width = 186
        Height = 21
        DataField = 'NR_DOCUMETO'
        DataSource = dsCadastro
        TabOrder = 3
        OnExit = dbeNRDocExit
        OnKeyPress = dbeNRDocKeyPress
      end
      object cmbExpedidor: TDBLookupComboBox
        Left = 13
        Top = 200
        Width = 500
        Height = 21
        DataField = 'DESC_EXPEDIDOR'
        DataSource = dsCadastro
        TabOrder = 4
      end
      object cmbUF: TDBComboBox
        Left = 13
        Top = 240
        Width = 76
        Height = 22
        Style = csOwnerDrawFixed
        DataField = 'UF_EMISSOA_DOC'
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
        TabOrder = 5
      end
    end
    inherited TabSheet2: TTabSheet
      inherited grdConsultar: TDBGrid
        Height = 296
        DataSource = dsConsultar
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_COMPRADOR'
            Title.Alignment = taCenter
            Title.Caption = 'C'#211'DIGO'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COMPRADOR'
            Title.Caption = 'NOME'
            Width = 435
            Visible = True
          end>
      end
      inherited Panel3: TPanel
        Height = 296
      end
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select ID_COMPRADOR, NOME_COMPRADOR from COMPRADOR'
    MaxBlobSize = -1
    SQLConnection = dmDados.sqlSNGPN
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarID_COMPRADOR: TIntegerField
      FieldName = 'ID_COMPRADOR'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsConsultarNOME_COMPRADOR: TStringField
      FieldName = 'NOME_COMPRADOR'
      Required = True
      Size = 60
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsComprador
  end
end
