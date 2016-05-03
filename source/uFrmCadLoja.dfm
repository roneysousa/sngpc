inherited frmCadLojas: TfrmCadLojas
  Left = 207
  Top = 153
  Caption = 'Cadastro de Lojas'
  ClientHeight = 392
  ClientWidth = 581
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 581
    Height = 371
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
        Top = 26
        Width = 79
        Height = 22
        AutoSize = True
        DataField = 'EMP_CODIGO'
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
        Left = 16
        Top = 56
        Width = 27
        Height = 13
        Caption = 'CNPJ'
        FocusControl = dbeCNPJ
        Transparent = True
      end
      object Label3: TLabel [3]
        Left = 16
        Top = 96
        Width = 40
        Height = 13
        Caption = 'Fantasia'
        FocusControl = dbeFantasia
        Transparent = True
      end
      object Label4: TLabel [4]
        Left = 16
        Top = 136
        Width = 63
        Height = 13
        Caption = 'Raz'#227'o Social'
        FocusControl = dbeRazao
        Transparent = True
      end
      object Label5: TLabel [5]
        Left = 16
        Top = 176
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = dbeEndereco
        Transparent = True
      end
      object Label6: TLabel [6]
        Left = 400
        Top = 176
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
        FocusControl = DBEdit5
        Transparent = True
      end
      object Label7: TLabel [7]
        Left = 16
        Top = 216
        Width = 33
        Height = 13
        Caption = 'Cidade'
        FocusControl = dbeCidade
        Transparent = True
      end
      object Label8: TLabel [8]
        Left = 208
        Top = 216
        Width = 27
        Height = 13
        Caption = 'Bairro'
        FocusControl = dbeBairro
        Transparent = True
      end
      object Label9: TLabel [9]
        Left = 456
        Top = 216
        Width = 14
        Height = 13
        Caption = 'UF'
        Transparent = True
      end
      object Label10: TLabel [10]
        Left = 16
        Top = 256
        Width = 38
        Height = 13
        Caption = 'Licen'#231'a'
        FocusControl = dbeLicenca
      end
      inherited Panel1: TPanel
        Top = 302
        Width = 573
      end
      object dbeCNPJ: TDBEdit
        Left = 16
        Top = 72
        Width = 186
        Height = 21
        DataField = 'EMP_CNPJ'
        DataSource = dsCadastro
        TabOrder = 1
        OnExit = dbeCNPJExit
      end
      object dbeFantasia: TDBEdit
        Left = 16
        Top = 112
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        DataField = 'EMP_FANTASIA'
        DataSource = dsCadastro
        TabOrder = 2
      end
      object dbeRazao: TDBEdit
        Left = 16
        Top = 152
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        DataField = 'EMP_RAZAO'
        DataSource = dsCadastro
        TabOrder = 3
      end
      object dbeEndereco: TDBEdit
        Left = 16
        Top = 192
        Width = 377
        Height = 21
        CharCase = ecUpperCase
        DataField = 'EMP_ENDERECO'
        DataSource = dsCadastro
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 400
        Top = 192
        Width = 116
        Height = 21
        DataField = 'EMP_NUMERO'
        DataSource = dsCadastro
        TabOrder = 5
      end
      object dbeCidade: TDBEdit
        Left = 16
        Top = 232
        Width = 185
        Height = 21
        CharCase = ecUpperCase
        DataField = 'EMP_CIDADE'
        DataSource = dsCadastro
        TabOrder = 6
      end
      object dbeBairro: TDBEdit
        Left = 208
        Top = 232
        Width = 241
        Height = 21
        CharCase = ecUpperCase
        DataField = 'EMP_BAIRRO'
        DataSource = dsCadastro
        TabOrder = 7
      end
      object cmbUF: TDBComboBox
        Left = 456
        Top = 232
        Width = 60
        Height = 22
        Style = csOwnerDrawFixed
        DataField = 'EMP_UFEMPR'
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
      object dbeLicenca: TDBEdit
        Left = 16
        Top = 272
        Width = 500
        Height = 21
        DataField = 'EMP_CHAVE'
        DataSource = dsCadastro
        TabOrder = 9
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        Width = 573
      end
      inherited grdConsultar: TDBGrid
        Width = 539
        Height = 284
        DataSource = dsConsultar
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'EMP_CODIGO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#211'DIGO'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMP_FANTASIA'
            Title.Caption = 'FANTASIA'
            Width = 444
            Visible = True
          end>
      end
      inherited Panel3: TPanel
        Left = 539
        Height = 284
      end
    end
  end
  inherited Panel4: TPanel
    Width = 581
    inherited Image1: TImage
      Width = 577
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select EMP_CODIGO, EMP_FANTASIA from EMPRESAS'
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarEMP_CODIGO: TIntegerField
      FieldName = 'EMP_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsLojas
  end
end
