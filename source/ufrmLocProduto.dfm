inherited frmLocProduto: TfrmLocProduto
  Left = 254
  Top = 161
  Caption = 'Localizar Produto'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited rgConsultar: TRadioGroup
      Items.Strings = (
        'C'#243'digo MS'
        'Nome/Descri'#231#227'o')
    end
    inherited btnConsultar: TBitBtn
      OnClick = btnConsultarClick
    end
  end
  inherited Panel1: TPanel
    inherited grdConsultar: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'PRO_RG_MS_MEDICAMENTO'
          Title.Caption = 'C'#211'DIGO MS'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 117
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_MEDICAMENTO'
          Title.Caption = 'DESCRI'#199#195'O'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 375
          Visible = True
        end>
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select PRO_RG_MS_MEDICAMENTO, PRO_MEDICAMENTO from PRODUTOS'
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarPRO_RG_MS_MEDICAMENTO: TStringField
      FieldName = 'PRO_RG_MS_MEDICAMENTO'
      Required = True
      EditMask = '9.9999.9999.999-9;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsConsultarPRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      Required = True
      Size = 50
    end
  end
end
