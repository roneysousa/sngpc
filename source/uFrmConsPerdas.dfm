inherited frmConsPerdas: TfrmConsPerdas
  Left = 222
  Top = 167
  Caption = 'Consulta de Perdas'
  ClientHeight = 426
  ClientWidth = 770
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 385
    Width = 770
    inherited bntFechar: TBitBtn
      Left = 672
    end
    inherited btnCancelar: TBitBtn
      Visible = False
      OnClick = btnCancelarClick
    end
  end
  inherited Panel4: TPanel
    Width = 770
    inherited Image1: TImage
      Width = 766
    end
  end
  inherited PageControl1: TPageControl
    Width = 770
    Height = 364
    inherited TabSheet1: TTabSheet
      inherited pnlSuperior: TPanel
        Width = 762
        inherited Label1: TLabel
          Caption = '&Per'#237'odo Final:'
        end
        inherited btnConsulta1: TBitBtn
          OnClick = btnConsulta1Click
        end
      end
      inherited grdConsultar: TDBGrid
        Width = 762
        Height = 271
        Columns = <
          item
            Expanded = False
            FieldName = 'DATA_PERDA'
            Title.Caption = 'Data'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'SITUACAO'
            Title.Alignment = taCenter
            Title.Caption = 'ST'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REGISTRO_MS'
            Title.Caption = 'Registro MS'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRO_MEDICAMENTO'
            Title.Caption = 'Medicamento'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERO_LOTE'
            Title.Alignment = taRightJustify
            Title.Caption = 'Lote'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Title.Alignment = taRightJustify
            Title.Caption = 'Quant.'
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
            Title.Caption = 'Motivo da Perda'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 218
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ARQUIVO'
            Title.Caption = 'Arquivo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_ARQUIVO'
            Title.Caption = 'Dt.Arquivo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
    end
  end
  inherited dstConsulta: TSQLDataSet
    CommandText = 
      'Select P.DATA_PERDA, P.ARQUIVO, P.DATA_ARQUIVO, PM.REGISTRO_MS, ' +
      'PR.PRO_MEDICAMENTO, PM.NUMERO_LOTE, PM.QUANTIDADE, MP.DESCRICAO ' +
      'from PERDAS P inner join TIPOMOTIVOPERDA MP ON (P.MOTIVO_PERDA =' +
      ' MP.ID_MOTIVOPERDA) inner join PERDAS_MEDICAMENTOS PM ON (P.ID_P' +
      'ERDA = PM.ID_PERDA) inner join PRODUTOS PR ON (PR.pro_rg_ms_medi' +
      'camento = PM.REGISTRO_MS) Where (P.DATA_PERDA >= :pINICIO) and (' +
      'P.DATA_PERDA <= :pFIM) and (P.FLUXO_INSUMO = :pFLUXO) order by P' +
      '.DATA_PERDA'
    Params = <
      item
        DataType = ftDate
        Name = 'pINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFLUXO'
        ParamType = ptUnknown
      end>
  end
  inherited cdsMedicamentos: TClientDataSet
    CommandText = 
      'Select P.ID_PERDA, P.DATA_PERDA, P.SITUACAO, P.ARQUIVO, P.DATA_A' +
      'RQUIVO ,PM.REGISTRO_MS, PR.PRO_MEDICAMENTO, PM.NUMERO_LOTE, PM.Q' +
      'UANTIDADE, MP.DESCRICAO from PERDAS P inner join TIPOMOTIVOPERDA' +
      ' MP ON (P.MOTIVO_PERDA = MP.ID_MOTIVOPERDA) inner join PERDAS_ME' +
      'DICAMENTOS PM ON (P.ID_PERDA = PM.ID_PERDA) inner join PRODUTOS ' +
      'PR ON (PR.pro_rg_ms_medicamento = PM.REGISTRO_MS) Where (P.DATA_' +
      'PERDA >= :pINICIO) and (P.DATA_PERDA <= :pFIM) and (P.FLUXO_INSU' +
      'MO = :pFLUXO) order by P.DATA_PERDA'
    Params = <
      item
        DataType = ftDate
        Name = 'pINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFLUXO'
        ParamType = ptUnknown
      end>
    object cdsMedicamentosID_PERDA: TIntegerField
      FieldName = 'ID_PERDA'
      Required = True
    end
    object cdsMedicamentosDATA_PERDA: TDateField
      FieldName = 'DATA_PERDA'
    end
    object cdsMedicamentosREGISTRO_MS: TStringField
      FieldName = 'REGISTRO_MS'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsMedicamentosPRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      Required = True
      Size = 50
    end
    object cdsMedicamentosNUMERO_LOTE: TStringField
      Alignment = taRightJustify
      FieldName = 'NUMERO_LOTE'
      FixedChar = True
      Size = 10
    end
    object cdsMedicamentosQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '########.0'
      Precision = 15
      Size = 8
    end
    object cdsMedicamentosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
    object cdsMedicamentosSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsMedicamentosARQUIVO: TStringField
      FieldName = 'ARQUIVO'
    end
    object cdsMedicamentosDATA_ARQUIVO: TDateField
      FieldName = 'DATA_ARQUIVO'
    end
  end
  inherited cdsInsumos: TClientDataSet
    CommandText = 
      'Select P.DATA_PERDA, P.ARQUIVO, P.DATA_ARQUIVO, PM.REGISTRO_MS, ' +
      'PR.PRO_MEDICAMENTO, PM.NUMERO_LOTE, PM.QUANTIDADE, MP.DESCRICAO ' +
      'from PERDAS P inner join TIPOMOTIVOPERDA MP ON (P.MOTIVO_PERDA =' +
      ' MP.ID_MOTIVOPERDA) inner join PERDAS_MEDICAMENTOS PM ON (P.ID_P' +
      'ERDA = PM.ID_PERDA) inner join PRODUTOS PR ON (PR.pro_rg_ms_medi' +
      'camento = PM.REGISTRO_MS) Where (P.DATA_PERDA >= :pINICIO) and (' +
      'P.DATA_PERDA <= :pFIM) and (P.FLUXO_INSUMO = :pFLUXO) order by P' +
      '.DATA_PERDA'
    Params = <
      item
        DataType = ftDate
        Name = 'pINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFLUXO'
        ParamType = ptUnknown
      end>
    object cdsInsumosDATA_PERDA: TDateField
      FieldName = 'DATA_PERDA'
    end
    object cdsInsumosREGISTRO_MS: TStringField
      FieldName = 'REGISTRO_MS'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsInsumosPRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      Required = True
      Size = 50
    end
    object cdsInsumosNUMERO_LOTE: TStringField
      Alignment = taRightJustify
      FieldName = 'NUMERO_LOTE'
      FixedChar = True
      Size = 10
    end
    object cdsInsumosQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '########.0'
      Precision = 15
      Size = 8
    end
    object cdsInsumosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
    object cdsInsumosARQUIVO: TStringField
      FieldName = 'ARQUIVO'
    end
    object cdsInsumosDATA_ARQUIVO: TDateField
      FieldName = 'DATA_ARQUIVO'
    end
  end
  inherited dsMedicamentos: TDataSource
    OnDataChange = dsMedicamentosDataChange
  end
end
