inherited frmCadConsProfissional: TfrmCadConsProfissional
  Caption = 'Cadastro Conselho Profissional'
  ClientHeight = 263
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 242
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 13
        Top = 101
        Width = 23
        Height = 13
        Caption = 'Sigla'
        FocusControl = dbeSigla
      end
      object Label2: TLabel [1]
        Left = 13
        Top = 60
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
      end
      object Label3: TLabel [2]
        Left = 13
        Top = 8
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Transparent = True
      end
      object DBText1: TDBText [3]
        Left = 13
        Top = 25
        Width = 79
        Height = 22
        AutoSize = True
        DataField = 'ID_CONSELHO'
        DataSource = dsCadastro
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      inherited Panel1: TPanel
        Top = 173
        TabOrder = 2
      end
      object dbeSigla: TDBEdit
        Left = 13
        Top = 117
        Width = 69
        Height = 21
        CharCase = ecUpperCase
        DataField = 'SIGLA'
        DataSource = dsCadastro
        TabOrder = 1
      end
      object dbeDescricao: TDBEdit
        Left = 13
        Top = 76
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = dsCadastro
        TabOrder = 0
      end
    end
    inherited TabSheet2: TTabSheet
      inherited grdConsultar: TDBGrid
        Height = 155
        DataSource = dsConsultar
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_CONSELHO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#211'DIGO'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'DESCRI'#199#195'O'
            Visible = True
          end>
      end
      inherited Panel3: TPanel
        Height = 155
      end
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select ID_CONSELHO, DESCRICAO from CONSELHOPROFISSIONAL'
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarID_CONSELHO: TIntegerField
      FieldName = 'ID_CONSELHO'
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
    DataSet = dmDados.cdsConselhoProfissional
  end
end
