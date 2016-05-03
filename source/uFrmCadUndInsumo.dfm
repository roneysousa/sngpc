inherited frmCadUndInsumo: TfrmCadUndInsumo
  Caption = 'Cadastro Unidade Insumo'
  ClientHeight = 244
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 223
    inherited TabSheet1: TTabSheet
      object Label3: TLabel [0]
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
        DataField = 'ID_UNDINSUMO'
        DataSource = dsCadastro
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel [2]
        Left = 13
        Top = 64
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
      end
      inherited Panel1: TPanel
        Top = 154
      end
      object dbeDescricao: TDBEdit
        Left = 13
        Top = 80
        Width = 500
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = dsCadastro
        TabOrder = 1
      end
    end
    inherited TabSheet2: TTabSheet
      inherited grdConsultar: TDBGrid
        Height = 136
        DataSource = dsConsultar
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_UNDINSUMO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#211'DIGO'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 418
            Visible = True
          end>
      end
      inherited Panel3: TPanel
        Height = 136
      end
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select ID_UNDINSUMO, DESCRICAO from TIPOUNIDADEINSUMO'
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarID_UNDINSUMO: TIntegerField
      FieldName = 'ID_UNDINSUMO'
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
    DataSet = dmDados.cdsUnidadeInsumo
  end
end
