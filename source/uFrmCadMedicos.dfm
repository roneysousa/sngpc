inherited frmCadMedico: TfrmCadMedico
  Left = 310
  Top = 171
  Caption = 'Cadastro de M'#233'dicos'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
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
        DataField = 'ID_MEDICO'
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
        Top = 59
        Width = 81
        Height = 13
        Caption = 'Nome do M'#233'dico'
        FocusControl = dbeDescricao
        Transparent = True
      end
      object Label3: TLabel [3]
        Left = 13
        Top = 100
        Width = 113
        Height = 13
        Caption = 'N.'#186' Registro Profissional'
        FocusControl = dbeNumRG
        Transparent = True
      end
      object Label4: TLabel [4]
        Left = 213
        Top = 206
        Width = 100
        Height = 13
        Caption = 'Conselho Profissional'
        FocusControl = cmbConselho
        Transparent = True
        Visible = False
      end
      object Label6: TLabel [5]
        Left = 13
        Top = 182
        Width = 76
        Height = 13
        Caption = 'UF do Conselho'
        Transparent = True
      end
      object Label5: TLabel [6]
        Left = 13
        Top = 142
        Width = 85
        Height = 13
        Caption = 'Sigla do Conselho'
        FocusControl = dbeSigla
      end
      object dbeDescricao: TDBEdit
        Left = 13
        Top = 75
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME_MEDICO'
        DataSource = dsCadastro
        TabOrder = 1
      end
      object dbeNumRG: TDBEdit
        Left = 13
        Top = 116
        Width = 134
        Height = 21
        DataField = 'NR_RG_PROFISSIONAL'
        DataSource = dsCadastro
        MaxLength = 10
        TabOrder = 2
      end
      object cmbConselho: TDBLookupComboBox
        Left = 213
        Top = 222
        Width = 364
        Height = 21
        DataField = 'NOME_CONSELHO'
        ReadOnly = True
        TabOrder = 4
        TabStop = False
        Visible = False
      end
      object cmbUF: TDBComboBox
        Left = 13
        Top = 198
        Width = 76
        Height = 22
        Style = csOwnerDrawFixed
        DataField = 'UF_CONSELHO'
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
      object dbeSigla: TDBEdit
        Left = 13
        Top = 158
        Width = 76
        Height = 21
        CharCase = ecUpperCase
        DataField = 'SIGLA_CONSELHO'
        DataSource = dsCadastro
        TabOrder = 3
        OnChange = dbeSiglaChange
        OnExit = dbeSiglaExit
      end
      object DBEdit1: TDBEdit
        Left = 101
        Top = 158
        Width = 410
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        DataField = 'NOME_CONSELHO'
        DataSource = dsCadastro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        OnChange = dbeSiglaChange
        OnExit = dbeSiglaExit
      end
    end
    inherited TabSheet2: TTabSheet
      inherited grdConsultar: TDBGrid
        DataSource = dsConsultar
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_MEDICO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#211'DIGO'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_MEDICO'
            Title.Caption = 'NOME'
            Width = 401
            Visible = True
          end>
      end
    end
  end
  inherited dsConsultar: TDataSource
    Left = 180
    Top = 162
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select ID_MEDICO, NOME_MEDICO from MEDICO'
    Top = 170
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarID_MEDICO: TIntegerField
      FieldName = 'ID_MEDICO'
      Required = True
      DisplayFormat = '00000'
    end
    object cdsConsultarNOME_MEDICO: TStringField
      FieldName = 'NOME_MEDICO'
      Required = True
      Size = 60
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsMedico
  end
end
