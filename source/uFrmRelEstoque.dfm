inherited frmRelEstoque: TfrmRelEstoque
  Caption = 'Relat'#243'rio de Estoque'
  ClientHeight = 232
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 191
    object Label21: TLabel
      Left = 25
      Top = 30
      Width = 20
      Height = 13
      Caption = '&Loja'
      FocusControl = cmbLojas3
      Transparent = True
    end
    object cmbLojas3: TComboBox
      Left = 25
      Top = 46
      Width = 322
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
    end
    object RadioGroup1: TRadioGroup
      Left = 25
      Top = 80
      Width = 322
      Height = 57
      Caption = '[ Ordem ]'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        '&C'#243'digo MS'
        '&Descri'#231#227'o')
      TabOrder = 1
    end
    object cbkEstoque: TCheckBox
      Left = 24
      Top = 146
      Width = 145
      Height = 17
      Caption = 'Somente com Estoque'
      TabOrder = 2
    end
  end
  inherited Panel2: TPanel
    Top = 191
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  object dstConsulta: TSQLDataSet
    CommandText = 
      'Select P.pro_rg_ms_medicamento, P.pro_medicamento, P.PRO_ANTIMIC' +
      'ROBIANOS, P.PRO_UNIDADE_MEDIDA, E.est_nrlote, E.est_quantidade f' +
      'rom PRODUTOS P'#13#10'INNER Join ESTOQUE E ON E.est_cdprod = P.pro_rg_' +
      'ms_medicamento'#13#10'Where (E.est_cdloja = :pLOJA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.sqlSNGPN
    Left = 8
    Top = 200
  end
  object dspConsulta: TDataSetProvider
    DataSet = dstConsulta
    Options = [poAllowCommandText]
    Left = 48
    Top = 200
  end
  object cdsConsulta: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsulta'
    OnCalcFields = cdsConsultaCalcFields
    Left = 88
    Top = 200
    object cdsConsultaPRO_RG_MS_MEDICAMENTO: TStringField
      FieldName = 'PRO_RG_MS_MEDICAMENTO'
      Required = True
      EditMask = '9.9999.9999.999-9;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsConsultaPRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      Required = True
      Size = 50
    end
    object cdsConsultaEST_NRLOTE: TStringField
      FieldName = 'EST_NRLOTE'
      Required = True
      Size = 10
    end
    object cdsConsultaEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsConsultaRMS_PRODUTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'RMS_PRODUTO'
      Calculated = True
    end
    object cdsConsultaPRO_ANTIMICROBIANOS: TStringField
      FieldName = 'PRO_ANTIMICROBIANOS'
      FixedChar = True
      Size = 1
    end
    object cdsConsultaPRO_UNIDADE_MEDIDA: TStringField
      FieldName = 'PRO_UNIDADE_MEDIDA'
      FixedChar = True
      Size = 1
    end
  end
  object dsConsulta: TDataSource
    DataSet = cdsConsulta
    Left = 128
    Top = 200
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
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
    Left = 296
    Top = 88
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25665
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'LISTA DE PRODUTO NO ESTOQUE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 62971
        mmTop = 5821
        mmWidth = 59267
        BandType = 0
      end
      object blLoja: TppLabel
        UserName = 'blLoja'
        Caption = 'blLoja'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4057
        mmLeft = 3175
        mmTop = 13758
        mmWidth = 9313
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 18256
        mmWidth = 196057
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 23548
        mmWidth = 196057
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'C'#211'DIGO MS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4057
        mmLeft = 2910
        mmTop = 19315
        mmWidth = 20743
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'DESCRI'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4057
        mmLeft = 35190
        mmTop = 19315
        mmWidth = 21167
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
        mmHeight = 4057
        mmLeft = 127265
        mmTop = 19315
        mmWidth = 9313
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'QUANT.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4057
        mmLeft = 156634
        mmTop = 19315
        mmWidth = 13547
        BandType = 0
      end
      object txtEstoque: TppLabel
        UserName = 'txtEstoque'
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 132027
        mmTop = 13758
        mmWidth = 2921
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'ANTIBI'#211'TICO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 172509
        mmTop = 19315
        mmWidth = 22860
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PRO_MEDICAMENTO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 35190
        mmTop = 264
        mmWidth = 89165
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'EST_NRLOTE'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 127265
        mmTop = 264
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'EST_QUANTIDADE'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 156634
        mmTop = 264
        mmWidth = 13547
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'RMS_PRODUTO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 264
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PRO_ANTIMICROBIANOS'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 179917
        mmTop = 265
        mmWidth = 6879
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
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4057
        mmLeft = 21431
        mmTop = 2646
        mmWidth = 17198
        BandType = 7
      end
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsConsulta
    UserName = 'DBPipeline1'
    Left = 296
    Top = 128
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'PRO_RG_MS_MEDICAMENTO'
      FieldName = 'PRO_RG_MS_MEDICAMENTO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'PRO_MEDICAMENTO'
      FieldName = 'PRO_MEDICAMENTO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'EST_NRLOTE'
      FieldName = 'EST_NRLOTE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'EST_QUANTIDADE'
      FieldName = 'EST_QUANTIDADE'
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 19
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'RMS_PRODUTO'
      FieldName = 'RMS_PRODUTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'PRO_ANTIMICROBIANOS'
      FieldName = 'PRO_ANTIMICROBIANOS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = 'PRO_UNIDADE_MEDIDA'
      FieldName = 'PRO_UNIDADE_MEDIDA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
  end
end
