inherited frmConsTransf: TfrmConsTransf
  Left = 321
  Top = 171
  Caption = 'Consulta de Transfer'#234'ncias'
  ClientHeight = 429
  ClientWidth = 781
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 388
    Width = 781
    inherited bntFechar: TBitBtn
      Left = 688
    end
    inherited btnCancelar: TBitBtn
      Visible = False
      OnClick = btnCancelarClick
    end
  end
  inherited Panel4: TPanel
    Width = 781
    inherited Image1: TImage
      Width = 777
    end
  end
  inherited PageControl1: TPageControl
    Width = 781
    Height = 367
    inherited TabSheet1: TTabSheet
      inherited pnlSuperior: TPanel
        Width = 773
        inherited btnConsulta1: TBitBtn
          OnClick = btnConsulta1Click
        end
      end
      inherited grdConsultar: TDBGrid
        Width = 773
        Height = 274
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CNPJ_DESTINO'
            Title.Alignment = taCenter
            Title.Caption = 'CNPJ Destino'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_TRANSFERENCIA'
            Title.Caption = 'N'#186'.Transf.'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = False
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
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NR_NOTAFISCAL'
            Title.Caption = 'N'#186'.Nota'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_TRANSFERENCIA'
            Title.Caption = 'DT.Transf.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_NOTA'
            Title.Caption = 'Data Nota'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 90
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
            Alignment = taRightJustify
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
            FieldName = 'QUANT_MEDICAMENTO'
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
            FieldName = 'CNPJ_FORNECEDOR'
            Title.Alignment = taRightJustify
            Title.Caption = 'CNPJ Fornecedor'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'EMP_FANTASIA'
            Title.Caption = 'Loja de Origem'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'EMP_FANTASIA_1'
            Title.Caption = 'Loja de Destino'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ARQUIVO'
            Title.Alignment = taCenter
            Title.Caption = 'Arquivo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_ARQUIVO'
            Title.Alignment = taCenter
            Title.Caption = 'Dt.Arquivo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Arquivo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DATA_ARQUIVO'
            Title.Alignment = taCenter
            Title.Caption = 'Dt.Arquivo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = False
          end>
      end
    end
  end
  inherited dstConsulta: TSQLDataSet
    CommandText = 
      'Select T.ID_TRANSFERENCIA, T.NR_NOTAFISCAL, T.DATA_TRANSFERENCIA' +
      ', T.DATA_NOTA, T.SITUACAO, T.cnpj_origem, T.cnpj_destino, T.ARQU' +
      'IVO, T.DATA_ARQUIVO, TM.REGISTRO_MS, PR.PRO_MEDICAMENTO, TM.NUME' +
      'RO_LOTE, TM.QUANT_MEDICAMENTO from TRANSFERENCIA T inner join TR' +
      'ANSFERENCIA_MEDICAMENTOS TM ON (TM.id_transferencia = T.id_trans' +
      'ferencia) inner join PRODUTOS PR ON (PR.pro_rg_ms_medicamento = ' +
      'TM.REGISTRO_MS) Where (T.DATA_TRANSFERENCIA >= :pINICIO) and (T.' +
      'DATA_TRANSFERENCIA <= :pFIM) and (T.FLUXO_INSUMO = :pFLUXO) orde' +
      'r by T.DATA_TRANSFERENCIA, T.ID_TRANSFERENCIA'
    Params = <
      item
        DataType = ftDate
        Name = 'pINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pFLUXO'
        ParamType = ptInput
      end>
    Left = 260
    Top = 96
  end
  inherited cdsMedicamentos: TClientDataSet
    CommandText = 
      'Select T.ID_TRANSFERENCIA, T.NR_NOTAFISCAL, T.DATA_TRANSFERENCIA' +
      ', T.DATA_NOTA, T.SITUACAO, T.cnpj_origem, T.cnpj_destino, T.ARQU' +
      'IVO, T.DATA_ARQUIVO, TM.REGISTRO_MS, PR.PRO_MEDICAMENTO, TM.NUME' +
      'RO_LOTE, TM.QUANT_MEDICAMENTO from TRANSFERENCIA T inner join TR' +
      'ANSFERENCIA_MEDICAMENTOS TM ON (TM.id_transferencia = T.id_trans' +
      'ferencia) inner join PRODUTOS PR ON (PR.pro_rg_ms_medicamento = ' +
      'TM.REGISTRO_MS) Where (T.DATA_TRANSFERENCIA >= :pINICIO) and (T.' +
      'DATA_TRANSFERENCIA <= :pFIM) and (T.FLUXO_INSUMO = :pFLUXO) orde' +
      'r by T.DATA_TRANSFERENCIA, T.ID_TRANSFERENCIA'
    Params = <
      item
        DataType = ftDate
        Name = 'pINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pFLUXO'
        ParamType = ptInput
      end>
    object cdsMedicamentosID_TRANSFERENCIA: TIntegerField
      FieldName = 'ID_TRANSFERENCIA'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsMedicamentosNR_NOTAFISCAL: TIntegerField
      FieldName = 'NR_NOTAFISCAL'
    end
    object cdsMedicamentosCNPJ_ORIGEM: TStringField
      FieldName = 'CNPJ_ORIGEM'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object cdsMedicamentosCNPJ_DESTINO: TStringField
      FieldName = 'CNPJ_DESTINO'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object cdsMedicamentosDATA_NOTA: TDateField
      FieldName = 'DATA_NOTA'
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
      FieldName = 'NUMERO_LOTE'
      FixedChar = True
      Size = 10
    end
    object cdsMedicamentosDATA_TRANSFERENCIA: TDateField
      FieldName = 'DATA_TRANSFERENCIA'
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
    object cdsMedicamentosQUANT_MEDICAMENTO: TBCDField
      FieldName = 'QUANT_MEDICAMENTO'
      Precision = 9
      Size = 3
    end
  end
  inherited cdsInsumos: TClientDataSet
    CommandText = 
      'Select T.ID_TRANSFERENCIA, T.NR_NOTAFISCAL, T.DATA_NOTA, T.ARQUI' +
      'VO, T.DATA_ARQUIVO, ORG.EMP_FANTASIA, DES.EMP_FANTASIA, TM.REGIS' +
      'TRO_MS, PR.PRO_MEDICAMENTO, TM.NUMERO_LOTE, TM.QUANT_MEDICAMENTO' +
      ', TM.CNPJ_FORNECEDOR from TRANSFERENCIA T inner join EMPRESAS OR' +
      'G ON (ORG.EMP_CNPJ = T.CNPJ_ORIGEM) inner join EMPRESAS DES ON (' +
      'DES.EMP_CNPJ = T.CNPJ_DESTINO) inner join TRANSFERENCIA_MEDICAME' +
      'NTOS TM ON (TM.id_transferencia = T.id_transferencia) inner join' +
      ' PRODUTOS PR ON (PR.pro_rg_ms_medicamento = TM.REGISTRO_MS) Wher' +
      'e (T.DATA_TRANSFERENCIA >= :pINICIO) and (T.DATA_TRANSFERENCIA <' +
      '= :pFIM) and (T.FLUXO_INSUMO = :pFLUXO) order by T.DATA_TRANSFER' +
      'ENCIA, T.ID_TRANSFERENCIA'
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
    object cdsInsumosID_TRANSFERENCIA: TIntegerField
      FieldName = 'ID_TRANSFERENCIA'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsInsumosNR_NOTAFISCAL: TIntegerField
      FieldName = 'NR_NOTAFISCAL'
    end
    object cdsInsumosDATA_NOTA: TDateField
      FieldName = 'DATA_NOTA'
    end
    object cdsInsumosEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
    object cdsInsumosEMP_FANTASIA_1: TStringField
      FieldName = 'EMP_FANTASIA_1'
      Size = 50
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
      FieldName = 'NUMERO_LOTE'
      FixedChar = True
      Size = 10
    end
    object cdsInsumosCNPJ_FORNECEDOR: TStringField
      Alignment = taRightJustify
      FieldName = 'CNPJ_FORNECEDOR'
      EditMask = '99.999.999/9999-99;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsInsumosARQUIVO: TStringField
      FieldName = 'ARQUIVO'
    end
    object cdsInsumosDATA_ARQUIVO: TDateField
      FieldName = 'DATA_ARQUIVO'
    end
    object cdsInsumosQUANT_MEDICAMENTO: TBCDField
      FieldName = 'QUANT_MEDICAMENTO'
      Precision = 9
      Size = 3
    end
  end
  inherited dsMedicamentos: TDataSource
    OnDataChange = dsMedicamentosDataChange
    Left = 412
  end
end
