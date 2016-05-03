inherited frmLocOrgaoExpedidor: TfrmLocOrgaoExpedidor
  Caption = 'Localiza '#211'rg'#227'o Expedidor'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited btnConsultar: TBitBtn
      OnClick = btnConsultarClick
    end
  end
  inherited Panel1: TPanel
    inherited grdConsultar: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_ORGAO'
          Title.Caption = 'C'#211'DIGO'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SIGLA_ORGAO'
          Title.Caption = 'SIGLA'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'DESCRI'#199#195'O'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select ID_ORGAO, SIGLA_ORGAO, DESCRICAO from ORGAO_EXPEDIDOR'
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarID_ORGAO: TIntegerField
      FieldName = 'ID_ORGAO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarSIGLA_ORGAO: TStringField
      FieldName = 'SIGLA_ORGAO'
      Size = 10
    end
    object cdsConsultarDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
end
