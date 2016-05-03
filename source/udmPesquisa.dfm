object dmPesquisa: TdmPesquisa
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 194
  Top = 125
  Height = 526
  Width = 783
  object dstTpDocumento: TSQLDataSet
    CommandText = 'select * from TIPO_DOCUMENTO order by DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDados.sqlSNGPN
    Left = 40
    Top = 32
  end
  object dspTipoDoc: TDataSetProvider
    DataSet = dstTpDocumento
    Options = [poAllowCommandText]
    Left = 120
    Top = 32
  end
  object cdsTipoDoc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoDoc'
    Left = 184
    Top = 32
    object cdsTipoDocID_DOCUMENTO: TIntegerField
      FieldName = 'ID_DOCUMENTO'
      Required = True
    end
    object cdsTipoDocDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object dstOrgExpedidor: TSQLDataSet
    CommandText = 
      'select ID_ORGAO, DESCRICAO from  ORGAO_EXPEDIDOR order by DESCRI' +
      'CAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDados.sqlSNGPN
    Left = 40
    Top = 80
  end
  object dspOrgExpedidor: TDataSetProvider
    DataSet = dstOrgExpedidor
    Options = [poAllowCommandText]
    Left = 120
    Top = 80
  end
  object cdsOrgExpedidor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrgExpedidor'
    Left = 184
    Top = 80
    object cdsOrgExpedidorID_ORGAO: TIntegerField
      FieldName = 'ID_ORGAO'
      Required = True
    end
    object cdsOrgExpedidorDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object dstConsProfissional: TSQLDataSet
    CommandText = 
      'select ID_CONSELHO, DESCRICAO, SIGLA from CONSELHOPROFISSIONAL o' +
      'rder by DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDados.sqlSNGPN
    Left = 40
    Top = 136
  end
  object dspConsProfis: TDataSetProvider
    DataSet = dstConsProfissional
    Options = [poAllowCommandText]
    Left = 120
    Top = 136
  end
  object cdsConsProfissional: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsProfis'
    Left = 200
    Top = 136
    object cdsConsProfissionalID_CONSELHO: TIntegerField
      FieldName = 'ID_CONSELHO'
      Required = True
    end
    object cdsConsProfissionalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
    object cdsConsProfissionalSIGLA: TStringField
      FieldName = 'SIGLA'
      Required = True
      Size = 5
    end
  end
  object qryBusca: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDados.sqlSNGPN
    Left = 288
    Top = 24
  end
  object dstConsulta: TSQLDataSet
    CommandText = 
      'Select EMP_FANTASIA, EMP_CNPJ from EMPRESAS order by EMP_FANTASI' +
      'A'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDados.sqlSNGPN
    Left = 32
    Top = 184
  end
  object dspConsulta: TDataSetProvider
    DataSet = dstConsulta
    Options = [poAllowCommandText]
    Left = 96
    Top = 184
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 168
    Top = 184
  end
  object dstBusca: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDados.sqlSNGPN
    Left = 264
    Top = 80
  end
  object dspBusca: TDataSetProvider
    DataSet = qryBusca
    Options = [poAllowCommandText]
    Left = 320
    Top = 80
  end
  object cdsBuscaMedico: TClientDataSet
    Aggregates = <>
    CommandText = 'Select ID_MEDICO, NOME_MEDICO from MEDICO order by NOME_MEDICO'
    Params = <>
    ProviderName = 'dspBusca'
    Left = 296
    Top = 136
    object cdsBuscaMedicoID_MEDICO: TIntegerField
      FieldName = 'ID_MEDICO'
      Required = True
    end
    object cdsBuscaMedicoNOME_MEDICO: TStringField
      FieldName = 'NOME_MEDICO'
      Required = True
      Size = 60
    end
  end
  object cdsConsLojas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 168
    Top = 232
  end
  object cdsConsPerdas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 256
    Top = 184
  end
  object cdsConsReceituario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 256
    Top = 232
  end
  object cdsConsUsoMedicam: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 368
    Top = 184
  end
  object cdsUndInsumo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 368
    Top = 232
  end
  object cdsTipoMotPerda: TClientDataSet
    Aggregates = <>
    CommandText = 'Select DESCRICAO from TIPOMOTIVOPERDA'
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 384
    Top = 136
    object cdsTipoMotPerdaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object qryAuxi: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDados.sqlSNGPN
    Left = 368
    Top = 32
  end
  object cdsPesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 168
    Top = 280
  end
  object cdsValidarMedico: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select * from MEDICO Where (NOME_MEDICO = :pNOME) and (NR_RG_PRO' +
      'FISSIONAL = :pRG) and (UF_CONSELHO = :pUF) and (SIGLA_CONSELHO =' +
      ' :pSIGLA)'
    Params = <
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pRG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pUF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pSIGLA'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspBusca'
    Left = 352
    Top = 280
  end
  object cdsValidarCliente: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select * from COMPRADOR where (NOME_COMPRADOR = :pNOME) and (NR_' +
      'DOCUMETO = :pRG) and (UF_EMISSOA_DOC = :pUF)'
    Params = <
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pRG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pUF'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspBusca'
    Left = 272
    Top = 296
  end
  object cdsPesLojas: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select EMP_FANTASIA, EMP_CNPJ from EMPRESAS order by EMP_FANTASI' +
      'A'
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 432
    Top = 72
    object cdsPesLojasEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
    object cdsPesLojasEMP_CNPJ: TStringField
      FieldName = 'EMP_CNPJ'
      Required = True
      Size = 14
    end
  end
  object dstPadrao: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDados.sqlSNGPN
    Left = 24
    Top = 248
  end
  object dspPadrao: TDataSetProvider
    DataSet = dstPadrao
    Options = [poAllowCommandText]
    Left = 24
    Top = 296
  end
  object cdsListaLojas: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select EMP_CODIGO, EMP_FANTASIA  from EMPRESAS order by EMP_FANT' +
      'ASIA'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 440
    Top = 256
    object cdsListaLojasEMP_CODIGO: TIntegerField
      FieldName = 'EMP_CODIGO'
      Required = True
    end
    object cdsListaLojasEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
  end
  object cdsAddItensVenda: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select * from VENDAS_MEDICAMENTOS Where (ID_VENDA = :pVENDA) and' +
      ' (REGISTRO_MS = :pREGISTRO) and (NUMERO_LOTE = :pLOTE)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pVENDA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pREGISTRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pLOTE'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 424
    Top = 312
    object cdsAddItensVendaID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Required = True
    end
    object cdsAddItensVendaREGISTRO_MS: TStringField
      FieldName = 'REGISTRO_MS'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsAddItensVendaNUMERO_LOTE: TStringField
      FieldName = 'NUMERO_LOTE'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsAddItensVendaQUANT_MEDICAMENTO: TBCDField
      FieldName = 'QUANT_MEDICAMENTO'
      Precision = 9
      Size = 3
    end
    object cdsAddItensVendaFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsAddItensVendaUND_MEDIDA_INSUMO: TIntegerField
      FieldName = 'UND_MEDIDA_INSUMO'
    end
    object cdsAddItensVendaUND_FARMACO_TECNICA: TIntegerField
      FieldName = 'UND_FARMACO_TECNICA'
    end
  end
  object cdsItensEstoque: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select * from ESTOQUE Where (EST_CDLOJA = :pLOJA) and (EST_CDPRO' +
      'D = :pCDPROD)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCDPROD'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 96
    Top = 256
    object cdsItensEstoqueEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      Required = True
    end
    object cdsItensEstoqueEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      Required = True
      EditMask = '9.9999.9999.999-9;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsItensEstoqueEST_NRLOTE: TStringField
      FieldName = 'EST_NRLOTE'
      Required = True
      Size = 10
    end
    object cdsItensEstoqueEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsItensEstoqueEST_DTVENCIMENTO: TDateField
      FieldName = 'EST_DTVENCIMENTO'
      EditMask = '99/99/9999;1;_'
    end
  end
  object cdsListaLotesProduto: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select * from ESTOQUE Where (EST_CDLOJA = :pLOJA) and (EST_CDPRO' +
      'D = :pCDPROD) and (EST_QUANTIDADE > 0)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCDPROD'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 96
    Top = 320
    object cdsListaLotesProdutoEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      Required = True
    end
    object cdsListaLotesProdutoEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsListaLotesProdutoEST_NRLOTE: TStringField
      FieldName = 'EST_NRLOTE'
      Required = True
      Size = 10
    end
    object cdsListaLotesProdutoEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsListaLotesProdutoEST_DTVENCIMENTO: TDateField
      FieldName = 'EST_DTVENCIMENTO'
    end
  end
  object cdsListaTipoDocumento: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select TD.id_documento, TD.descricao from TIPO_DOCUMENTO TD ORDE' +
      'R BY TD.id_documento'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 256
    Top = 352
    object cdsListaTipoDocumentoID_DOCUMENTO: TIntegerField
      FieldName = 'ID_DOCUMENTO'
      Required = True
    end
    object cdsListaTipoDocumentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object cdsConselhos: TClientDataSet
    Aggregates = <>
    CommandText = 'Select ID_CONSELHO, SIGLA from CONSELHOPROFISSIONAL'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 352
    Top = 336
    object cdsConselhosID_CONSELHO: TIntegerField
      FieldName = 'ID_CONSELHO'
      Required = True
    end
    object cdsConselhosSIGLA: TStringField
      FieldName = 'SIGLA'
      Required = True
      Size = 5
    end
  end
  object dstListaVenda: TSQLDataSet
    CommandText = 
      'select * from VENDAS_MEDICAMENTOS VM Where (VM.ID_VENDA = :pVEND' +
      'A)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pVENDA'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.sqlSNGPN
    Left = 24
    Top = 384
    object dstListaVendaID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Required = True
    end
    object dstListaVendaREGISTRO_MS: TStringField
      FieldName = 'REGISTRO_MS'
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstListaVendaNUMERO_LOTE: TStringField
      FieldName = 'NUMERO_LOTE'
      Required = True
      FixedChar = True
      Size = 10
    end
    object dstListaVendaQUANT_MEDICAMENTO: TBCDField
      FieldName = 'QUANT_MEDICAMENTO'
      Precision = 9
      Size = 3
    end
    object dstListaVendaFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      FixedChar = True
      Size = 1
    end
    object dstListaVendaUND_MEDIDA_INSUMO: TIntegerField
      FieldName = 'UND_MEDIDA_INSUMO'
    end
    object dstListaVendaUND_FARMACO_TECNICA: TIntegerField
      FieldName = 'UND_FARMACO_TECNICA'
    end
  end
  object dspListaVenda: TDataSetProvider
    DataSet = dstListaVenda
    Options = [poAllowCommandText]
    Left = 96
    Top = 368
  end
  object cdsListaVenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pVENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaVenda'
    Left = 160
    Top = 384
    object cdsListaVendaID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Required = True
    end
    object cdsListaVendaREGISTRO_MS: TStringField
      FieldName = 'REGISTRO_MS'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsListaVendaNUMERO_LOTE: TStringField
      FieldName = 'NUMERO_LOTE'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsListaVendaQUANT_MEDICAMENTO: TBCDField
      FieldName = 'QUANT_MEDICAMENTO'
      Precision = 9
      Size = 3
    end
    object cdsListaVendaFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsListaVendaUND_MEDIDA_INSUMO: TIntegerField
      FieldName = 'UND_MEDIDA_INSUMO'
    end
    object cdsListaVendaUND_FARMACO_TECNICA: TIntegerField
      FieldName = 'UND_FARMACO_TECNICA'
    end
  end
  object cdsBalancoProdutos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsBalancoProdutosCalcFields
    Left = 520
    Top = 408
    Data = {
      C20000009619E0BD010000001800000007000000000003000000C2000C434453
      5F434F4449474F4D530100490000000100055749445448020002000D000D4344
      535F44455343524943414F01004900000001000557494454480200020032000E
      4344535F455354494E494349414C08000400000000000B4344535F454E545241
      44410800040000000000094344535F534149444108000400000000000A434453
      5F50455244415308000400000000000C4344535F455354415455414C08000400
      000000000000}
    object cdsBalancoProdutosCDS_CODIGOMS: TStringField
      DisplayWidth = 20
      FieldName = 'CDS_CODIGOMS'
      EditMask = '9.9999.9999.999-9;0;_'
      Size = 13
    end
    object cdsBalancoProdutosCDS_DESCRICAO: TStringField
      DisplayWidth = 60
      FieldName = 'CDS_DESCRICAO'
      Size = 50
    end
    object cdsBalancoProdutosCDS_ESTINICIAL: TFloatField
      DisplayWidth = 17
      FieldName = 'CDS_ESTINICIAL'
    end
    object cdsBalancoProdutosCDS_ENTRADA: TFloatField
      DisplayWidth = 16
      FieldName = 'CDS_ENTRADA'
    end
    object cdsBalancoProdutosCDS_SAIDA: TFloatField
      DisplayWidth = 12
      FieldName = 'CDS_SAIDA'
    end
    object cdsBalancoProdutosCDS_PERDAS: TFloatField
      DisplayWidth = 15
      FieldName = 'CDS_PERDAS'
    end
    object cdsBalancoProdutosCDS_ESTATUAL: TFloatField
      FieldName = 'CDS_ESTATUAL'
    end
    object cdsBalancoProdutosCDS_ESTFINAL: TFloatField
      DisplayWidth = 16
      FieldKind = fkCalculated
      FieldName = 'CDS_ESTFINAL'
      Calculated = True
    end
    object cdsBalancoProdutosCDS_CODMS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CDS_CODMS'
      Calculated = True
    end
  end
  object dstListaBalanco: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDados.sqlSNGPN
    Left = 224
    Top = 424
  end
  object cdsListaEntrada: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select P.PRO_RG_MS_MEDICAMENTO, P.PRO_MEDICAMENTO, Sum(ME.quanti' +
      'dade) AS QUANT from PRODUTOS P Inner Join medicamento_entrada ME' +
      ' ON P.pro_rg_ms_medicamento = ME.registro_ms Inner Join ENTRADA_' +
      'MEDICAMENTOS EM ON ME.id_entrada = EM.id_entrada Where (P.PRO_RG' +
      '_MS_MEDICAMENTO = :pCODIGO) and (EM.data_recebimento >= :pDTINIC' +
      ') and (EM.data_recebimento <= :pDTFINA) AND (EM.situacao = '#39'F'#39') ' +
      'Group By P.PRO_RG_MS_MEDICAMENTO, P.PRO_MEDICAMENTO order by P.P' +
      'RO_MEDICAMENTO'
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTINIC'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINA'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaBalanco'
    Left = 360
    Top = 384
    object cdsListaEntradaPRO_RG_MS_MEDICAMENTO: TStringField
      FieldName = 'PRO_RG_MS_MEDICAMENTO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsListaEntradaPRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      Required = True
      Size = 50
    end
    object cdsListaEntradaQUANT: TFMTBCDField
      FieldName = 'QUANT'
      ReadOnly = True
      Precision = 18
      Size = 3
    end
  end
  object dspListaBalanco: TDataSetProvider
    DataSet = dstListaBalanco
    Options = [poAllowCommandText]
    Left = 288
    Top = 400
  end
  object cdsListaPerdas: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select P.PRO_RG_MS_MEDICAMENTO, P.PRO_MEDICAMENTO, Sum(PM.quanti' +
      'dade) AS QUANT from PRODUTOS P Inner Join PERDAS_MEDICAMENTOS PM' +
      ' ON P.pro_rg_ms_medicamento = PM.registro_ms  Inner Join PERDAS ' +
      'PD ON PM.id_perda = PD.id_perda Where (P.PRO_RG_MS_MEDICAMENTO =' +
      ' :pCODIGO) AND (PD.data_perda >= :pDTINIC) and (PD.data_perda <=' +
      ' :pDTFINA) AND (PD.situacao = '#39'F'#39') Group By P.PRO_RG_MS_MEDICAME' +
      'NTO, P.PRO_MEDICAMENTO  order by P.PRO_MEDICAMENTO'
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTINIC'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINA'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaBalanco'
    Left = 360
    Top = 432
    object cdsListaPerdasPRO_RG_MS_MEDICAMENTO: TStringField
      FieldName = 'PRO_RG_MS_MEDICAMENTO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsListaPerdasPRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      Required = True
      Size = 50
    end
    object cdsListaPerdasQUANT: TFMTBCDField
      FieldName = 'QUANT'
      ReadOnly = True
      Precision = 18
      Size = 8
    end
  end
  object cdsListaSaida: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select P.PRO_RG_MS_MEDICAMENTO, P.PRO_MEDICAMENTO, Sum(VM.quant_' +
      'medicamento) AS QUANT from PRODUTOS P Inner Join vendas_medicame' +
      'ntos VM ON P.pro_rg_ms_medicamento = VM.registro_ms Inner Join v' +
      'endas V ON VM.id_venda = V.id_venda Where (P.PRO_RG_MS_MEDICAMEN' +
      'TO = :pCODIGO) and (V.data_venda >= :pDTINIC) and (V.data_venda ' +
      '<= :pDTFINA) AND (V.SITUACAO = '#39'F'#39') Group By P.PRO_RG_MS_MEDICAM' +
      'ENTO, P.PRO_MEDICAMENTO order by P.PRO_MEDICAMENTO'
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDTINIC'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDTFINA'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaBalanco'
    Left = 424
    Top = 408
    object cdsListaSaidaPRO_RG_MS_MEDICAMENTO: TStringField
      FieldName = 'PRO_RG_MS_MEDICAMENTO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsListaSaidaPRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      Required = True
      Size = 50
    end
    object cdsListaSaidaQUANT: TFMTBCDField
      FieldName = 'QUANT'
      ReadOnly = True
      Precision = 18
      Size = 3
    end
  end
  object cdsProdutosEstoque: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select E.est_cdloja, E.est_cdprod, P.pro_medicamento from ESTOQU' +
      'E E inner join PRODUTOS P on P.pro_rg_ms_medicamento = E.est_cdp' +
      'rod group by E.est_cdloja, E.est_cdprod, P.pro_medicamento order' +
      ' by P.pro_medicamento'
    Params = <>
    ProviderName = 'dspListaBalanco'
    OnCalcFields = cdsProdutosEstoqueCalcFields
    Left = 512
    Top = 352
    object cdsProdutosEstoqueEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      Required = True
    end
    object cdsProdutosEstoqueEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      Required = True
      EditMask = '9.9999.9999.999-9;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsProdutosEstoquePRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      Required = True
      Size = 50
    end
    object cdsProdutosEstoqueEST_INICIAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'EST_INICIAL'
    end
    object cdsProdutosEstoqueEST_ENTRADA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'EST_ENTRADA'
    end
    object cdsProdutosEstoqueEST_VENDAS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'EST_VENDAS'
    end
    object cdsProdutosEstoqueEST_PERDAS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'EST_PERDAS'
    end
    object cdsProdutosEstoqueEST_TRANSFERENCIAS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'EST_TRANSFERENCIAS'
    end
    object cdsProdutosEstoqueEST_FINAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'EST_FINAL'
    end
  end
  object dstListaBal: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDados.sqlSNGPN
    Left = 512
    Top = 40
  end
  object dspListaBal: TDataSetProvider
    DataSet = dstListaBal
    Options = [poAllowCommandText]
    Left = 512
    Top = 88
  end
  object cdsListaBal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListaBal'
    Left = 512
    Top = 136
  end
  object dstListaEstoque: TSQLDataSet
    CommandText = 'select * from ESTOQUE where (EST_CDLOJA = :pCDLOJA) '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCDLOJA'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.sqlSNGPN
    Left = 468
    Top = 189
  end
  object dspListaEstoque: TDataSetProvider
    DataSet = dstListaEstoque
    Options = [poAllowCommandText]
    Left = 564
    Top = 213
  end
  object cdsListaEstoque: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCDLOJA'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaEstoque'
    Left = 668
    Top = 181
    object cdsListaEstoqueEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      Required = True
    end
    object cdsListaEstoqueEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsListaEstoqueEST_NRLOTE: TStringField
      FieldName = 'EST_NRLOTE'
      Required = True
      Size = 10
    end
    object cdsListaEstoqueEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsListaEstoqueEST_DTVENCIMENTO: TDateField
      FieldName = 'EST_DTVENCIMENTO'
    end
  end
end
