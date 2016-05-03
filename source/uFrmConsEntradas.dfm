inherited frmConsEntradas: TfrmConsEntradas
  Left = 193
  Top = 128
  Caption = 'Consulta de Entradas'
  ClientHeight = 470
  ClientWidth = 727
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 429
    Width = 727
    inherited bntFechar: TBitBtn
      Left = 628
    end
    inherited btnCancelar: TBitBtn
      Visible = False
      OnClick = btnCancelarClick
    end
  end
  inherited Panel4: TPanel
    Width = 727
    inherited Image1: TImage
      Width = 723
    end
  end
  inherited PageControl1: TPageControl
    Width = 727
    Height = 408
    inherited TabSheet1: TTabSheet
      inherited pnlSuperior: TPanel
        Width = 719
        inherited Label1: TLabel
          Caption = '&Per'#237'odo Final:'
        end
        inherited btnConsulta1: TBitBtn
          OnClick = btnConsulta1Click
        end
      end
      inherited grdConsultar: TDBGrid
        Width = 719
        Height = 198
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_ENTRADA'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186'. Entrada'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_NOTAFISCAL'
            Title.Caption = 'N'#186'. Nota'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 70
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'DATA_NOTA'
            Title.Caption = 'Data Nota'
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
            FieldName = 'DATA_RECEBIMENTO'
            Title.Caption = 'Data Recebimento'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ_ORIGEM'
            Title.Caption = 'CNPJ Fornecedor'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ_DESTINO'
            Title.Caption = 'CNPJ Loja destino'
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
            Visible = True
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
            FieldName = 'ARQUIVO'
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
            Title.Caption = 'Dt.Arquivo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ID_LOJA'
            Visible = False
          end>
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 263
        Width = 719
        Height = 117
        Align = alBottom
        Ctl3D = False
        DataSource = dsItensEntrada
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'REGISTRO_MS'
            Title.Alignment = taCenter
            Title.Caption = 'Registro MS'
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
            FieldName = 'PRO_MEDICAMENTO'
            Title.Caption = 'Medicamento'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 252
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
            Width = 87
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QUANTIDADE'
            Title.Alignment = taRightJustify
            Title.Caption = 'Quantidade'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 81
            Visible = True
          end>
      end
    end
  end
  inherited dstConsulta: TSQLDataSet
    CommandText = 
      'Select E.ID_ENTRADA, E.ID_LOJA, E.NR_NOTAFISCAL, E.DATA_NOTA, E.' +
      'DATA_RECEBIMENTO, E.CNPJ_ORIGEM, E.CNPJ_DESTINO, E.SITUACAO, E.A' +
      'RQUIVO, E.DATA_ARQUIVO from ENTRADA_MEDICAMENTOS E Where (E.DATA' +
      '_RECEBIMENTO >= :pINICIO) and (E.DATA_RECEBIMENTO <= :pFIM) and ' +
      '(FLINSUMO = :pFLUXO) order by E.DATA_RECEBIMENTO'
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
      'Select E.ID_ENTRADA, E.ID_LOJA, E.NR_NOTAFISCAL, E.DATA_NOTA, E.' +
      'DATA_RECEBIMENTO, E.CNPJ_ORIGEM, E.CNPJ_DESTINO, E.SITUACAO, E.A' +
      'RQUIVO, E.DATA_ARQUIVO from ENTRADA_MEDICAMENTOS E Where (E.DATA' +
      '_RECEBIMENTO >= :pINICIO) and (E.DATA_RECEBIMENTO <= :pFIM) and ' +
      '(FLINSUMO = :pFLUXO) order by E.DATA_RECEBIMENTO'
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
    object cdsMedicamentosID_ENTRADA: TIntegerField
      FieldName = 'ID_ENTRADA'
      Required = True
      DisplayFormat = '0000000000'
    end
    object cdsMedicamentosID_LOJA: TIntegerField
      FieldName = 'ID_LOJA'
      Required = True
    end
    object cdsMedicamentosNR_NOTAFISCAL: TIntegerField
      FieldName = 'NR_NOTAFISCAL'
      Required = True
      DisplayFormat = '000000000'
    end
    object cdsMedicamentosDATA_NOTA: TDateField
      FieldName = 'DATA_NOTA'
    end
    object cdsMedicamentosDATA_RECEBIMENTO: TDateField
      FieldName = 'DATA_RECEBIMENTO'
      Required = True
    end
    object cdsMedicamentosCNPJ_ORIGEM: TStringField
      Alignment = taRightJustify
      FieldName = 'CNPJ_ORIGEM'
      Required = True
      EditMask = '99.999.999/9999-99;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsMedicamentosCNPJ_DESTINO: TStringField
      Alignment = taRightJustify
      FieldName = 'CNPJ_DESTINO'
      Required = True
      EditMask = '99.999.999/9999-99;0;_'
      FixedChar = True
      Size = 14
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
      'Select E.ID_ENTRADA, E.NR_NOTAFISCAL, E.DATA_NOTA, E.DATA_RECEBI' +
      'MENTO, E.CNPJ_ORIGEM, E.CNPJ_DESTINO, E.ARQUIVO, E.DATA_ARQUIVO ' +
      'from ENTRADA_MEDICAMENTOS E Where (E.DATA_RECEBIMENTO >= :pINICI' +
      'O) and (E.DATA_RECEBIMENTO <= :pFIM) and (FLINSUMO = :pFLUXO) or' +
      'der by E.DATA_RECEBIMENTO'
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
    object cdsInsumosID_ENTRADA: TIntegerField
      FieldName = 'ID_ENTRADA'
      Required = True
      DisplayFormat = '0000000000'
    end
    object cdsInsumosNR_NOTAFISCAL: TIntegerField
      FieldName = 'NR_NOTAFISCAL'
      Required = True
    end
    object cdsInsumosDATA_NOTA: TDateField
      FieldName = 'DATA_NOTA'
    end
    object cdsInsumosDATA_RECEBIMENTO: TDateField
      FieldName = 'DATA_RECEBIMENTO'
      Required = True
    end
    object cdsInsumosCNPJ_ORIGEM: TStringField
      FieldName = 'CNPJ_ORIGEM'
      Required = True
      EditMask = '99.999.999/9999-99;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsInsumosCNPJ_DESTINO: TStringField
      FieldName = 'CNPJ_DESTINO'
      Required = True
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
  end
  inherited dsMedicamentos: TDataSource
    OnDataChange = dsMedicamentosDataChange
  end
  object dspPadrao: TSQLDataSet
    CommandText = 
      'Select ME.id_entrada, ME.registro_ms ,P.pro_medicamento, ME.nume' +
      'ro_lote, ME.quantidade from medicamento_entrada ME  INNER JOIN P' +
      'RODUTOS P ON P.pro_rg_ms_medicamento = ME.registro_ms Where (ME.' +
      'id_entrada = :pid_entrada)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pid_entrada'
        ParamType = ptUnknown
      end>
    SQLConnection = dmDados.sqlSNGPN
    Left = 292
    Top = 181
  end
  object dspPadrao2: TDataSetProvider
    DataSet = dspPadrao
    Options = [poAllowCommandText]
    Left = 340
    Top = 181
  end
  object cdsItensEntrada: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select ME.id_entrada, ME.registro_ms ,P.pro_medicamento, ME.nume' +
      'ro_lote, ME.quantidade from medicamento_entrada ME  INNER JOIN P' +
      'RODUTOS P ON P.pro_rg_ms_medicamento = ME.registro_ms Where (ME.' +
      'id_entrada = :pid_entrada)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pid_entrada'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspPadrao2'
    Left = 396
    Top = 181
    object cdsItensEntradaID_ENTRADA: TIntegerField
      FieldName = 'ID_ENTRADA'
      Required = True
    end
    object cdsItensEntradaREGISTRO_MS: TStringField
      FieldName = 'REGISTRO_MS'
      Required = True
      EditMask = '#.####.####.###-#;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsItensEntradaPRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      Required = True
      Size = 50
    end
    object cdsItensEntradaNUMERO_LOTE: TStringField
      Alignment = taRightJustify
      FieldName = 'NUMERO_LOTE'
      FixedChar = True
      Size = 10
    end
    object cdsItensEntradaQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Precision = 9
      Size = 3
    end
  end
  object dsItensEntrada: TDataSource
    DataSet = cdsItensEntrada
    Left = 452
    Top = 189
  end
end
