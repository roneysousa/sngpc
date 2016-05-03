inherited frmCadOrgaoExpedidor: TfrmCadOrgaoExpedidor
  Caption = 'Cadastro '#211'rg'#227'o Expedidor'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 13
        Top = 16
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
        DataField = 'ID_ORGAO'
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
        Top = 120
        Width = 120
        Height = 13
        Caption = 'Sigla do '#211'rg'#227'o Expedidor'
        FocusControl = dbeSigla
        Transparent = True
      end
      object Label3: TLabel [3]
        Left = 16
        Top = 78
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
        Transparent = True
      end
      inherited Panel1: TPanel
        TabOrder = 2
      end
      object dbeSigla: TDBEdit
        Left = 16
        Top = 136
        Width = 134
        Height = 21
        CharCase = ecUpperCase
        DataField = 'SIGLA_ORGAO'
        DataSource = dsCadastro
        TabOrder = 1
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 94
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = dsCadastro
        TabOrder = 0
        OnExit = dbeDescricaoExit
      end
    end
    inherited TabSheet2: TTabSheet
      inherited grdConsultar: TDBGrid
        DataSource = dsConsultar
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_ORGAO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#211'DIGO'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 424
            Visible = True
          end>
      end
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select ID_ORGAO, DESCRICAO from ORGAO_EXPEDIDOR'
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarID_ORGAO: TIntegerField
      FieldName = 'ID_ORGAO'
      Required = True
      DisplayFormat = '0000'
    end
    object cdsConsultarDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsOrgaoExpedidor
  end
end
