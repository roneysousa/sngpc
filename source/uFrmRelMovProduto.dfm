inherited FrmRelMovProduto: TFrmRelMovProduto
  Left = 350
  Top = 152
  Caption = 'Movimento de Produto'
  ClientHeight = 272
  ClientWidth = 494
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 494
    Height = 231
    object Label21: TLabel
      Left = 29
      Top = 28
      Width = 20
      Height = 13
      Caption = '&Loja'
      FocusControl = cmbLojas
      Transparent = True
    end
    object Label3: TLabel
      Left = 29
      Top = 68
      Width = 71
      Height = 13
      Caption = 'Per'#237'odo &Inicial:'
      FocusControl = edtDTINCIAL
      Transparent = True
    end
    object Label1: TLabel
      Left = 169
      Top = 68
      Width = 66
      Height = 13
      Caption = '&Per'#237'odo Final:'
      FocusControl = edtDTFINAL
      Transparent = True
    end
    object Label2: TLabel
      Left = 28
      Top = 107
      Width = 40
      Height = 13
      Caption = '&Produto:'
      Transparent = True
    end
    object spLocalizar: TSpeedButton
      Left = 150
      Top = 123
      Width = 23
      Height = 22
      Hint = 'Localizar Produto'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777744444777774444474B444777774B44474B444777774B
        4447444444474444444744B444444B44444744B444744B44444744B444744B44
        44477444444444444477774B44474B4447777744444744444777777444777444
        77777774B47774B4777777744477744477777777777777777777}
      OnClick = spLocalizarClick
    end
    object lblNumLote: TLabel
      Left = 28
      Top = 146
      Width = 21
      Height = 13
      Caption = '&Lote'
      FocusControl = cmbLote
      Transparent = True
    end
    object cmbLojas: TComboBox
      Left = 29
      Top = 44
      Width = 322
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
    end
    object edtDTINCIAL: TDateEdit
      Left = 29
      Top = 84
      Width = 121
      Height = 21
      Hint = 'Per'#237'odo inicial'
      NumGlyphs = 2
      TabOrder = 1
      OnExit = edtDTINCIALExit
    end
    object edtDTFINAL: TDateEdit
      Left = 169
      Top = 84
      Width = 121
      Height = 21
      Hint = 'Per'#237'odo final'
      NumGlyphs = 2
      TabOrder = 2
      OnExit = edtDTFINALExit
    end
    object edtCDPROD: TEdit
      Left = 28
      Top = 123
      Width = 121
      Height = 21
      MaxLength = 13
      TabOrder = 3
      OnChange = edtCDPRODChange
      OnEnter = edtCDPRODEnter
      OnExit = edtCDPRODExit
      OnKeyPress = edtCDPRODKeyPress
    end
    object lbl_NMPROD: TEdit
      Left = 175
      Top = 123
      Width = 274
      Height = 21
      TabStop = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object cmbLote: TComboBox
      Left = 28
      Top = 162
      Width = 209
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 5
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 189
      Width = 492
      Height = 41
      Align = alBottom
      DataSource = dsDados
      ReadOnly = True
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Visible = False
    end
  end
  inherited Panel2: TPanel
    Top = 231
    Width = 494
    inherited btnVisualizar: TBitBtn
      Left = 288
      OnClick = btnVisualizarClick
    end
    inherited btnFechar: TBitBtn
      Left = 376
    end
  end
  object cdsListaMovimento: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'LOJA'
        DataType = ftInteger
      end
      item
        Name = 'TIPO_MOV'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NR_SEQUENCIA'
        DataType = ftInteger
      end
      item
        Name = 'DATA_MOV'
        DataType = ftDate
      end
      item
        Name = 'REGISTRO_MS'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'NRLOTE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftFloat
      end
      item
        Name = 'USUARIO'
        DataType = ftInteger
      end
      item
        Name = 'NOME_PRODUTO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NOME_USUARIO'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <
      item
        Name = 'cdsListaMovimentoIndex1'
        Fields = 'DATA_MOV;TIPO_MOV'
      end>
    IndexFieldNames = 'DATA_MOV;TIPO_MOV'
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsListaMovimentoCalcFields
    Left = 384
    Top = 48
    Data = {
      C80000009619E0BD010000001800000008000000000003000000C800044C4F4A
      410400010000000000085449504F5F4D4F560100490000000100055749445448
      0200020002000C4E525F53455155454E43494104000100000000000844415441
      5F4D4F5604000600000000000B524547495354524F5F4D530100490000000100
      055749445448020002000D00064E524C4F544501004900000001000557494454
      480200020014000A5155414E5449444144450800040000000000075553554152
      494F04000100000000000000}
    object cdsListaMovimentoLOJA: TIntegerField
      FieldName = 'LOJA'
    end
    object cdsListaMovimentoTIPO_MOV: TStringField
      FieldName = 'TIPO_MOV'
      Size = 2
    end
    object cdsListaMovimentoNR_SEQUENCIA: TIntegerField
      FieldName = 'NR_SEQUENCIA'
    end
    object cdsListaMovimentoDATA_MOV: TDateField
      FieldName = 'DATA_MOV'
    end
    object cdsListaMovimentoREGISTRO_MS: TStringField
      FieldName = 'REGISTRO_MS'
      Size = 13
    end
    object cdsListaMovimentoNRLOTE: TStringField
      FieldName = 'NRLOTE'
    end
    object cdsListaMovimentoQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object cdsListaMovimentoUSUARIO: TIntegerField
      FieldName = 'USUARIO'
    end
    object cdsListaMovimentoNOME_PRODUTO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOME_PRODUTO'
      Size = 60
    end
    object cdsListaMovimentoNOME_USUARIO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOME_USUARIO'
      Size = 40
    end
  end
  object dstListaDados: TSQLDataSet
    CommandText = 
      'select V.id_venda, V.data_venda, V.USUARIO, VE.registro_ms, VE.n' +
      'umero_lote, VE.quant_medicamento from vendas_medicamentos VE Inn' +
      'er join VENDAS V ON V.id_venda = VE.id_venda WHERE (V.data_venda' +
      ' >= :pDTINICIO) AND (V.data_venda <= :pDTFINAL) AND (V.id_loja =' +
      ' :pLOJA) and (VE.registro_ms = :pCDPROD) and (VE.numero_lote = :' +
      'pLOTE)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCDPROD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pLOTE'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.sqlSNGPN
    Left = 240
    Top = 16
  end
  object dspListaDados: TDataSetProvider
    DataSet = dstListaDados
    Options = [poAllowCommandText]
    Left = 280
    Top = 16
  end
  object cdsListaEntrada: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select E.id_entrada, E.data_recebimento, ME.registro_ms, ME.nume' +
      'ro_lote, ME.quantidade from MEDICAMENTO_ENTRADA ME Inner join EN' +
      'TRADA_MEDICAMENTOS E ON E.id_entrada = ME.id_entrada WHERE (E.da' +
      'ta_recebimento >= :pDTINICIO) AND (E.data_recebimento <= :pDTFIN' +
      'AL) AND (E.id_loja = :pLOJA) and (ME.registro_ms = :pCDPROD) and' +
      ' (ME.numero_lote = :pLOTE)'
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCDPROD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pLOTE'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaEntrada'
    Left = 424
    Top = 8
    object cdsListaEntradaID_ENTRADA: TIntegerField
      FieldName = 'ID_ENTRADA'
      Required = True
    end
    object cdsListaEntradaDATA_RECEBIMENTO: TDateField
      FieldName = 'DATA_RECEBIMENTO'
      Required = True
    end
    object cdsListaEntradaREGISTRO_MS: TStringField
      FieldName = 'REGISTRO_MS'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsListaEntradaNUMERO_LOTE: TStringField
      FieldName = 'NUMERO_LOTE'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsListaEntradaQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Precision = 9
      Size = 3
    end
  end
  object cdsListaVendas: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select V.id_venda, V.data_venda, V.USUARIO, VE.registro_ms, VE.n' +
      'umero_lote, VE.quant_medicamento from vendas_medicamentos VE Inn' +
      'er join VENDAS V ON V.id_venda = VE.id_venda WHERE (V.data_venda' +
      ' >= :pDTINICIO) AND (V.data_venda <= :pDTFINAL) AND (V.id_loja =' +
      ' :pLOJA) and (VE.registro_ms = :pCDPROD) and (VE.numero_lote = :' +
      'pLOTE)'
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCDPROD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pLOTE'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaDados'
    Left = 336
    Top = 48
    object cdsListaVendasID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Required = True
    end
    object cdsListaVendasDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
      Required = True
    end
    object cdsListaVendasREGISTRO_MS: TStringField
      FieldName = 'REGISTRO_MS'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsListaVendasNUMERO_LOTE: TStringField
      FieldName = 'NUMERO_LOTE'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsListaVendasQUANT_MEDICAMENTO: TBCDField
      FieldName = 'QUANT_MEDICAMENTO'
      Precision = 9
      Size = 3
    end
    object cdsListaVendasUSUARIO: TIntegerField
      FieldName = 'USUARIO'
    end
  end
  object dsDados: TDataSource
    AutoEdit = False
    DataSet = cdsListaMovimento
    Left = 432
    Top = 56
  end
  object qryListaEntrada: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCDPROD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pLOTE'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.sqlSNGPN
    Left = 336
    Top = 8
  end
  object dspListaEntrada: TDataSetProvider
    DataSet = qryListaEntrada
    Options = [poAllowCommandText]
    Left = 376
    Top = 8
  end
  object ppRepDados: TppReport
    AutoStop = False
    DataPipeline = ppDBPDados
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 288
    Top = 88
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPDados'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32015
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'MOVIMENTO DE PRODUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 3704
        mmWidth = 46302
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 1058
        mmTop = 25400
        mmWidth = 196057
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 794
        mmTop = 30692
        mmWidth = 196057
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'LOTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 59796
        mmTop = 26458
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'QUANTIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 84821
        mmTop = 26458
        mmWidth = 23241
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2381
        mmTop = 26458
        mmWidth = 9059
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'TIPO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 21167
        mmTop = 26458
        mmWidth = 8255
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'C'#211'DIGO MS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 30692
        mmTop = 26458
        mmWidth = 20616
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'PER'#205'ODO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'lblPeriodo'
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 22490
        mmTop = 12965
        mmWidth = 60325
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'PRODUTO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 17727
        mmWidth = 18521
        BandType = 0
      end
      object lblProduto: TppLabel
        UserName = 'lblPeriodo1'
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 22490
        mmTop = 17727
        mmWidth = 81756
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'LOJA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 8467
        mmWidth = 9790
        BandType = 0
      end
      object lblLoja: TppLabel
        UserName = 'lblLoja'
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 22490
        mmTop = 8467
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'USU'#193'RIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 111125
        mmTop = 26458
        mmWidth = 16214
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DATA_MOV'
        DataPipeline = ppDBPDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPDados'
        mmHeight = 4022
        mmLeft = 2381
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'TIPO_MOV'
        DataPipeline = ppDBPDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPDados'
        mmHeight = 3969
        mmLeft = 21167
        mmTop = 0
        mmWidth = 7673
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'REGISTRO_MS'
        DataPipeline = ppDBPDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPDados'
        mmHeight = 3969
        mmLeft = 30692
        mmTop = 0
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'NRLOTE'
        DataPipeline = ppDBPDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPDados'
        mmHeight = 3969
        mmLeft = 59796
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'QUANTIDADE'
        DataPipeline = ppDBPDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPDados'
        mmHeight = 3969
        mmLeft = 84821
        mmTop = 0
        mmWidth = 23241
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'NOME_USUARIO'
        DataPipeline = ppDBPDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPDados'
        mmHeight = 3969
        mmLeft = 111390
        mmTop = 0
        mmWidth = 60325
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 794
        mmWidth = 196057
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 158486
        mmTop = 3440
        mmWidth = 32015
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 158221
        mmTop = 8202
        mmWidth = 1947
        BandType = 8
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Data/Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 139700
        mmTop = 3440
        mmWidth = 16976
        BandType = 8
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 144727
        mmTop = 8202
        mmWidth = 11853
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 1058
        mmWidth = 196057
        BandType = 7
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Registro(s):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4057
        mmLeft = 1588
        mmTop = 2646
        mmWidth = 18415
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataPipeline = ppDBPDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPDados'
        mmHeight = 4057
        mmLeft = 21431
        mmTop = 2646
        mmWidth = 17198
        BandType = 7
      end
    end
  end
  object ppDBPDados: TppDBPipeline
    DataSource = dsDados
    UserName = 'DBPDados'
    Left = 328
    Top = 88
    object ppDBPDadosppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'LOJA'
      FieldName = 'LOJA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppDBPDadosppField2: TppField
      FieldAlias = 'TIPO_MOV'
      FieldName = 'TIPO_MOV'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object ppDBPDadosppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'NR_SEQUENCIA'
      FieldName = 'NR_SEQUENCIA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPDadosppField4: TppField
      FieldAlias = 'DATA_MOV'
      FieldName = 'DATA_MOV'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPDadosppField5: TppField
      FieldAlias = 'REGISTRO_MS'
      FieldName = 'REGISTRO_MS'
      FieldLength = 13
      DisplayWidth = 13
      Position = 4
    end
    object ppDBPDadosppField6: TppField
      FieldAlias = 'NRLOTE'
      FieldName = 'NRLOTE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppDBPDadosppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTIDADE'
      FieldName = 'QUANTIDADE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPDadosppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'USUARIO'
      FieldName = 'USUARIO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDBPDadosppField9: TppField
      FieldAlias = 'NOME_PRODUTO'
      FieldName = 'NOME_PRODUTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object ppDBPDadosppField10: TppField
      FieldAlias = 'NOME_USUARIO'
      FieldName = 'NOME_USUARIO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 9
    end
  end
end
