unit udmDados;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, FMTBcd, Provider, DBClient,
  Forms, Dialogs, Windows, IniFiles, Controls, MidasLib, StdCtrls, Variants;

type
  TTypeLocalizar = (fsInteger, fsString);
  TdmDados = class(TDataModule)
    sqlSNGPN: TSQLConnection;
    dstMedico: TSQLDataSet;
    dstComprador: TSQLDataSet;
    dstReceituario: TSQLDataSet;
    dstUsoMedicamento: TSQLDataSet;
    dstOpeNotaFiscal: TSQLDataSet;
    dstConsProfissional: TSQLDataSet;
    dspMedico: TDataSetProvider;
    dspComprador: TDataSetProvider;
    dspReceituario: TDataSetProvider;
    dspUsoMedicamento: TDataSetProvider;
    dspOpeNotaFiscal: TDataSetProvider;
    dspConsProfissional: TDataSetProvider;
    cdsMedico: TClientDataSet;
    cdsComprador: TClientDataSet;
    dstCompradorID_COMPRADOR: TIntegerField;
    dstCompradorNOME_COMPRADOR: TStringField;
    dstCompradorTIPO_DOCUMENTO: TIntegerField;
    dstCompradorNR_DOCUMETO: TStringField;
    dstCompradorORGAO_EXPEDIDOR: TIntegerField;
    dstCompradorUF_EMISSOA_DOC: TStringField;
    cdsCompradorID_COMPRADOR: TIntegerField;
    cdsCompradorNOME_COMPRADOR: TStringField;
    cdsCompradorTIPO_DOCUMENTO: TIntegerField;
    cdsCompradorNR_DOCUMETO: TStringField;
    cdsCompradorORGAO_EXPEDIDOR: TIntegerField;
    cdsCompradorUF_EMISSOA_DOC: TStringField;
    cdsCompradorDESC_TPDOC: TStringField;
    cdsCompradorDESC_EXPEDIDOR: TStringField;
    dstConfig: TSQLDataSet;
    dspConfig: TDataSetProvider;
    cdsConfig: TClientDataSet;
    cdsConfigCFG_TIPORECEITUARIO: TIntegerField;
    cdsConfigCFG_TIPO_USO_MEDICAMENTO: TIntegerField;
    cdsConfigCFG_OPERACAO_NF: TIntegerField;
    cdsConfigCFG_CONSELHO_PROFISSIONAL: TIntegerField;
    cdsConfigCFG_UND_INSUMO: TIntegerField;
    cdsConfigCFG_UND_FARMACOTECNICA: TIntegerField;
    cdsConfigCFG_TIPO_DOCUMENTO: TIntegerField;
    cdsConfigCFG_ORGAO_EXPEDIDOR: TIntegerField;
    cdsConfigCFG_MEDICO: TIntegerField;
    cdsConfigCFG_COMPRADOR: TIntegerField;
    cdsConfigCFG_PERDAS: TIntegerField;
    cdsConfigCFG_VENDAS: TIntegerField;
    cdsConfigCFG_ENTRADAS_MEDICAMENTOS: TIntegerField;
    cdsConfigCFG_TRANSFERENCIA: TIntegerField;
    cdsConfigCFG_DATA_ATUAL: TDateField;
    cdsConfigCGF_NOME_EMPRESA: TStringField;
    cdsConfigCFG_CNPJ: TStringField;
    dstMedicoID_MEDICO: TIntegerField;
    dstMedicoNOME_MEDICO: TStringField;
    dstMedicoNR_RG_PROFISSIONAL: TIntegerField;
    dstMedicoCONSELHO_PROFISSIONAL: TIntegerField;
    dstMedicoUF_CONSELHO: TStringField;
    cdsMedicoID_MEDICO: TIntegerField;
    cdsMedicoNOME_MEDICO: TStringField;
    cdsMedicoNR_RG_PROFISSIONAL: TIntegerField;
    cdsMedicoCONSELHO_PROFISSIONAL: TIntegerField;
    cdsMedicoUF_CONSELHO: TStringField;
    cdsMedicoNOME_CONSELHO: TStringField;
    cdsReceituario: TClientDataSet;
    dstReceituarioID_TIPORECEITUARIO: TIntegerField;
    dstReceituarioDESCRICAO: TStringField;
    cdsReceituarioID_TIPORECEITUARIO: TIntegerField;
    cdsReceituarioDESCRICAO: TStringField;
    cdsOpNotaFiscal: TClientDataSet;
    dstOpeNotaFiscalID_OPERACAO: TIntegerField;
    dstOpeNotaFiscalDESCRICAO: TStringField;
    cdsOpNotaFiscalID_OPERACAO: TIntegerField;
    cdsOpNotaFiscalDESCRICAO: TStringField;
    cdsUsoMedicamento: TClientDataSet;
    dstUsoMedicamentoID_TIPOMEDICAMENTO: TIntegerField;
    dstUsoMedicamentoDESCRICAO: TStringField;
    cdsUsoMedicamentoID_TIPOMEDICAMENTO: TIntegerField;
    cdsUsoMedicamentoDESCRICAO: TStringField;
    cdsConselhoProfissional: TClientDataSet;
    dstConsProfissionalID_CONSELHO: TIntegerField;
    dstConsProfissionalSIGLA: TStringField;
    dstConsProfissionalDESCRICAO: TStringField;
    cdsConselhoProfissionalID_CONSELHO: TIntegerField;
    cdsConselhoProfissionalSIGLA: TStringField;
    cdsConselhoProfissionalDESCRICAO: TStringField;
    dstMotivoPerda: TSQLDataSet;
    dstMotivoPerdaID_MOTIVOPERDA: TIntegerField;
    dstMotivoPerdaDESCRICAO: TStringField;
    dspMotivoPerda: TDataSetProvider;
    cdsMotivoPerda: TClientDataSet;
    cdsMotivoPerdaID_MOTIVOPERDA: TIntegerField;
    cdsMotivoPerdaDESCRICAO: TStringField;
    cdsConfigCFG_MOTIVO_PERDA: TIntegerField;
    dstUnidadeInsumo: TSQLDataSet;
    dstUnidadeInsumoID_UNDINSUMO: TIntegerField;
    dstUnidadeInsumoDESCRICAO: TStringField;
    dspUnidadeInsumo: TDataSetProvider;
    cdsUnidadeInsumo: TClientDataSet;
    cdsUnidadeInsumoID_UNDINSUMO: TIntegerField;
    cdsUnidadeInsumoDESCRICAO: TStringField;
    dstUndFarma: TSQLDataSet;
    dstUndFarmaID_UND_FARMACOTECNICA: TIntegerField;
    dstUndFarmaDESCRICAO: TStringField;
    dspUndFarma: TDataSetProvider;
    cdsUndFarmaco: TClientDataSet;
    cdsUndFarmacoID_UND_FARMACOTECNICA: TIntegerField;
    cdsUndFarmacoDESCRICAO: TStringField;
    dstTipoDocumento: TSQLDataSet;
    dstTipoDocumentoID_DOCUMENTO: TIntegerField;
    dstTipoDocumentoDESCRICAO: TStringField;
    dspTipoDocumento: TDataSetProvider;
    cdsTipoDocumento: TClientDataSet;
    cdsTipoDocumentoID_DOCUMENTO: TIntegerField;
    cdsTipoDocumentoDESCRICAO: TStringField;
    dstOrgaoExpedidor: TSQLDataSet;
    dspOrgaoExpedidor: TDataSetProvider;
    dstOrgaoExpedidorID_ORGAO: TIntegerField;
    dstOrgaoExpedidorSIGLA_ORGAO: TStringField;
    dstOrgaoExpedidorDESCRICAO: TStringField;
    cdsOrgaoExpedidor: TClientDataSet;
    cdsOrgaoExpedidorID_ORGAO: TIntegerField;
    cdsOrgaoExpedidorSIGLA_ORGAO: TStringField;
    cdsOrgaoExpedidorDESCRICAO: TStringField;
    cdsConfigCFG_NOME_PASTA: TStringField;
    qryUsuarios: TSQLQuery;
    dstUsuarios: TSQLDataSet;
    dspUsuarios: TDataSetProvider;
    cdsUsuarios: TClientDataSet;
    cdsDados: TClientDataSet;
    cdsDadosPRO_CDBARR: TStringField;
    cdsDadosPRO_NMPROD: TStringField;
    cdsDadosPRO_QTPROD: TFloatField;
    cdsDadosPRO_VLVEND: TCurrencyField;
    qryProcurar: TSQLQuery;
    dstVendas: TSQLDataSet;
    dspVendas: TDataSetProvider;
    cdsVendas: TClientDataSet;
    dstProdutosVendas: TSQLDataSet;
    dstProdutosVendasPRV_CODSOLICITACAO: TIntegerField;
    dstProdutosVendasPRV_CODBARRAS: TStringField;
    dstProdutosVendasPRV_NOMEAPRESENTACAO: TStringField;
    dstProdutosVendasPRV_QUANTIDADE: TFMTBCDField;
    dstProdutosVendasPRV_VLVENDA: TFMTBCDField;
    dstProdutosVendasPRV_QUANTIDADE_PRESCRITA: TFMTBCDField;
    dstProdutosVendasPRV_QUANTIDADE_AUTORIZADA: TFMTBCDField;
    dstProdutosVendasPRV_VLPARCELA: TFMTBCDField;
    dstProdutosVendasPRV_VLTOTALPRECOVENDA: TFMTBCDField;
    dstProdutosVendasPRV_VLTOTALPARCELA: TFMTBCDField;
    dstProdutosVendasPRV_COD_INDICADOR: TIntegerField;
    dstProdutosVendasPRV_QUANT_CANCELADA: TFMTBCDField;
    dstProdutosVendasPRV_AUTORESTORNO: TStringField;
    dstProdutosVendasPRV_AUTORMEDICAMENTO: TStringField;
    dstProdutosVendasPRV_STATUS: TStringField;
    dstProdutosVendasPRV_QTDEVOLVIDA: TFMTBCDField;
    dstProdutosVendasPRV_QTPRESCRITA: TFMTBCDField;
    dstProdutosVendasPRV_VLPRECO_SUBSIDIADO: TFMTBCDField;
    dstProdutosVendasPRV_VLPRECO_SUBPACIENTE: TFMTBCDField;
    dstProdutosVendasPRV_VLPRECO_SUBPAC_POSESTORNO: TFMTBCDField;
    dstProdutosVendasPRV_VLSUBMS_POSESTORNO: TFMTBCDField;
    dstProdutosVendasPRV_VLTOTAL_POSESTORNO: TFMTBCDField;
    dstProdutosVendasPRV_FLCANC: TStringField;
    dstProdutosVendasPRV_QTESTORNADA: TFMTBCDField;
    dspProdutosVendas: TDataSetProvider;
    cdsProdutosVendas: TClientDataSet;
    cdsProdutosVendasPRV_CODSOLICITACAO: TIntegerField;
    cdsProdutosVendasPRV_CODBARRAS: TStringField;
    cdsProdutosVendasPRV_NOMEAPRESENTACAO: TStringField;
    cdsProdutosVendasPRV_QUANTIDADE: TFMTBCDField;
    cdsProdutosVendasPRV_VLVENDA: TFMTBCDField;
    cdsProdutosVendasPRV_QUANTIDADE_PRESCRITA: TFMTBCDField;
    cdsProdutosVendasPRV_QUANTIDADE_AUTORIZADA: TFMTBCDField;
    cdsProdutosVendasPRV_VLPARCELA: TFMTBCDField;
    cdsProdutosVendasPRV_VLTOTALPRECOVENDA: TFMTBCDField;
    cdsProdutosVendasPRV_VLTOTALPARCELA: TFMTBCDField;
    cdsProdutosVendasPRV_COD_INDICADOR: TIntegerField;
    cdsProdutosVendasPRV_QUANT_CANCELADA: TFMTBCDField;
    cdsProdutosVendasPRV_AUTORESTORNO: TStringField;
    cdsProdutosVendasPRV_AUTORMEDICAMENTO: TStringField;
    cdsProdutosVendasPRV_STATUS: TStringField;
    cdsProdutosVendasPRV_QTDEVOLVIDA: TFMTBCDField;
    cdsProdutosVendasPRV_QTPRESCRITA: TFMTBCDField;
    cdsProdutosVendasPRV_VLPRECO_SUBSIDIADO: TFMTBCDField;
    cdsProdutosVendasPRV_VLPRECO_SUBPACIENTE: TFMTBCDField;
    cdsProdutosVendasPRV_VLPRECO_SUBPAC_POSESTORNO: TFMTBCDField;
    cdsProdutosVendasPRV_VLSUBMS_POSESTORNO: TFMTBCDField;
    cdsProdutosVendasPRV_VLTOTAL_POSESTORNO: TFMTBCDField;
    cdsProdutosVendasPRV_FLCANC: TStringField;
    cdsProdutosVendasPRV_QTESTORNADA: TFMTBCDField;
    cdsDadosPRO_NRLOTE: TStringField;
    cdsDadosPRO_NRVEND: TStringField;
    cdsConfigCFG_USUARIO: TIntegerField;
    cdsConfigCFG_EMAIL: TStringField;
    cdsConfigCFG_LOGIN: TStringField;
    dstUsuariosSEN_CODIGO: TIntegerField;
    dstUsuariosSEN_NOME: TStringField;
    dstUsuariosSEN_SNATUA: TStringField;
    dstUsuariosSEN_CARGO: TStringField;
    dstUsuariosSEN_TERMINAL: TStringField;
    dstUsuariosSEN_LOJA: TIntegerField;
    dstUsuariosSEN_DTATUAL: TDateField;
    cdsUsuariosSEN_CODIGO: TIntegerField;
    cdsUsuariosSEN_NOME: TStringField;
    cdsUsuariosSEN_SNATUA: TStringField;
    cdsUsuariosSEN_CARGO: TStringField;
    cdsUsuariosSEN_TERMINAL: TStringField;
    cdsUsuariosSEN_LOJA: TIntegerField;
    cdsUsuariosSEN_DTATUAL: TDateField;
    cdsConfigCFG_CPF: TStringField;
    dstLojas: TSQLDataSet;
    dspLojas: TDataSetProvider;
    cdsLojas: TClientDataSet;
    dstLojasEMP_CODIGO: TIntegerField;
    dstLojasEMP_CNPJ: TStringField;
    dstLojasEMP_INSCRICAOESTADUAL: TStringField;
    dstLojasEMP_FANTASIA: TStringField;
    dstLojasEMP_RAZAO: TStringField;
    dstLojasEMP_ENDERECO: TStringField;
    dstLojasEMP_NUMERO: TIntegerField;
    dstLojasEMP_BAIRRO: TStringField;
    dstLojasEMP_CIDADE: TStringField;
    dstLojasEMP_UFEMPR: TStringField;
    cdsLojasEMP_CODIGO: TIntegerField;
    cdsLojasEMP_CNPJ: TStringField;
    cdsLojasEMP_INSCRICAOESTADUAL: TStringField;
    cdsLojasEMP_FANTASIA: TStringField;
    cdsLojasEMP_RAZAO: TStringField;
    cdsLojasEMP_ENDERECO: TStringField;
    cdsLojasEMP_NUMERO: TIntegerField;
    cdsLojasEMP_BAIRRO: TStringField;
    cdsLojasEMP_CIDADE: TStringField;
    cdsLojasEMP_UFEMPR: TStringField;
    cdsConfigCFG_EMPRESAS: TIntegerField;
    cdsConfigCFG_ENTRADA: TIntegerField;
    cdsProdutos: TClientDataSet;
    dspProdutos: TDataSetProvider;
    dstProdutos: TSQLDataSet;
    dstProdutosPRO_RG_MS_MEDICAMENTO: TStringField;
    dstProdutosPRO_MEDICAMENTO: TStringField;
    dstProdutosPRO_VALORVENDA: TFMTBCDField;
    dstProdutosPRO_QUANTIDADE: TFMTBCDField;
    cdsProdutosPRO_RG_MS_MEDICAMENTO: TStringField;
    cdsProdutosPRO_MEDICAMENTO: TStringField;
    cdsProdutosPRO_VALORVENDA: TFMTBCDField;
    cdsProdutosPRO_QUANTIDADE: TFMTBCDField;
    cdsDadosPRO_UND_INS_FARM: TIntegerField;
    cdsDadosPRO_UND_FARMA: TIntegerField;
    cdsDadosPRO_QT_UND_FARMA: TFloatField;
    cdsConfigCFG_VENDA_INSUMO: TIntegerField;
    cdsDadosPRO_CNPJ_FORN: TStringField;
    qryIncProduto: TSQLQuery;
    cdsConfigCFG_ARQUIVO: TIntegerField;
    cdsConfigCFG_UF_PADRAO: TStringField;
    dstMedicoSIGLA_CONSELHO: TStringField;
    cdsMedicoSIGLA_CONSELHO: TStringField;
    cdsDadosPRO_SUBTOTAL: TFloatField;
    cdsConfigCFG_FLARQUIVO: TStringField;
    dstEstoque: TSQLDataSet;
    dspEstoque: TDataSetProvider;
    cdsEstoque: TClientDataSet;
    dstVendasID_VENDA: TIntegerField;
    dstVendasID_LOJA: TIntegerField;
    dstVendasDATA_VENDA: TDateField;
    dstVendasTIPO_RECEITUARIO: TIntegerField;
    dstVendasNR_NOT_MEDICAMENTO: TStringField;
    dstVendasID_PRESCRITOR: TIntegerField;
    dstVendasUSO_MEDICAMENTO: TIntegerField;
    dstVendasID_COMPRADOR: TIntegerField;
    dstVendasFLUXO_INSUMO: TStringField;
    dstVendasSITUACAO: TStringField;
    dstVendasARQUIVO: TStringField;
    dstVendasDATA_ARQUIVO: TDateField;
    cdsVendasID_VENDA: TIntegerField;
    cdsVendasID_LOJA: TIntegerField;
    cdsVendasDATA_VENDA: TDateField;
    cdsVendasTIPO_RECEITUARIO: TIntegerField;
    cdsVendasNR_NOT_MEDICAMENTO: TStringField;
    cdsVendasID_PRESCRITOR: TIntegerField;
    cdsVendasUSO_MEDICAMENTO: TIntegerField;
    cdsVendasID_COMPRADOR: TIntegerField;
    cdsVendasFLUXO_INSUMO: TStringField;
    cdsVendasSITUACAO: TStringField;
    cdsVendasARQUIVO: TStringField;
    cdsVendasDATA_ARQUIVO: TDateField;
    cdsConfigCFG_LIMITE_LOJAS: TIntegerField;
    cdsConfigCFG_FLJURO: TIntegerField;
    cdsConfigCFG_SEQTAREFA: TIntegerField;
    cdsPeriodos: TClientDataSet;
    cdsPeriodosUSUARIO: TIntegerField;
    cdsPeriodosDATA: TDateField;
    cdsPeriodosACAO: TStringField;
    cdsPeriodosARQUIVO: TStringField;
    cdsPeriodosNOME_USUARIO: TStringField;
    cdsTarefas: TClientDataSet;
    dstTarefas: TSQLDataSet;
    dspTarefas: TDataSetProvider;
    dstTarefasTAR_SEQUENCIA: TIntegerField;
    dstTarefasTAR_USUARIO: TIntegerField;
    dstTarefasTAR_DTMOVI: TDateField;
    dstTarefasTAR_ACAO: TStringField;
    dstTarefasTAR_ARQUIVO: TStringField;
    cdsTarefasTAR_SEQUENCIA: TIntegerField;
    cdsTarefasTAR_USUARIO: TIntegerField;
    cdsTarefasTAR_DTMOVI: TDateField;
    cdsTarefasTAR_ACAO: TStringField;
    cdsTarefasTAR_ARQUIVO: TStringField;
    cdsConfigCFG_SCREEN_WIDTH: TIntegerField;
    cdsConfigCFG_SCREEN_HEIGTH: TIntegerField;
    dstLojasEMP_ULTIMO_PERIODO: TDateField;
    cdsLojasEMP_ULTIMO_PERIODO: TDateField;
    cdsConfigCFG_FLZEROS: TStringField;
    cdsListaItensEntrada: TClientDataSet;
    dspListaItensEntrada: TDataSetProvider;
    dstListaItensEntrada: TSQLDataSet;
    dstListaItensEntradaID_ENTRADA: TIntegerField;
    dstListaItensEntradaREGISTRO_MS: TStringField;
    dstListaItensEntradaNUMERO_LOTE: TStringField;
    dstListaItensEntradaQUANTIDADE: TBCDField;
    dstListaItensEntradaFLUXO_INSUMO: TStringField;
    dstListaItensEntradaUND_ENTRADA: TStringField;
    dstListaItensEntradaCNPJ_FORNECEDOR: TStringField;
    dstListaItensEntradaDATA_VENCIMENTO: TDateField;
    cdsListaItensEntradaID_ENTRADA: TIntegerField;
    cdsListaItensEntradaREGISTRO_MS: TStringField;
    cdsListaItensEntradaNUMERO_LOTE: TStringField;
    cdsListaItensEntradaQUANTIDADE: TBCDField;
    cdsListaItensEntradaFLUXO_INSUMO: TStringField;
    cdsListaItensEntradaUND_ENTRADA: TStringField;
    cdsListaItensEntradaCNPJ_FORNECEDOR: TStringField;
    cdsListaItensEntradaDATA_VENCIMENTO: TDateField;
    cdsConfigCFG_FLINVENTARIO: TStringField;
    cdsConfigCFG_DTINVENTARIO: TDateField;
    dstProdutosPRO_UNIDADE_MEDIDA: TStringField;
    cdsProdutosPRO_UNIDADE_MEDIDA: TStringField;
    dstHistorico: TSQLDataSet;
    dstHistoricoHIS_SEQUENCIA: TIntegerField;
    dstHistoricoHIS_LOJA: TIntegerField;
    dstHistoricoHIS_PRODUTO: TStringField;
    dstHistoricoHIS_NRLOTE: TStringField;
    dstHistoricoHIS_UNIDADE: TStringField;
    dstHistoricoHIS_DATA: TDateField;
    dstHistoricoHIS_HORA: TStringField;
    dstHistoricoHIS_TIPO_MOVIMENTO: TStringField;
    dstHistoricoHIS_TIPO: TStringField;
    dstHistoricoHIS_DOCUMENTO: TIntegerField;
    dstHistoricoHIS_ANTERIOR: TFMTBCDField;
    dstHistoricoHIS_MOVIMENTO: TFMTBCDField;
    dstHistoricoHIS_ATUAL: TFMTBCDField;
    dstHistoricoHIS_MOTIVO: TIntegerField;
    dstHistoricoHIS_USUARIO: TIntegerField;
    dspHistorico: TDataSetProvider;
    cdsHistorico2: TClientDataSet;
    cdsHistorico2HIS_LOJA: TIntegerField;
    cdsHistorico2HIS_PRODUTO: TStringField;
    cdsHistorico2HIS_NRLOTE: TStringField;
    cdsHistorico2HIS_UNIDADE: TStringField;
    cdsHistorico2HIS_DATA: TDateField;
    cdsHistorico2HIS_HORA: TStringField;
    cdsHistorico2HIS_TIPO_MOVIMENTO: TStringField;
    cdsHistorico2HIS_TIPO: TStringField;
    cdsHistorico2HIS_DOCUMENTO: TIntegerField;
    cdsHistorico2HIS_ANTERIOR: TFMTBCDField;
    cdsHistorico2HIS_MOVIMENTO: TFMTBCDField;
    cdsHistorico2HIS_ATUAL: TFMTBCDField;
    cdsHistorico2HIS_MOTIVO: TIntegerField;
    cdsHistorico2HIS_USUARIO: TIntegerField;
    cdsHistorico2HIS_SEQUENCIA: TIntegerField;
    dstInvertario: TSQLDataSet;
    dspInvertario: TDataSetProvider;
    cdsInvertario: TClientDataSet;
    cdsInvertarioEST_CDLOJA: TIntegerField;
    cdsInvertarioEST_CDPROD: TStringField;
    cdsInvertarioEST_NRLOTE: TStringField;
    cdsInvertarioPRO_MEDICAMENTO: TStringField;
    cdsInvertarioEST_QUANTIDADE: TFMTBCDField;
    cdsInvertarioPRO_UNIDADE_MEDIDA: TStringField;
    cdsInvertarioPRO_ANTIMICROBIANOS: TStringField;
    dstListas: TSQLDataSet;
    dspListas: TDataSetProvider;
    cdsListaTipoDocumentos: TClientDataSet;
    cdsListaTipoDocumentosID_DOCUMENTO: TIntegerField;
    cdsListaTipoDocumentosDESCRICAO: TStringField;
    cdsListaOrgaos: TClientDataSet;
    cdsListaOrgaosID_ORGAO: TIntegerField;
    cdsListaOrgaosDESCRICAO: TStringField;
    cdsListaConselho: TClientDataSet;
    cdsListaConselhoID_CONSELHO: TIntegerField;
    cdsListaConselhoDESCRICAO: TStringField;
    cdsConfigCFG_DTULTIMO_ARQUIVO_VALIDADO: TDateField;
    dstEstoqueHistorico: TSQLDataSet;
    dstEstoqueHistoricoEST_CDLOJA: TIntegerField;
    dstEstoqueHistoricoEST_CDPROD: TStringField;
    dstEstoqueHistoricoEST_NRLOTE: TStringField;
    dstEstoqueHistoricoEST_QUANTIDADE: TFMTBCDField;
    dstEstoqueHistoricoEST_DTVENCIMENTO: TDateField;
    dspEstoqueHistorico: TDataSetProvider;
    cdsEstoqueHistorico: TClientDataSet;
    cdsEstoqueHistoricoEST_CDLOJA: TIntegerField;
    cdsEstoqueHistoricoEST_CDPROD: TStringField;
    cdsEstoqueHistoricoEST_NRLOTE: TStringField;
    cdsEstoqueHistoricoEST_QUANTIDADE: TFMTBCDField;
    cdsEstoqueHistoricoEST_DTVENCIMENTO: TDateField;
    cdsListaEstoque: TClientDataSet;
    cdsListaEstoqueEST_CDLOJA: TIntegerField;
    cdsListaEstoqueEST_CDPROD: TStringField;
    cdsListaEstoqueEST_NRLOTE: TStringField;
    cdsListaEstoqueEST_QUANTIDADE: TFMTBCDField;
    cdsListaEstoquePRO_DESCRICAO: TStringField;
    cdsListaEstoquePRO_MEDICAMENTO: TStringField;
    dstEntradaProdutos: TSQLDataSet;
    dspEntradaProdutos: TDataSetProvider;
    cdsEntradaProdutos: TClientDataSet;
    dstEntradaProdutosID_ENTRADA: TIntegerField;
    dstEntradaProdutosID_LOJA: TIntegerField;
    dstEntradaProdutosNR_NOTAFISCAL: TIntegerField;
    dstEntradaProdutosTIPO_OPERACAO_NF: TIntegerField;
    dstEntradaProdutosCNPJ_ORIGEM: TStringField;
    dstEntradaProdutosCNPJ_DESTINO: TStringField;
    dstEntradaProdutosDATA_RECEBIMENTO: TDateField;
    dstEntradaProdutosHORA_RECEBIMENTO: TStringField;
    dstEntradaProdutosDATA_NOTA: TDateField;
    dstEntradaProdutosFLINSUMO: TStringField;
    dstEntradaProdutosSITUACAO: TStringField;
    dstEntradaProdutosARQUIVO: TStringField;
    dstEntradaProdutosDATA_ARQUIVO: TDateField;
    cdsEntradaProdutosID_ENTRADA: TIntegerField;
    cdsEntradaProdutosID_LOJA: TIntegerField;
    cdsEntradaProdutosNR_NOTAFISCAL: TIntegerField;
    cdsEntradaProdutosTIPO_OPERACAO_NF: TIntegerField;
    cdsEntradaProdutosCNPJ_ORIGEM: TStringField;
    cdsEntradaProdutosCNPJ_DESTINO: TStringField;
    cdsEntradaProdutosDATA_RECEBIMENTO: TDateField;
    cdsEntradaProdutosHORA_RECEBIMENTO: TStringField;
    cdsEntradaProdutosDATA_NOTA: TDateField;
    cdsEntradaProdutosFLINSUMO: TStringField;
    cdsEntradaProdutosSITUACAO: TStringField;
    cdsEntradaProdutosARQUIVO: TStringField;
    cdsEntradaProdutosDATA_ARQUIVO: TDateField;
    cdsListaEmpresa: TClientDataSet;
    cdsListaEmpresaEMP_CODIGO: TIntegerField;
    cdsListaEmpresaEMP_RAZAO: TStringField;
    cdsListaEmpresaEMP_FANTASIA: TStringField;
    cdsEntradaProdutosNOME_LOJA: TStringField;
    dstFarmaceutico: TSQLDataSet;
    dstFarmaceuticoFAR_CODIGO: TIntegerField;
    dstFarmaceuticoFAR_NOME: TStringField;
    dstFarmaceuticoFAR_CPF: TStringField;
    dstFarmaceuticoFAR_ENDERECO: TStringField;
    dstFarmaceuticoFAR_NUMERO: TIntegerField;
    dstFarmaceuticoFAR_CIDADE: TStringField;
    dstFarmaceuticoFAR_UF: TStringField;
    dstFarmaceuticoFAR_BAIRRO: TStringField;
    dstFarmaceuticoFAR_NOME_MAE: TStringField;
    dstFarmaceuticoFAR_CRF: TIntegerField;
    dstFarmaceuticoFAR_DATACADASTRO: TDateField;
    dstFarmaceuticoFAR_HORACADASTRO: TStringField;
    dstFarmaceuticoFAR_USUARIO: TIntegerField;
    dspFarmaceutico: TDataSetProvider;
    cdsFarmaceutico: TClientDataSet;
    cdsFarmaceuticoFAR_CODIGO: TIntegerField;
    cdsFarmaceuticoFAR_NOME: TStringField;
    cdsFarmaceuticoFAR_CPF: TStringField;
    cdsFarmaceuticoFAR_ENDERECO: TStringField;
    cdsFarmaceuticoFAR_NUMERO: TIntegerField;
    cdsFarmaceuticoFAR_CIDADE: TStringField;
    cdsFarmaceuticoFAR_UF: TStringField;
    cdsFarmaceuticoFAR_BAIRRO: TStringField;
    cdsFarmaceuticoFAR_NOME_MAE: TStringField;
    cdsFarmaceuticoFAR_CRF: TIntegerField;
    cdsFarmaceuticoFAR_DATACADASTRO: TDateField;
    cdsFarmaceuticoFAR_HORACADASTRO: TStringField;
    cdsFarmaceuticoFAR_USUARIO: TIntegerField;
    cdsConfigCFG_DT_FECHAMENTO_INV_SISTEMA: TDateField;
    cdsConfigCFG_FARMACEUTICO: TIntegerField;
    dstFarmaceuticoFAR_EMPRESA: TIntegerField;
    cdsFarmaceuticoFAR_EMPRESA: TIntegerField;
    cdsFarmaceuticoFAR_NOME_EMPRESA: TStringField;
    cdsListaEstoqueAtual: TClientDataSet;
    dspListaEstoqueAtual: TDataSetProvider;
    dstListaEstoqueAtual: TSQLDataSet;
    dstListaEstoqueAtualEST_CDLOJA: TIntegerField;
    dstListaEstoqueAtualEST_CDPROD: TStringField;
    dstListaEstoqueAtualEST_NRLOTE: TStringField;
    dstListaEstoqueAtualEST_QUANTIDADE: TFMTBCDField;
    dstListaEstoqueAtualEST_DTVENCIMENTO: TDateField;
    cdsListaEstoqueAtualEST_CDLOJA: TIntegerField;
    cdsListaEstoqueAtualEST_CDPROD: TStringField;
    cdsListaEstoqueAtualEST_NRLOTE: TStringField;
    cdsListaEstoqueAtualEST_QUANTIDADE: TFMTBCDField;
    cdsListaEstoqueAtualEST_DTVENCIMENTO: TDateField;
    cdsFecharInvertario: TClientDataSet;
    cdsFecharInvertarioEST_CDLOJA: TIntegerField;
    cdsFecharInvertarioEST_CDPROD: TStringField;
    cdsFecharInvertarioEST_NRLOTE: TStringField;
    cdsFecharInvertarioEST_QUANTIDADE: TFMTBCDField;
    cdsFecharInvertarioEST_DTVENCIMENTO: TDateField;
    cdsConfigCFG_INVERTARIO_ABERTO_SISTEMA: TStringField;
    dstMovimento: TSQLDataSet;
    dstMovimentoMOV_NUMERO: TIntegerField;
    dstMovimentoMOV_LOJA: TIntegerField;
    dstMovimentoMOV_DTABERTURA: TDateField;
    dstMovimentoMOV_DTFECHAMENTO: TDateField;
    dstMovimentoMOV_HOABERTURA: TStringField;
    dstMovimentoMOV_HOFECHAMENTO: TStringField;
    dstMovimentoMOV_RGINICIAL: TIntegerField;
    dstMovimentoMOV_RGFINAL: TIntegerField;
    dstMovimentoMOV_USUARIO: TIntegerField;
    dstMovimentoMOV_SITUACAO: TStringField;
    dspMovimento: TDataSetProvider;
    cdsMovimento: TClientDataSet;
    cdsMovimentoMOV_NUMERO: TIntegerField;
    cdsMovimentoMOV_LOJA: TIntegerField;
    cdsMovimentoMOV_DTABERTURA: TDateField;
    cdsMovimentoMOV_DTFECHAMENTO: TDateField;
    cdsMovimentoMOV_HOABERTURA: TStringField;
    cdsMovimentoMOV_HOFECHAMENTO: TStringField;
    cdsMovimentoMOV_RGINICIAL: TIntegerField;
    cdsMovimentoMOV_RGFINAL: TIntegerField;
    cdsMovimentoMOV_USUARIO: TIntegerField;
    cdsMovimentoMOV_SITUACAO: TStringField;
    cdsConfigCFG_SEQUENCIA_MOVIMENTO: TIntegerField;
    cdsConfigCFG_DT_INVERTARIO_ABERTO_SIS: TDateField;
    dstProdutosPRO_BARRAS: TStringField;
    cdsProdutosPRO_BARRAS: TStringField;
    dstMovimentoMOV_USUARIO_FECHOU: TIntegerField;
    cdsMovimentoMOV_USUARIO_FECHOU: TIntegerField;
    dstMovimentoMOV_DATA: TDateField;
    cdsMovimentoMOV_DATA: TDateField;
    cdsConfigCFG_LOJA_PADRAO: TIntegerField;
    cdsListaEstoqueEST_DTVENCIMENTO: TDateField;
    dstHisEstoque: TSQLDataSet;
    dstHisEstoqueEST_CDLOJA: TIntegerField;
    dstHisEstoqueEST_CDPROD: TStringField;
    dstHisEstoqueEST_NRLOTE: TStringField;
    dstHisEstoqueEST_QUANTIDADE: TFMTBCDField;
    dstHisEstoqueEST_DTVENCIMENTO: TDateField;
    dstHisEstoqueEST_DTMOVIMENTO: TDateField;
    dstHisEstoqueEST_HOMOVIMENTO: TStringField;
    dstHisEstoqueEST_USUARIO: TIntegerField;
    dstHisEstoqueEST_SITUACAO: TStringField;
    dspHisEstoque: TDataSetProvider;
    cdsHisEstoque: TClientDataSet;
    cdsHisEstoqueEST_CDLOJA: TIntegerField;
    cdsHisEstoqueEST_CDPROD: TStringField;
    cdsHisEstoqueEST_NRLOTE: TStringField;
    cdsHisEstoqueEST_QUANTIDADE: TFMTBCDField;
    cdsHisEstoqueEST_DTVENCIMENTO: TDateField;
    cdsHisEstoqueEST_DTMOVIMENTO: TDateField;
    cdsHisEstoqueEST_HOMOVIMENTO: TStringField;
    cdsHisEstoqueEST_USUARIO: TIntegerField;
    cdsHisEstoqueEST_SITUACAO: TStringField;
    cdsDadosPRO_CODIGO: TStringField;
    dstItensEntrada: TSQLDataSet;
    dstItensEntradaID_ENTRADA: TIntegerField;
    dstItensEntradaREGISTRO_MS: TStringField;
    dstItensEntradaNUMERO_LOTE: TStringField;
    dstItensEntradaQUANTIDADE: TBCDField;
    dstItensEntradaFLUXO_INSUMO: TStringField;
    dstItensEntradaUND_ENTRADA: TStringField;
    dstItensEntradaCNPJ_FORNECEDOR: TStringField;
    dstItensEntradaDATA_VENCIMENTO: TDateField;
    dspItensEntrada: TDataSetProvider;
    cdsItensEntrada: TClientDataSet;
    cdsItensEntradaID_ENTRADA: TIntegerField;
    cdsItensEntradaREGISTRO_MS: TStringField;
    cdsItensEntradaNUMERO_LOTE: TStringField;
    cdsItensEntradaQUANTIDADE: TBCDField;
    cdsItensEntradaFLUXO_INSUMO: TStringField;
    cdsItensEntradaUND_ENTRADA: TStringField;
    cdsItensEntradaCNPJ_FORNECEDOR: TStringField;
    cdsItensEntradaDATA_VENCIMENTO: TDateField;
    dstEntradaProdutosDATA_CADASTRO: TDateField;
    dstEntradaProdutosUSUARIO: TIntegerField;
    cdsEntradaProdutosDATA_CADASTRO: TDateField;
    cdsEntradaProdutosUSUARIO: TIntegerField;
    dstFarmaceuticoEMAIL: TStringField;
    cdsFarmaceuticoEMAIL: TStringField;
    dstVendasPAC_NOME: TStringField;
    dstVendasPAC_IDADE: TIntegerField;
    dstVendasPAC_UND_IDADE: TIntegerField;
    dstVendasPAC_SEXO: TStringField;
    dstVendasDATA_CADASTRO: TDateField;
    dstVendasUSUARIO: TIntegerField;
    cdsVendasPAC_NOME: TStringField;
    cdsVendasPAC_IDADE: TIntegerField;
    cdsVendasPAC_UND_IDADE: TIntegerField;
    cdsVendasPAC_SEXO: TStringField;
    cdsVendasDATA_CADASTRO: TDateField;
    cdsVendasUSUARIO: TIntegerField;
    dstVendasDATA_RECEITA: TDateField;
    dstVendasHORA_VENDA: TStringField;
    cdsVendasDATA_RECEITA: TDateField;
    cdsVendasHORA_VENDA: TStringField;
    cdsVendasNOME_LOJA: TStringField;
    cdsListaUsoMedicamento: TClientDataSet;
    cdsListaUsoMedicamentoID_TIPOMEDICAMENTO: TIntegerField;
    cdsListaUsoMedicamentoDESCRICAO: TStringField;
    cdsVendasDESCRICAO_USO_MED: TStringField;
    cdsListaUsoReceituario: TClientDataSet;
    cdsListaUsoReceituarioID_TIPORECEITUARIO: TIntegerField;
    cdsListaUsoReceituarioDESCRICAO: TStringField;
    cdsVendasDESCRICAO_USO_REC: TStringField;
    cdsListaTipoDocumento: TClientDataSet;
    cdsListaTipoDocumentoID_DOCUMENTO: TIntegerField;
    cdsListaTipoDocumentoDESCRICAO: TStringField;
    cdsConfigCFG_CONTROLE_RECEITA_BRANCA: TIntegerField;
    cdsConfigCFG_FLPRODUCAO: TStringField;
    dstItensVendas: TSQLDataSet;
    dspItensVendas: TDataSetProvider;
    cdsItensVendas: TClientDataSet;
    dstItensVendasID_VENDA: TIntegerField;
    dstItensVendasREGISTRO_MS: TStringField;
    dstItensVendasNUMERO_LOTE: TStringField;
    dstItensVendasQUANT_MEDICAMENTO: TBCDField;
    dstItensVendasFLUXO_INSUMO: TStringField;
    dstItensVendasUND_MEDIDA_INSUMO: TIntegerField;
    dstItensVendasUND_FARMACO_TECNICA: TIntegerField;
    cdsItensVendasID_VENDA: TIntegerField;
    cdsItensVendasREGISTRO_MS: TStringField;
    cdsItensVendasNUMERO_LOTE: TStringField;
    cdsItensVendasQUANT_MEDICAMENTO: TBCDField;
    cdsItensVendasFLUXO_INSUMO: TStringField;
    cdsItensVendasUND_MEDIDA_INSUMO: TIntegerField;
    cdsItensVendasUND_FARMACO_TECNICA: TIntegerField;
    dstPerda: TSQLDataSet;
    dstPerdaID_PERDA: TIntegerField;
    dstPerdaID_LOJA: TIntegerField;
    dstPerdaMOTIVO_PERDA: TIntegerField;
    dstPerdaDATA_PERDA: TDateField;
    dstPerdaFLUXO_INSUMO: TStringField;
    dstPerdaSITUACAO: TStringField;
    dstPerdaARQUIVO: TStringField;
    dstPerdaDATA_ARQUIVO: TDateField;
    dstPerdaDATA_CADASTRO: TDateField;
    dstPerdaUSUARIO: TIntegerField;
    dspPerda: TDataSetProvider;
    cdsPerda: TClientDataSet;
    cdsPerdaID_PERDA: TIntegerField;
    cdsPerdaID_LOJA: TIntegerField;
    cdsPerdaMOTIVO_PERDA: TIntegerField;
    cdsPerdaDATA_PERDA: TDateField;
    cdsPerdaFLUXO_INSUMO: TStringField;
    cdsPerdaSITUACAO: TStringField;
    cdsPerdaARQUIVO: TStringField;
    cdsPerdaDATA_ARQUIVO: TDateField;
    cdsPerdaDATA_CADASTRO: TDateField;
    cdsPerdaUSUARIO: TIntegerField;
    cdsPerdaNOME_LOJA: TStringField;
    cdsListaMotivoPerda: TClientDataSet;
    cdsListaMotivoPerdaID_MOTIVOPERDA: TIntegerField;
    cdsListaMotivoPerdaDESCRICAO: TStringField;
    cdsPerdaDESCRICAO_MOTIVO_PERDA: TStringField;
    dstPerdaItens: TSQLDataSet;
    dspPerdaItens: TDataSetProvider;
    cdsPerdaItens: TClientDataSet;
    dstPerdaItensID_PERDA: TIntegerField;
    dstPerdaItensREGISTRO_MS: TStringField;
    cdsPerdaItensID_PERDA: TIntegerField;
    cdsPerdaItensREGISTRO_MS: TStringField;
    dstVendasPAC_CODIGO: TIntegerField;
    cdsVendasPAC_CODIGO: TIntegerField;
    dstVendasPAC_DATA_NASC: TDateField;
    cdsVendasPAC_DATA_NASC: TDateField;
    cdsDadosPRO_USO_PROLOGADO: TStringField;
    dstItensVendasUSO_PROLONGADO: TStringField;
    cdsItensVendasUSO_PROLONGADO: TStringField;
    dstFarmaceuticoSENHA: TStringField;
    cdsFarmaceuticoSENHA: TStringField;
    dstVendasPAC_CID: TIntegerField;
    cdsVendasPAC_CID: TIntegerField;
    dstLojasEMP_CHAVE: TStringField;
    cdsLojasEMP_CHAVE: TStringField;
    dstArquivoHast: TSQLDataSet;
    dspArquivoHast: TDataSetProvider;
    cdsArquivoHast: TClientDataSet;
    dstArquivoHastARQ_CODIGO: TIntegerField;
    dstArquivoHastDATA_GERACAO: TDateField;
    dstArquivoHastHORA_GERACAO: TStringField;
    dstArquivoHastUSUARIO: TIntegerField;
    dstArquivoHastDATA_INICIAL: TDateField;
    dstArquivoHastDATA_FINAL: TDateField;
    dstArquivoHastHASH_MD5: TStringField;
    dstArquivoHastNOME_ARQUIVO: TStringField;
    cdsArquivoHastARQ_CODIGO: TIntegerField;
    cdsArquivoHastDATA_GERACAO: TDateField;
    cdsArquivoHastHORA_GERACAO: TStringField;
    cdsArquivoHastUSUARIO: TIntegerField;
    cdsArquivoHastDATA_INICIAL: TDateField;
    cdsArquivoHastDATA_FINAL: TDateField;
    cdsArquivoHastHASH_MD5: TStringField;
    cdsArquivoHastNOME_ARQUIVO: TStringField;
    dstHisEstoqueEST_QTENTRADA: TFMTBCDField;
    dstHisEstoqueEST_QTSAIDA: TFMTBCDField;
    dstHisEstoqueEST_PERDA: TFMTBCDField;
    cdsHisEstoqueEST_QTENTRADA: TFMTBCDField;
    cdsHisEstoqueEST_QTSAIDA: TFMTBCDField;
    cdsHisEstoqueEST_PERDA: TFMTBCDField;
    dstEstoqueEST_CDLOJA: TIntegerField;
    dstEstoqueEST_CDPROD: TStringField;
    dstEstoqueEST_NRLOTE: TStringField;
    dstEstoqueEST_QUANTIDADE: TFMTBCDField;
    dstEstoqueEST_DTVENCIMENTO: TDateField;
    cdsEstoqueEST_CDLOJA: TIntegerField;
    cdsEstoqueEST_CDPROD: TStringField;
    cdsEstoqueEST_NRLOTE: TStringField;
    cdsEstoqueEST_QUANTIDADE: TFMTBCDField;
    cdsEstoqueEST_DTVENCIMENTO: TDateField;
    dstRetornaEstoque: TSQLDataSet;
    dspRetornaEstoque: TDataSetProvider;
    cdsRetornaEstoque: TClientDataSet;
    dstRetornaEstoqueEST_CDLOJA: TIntegerField;
    dstRetornaEstoqueEST_CDPROD: TStringField;
    dstRetornaEstoqueEST_NRLOTE: TStringField;
    dstRetornaEstoqueEST_QUANTIDADE: TFMTBCDField;
    dstRetornaEstoqueEST_DTVENCIMENTO: TDateField;
    cdsRetornaEstoqueEST_CDLOJA: TIntegerField;
    cdsRetornaEstoqueEST_CDPROD: TStringField;
    cdsRetornaEstoqueEST_NRLOTE: TStringField;
    cdsRetornaEstoqueEST_QUANTIDADE: TFMTBCDField;
    cdsRetornaEstoqueEST_DTVENCIMENTO: TDateField;
    dstProdutosPRO_IDFABRICANTE: TIntegerField;
    cdsProdutosPRO_IDFABRICANTE: TIntegerField;
    dstTransferencia: TSQLDataSet;
    dstTransferenciaID_TRANSFERENCIA: TIntegerField;
    dstTransferenciaID_LOJA: TIntegerField;
    dstTransferenciaNR_NOTAFISCAL: TIntegerField;
    dstTransferenciaTIPO_OPERACAO: TIntegerField;
    dstTransferenciaDATA_NOTA: TDateField;
    dstTransferenciaCNPJ_ORIGEM: TStringField;
    dstTransferenciaCNPJ_DESTINO: TStringField;
    dstTransferenciaDATA_TRANSFERENCIA: TDateField;
    dstTransferenciaFLUXO_INSUMO: TStringField;
    dstTransferenciaSITUACAO: TStringField;
    dstTransferenciaARQUIVO: TStringField;
    dstTransferenciaDATA_ARQUIVO: TDateField;
    dstTransferenciaDATA_CADASTRO: TDateField;
    dstTransferenciaUSUARIO: TIntegerField;
    dspTransferencia: TDataSetProvider;
    cdsTransferencia: TClientDataSet;
    cdsTransferenciaID_TRANSFERENCIA: TIntegerField;
    cdsTransferenciaID_LOJA: TIntegerField;
    cdsTransferenciaNR_NOTAFISCAL: TIntegerField;
    cdsTransferenciaTIPO_OPERACAO: TIntegerField;
    cdsTransferenciaDATA_NOTA: TDateField;
    cdsTransferenciaCNPJ_ORIGEM: TStringField;
    cdsTransferenciaCNPJ_DESTINO: TStringField;
    cdsTransferenciaDATA_TRANSFERENCIA: TDateField;
    cdsTransferenciaFLUXO_INSUMO: TStringField;
    cdsTransferenciaSITUACAO: TStringField;
    cdsTransferenciaARQUIVO: TStringField;
    cdsTransferenciaDATA_ARQUIVO: TDateField;
    cdsTransferenciaDATA_CADASTRO: TDateField;
    cdsTransferenciaUSUARIO: TIntegerField;
    dstItensTransf: TSQLDataSet;
    dstItensTransfID_TRANSFERENCIA: TIntegerField;
    dstItensTransfREGISTRO_MS: TStringField;
    dstItensTransfNUMERO_LOTE: TStringField;
    dstItensTransfQUANT_MEDICAMENTO: TBCDField;
    dstItensTransfFLUXO_INSUMO: TStringField;
    dstItensTransfUND_TRANSF: TStringField;
    dstItensTransfCNPJ_FORNECEDOR: TStringField;
    dspItensTransf: TDataSetProvider;
    cdsItensTransf: TClientDataSet;
    cdsItensTransfID_TRANSFERENCIA: TIntegerField;
    cdsItensTransfREGISTRO_MS: TStringField;
    cdsItensTransfNUMERO_LOTE: TStringField;
    cdsItensTransfQUANT_MEDICAMENTO: TBCDField;
    cdsItensTransfFLUXO_INSUMO: TStringField;
    cdsItensTransfUND_TRANSF: TStringField;
    cdsItensTransfCNPJ_FORNECEDOR: TStringField;
    dstImpEstoque: TSQLDataSet;
    dstImpEstoqueEST_CDLOJA: TIntegerField;
    dstImpEstoqueEST_CDPROD: TStringField;
    dstImpEstoqueEST_NRLOTE: TStringField;
    dstImpEstoqueEST_QUANTIDADE: TFMTBCDField;
    dstImpEstoqueEST_DTVENCIMENTO: TDateField;
    dspImpEstoque: TDataSetProvider;
    cdsImpEstoque: TClientDataSet;
    cdsImpEstoqueEST_CDLOJA: TIntegerField;
    cdsImpEstoqueEST_CDPROD: TStringField;
    cdsImpEstoqueEST_NRLOTE: TStringField;
    cdsImpEstoqueEST_QUANTIDADE: TFMTBCDField;
    cdsImpEstoqueEST_DTVENCIMENTO: TDateField;
    dstHisEstoqueEST_SEQUENCIA: TIntegerField;
    dstHisEstoqueEST_QTTRANSFERENCIA: TFMTBCDField;
    cdsHisEstoqueEST_SEQUENCIA: TIntegerField;
    cdsHisEstoqueEST_QTTRANSFERENCIA: TFMTBCDField;
    dstTarefasTAR_STATUS: TStringField;
    cdsTarefasTAR_STATUS: TStringField;
    cdsPeriodosSTATUS: TStringField;
    cdsPeriodosID: TIntegerField;
    dstProdutosPRO_ANTIMICROBIANOS: TStringField;
    cdsProdutosPRO_ANTIMICROBIANOS: TStringField;
    dstPerdaItensNUMERO_LOTE: TStringField;
    dstPerdaItensQUANTIDADE: TFMTBCDField;
    dstPerdaItensFLUXO_INSUMO: TStringField;
    dstPerdaItensUND_PERDA: TStringField;
    dstPerdaItensCNPJ_FORNECEDOR: TStringField;
    cdsPerdaItensNUMERO_LOTE: TStringField;
    cdsPerdaItensQUANTIDADE: TFMTBCDField;
    cdsPerdaItensFLUXO_INSUMO: TStringField;
    cdsPerdaItensUND_PERDA: TStringField;
    cdsPerdaItensCNPJ_FORNECEDOR: TStringField;
    procedure dspConfigGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspMedicoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspReceituarioGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspOpeNotaFiscalGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspConsProfissionalGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspMotivoPerdaGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspUnidadeInsumoGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspUndFarmaGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspTipoDocumentoGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspOrgaoExpedidorGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure dspLojasGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspProdutosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cdsDadosCalcFields(DataSet: TDataSet);
    procedure dspEstoqueGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure sqlSNGPNBeforeConnect(Sender: TObject);
    procedure cdsListaEstoqueCalcFields(DataSet: TDataSet);
    procedure dspListaEstoqueAtualGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspMovimentoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspHisEstoqueGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspItensEntradaGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspItensVendasGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspPerdaGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspRetornaEstoqueGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspTransferenciaGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspItensTransfGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
  private
    { Private declarations }
  public
    { Public declarations }
    Transc : TTransactionDesc;
    procedure Start;
    procedure Comit(aTransc : TTransactionDesc);
    procedure Rollback;
    procedure Parametros;
    function PROCURAR_PRODUTO(M_CDPROD : String) : boolean;
    function GetNomeProduto(M_CDPROD : String) : String;
    function GetProduto(M_CDPROD : String) : Boolean;
    function LOCALIZAR_MEDICO(M_IDMEDI: String): Boolean;
    function LOC_CRM_MEDICO(M_NUMCRM : Integer; M_SIGUF : String): Boolean;
    function LOC_CRM_MEDICO2(M_NUMCRM : Integer ): Boolean;
    Function GetCLIENTE(M_CDCOMP : String) : Boolean;
    Function GetNomeCLIENTE(M_CDCOMP : Integer) : String;
    Function GetNomeMedico(M_CDMEDI : Integer) : String;
    Function GetUNDInsumo(DESCRICAO : String) : Integer;
    Function GetUNDFarmaco(DESCRICAO : String) : Integer;
    Function IncProduto(M_CDPROD, M_NMPROD : String) : Boolean;
    Function GetVenda(M_NRVEND : integer) : Boolean;
    Function GetNRVenda(M_NMARQU : String) : Integer;
    Function GetNREntrada(M_NMARQU : String) : Integer;
    Function GetNRTransf(M_NMARQU : String) : Integer;
    Function GetNRPerda(M_NMARQU : String) : Integer;
    function Cancela_Venda(M_NRVEND, iLoja : integer) : Boolean;
    function Cancela_Entrada(M_NRENTR, iLoja : integer) : Boolean;
    function Cancela_Transf(M_NRTRAN : integer) : Boolean;
    function Cancela_Perda(M_NRPERD : integer) : Boolean;
    procedure Openbd(cnn: TSQLConnection; Ini: TMemIniFile);
    Procedure FilterCDS(aCds : TClientDataSet; aType : TTypeLocalizar ; aBusca : String);
    procedure RefreshCDS(aDateSet : TClientDataSet);
    function IDTransation : String;
    procedure VENDA_ARQUIVO(M_NRVEND : Integer; W_NMARQU : String; W_DTARQU : TDate);
    procedure ENTRADA_ARQUIVO(M_NRENTR : Integer; W_NMARQU : String; W_DTARQU : TDate);
    Function LIMPAR_CAMPOS_ARQUIVO(aDataInicio, aDataFinal : TDate; iLoja : Integer) : Boolean;
    procedure VENDA_INSUMO_ARQUIVO(M_NRVEND : Integer; W_NMARQU : String; W_DTARQU : TDate);
    procedure PERDA_ARQUIVO(M_NRPERD : Integer; W_NMARQU : String; W_DTARQU : TDate);
    procedure TRANSF_ARQUIVO(M_NRTRAN : Integer; W_NMARQU : String; W_DTARQU : TDate);
    function Validar_medico(M_NMMEDI, M_SIGLA, M_UFMEDI : String; M_NRREGI : Integer) : Boolean;
    function Validar_Cliente(M_NMCLI, M_NRREGI ,M_UFCLIE : String) : Boolean;
    Function GetProximaVenda() : String;
    Function IncPerdas(idPerda, iLoja, iTipo : integer; aDataMov : TDate; aFluxo : String) : boolean;
    Function IncItemPerda(idPerda, iLoja : Integer; aCodigo, aLote : String; fQuant : Double) : boolean;
    Function Incluir_Transf(iID, iLoja, iNR_NOTAFISCAL, iTIPO_OPERACAO : integer; aDATA_NOTA, aDATA_TRANSFERENCIA :TDate;
          aCNPJ_ORIGEM, aCNPJ_DESTINO, aFLUXO_INSUMO : String) : boolean;
    Function Itens_Transf(iID, iLojaOrigem, iLojaDestino : Integer; aREGISTRO_MS, aNUMERO_LOTE, aFLUXO_INSUMO, aCNPJ_FORNECEDOR : String;
               fQUANT_MEDICAMENTO : Double) : boolean;
    Function VerificarLoteProduto(aRegistroMS, aLote : String) : Boolean;
    Function GetProdutoLoteEstoque(iLoja : Integer; aCodigo, aLote : String) : Boolean;
    Function GetProdutoLoteEstoqueHistorico(iLoja : Integer; aCodigo, aLote : String) : Boolean;
    Function GetProdutoNoEstoque(iLoja : Integer; aCodigo : String) : Boolean;
    Function GetCodigoLoja(aNome : String) : Integer;
    Function AdicionarVenda(iVenda, iLoja, iTipoReceituario, iUsoMedicamento,
           iPrescritor,  iCliente : Integer; aDataVenda : TDate; aNrNotificacao : String;
           aCdsItens : TClientDataSet ): Boolean;
    Function AdicionarVendaNovo(iVenda, iLoja : Integer; aCdsItens : TClientDataSet ): Boolean;
    Function AdicionarProdutoPerdaNovo(iPerda, iLoja : Integer; aCdsItens : TClientDataSet ): Boolean;
    Function AdicionarTransferenciaProduto(idTransferencia, iLojaOrigem,  iLojaDestino : Integer; aCdsItens : TClientDataSet ): Boolean;
    procedure CarregarLojas(aCmb : TComboBox);
    Function GetNomeLoja(iCogigo : Integer) : String;
    Procedure CarregarLotesProduto(iLoja : Integer; aProduto : String; aCmb : TComboBox);
    Function ExcluirVenda(iVenda : Integer) : Boolean;
    Function AtualizaEstoqueProduto(iLoja : Integer; aProduto, aLote : String; fQuant : Double) : Boolean;
    Function AdicionaProdutoEstoque(iLoja : Integer; aProduto, aLote : String; fQuant : Double) : Boolean;
    Function SaidaProdutoEstoque(iLoja : Integer; aProduto, aLote : String; fQuant : Double) : Boolean;
    Function AdicionaProdutoEstoqueNovo(iLoja : Integer; aProduto, aLote : String; fQuant : Double; aDataVenc : String) : Boolean;
    Function GetVerificarQuantEstoque(iLoja : Integer; aProduto, aLote : String; fQuant : Double) : Boolean;
    Function GetCodigoLojaDestino(aCNPJ : String) : Integer;
    Function AddTarefaUsuario(iUSUARIO : INTEGER;
             aDTMOVI  : TDATE; aACAO, aARQUIVO  : String) : Boolean;
    Function AddLogUsuario(iUSUARIO : INTEGER;
             aDTMOVI  : TDATE; aACAO  : String) : Boolean;
    Procedure ListaTarefas();
    Function GetNomeUsuario(iCodigo : Integer) : String;
    Function VerificarVendaPeriodo(aDataInicial, aDataFinal : TDate) : Boolean;
    Function VerificarEntradasPeriodo(aDataInicial, aDataFinal : TDate) : Boolean;
    Function GetIdentidadeCliente(aNumero : String) : Integer;
    Function GetSiglaOrgao(iCodigo : Integer) : String;
    Function VerificarSiglaOrgao(aSigla : String) : Boolean;
    Function IncluirCliente(iCodigo, iTipoDoc, iOrgao : Integer; aNome, aNumeroDoc, aUF, aDataNasc, aSexo : String) : Integer;
    Function IncluirMedico(iCodigo, iRGPROFISSIONAL, iCONSELHO_PROFISSIONAL : Integer;
            aNome, aUF, aSigla : String) : Integer;
    Function GetCodigoMedico(iRG : Integer; aUF, aSiglaConselho : String) : Integer;
    Function GetCodigoTipoDoc(aDescricao : String): Integer;
    Function GetCodigoOrgao(aDescricao : String): Integer;
    Function GetCodigoConselhoProfissional(aDescricao : String): Integer;
    Function GetValidarIdenOrgaoUF(aIdentidade, aUF : String; iOrgao : Integer) : Boolean;
    Function GetCodigoIdenOrgaoUF(aIdentidade, aUF : String; iOrgao : Integer) : Integer;
    Function GetValidarCRMNumeroUF(aNumero: Integer; aConselho, aUF : String ) : Boolean;
    Function GetCodigoCRMNumeroUF(aNumero: Integer; aConselho, aUF : String ) : Integer;
    Function OpenBDNew() : Boolean;
    Function VerificarNotaEntrada(aCNPJ : String; iLoja, aNota : integer) : Boolean;
    Function VerificarNotaTransferencia(aCNPJ : String; iLoja, aNota : integer) : Boolean;
    Function VerificarQuantLojas(): Boolean;
    Function GetValidarCNPJ(aOrigem, aDestino : String): Boolean;
    Function GetCNPJDestino(iLoja : Integer) : String;
    Function GetIdLojaDestino(aCNPJ : String): Integer;
    Function GetNomeLojaCNPJ(aCNPJ : String): String;
    Function ExcluirLoteProdutoEstoque(iLoja : Integer; aProduto, aLote : String): Boolean;
    Function GetVerificaVendaCliente(iCliente : Integer): Boolean;
    Function GetVefificaVendaMedico(iMedico : Integer): Boolean;
    Function AdicionarHistoricoProduto(
               iLoja, iMotivo, iUsuario, iDocumento : Integer;
               aProduto, aLote, aHoraMov, aTipoMov, aTipoES : String;
               fQuantAnterior, fQuantMovimento, fQuantAtual : Double;
               aDataMov : TDatetime ): Boolean;
    Function AbrirInvertario(iLoja : Integer): Boolean;
    Function GerarXMLInvertario(iLoja: Integer; aCDSEstoque : TClientDataSet; aNomeArquivo : String; aDataInvertario : TDatetime): Boolean;
    Function GetEstoqueAtualProduto(iLoja : Integer; aProduto, aLote : String): Double;
    Function ProcurarValor(aValor, aCampo, aTabela : String) : Boolean;
    Function AbrirListaEstoque(iLoja : Integer): Boolean;
    Function ExcluirLoteProdutoEstoqueHistorico(iLoja : Integer; aProduto, aLote : String): Boolean;
    Function LimparLoteProdutoEstoqueHistorico(iLoja : Integer; aProduto, aLote, aOpcao : String): Boolean;
    Function ZeraEstoque(iLoja : Integer): Boolean;
    Function AbreturaInvertario(iLoja : Integer; aImportaInvertario, aCPF : String): Boolean;
    Function UpdateLoteProdutoEstoqueHistorico(iLoja, iUsuario : Integer; aProduto, aLote, aHora, aDataVencimento : String;
         aDataMov : TDatetime; fQuantidade: Double): Boolean;
    Function FecharInvertario(iLoja : Integer; aDtMovi, aDataFechamento : TDatetime): Boolean;
    Function AbrirMovimento(iLoja, iUsuario : Integer; aDataMov : TDatetime): Boolean;
    Function FecharDiaMovimento(iNumeroMov, iLoja, iUsuario : Integer; aDataMov : TDatetime): Boolean;
    Function GetDataMovimentoAtual(iLoja : Integer): TDateTime;
    Function GetNumeroMovimentoAtual(iLoja : Integer): Integer;
    Function AtualizaEstoqueDia(iLoja, iUsuario : Integer; aDataMov : TDatetime): Boolean;
    Function LimparMovimentoDia(): Boolean;
    Function LimparHistoricoProduto(iLoja: Integer; aDataMov : TDatetime): Boolean;
    Function GetProximoCodigoReceitaBranca(): Integer;
    Function GetEstoqueLoteProduto(iLoja : Integer; aProduto, aLote : String): Double;
    Function GetTotalEntradaLoteProduto(iLoja : Integer; aProduto, aLote : String): Double;
    Function GetTotalVendaLoteProduto(iLoja : Integer; aProduto, aLote : String): Double;
    Function GetTotalPerdaLoteProduto(iLoja : Integer; aProduto, aLote : String): Double;
    Function GetTotalTransferenciaProduto(iLoja : Integer; aProduto, aLote : String): Double;
    //
    Function GetQuantidadeProdutoData(iLoja : Integer; aProduto : String; aDtMovi : TDatetime): Double;
    Function GetTotalEntradaProduto(iLoja : Integer; aProduto : String; aDtMovi : TDatetime): Double;
    Function GetTotalVendaProduto(iLoja : Integer; aProduto : String; aDtMovi : TDatetime): Double;
    Function GetTotalPerdaProduto(iLoja : Integer; aProduto : String; aDtMovi : TDatetime): Double;
    Function GetTotalTransfProduto(iLoja : Integer; aProduto : String; aDtMovi : TDatetime): Double;
    //
    Function AddItemProduto(aProduto, aNomeProduto, aLote, aCNPJ : String; fQuant : Double): Boolean;
    Function AddNovoTipoReceituario(): Boolean;
    Function AddNovoMotivoPerdaMedicamento(): Boolean;
    Function ValidarChave(iEmpresa : Integer): Boolean;
    Function GetVerificaProdutoAntimicrobiano(aProduto : String): Boolean;
    Function GetVerificaProdutoSujeitoControleEspecial(aProduto : String): Boolean;
    Function RegistrosNovos(): Boolean;
    Function AddRegistroHastArquivo(aNomeArquivo, aHast : String; iUsuario: Integer): Boolean;
    Function AddRegistroHistoricoEstoque(iCDLOJA, iUsuario : Integer; aProduto, aLote, aDTVENCIMENTO : String;
          fQUANTIDADE, fQTENTRADA, fQTSAIDA, fPERDA, fQTTransferencia : Double): Boolean;
    Function ExcluitRegistroHistoricoEstoque(iCDLOJA : Integer; aDataMov : TDatetime): Boolean;
    Function GetNomeMotivoPerda(idMotivo : Integer): String;
    Function SetEstoqueProduto(iLoja : Integer; aProduto, aLote : String; fQuant : Double): Boolean;
    Function ExcluirEntrada(idEntrada : Integer): Boolean;
    Function ExcluirPerda(idPerda : Integer): Boolean;
    Function ExcluirTransferencia(idTransferencia : Integer): Boolean;
    Function ExcluirVendaNovo(idVenda : Integer): Boolean;
    Function GetEstoqueAnteriorProduto(iLoja : Integer; aProduto, aLote : String): Double;
    Function ExcluirMovimento(iLoja: Integer; aDataMov : TDatetime): Boolean;
    Function GetQuantProdutoPeriodo(iLoja : Integer; aProduto, aNomeCampo : String;
                       aDtInicial, aDtFinal : TDatetime): Double;
    Function SetClasseTerapeuticaProduto(aProduto, aClasse : String): Boolean;
    Function GetClasseTerapeuticaProduto(aProduto : String): String;
    Function SetUnidadeMedidaProduto(aProduto, aUnidade : String): Boolean;
    Function GetUnidadeMedidaProduto(aProduto : String): String;
    Function LimparEstoqueLoja(iLoja : Integer): boolean;
    Function AddProduto(aProduto, aDescricao : String): Boolean;
    Function GetMaxIdPerda(): Integer;
    Function GetMaxIdEntrada(): Integer;
    Function GetMaxIdVenda(): Integer;
    Function GetDataUltimoMov(aDtMovi : TDatetime): Boolean;
    Function SetStatusArquivo(iCodigo : Integer; aStatus : String): Boolean;
    Function ExcluirEstoqueMovimentoDia(iLoja : Integer; aDataMov : TDatetime): Boolean;
    Function AddClienteVenda(): Boolean;
    Function VerificaMovimentoVenda(iLoja : Integer; aProduto, aLote, aDataMov : String): Boolean;
    Function GetQuantEntradasPeriodo(iLoja : Integer; aDtInicio, aDtFinal : TDatetime): integer;
    Function VerificaItensVenda(idVenda : Integer): Boolean;
    Function GetGeneratorVenda(): Integer;
    Procedure GetError(DataSet: TCustomClientDataSet;
         E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    Function AddVenda(idVenda : Integer; aCdsVenda : TClientDataSet): Boolean;     
  end;

Const WS_HOMOLOGACAO = 'http://homologacao.anvisa.gov.br/sngpc/webservice/sngpc.asmx?WSDL';
      WS_PRODUTO = '';

var
  dmDados: TdmDados;
  nomeestacao : String;
  M_FLARQU : String;
  M_NMPROD : String;
  M_VLPROD : double;
  M_HAMBIENTE : String;

implementation

uses udmPesquisa, uFuncoes, uFormMainSngpc ;

{$R *.dfm}

{ TdmDados }

procedure TdmDados.Parametros;
begin
     cdsConfig.Close;
     cdsConfig.Open;
end;

procedure TdmDados.dspConfigGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'CONFIG';
end;

procedure TdmDados.dspMedicoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
    TableName := 'MEDICO';
end;

procedure TdmDados.dspReceituarioGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'TIPOUSORECEITUARIO';
end;

procedure TdmDados.dspOpeNotaFiscalGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
      TableName := 'TIPOOPERACAONOTAFISCAL';
end;

procedure TdmDados.dspConsProfissionalGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'CONSELHOPROFISSIONAL';
end;

procedure TdmDados.dspMotivoPerdaGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
      TableName := 'TIPOMOTIVOPERDA';
end;

procedure TdmDados.dspUnidadeInsumoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
    TableName := 'TIPOUNIDADEINSUMO';
end;

procedure TdmDados.dspUndFarmaGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
    TableName := 'TIPO_UNIDADE_FARMACOTECNICA';
end;

procedure TdmDados.dspTipoDocumentoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'TIPO_DOCUMENTO';
end;

procedure TdmDados.dspOrgaoExpedidorGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
      TableName := 'ORGAO_EXPEDIDOR';
end;

function TdmDados.PROCURAR_PRODUTO(M_CDPROD: String): boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  M_NMPROD := '';
  M_VLPROD := 0;
  //
  texto := 'Select PRO_RG_MS_MEDICAMENTO, PRO_MEDICAMENTO, PRO_VALORVENDA from PRODUTOS Where (PRO_RG_MS_MEDICAMENTO = '+QuotedStr(M_CDPROD)+')';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := sqlSNGPN;
      sql.Add(texto);
      open;
      //
      If not (IsEmpty) Then
        begin
            M_NMPROD := fieldByName('PRO_MEDICAMENTO').AsString;
            M_VLPROD := fieldByName('PRO_VALORVENDA').AsFloat;
            result := True;
        End;
    finally
      free;
    end;
end;


procedure TdmDados.DataModuleCreate(Sender: TObject);
Var
    CAMINHO : String;
    ArqIni : TmeminiFile;
    Texto:string;
    M_DTEXPI : TDatetime;
    I : Integer;
begin
    {M_DTEXPI := StrtoDate('02/05/2013');
    //
    If (Date() > M_DTEXPI) Then
     begin
           Application.MessageBox('A validade deste programa expirou!!!'+#13
                                 +'Entre em contato com a InfoG2:'+#13
                                 +'Telefone: (86) 3226-4510'+#13
                                 +'E-mail...: sac@infog2.com.br' ,
              'Atenção',MB_DEFBUTTON2+MB_OK+MB_ICONINFORMATION);
           //
           Application.Terminate;
     End; }    
    // sqlSNGPN.LoadParamsFromIniFile('./dbxconnections.ini');
     try
      With sqlSNGPN do
      begin
        if Connected then
          begin
               CloseDataSets;
               Connected := False;
          end;
        //
        Connected := True;
        //
        dstListas.CommandText := '';
        //
        RegistrosNovos();
        //
        AddClienteVenda();
       End;
     Except
          on e: exception do
          begin
              Application.MessageBox(PChar('Erro na abertura de Base de Dados! Erro:'+#13
                      + E.Message),
                      'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
              sqlSNGPN.Connected := false;
              Application.Terminate;
          End;
     End;
     //
     sqlSNGPN.Open;
     //
      for I := 0 to Pred(ComponentCount) do
          if Components[i] is TClientDataSet  then
             begin
                 TClientDataSet(Components[i]).OnReconcileError := getError;
             end;
     //
     RefreshCDS(cdsConfig);
     M_FLARQU := cdsConfigCFG_FLARQUIVO.AsString;
end;

procedure TdmDados.DataModuleDestroy(Sender: TObject);
begin
     sqlSNGPN.Connected := False;
end;

function TdmDados.LOCALIZAR_MEDICO(M_IDMEDI: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  //
  texto := 'Select ID_MEDICO, NOME_MEDICO from MEDICO Where (ID_MEDICO = :pID)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pID').AsInteger := StrtoInt(M_IDMEDI);
      open;
      //
      If not (IsEmpty) Then
            result := True;
    finally
      free;
    end;

{     With qryProcurar do
       begin
            SQL.Clear;
            Close;
            SQL.Add('Select ID_MEDICO, NOME_MEDICO from MEDICO Where (ID_MEDICO = :pID)');
            Params.ParamByName('pID').AsInteger := StrtoInt(M_IDMEDI);
            Open;
            //
            If not (IsEmpty) Then
                result := True
            Else

       End; }
end;

function TdmDados.LOC_CRM_MEDICO(M_NUMCRM: Integer; M_SIGUF : String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  //
  texto := 'Select * from MEDICO Where (NR_RG_PROFISSIONAL = :pCRM) and (UF_CONSELHO = :pSIGLA)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pCRM').AsInteger  := M_NUMCRM;
      Params.ParamByName('pSIGLA').AsString := M_SIGUF;
      Open;
      //
      If not (IsEmpty) Then
            result := True;
    finally
      free;
    end;

{     With qryProcurar do
       begin
            SQL.Clear;
            Close;
            SQL.Add('Select * from MEDICO Where (NR_RG_PROFISSIONAL = :pCRM) and (UF_CONSELHO = :pSIGLA)');
            Params.ParamByName('pCRM').AsInteger  := M_NUMCRM;
            Params.ParamByName('pSIGLA').AsString := M_SIGUF;
            Open;
            //
            If not (IsEmpty) Then
                result := True
            Else
                result := False;
       End;   }
end;

procedure TdmDados.dspLojasGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
    TableName := 'EMPRESAS';
end;

procedure TdmDados.dspProdutosGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'PRODUTOS';
end;

function TdmDados.GetNomeProduto(M_CDPROD: String): String;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select PRO_MEDICAMENTO from PRODUTOS Where (PRO_RG_MS_MEDICAMENTO = '+QuotedStr(M_CDPROD)+')';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := sqlSNGPN;
      sql.Add(texto);
      open;
      result := fields[0].AsString;
    finally
      free;
    end;
end;

function TdmDados.GetProduto(M_CDPROD: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select PRO_RG_MS_MEDICAMENTO, PRO_MEDICAMENTO from PRODUTOS Where (PRO_RG_MS_MEDICAMENTO = '+QuotedStr(M_CDPROD)+')';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := sqlSNGPN;
      sql.Add(texto);
      open;
      If not (IsEmpty) Then
          result :=  False
      Else
          result :=  True;
    finally
      free;
    end;
end;

function TdmDados.GetCLIENTE(M_CDCOMP: String): Boolean;
var qraux : TSQLquery;
    texto : string;
Begin
  texto := 'Select ID_COMPRADOR, NOME_COMPRADOR from COMPRADOR Where (ID_COMPRADOR = :pCOMPRADOR)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := sqlSNGPN;
      sql.Add(texto);
      open;
      If not (IsEmpty) Then
          result :=  False
      Else
          result :=  True;
    finally
      free;
    end;


{     With dmDados.qryProcurar do
       begin
            SQL.Clear;
            Close;
            SQL.Add('Select ID_COMPRADOR, NOME_COMPRADOR from COMPRADOR Where (ID_COMPRADOR = :pCOMPRADOR)');
            Params.ParamByName('pCOMPRADOR').AsInteger := StrtoInt(M_CDCOMP);
            Open;
            //
            If not (IsEmpty) Then
                result := True
            Else
                result := False;
       End;}
end;

function TdmDados.GetUNDInsumo(DESCRICAO: String): Integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select ID_UNDINSUMO from TIPOUNIDADEINSUMO Where (DESCRICAO = '+QuotedStr(DESCRICAO)+')';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := sqlSNGPN;
      sql.Add(texto);
      open;
      If not (IsEmpty) Then
          result :=  fieldByname('ID_UNDINSUMO').AsInteger;
    finally
      free;
    end;
end;

function TdmDados.GetUNDFarmaco(DESCRICAO: String): Integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select ID_UND_FARMACOTECNICA from TIPO_UNIDADE_FARMACOTECNICA Where (DESCRICAO = '+QuotedStr(DESCRICAO)+')';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := sqlSNGPN;
      sql.Add(texto);
      open;
      If not (IsEmpty) Then
          result :=  fieldByname('ID_UND_FARMACOTECNICA').AsInteger;
    finally
      free;
    end;
end;

function TdmDados.IncProduto(M_CDPROD, M_NMPROD: String): Boolean;
begin
   Result := True;
   Try
     With qryIncProduto do
      begin
           Close;
           Params[0].AsString := M_CDPROD;
           Params[1].AsString := M_NMPROD;
           Params[2].AsFloat  := 0;
           ExecSQL();
      End;
    Except
          Result := False;
    End;
end;

function TdmDados.GetVenda(M_NRVEND: integer): Boolean;
var
    texto : string;
begin
  texto := 'Select V.ID_VENDA, V.DATA_VENDA, CL.NOME_COMPRADOR from VENDAS V ';
  texto := texto + 'inner join COMPRADOR CL ON (V.ID_COMPRADOR = CL.ID_COMPRADOR) ';
  texto := texto + 'Where (V.ID_VENDA = :pID_VENDA) AND (V.SITUACAO = :pSITUACAO) ';
  with qryProcurar do
  Begin
      sql.Clear;
      Close;
      sql.Add(texto);
      Params.ParamByName('pID_VENDA').AsInteger := M_NRVEND;
      Params.ParamByName('pSITUACAO').AsString  := 'F';
      open;
      If not (IsEmpty) Then
          result := True
      Else
          result := False;
  end;  // fim-with
end;

function TdmDados.Cancela_Venda(M_NRVEND, iLoja : integer): Boolean;
Var
    TD : TTransactionDesc;
begin
       // Inicia um transação no BD
       Start;
        try
           {  With spCancelaVenda do
              begin
                   Close;
                   Params[0].AsInteger := M_NRVEND;
                   ExecProc();
              End;
             //sqlSNGPN.Commit(TD);
             Comit(Transc);
             // Atualiza Estoque
             With dmPesquisa.cdsListaVenda  do
             begin
                  Close;
                  Params[0].AsInteger := M_NRVEND;
                  Open;
                  //
                  If not (IsEmpty) Then
                    begin
                         First;
                         While not (Eof) do
                          begin
                               AdicionaProdutoEstoque(iLoja,
                                 FieldByName('REGISTRO_MS').AsString,
                                 FieldByName('NUMERO_LOTE').AsString,
                                 FieldByName('QUANT_MEDICAMENTO').AsFloat);
                               //
                               Next;
                          End;
                    End
             End;     }
             //
             result := True;
        Except
             Rollback;
             result := False;
        End;
end;

function TdmDados.GetNRVenda(M_NMARQU: String): Integer;
var
  arquivo : textfile;
  M_NMPAST, Linha : String;
begin
  M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
  //
  try
          AssignFile(arquivo, M_NMARQU);
          Reset(arquivo);
          Read(arquivo, Linha);
          //
          result := StrtoInt(Copy(Linha, 10, 10));
  finally
        CloseFile(arquivo);
        //
        if FileExists(M_NMARQU) then
            DeleteFile(PChar(M_NMARQU));
  end;
end;

procedure TdmDados.Openbd(cnn: TSQLConnection; Ini: TMemIniFile);
var
  Config: TMemIniFile;
  Arq: TFileName;
begin
  Arq := ExtractFilePath(ParamStr(0))+'\BD.INI';
  if Assigned(Ini) or FileExists(Arq) then begin
     if Assigned(Ini) then
        Config := Ini
     else
        Config := TMemIniFile.Create(Arq);
     with cnn do
        try
           If (fileexists(ExtractFilePath( Application.ExeName )+'caminho.txt')) then
              nomeestacao := uFuncoes.percorreArquivoTexto(ExtractFilePath( Application.ExeName )+'caminho.txt')
           Else
              nomeestacao := 'Servidor';

           if Connected then Close;
           ConnectionName := nomeestacao;
           DriverName := Config.ReadString(ConnectionName, 'DriverName', DriverName);
           GetDriverFunc := Config.ReadString(ConnectionName, 'GetDriverFunc', GetDriverFunc);
           LibraryName := Config.ReadString(ConnectionName, 'LibraryName', LibraryName);
           VendorLib := Config.ReadString(ConnectionName, 'VendorLib',     VendorLib);
           LoginPrompt := False;
           KeepConnection := True;
           LoadParamsOnConnect := False;
           LoadParamsFromIniFile(Config.FileName);
        finally
           if not Assigned(Ini) then Config.Free;
        end;
     end;
     cnn.Open;
end;

procedure TdmDados.FilterCDS(aCds: TClientDataSet; aType: TTypeLocalizar;
  aBusca: String);
begin
     aCds.close;
     case aType of
          fsInteger : aCds.Params[0].AsInteger := StrtoInt(aBusca);
          fsString  : aCds.Params[0].AsString  := UpperCase(aBusca);
     end;
     aCds.Open;
end;

procedure TdmDados.RefreshCDS(aDateSet: TClientDataSet);
begin
     aDateSet.Close;
     aDateSet.Open;
end;

function TdmDados.Cancela_Entrada(M_NRENTR, iLoja: integer): Boolean;
begin
       // Inicia um transação no BD
       Start;
        try
             With dmPesquisa.qryAuxi do
              begin
                   SQL.Clear;
                   Close;
                   SQL.Add('UpDate ENTRADA_MEDICAMENTOS SET SITUACAO = '+QuotedStr('C'));
                   SQL.Add('Where (ID_ENTRADA = :pENTRADA)');
                   Params[0].AsInteger := M_NRENTR;
                   ExecSQL();
              End;
              //
             Comit(Transc);
             // Itens
             With cdsListaItensEntrada do
             begin
                  Close;
                  Params[0].AsInteger := M_NRENTR;
                  Open;
                  //
                  If not (IsEmpty) Then
                    begin
                         First;
                         While not (Eof) do
                          begin
                               AtualizaEstoqueProduto(iLoja,
                                 FieldByName('REGISTRO_MS').AsString,
                                 FieldByName('NUMERO_LOTE').AsString,
                                 FieldByName('QUANTIDADE').AsFloat);
                               //
                               Next;
                          End;
                    End
             End;
             //
             result := True;
        Except
             Rollback;
             result := False;
        End;
end;

function TdmDados.GetNREntrada(M_NMARQU: String): Integer;
var
  arquivo : textfile;
  M_NMPAST, Linha : String;
begin
  M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
  //
  try
          AssignFile(arquivo, M_NMARQU);
          Reset(arquivo);
          Read(arquivo, Linha);
          //
          result := StrtoInt(Copy(Linha, 10, 10));
  finally
        CloseFile(arquivo);
        //
        if FileExists(M_NMARQU) then
            DeleteFile(PChar(M_NMARQU));
  end;
end;

function TdmDados.Cancela_Transf(M_NRTRAN: integer): Boolean;
begin
       // Inicia um transação no BD
       Start;
        try
             With dmPesquisa.qryAuxi do
              begin
                   SQL.Clear;
                   Close;
                   SQL.Add('UpDate TRANSFERENCIA SET SITUACAO = '+QuotedStr('C'));
                   SQL.Add('Where (ID_TRANSFERENCIA = :pID)');
                   Params[0].AsInteger := M_NRTRAN;
                   ExecSQL();
              End;
              //
             Comit(Transc);
             //
             result := True;
        Except
             Rollback;
             result := False;
        End;
end;

function TdmDados.GetNRTransf(M_NMARQU: String): Integer;
var
  arquivo : textfile;
  M_NMPAST, Linha : String;
begin
  M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
  //
  try
          AssignFile(arquivo, M_NMARQU);
          Reset(arquivo);
          Read(arquivo, Linha);
          //
          result := StrtoInt(Copy(Linha, 10, 10));
  finally
        CloseFile(arquivo);
        //
        if FileExists(M_NMARQU) then
            DeleteFile(PChar(M_NMARQU));
  end;
end;

function TdmDados.GetNRPerda(M_NMARQU: String): Integer;
var
  arquivo : textfile;
  M_NMPAST, Linha : String;
begin
  M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
  //
  try
          AssignFile(arquivo, M_NMARQU);
          Reset(arquivo);
          Read(arquivo, Linha);
          //
          result := StrtoInt(Copy(Linha, 10, 10));
  finally
        CloseFile(arquivo);
        //
        if FileExists(M_NMARQU) then
            DeleteFile(PChar(M_NMARQU));
  end;
end;

function TdmDados.IDTransation: String;
Var
  i : integer;
Const
  srt = '0123456789';
begin
     for i := 1 to 2 do
      begin
           Randomize;
           Result := Result + srt[Random(Length(srt))+1];
      End;
end;

procedure TdmDados.Comit(aTransc: TTransactionDesc);
begin
     sqlSNGPN.Commit(aTransc);
end;

procedure TdmDados.Rollback;
begin
     sqlSNGPN.Rollback(Transc);
     Application.MessageBox(PChar(MSG_ERRO), 'Erro', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
     //raise Exception.Create(MSG_ERROR);
end;

procedure TdmDados.Start;
begin
     Transc.IsolationLevel := xilREADCOMMITTED;
     Transc.TransactionID  := StrToInt(IDTransation);
     sqlSNGPN.StartTransaction(Transc);
end;

function TdmDados.Cancela_Perda(M_NRPERD: integer): Boolean;
begin
       // Inicia um transação no BD
       Start;
        try
             With dmPesquisa.qryAuxi do
              begin
                   SQL.Clear;
                   Close;
                   SQL.Add('UpDate PERDAS SET SITUACAO = '+QuotedStr('C'));
                   SQL.Add('Where (ID_PERDA = :pID)');
                   Params[0].AsInteger := M_NRPERD;
                   ExecSQL();
              End;
              //
             Comit(Transc);
             //
             result := True;
        Except
             Rollback;
             result := False;
        End;
end;

procedure TdmDados.VENDA_ARQUIVO(M_NRVEND: Integer; W_NMARQU: String;
  W_DTARQU: TDate);
begin
             With dmPesquisa.qryAuxi do
              begin
                   SQL.Clear;
                   Close;
                   {SQL.Add('UpDate VENDAS SET ARQUIVO = '+QuotedStr(W_NMARQU)+', ');
                   SQL.Add('DATA_ARQUIVO = :pDATA Where (ID_VENDA = '+QuotedStr(InttoStr(M_NRVEND))+')');}
                   SQL.Add('UpDate VENDAS SET ARQUIVO = :pARQUIVO,');
                   SQL.Add('DATA_ARQUIVO = :pDATA Where (ID_VENDA = :pID) AND (SITUACAO = :pSITUACAO)');
                   Params.ParamByName('pID').AsInteger      := M_NRVEND;
                   Params.ParamByName('pSITUACAO').AsString := 'F';
                   Params.ParamByName('pARQUIVO').AsString  := W_NMARQU;
                   Params.ParamByName('pDATA').AsDate       := W_DTARQU;
                   ExecSQL();
              End;
end;

procedure TdmDados.ENTRADA_ARQUIVO(M_NRENTR: Integer; W_NMARQU: String;
  W_DTARQU: TDate);
Var
    qryAux : TSQLQuery;
    aTexto : String;
begin
      aTexto := 'UpDate ENTRADA_MEDICAMENTOS SET ARQUIVO = '+QuotedStr(W_NMARQU)+', ';
      aTexto := aTexto + 'DATA_ARQUIVO = :pDATA Where (ID_ENTRADA = '+QuotedStr(InttoStr(M_NRENTR))+')';
      //
      qryAux := TSQLQuery.Create(nil);
      With qryAux do
        try
             SQLConnection := sqlSNGPN;
             Close;
             SQL.Add(aTexto);
             Params.ParamByName('pDATA').AsDate  := W_DTARQU;
             ExecSQL();
        Finally
             Free;
        End;
            { With dmPesquisa.qryAuxi do
              begin
                   SQL.Clear;
                   Close;
                   SQL.Add('UpDate ENTRADA_MEDICAMENTOS SET ARQUIVO = '+QuotedStr(W_NMARQU)+', ');
                   SQL.Add('DATA_ARQUIVO = :pDATA Where (ID_ENTRADA = '+QuotedStr(InttoStr(M_NRENTR))+')');
                   Params.ParamByName('pDATA').AsDate  := W_DTARQU;
                   //SQL.Add('UpDate ENTRADA_MEDICAMENTOS SET ARQUIVO = :pARQUIVO, ');
                   // SQL.Add('DATA_ARQUIVO = :pDATA Where (ID_ENTRADA = :pID)');
                   //Params.ParamByName('pID').AsInteger     := M_NRENTR;
                   //Params.ParamByName('pARQUIVO').AsString := W_NMARQU;
                   // Params.ParamByName('pDATA').AsDateTime  := W_DTARQU;
                   ExecSQL();
              End;}
end;

procedure TdmDados.PERDA_ARQUIVO(M_NRPERD: Integer; W_NMARQU: String;
  W_DTARQU: TDate);
Var
    qryAux : TSQLQuery;
    aTexto : String;
begin
      aTexto := 'UpDate PERDAS SET ARQUIVO = :pARQUIVO, ';
      aTexto := aTexto + 'DATA_ARQUIVO = :pDATA Where (ID_PERDA = :pID) and (SITUACAO = :pSITUACAO)';
      //
      qryAux := TSQLQuery.Create(nil);
      With qryAux do
        try
             SQLConnection := sqlSNGPN;
             Close;
             SQL.Add(aTexto);
             Params.ParamByName('pID').AsInteger      := M_NRPERD;
             Params.ParamByName('pARQUIVO').AsString  := W_NMARQU;
             Params.ParamByName('pSITUACAO').AsString := 'F';
             Params.ParamByName('pDATA').AsDate       := W_DTARQU;
             ExecSQL();
        Finally
             Free;
        End;

            { With dmPesquisa.qryAuxi do
              begin
                   SQL.Clear;
                   Close;
                   SQL.Add('UpDate PERDAS SET ARQUIVO = :pARQUIVO, ');
                   SQL.Add('DATA_ARQUIVO = :pDATA Where (ID_PERDA = :pID) and (SITUACAO = :pSITUACAO)');
                   Params.ParamByName('pID').AsInteger      := M_NRPERD;
                   Params.ParamByName('pARQUIVO').AsString  := W_NMARQU;
                   Params.ParamByName('pSITUACAO').AsString := 'F';
                   Params.ParamByName('pDATA').AsDate       := W_DTARQU;
                   ExecSQL();
              End;}
end;

procedure TdmDados.TRANSF_ARQUIVO(M_NRTRAN: Integer; W_NMARQU: String;
  W_DTARQU: TDate);
Var
    qryAux : TSQLQuery;
    aTexto : String;  
begin
      aTexto := 'UpDate TRANSFERENCIA SET ARQUIVO = :pARQUIVO, ';
      aTexto := aTexto + 'DATA_ARQUIVO = :pDATA Where (ID_TRANSFERENCIA = :pID)';
      //
      qryAux := TSQLQuery.Create(nil);
      With qryAux do
        try
             SQLConnection := sqlSNGPN;
             Close;
             SQL.Add(aTexto);
             Params.ParamByName('pID').AsInteger     := M_NRTRAN;
             Params.ParamByName('pARQUIVO').AsString := W_NMARQU;
             Params.ParamByName('pDATA').AsDate      := W_DTARQU;
             ExecSQL();
        Finally
             Free;
        End;

            { With dmPesquisa.qryAuxi do
              begin
                   SQL.Clear;
                   Close;
                   SQL.Add('UpDate TRANSFERENCIA SET ARQUIVO = :pARQUIVO, ');
                   SQL.Add('DATA_ARQUIVO = :pDATA Where (ID_TRANSFERENCIA = :pID)');
                   // SQL.Add('UpDate TRANSFERENCIA SET ARQUIVO = '+QuotedStr(W_NMARQU)+', ');
                   // SQL.Add('DATA_ARQUIVO = :pDATA Where (ID_PERDA = '+QuotedStr(InttoStr(M_NRTRAN))+')');
                   Params.ParamByName('pID').AsInteger    := M_NRTRAN;
                   Params.ParamByName('pARQUIVO').AsString := W_NMARQU;
                   Params.ParamByName('pDATA').AsDate := W_DTARQU;
                   ExecSQL();
              End;  }
end;

procedure TdmDados.VENDA_INSUMO_ARQUIVO(M_NRVEND: Integer;
  W_NMARQU: String; W_DTARQU: TDate);
Var
    qryAux : TSQLQuery;
    aTexto : String;
begin
      aTexto := 'UpDate VENDAS_INSUMOS SET ARQUIVO = '+QuotedStr(W_NMARQU)+', ';
      aTexto := aTexto + 'DATA_ARQUIVO = :pDATA Where (ID_VENDA = '+QuotedStr(InttoStr(M_NRVEND))+')';
      //
      qryAux := TSQLQuery.Create(nil);
      With qryAux do
        try
             SQLConnection := sqlSNGPN;
             Close;
             SQL.Add(aTexto);
             Params.ParamByName('pDATA').AsDate := W_DTARQU;
             ExecSQL();
        Finally
             Free;
        End;

             {With dmPesquisa.qryAuxi do
              begin
                   SQL.Clear;
                   Close;
                   // SQL.Add('UpDate VENDAS_INSUMOS SET ARQUIVO = :pARQUIVO, ');
                   // SQL.Add('DATA_ARQUIVO = :pDATA Where (ID_VENDA = :pID)');
                   SQL.Add('UpDate VENDAS_INSUMOS SET ARQUIVO = '+QuotedStr(W_NMARQU)+', ');
                   SQL.Add('DATA_ARQUIVO = :pDATA Where (ID_VENDA = '+QuotedStr(InttoStr(M_NRVEND))+')');
                   // Params.ParamByName('pID').AsInteger    := M_NRVEND;
                   // Params.ParamByName('pARQUIVO').AsString := W_NMARQU;
                   Params.ParamByName('pDATA').AsDate := W_DTARQU;
                   ExecSQL();
              End;}
end;

function TdmDados.LOC_CRM_MEDICO2(M_NUMCRM: Integer): Boolean;
Var
    qryAux : TSQLQuery;
    aTexto : String;
begin
      result := False;
      aTexto := 'Select * from MEDICO Where (NR_RG_PROFISSIONAL = :pCRM)';
      qryAux := TSQLQuery.Create(nil);
      With qryAux do
        try
             SQLConnection := sqlSNGPN;
             Close;
             SQL.Add(aTexto);
             Params.ParamByName('pCRM').AsInteger  := M_NUMCRM;
             open;
             //
             if not (IsEmpty) Then
                Result := True;
        Finally
             Free;
        End;
     {With qryProcurar do
       begin
            SQL.Clear;
            Close;
            SQL.Add('Select * from MEDICO Where (NR_RG_PROFISSIONAL = :pCRM)');
            Params.ParamByName('pCRM').AsInteger  := M_NUMCRM;
            Open;
            //
            If not (IsEmpty) Then
                result := True
            Else
                result := False;
       End;  }
end;

function TdmDados.Validar_medico(M_NMMEDI, M_SIGLA, M_UFMEDI: String;
  M_NRREGI: Integer): Boolean;
Var
    qryAux : TSQLQuery;
    aTexto : String;
begin
     result := False;
     aTexto := 'Select * from MEDICO Where (NOME_MEDICO = :pNOME) and (NR_RG_PROFISSIONAL = :pRG) and (UF_CONSELHO = :pUF) and (SIGLA_CONSELHO = :pSIGLA)';
     {With dmPesquisa.cdsValidarMedico do
      begin
           Active := False;
           Params[0].AsString := M_NMMEDI;
           Params[1].AsInteger := M_NRREGI;
           Params[2].AsString := M_UFMEDI;
           Params[3].AsString := M_SIGLA;
           Active := True;
           //
           if not (IsEmpty) Then
              Result := True;
      End;}
      qryAux := TSQLQuery.Create(nil);
      With qryAux do
        try
             SQLConnection := sqlSNGPN;
             Close;
             SQL.Add(aTexto);
             Params.ParamByName('pNOME').AsString  := M_NMMEDI;
             Params.ParamByName('pRG').AsInteger   := M_NRREGI;
             Params.ParamByName('pUF').AsString    := M_UFMEDI;
             Params.ParamByName('pSIGLA').AsString := M_SIGLA;
             //
             open;
             //
             if not (IsEmpty) Then
                Result := True;
        Finally
             Free;
        End;
end;

function TdmDados.Validar_Cliente(M_NMCLI, M_NRREGI, M_UFCLIE: String ): Boolean;
Var
    qryAux : TSQLQuery;
    aTexto : String;
begin
     result := False;
     aTexto := 'select * from COMPRADOR where (NOME_COMPRADOR = :pNOME) and (NR_DOCUMETO = :pRG) and (UF_EMISSOA_DOC = :pUF)';
     //
      qryAux := TSQLQuery.Create(nil);
      With qryAux do
        try
             SQLConnection := sqlSNGPN;
             Close;
             SQL.Add(aTexto);
             Params.ParamByName('pNOME').AsString  := M_NMCLI;
             Params.ParamByName('pRG').AsString  := M_NRREGI;
             Params.ParamByName('pUF').AsString  := M_UFCLIE;
             //
             open;
             //
             if not (IsEmpty) Then
                Result := True;
        Finally
             Free;
        End;
     {With dmPesquisa.cdsValidarCliente do
      begin
           Active := False;
           Params[0].AsString  := M_NMCLI;
           Params[1].AsString  := M_NRREGI;
           Params[2].AsString  := M_UFCLIE;
           Active := True;
           //
           if not (IsEmpty) Then
              Result := True;
      End;}
end;

function TdmDados.GetProximaVenda: String;
Var
    iVenda : integer;
begin
     cdsConfig.Edit;
     iVenda := cdsConfigCFG_VENDAS.AsInteger +1;
     Result := uFuncoes.StrZero (InttoStr(iVenda),7);
end;

procedure TdmDados.cdsDadosCalcFields(DataSet: TDataSet);
begin
     cdsDadosPRO_SUBTOTAL.AsFloat := cdsDadosPRO_VLVEND.AsCurrency  * cdsDadosPRO_QTPROD.AsFloat;   
end;

function TdmDados.IncPerdas(idPerda, iLoja, iTipo: integer; aDataMov: TDate;
  aFluxo: String): boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Insert into PERDAS (ID_PERDA, ID_LOJA, MOTIVO_PERDA,DATA_PERDA, FLUXO_INSUMO) ';
  texto := texto + ' Values(:pID_PERDA, :pLOJA, :pMOTIVO_PERDA, :pDATA_PERDA, :pFLUXO_INSUMO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pID_PERDA').AsInteger  := idPerda;
      Params.ParamByName('pLOJA').AsInteger      := iLoja;
      Params.ParamByName('pMOTIVO_PERDA').AsInteger := iTipo;
      Params.ParamByName('pDATA_PERDA').AsDateTime  := aDataMov;
      Params.ParamByName('pFLUXO_INSUMO').AsString  := aFluxo;
      ExecSQL();
      result := True;
    finally
      free;
    end;
end;

function TdmDados.IncItemPerda(idPerda, iLoja: Integer; aCodigo, aLote: String;
  fQuant: Double): boolean;
var qraux : TSQLquery;
    texto : string;
    //
    M_QTANTE, M_QTMOVI, M_QTATUA : Double;
    aTipoEntradaSaida, aMotivoAlteracao, aHoraMov : String;
    iMotivo, iUsuario : Integer;
    aDataMov: TDatetime;
begin
  result := False;
  texto := 'Insert into PERDAS_MEDICAMENTOS (ID_PERDA, REGISTRO_MS, NUMERO_LOTE, QUANTIDADE, FLUXO_INSUMO ) ';
  texto := texto + 'Values (:pID_PERDA, :pREGISTRO_MS, :pNUMERO_LOTE, :pQUANTIDADE, :pFLUXO_INSUMO)';
  //
  aDataMov := Date();
  aHoraMov := uFuncoes.RemoveChar(TimetoStr(Time));
  iUsuario := StrtoInt(uFormMainSngpc.M_CDUSUA);
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pID_PERDA').AsInteger    := idPerda;
      Params.ParamByName('pREGISTRO_MS').AsString  := aCodigo;
      Params.ParamByName('pNUMERO_LOTE').AsString  := aLote;
      Params.ParamByName('pQUANTIDADE').AsFloat    := fQuant;
      Params.ParamByName('pFLUXO_INSUMO').AsString := 'N';
      ExecSQL();
      //
      M_QTANTE := dmDados.GetEstoqueAtualProduto(iLoja, aCodigo, aLote);
      M_QTMOVI := fQuant;
      //     Estoque
      AtualizaEstoqueProduto(iLoja, aCodigo, aLote, fQuant);
      // Historico
      M_QTATUA :=  dmDados.GetEstoqueAtualProduto(iLoja, aCodigo, aLote);
      //  Historico
      iMotivo := 5;  // Perda de Produto
      aTipoEntradaSaida := 'S';  // E - ENtrada/ S - Saída
      aMotivoAlteracao  := 'P';  // P - Perda
      {dmDados.AdicionarHistoricoProduto(iLoja, iMotivo, iUsuario,
      iDocumento: Integer; aProduto, aLote, aHoraMov, aTipoMov,
      aTipoES: String; fQuantAnterior, fQuantMovimento, fQuantAtual: Double;
      aDataMov: TDatetime): Boolean; }
      AdicionarHistoricoProduto(iLoja, iMotivo,  iUsuario, 0,
                                   aCodigo,
                                   aLote, aHoraMov, aMotivoAlteracao, aTipoEntradaSaida,
                                   M_QTANTE, M_QTMOVI, M_QTATUA, aDataMov);
      //
      result := True;
    finally
      free;
    end;
end;

function TdmDados.Incluir_Transf(iID, iLoja, iNR_NOTAFISCAL,
  iTIPO_OPERACAO: integer; aDATA_NOTA, aDATA_TRANSFERENCIA: TDate;
  aCNPJ_ORIGEM, aCNPJ_DESTINO, aFLUXO_INSUMO: String): boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Insert into TRANSFERENCIA (ID_TRANSFERENCIA, ID_LOJA, NR_NOTAFISCAL, TIPO_OPERACAO, DATA_NOTA, CNPJ_ORIGEM, CNPJ_DESTINO, DATA_TRANSFERENCIA, FLUXO_INSUMO) ';
  texto := texto + 'Values(:pID, :pLOJA, :pNR_NOTAFISCAL, :pTIPO_OPERACAO, :pDATA_NOTA, :pCNPJ_ORIGEM, :pCNPJ_DESTINO, :pDATA_TRANSFERENCIA, :pFLUXO_INSUMO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pID').AsInteger            := iID;
      Params.ParamByName('pLOJA').AsInteger          := iLoja;
      Params.ParamByName('pNR_NOTAFISCAL').AsInteger := iNR_NOTAFISCAL;
      Params.ParamByName('pTIPO_OPERACAO').AsInteger := iTIPO_OPERACAO;
      Params.ParamByName('pDATA_NOTA').AsDateTime    := aDATA_NOTA;
      Params.ParamByName('pCNPJ_ORIGEM').AsString    := aCNPJ_ORIGEM;
      Params.ParamByName('pCNPJ_DESTINO').AsString   := aCNPJ_DESTINO;
      Params.ParamByName('pDATA_TRANSFERENCIA').AsDateTime := aDATA_TRANSFERENCIA;
      Params.ParamByName('pFLUXO_INSUMO').AsString   := aFLUXO_INSUMO;
      ExecSQL();
      result := True;
    finally
      free;
    end;
end;

function TdmDados.Itens_Transf(iID, iLojaOrigem, iLojaDestino : Integer; aREGISTRO_MS, aNUMERO_LOTE,
  aFLUXO_INSUMO, aCNPJ_FORNECEDOR: String;
  fQUANT_MEDICAMENTO: Double): boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'INSERT INTO TRANSFERENCIA_MEDICAMENTOS (ID_TRANSFERENCIA, REGISTRO_MS, NUMERO_LOTE, QUANT_MEDICAMENTO, FLUXO_INSUMO, CNPJ_FORNECEDOR) ';
  texto := texto + 'Values (:pID, :pREGISTRO_MS, :pNUMERO_LOTE, :pQUANTIDADE, :pFLUXO_INSUMO,  :pCNPJ_FORNECEDOR)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pID').AsInteger          := iID;
      Params.ParamByName('pREGISTRO_MS').AsString  := aREGISTRO_MS;
      Params.ParamByName('pNUMERO_LOTE').AsString  := aNUMERO_LOTE;
      Params.ParamByName('pQUANTIDADE').AsFloat    := fQUANT_MEDICAMENTO;
      Params.ParamByName('pFLUXO_INSUMO').AsString := aFLUXO_INSUMO;
      Params.ParamByName('pCNPJ_FORNECEDOR').AsString := aCNPJ_FORNECEDOR;
      ExecSQL();
      // Loja Origem
      AtualizaEstoqueProduto(iLojaOrigem, aREGISTRO_MS, aNUMERO_LOTE, fQUANT_MEDICAMENTO);
      // Loja Destino
      AdicionaProdutoEstoque(iLojaDestino, aREGISTRO_MS, aNUMERO_LOTE, fQUANT_MEDICAMENTO);
      //
      result := True;
    finally
      free;
    end;
end;

function TdmDados.VerificarLoteProduto(aRegistroMS,
  aLote: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select ID_ENTRADA, REGISTRO_MS, NUMERO_LOTE from MEDICAMENTO_ENTRADA Where (REGISTRO_MS = :pREGISTRO) and (NUMERO_LOTE = :pLOTE)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pREGISTRO').AsString  := aRegistroMS;
      Params.ParamByName('pLOTE').AsString      := aLote;
      Open;
      //
      If Not (IsEmpty) Then
          result := True;
    finally
      free;
    end;
end;

procedure TdmDados.dspEstoqueGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'ESTOQUE';
end;

function TdmDados.GetProdutoLoteEstoque(iLoja : Integer; aCodigo, aLote: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select * from ESTOQUE Where (EST_CDLOJA = :pLOJA) and (EST_CDPROD = :pCDPROD) AND (EST_NRLOTE = :pLOTE)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pLOJA').AsInteger   := iLoja;
      Params.ParamByName('pCDPROD').AsString  := aCodigo;
      Params.ParamByName('pLOTE').AsString    := aLote;
      Open;
      //
      If Not (IsEmpty) Then
          result := True;
    finally
      free;
    end;
end;

function TdmDados.GetCodigoLoja(aNome: String): Integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS Where (EMP_FANTASIA = :pFANTASIA)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pFANTASIA').AsString := aNome;
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByName('EMP_CODIGO').AsInteger;
    finally
      free;
    end;
end;

function TdmDados.AdicionarVenda(iVenda, iLoja, iTipoReceituario,
  iUsoMedicamento, iPrescritor, iCliente : Integer; aDataVenda: TDate;
  aNrNotificacao : String; aCdsItens: TClientDataSet): Boolean;
Var
    aFluxuGravar : Boolean;
    M_QTANTE, M_QTMOVI, M_QTATUA : Double;
    aTipoEntradaSaida, aMotivoAlteracao, aHoraMov : String;
    iMotivo, iUsuario : Integer;
    aDataMov: TDatetime;
begin
     //
     aFluxuGravar := False;
     FilterCDS(cdsVendas, fsInteger, InttoStr(iVenda));
     aDataMov := Date();
     aHoraMov := uFuncoes.RemoveChar(TimetoStr(Time));
     iUsuario := StrtoInt(uFormMainSngpc.M_CDUSUA);
     //
     Start;
     try
         // Adicionar Venda
         With cdsVendas do
          begin
             Append;
             FieldByName('ID_VENDA').AsInteger          := iVenda;
             FieldByName('ID_LOJA').AsInteger           := iLoja;
             FieldByName('DATA_VENDA').AsDateTime       := aDataVenda;
             FieldByName('TIPO_RECEITUARIO').AsInteger  := iTipoReceituario;
             FieldByName('NR_NOT_MEDICAMENTO').AsString := aNrNotificacao;
             FieldByName('ID_PRESCRITOR').AsInteger     := iPrescritor;
             FieldByName('USO_MEDICAMENTO').AsInteger   := iUsoMedicamento;
             FieldByName('ID_COMPRADOR').AsInteger      := iCliente;
             //
             ApplyUpdates(0);
          End;  // fim-with
          //
          Comit(Transc);
          aFluxuGravar := True;
     Except
          Rollback;
          Result := False;
     End;
     //
     If (aFluxuGravar) Then
      begin
           //
           aCdsItens.DisableControls;
           aCdsItens.First;
           While not (aCdsItens.Eof) Do
            begin
                Start;
                try
                 // Adiciona Itens da Venda
                 With dmPesquisa.cdsAddItensVenda do
                 begin
                     Close;
                     Params[0].AsInteger := iVenda;
                     Params[1].AsString  := aCdsItens.FieldByName('PRO_CDBARR').AsString;
                     Params[2].AsString  := aCdsItens.FieldByName('PRO_NRLOTE').AsString;
                     Open;
                     //
                     If (IsEmpty) Then
                     begin
                          M_QTANTE := 0;
                          M_QTMOVI := 0;
                          M_QTATUA := 0;
                          //
                          Append;
                          FieldByName('ID_VENDA').AsInteger   := iVenda;
                          FieldByName('REGISTRO_MS').AsString := aCdsItens.FieldByName('PRO_CDBARR').AsString;
                          FieldByName('NUMERO_LOTE').AsString := aCdsItens.FieldByName('PRO_NRLOTE').AsString;
                          FieldByName('QUANT_MEDICAMENTO').AsFloat  := aCdsItens.FieldByName('PRO_QTPROD').AsFloat;
                          ApplyUpdates(0);
                          //
                          M_QTANTE := dmDados.GetEstoqueAtualProduto(iLoja, aCdsItens.FieldByName('PRO_CDBARR').AsString, aCdsItens.FieldByName('PRO_NRLOTE').AsString);
                          M_QTMOVI := aCdsItens.FieldByName('PRO_QTPROD').AsFloat;
                          //  Estoque
                          aFluxuGravar := AtualizaEstoqueProduto(iLoja,
                                aCdsItens.FieldByName('PRO_CDBARR').AsString,
                                aCdsItens.FieldByName('PRO_NRLOTE').AsString,
                                aCdsItens.FieldByName('PRO_QTPROD').AsFloat);
                          //
                          M_QTATUA :=  dmDados.GetEstoqueAtualProduto(iLoja, aCdsItens.FieldByName('PRO_CDBARR').AsString, aCdsItens.FieldByName('PRO_NRLOTE').AsString);
                          //  Historico
                          iMotivo := 4;  // Venda de Produto
                          aTipoEntradaSaida := 'S';  // E - ENtrada/ S - Saída
                          aMotivoAlteracao  := 'V';  // V - Venda
                          {dmDados.AdicionarHistoricoProduto(iLoja, iMotivo, iUsuario,
                          iDocumento: Integer; aProduto, aLote, aHoraMov, aTipoMov,
                          aTipoES: String; fQuantAnterior, fQuantMovimento, fQuantAtual: Double;
                          aDataMov: TDatetime): Boolean; }
                          AdicionarHistoricoProduto(iLoja, iMotivo,  iUsuario, iVenda,
                                   aCdsItens.FieldByName('PRO_CDBARR').AsString,
                                   aCdsItens.FieldByName('PRO_NRLOTE').AsString, aHoraMov, aMotivoAlteracao, aTipoEntradaSaida,
                                   M_QTANTE, M_QTMOVI, M_QTATUA, aDataMov);
                     End;
                  End;
                  //
                  Comit(Transc);
                Except
                     Rollback;
                     //
                     ExcluirVenda(iVenda);
                     //
                     aFluxuGravar := False;
                     Break;
                End;
                // Proximo item
                aCdsItens.Next;
            End;  // fim-do-enquanto- aCdsItens
            //
            aCdsItens.EnableControls;
      End;
     //
     If (aFluxuGravar) Then
         Result := True;
end;

procedure TdmDados.CarregarLojas(aCmb: TComboBox);
begin
     dmDados.RefreshCDS(dmPesquisa.cdsListaLojas);
     //
     aCmb.Clear;
     With dmPesquisa.cdsListaLojas do
      begin
           First;
           While not (Eof) do
            begin
                 aCmb.Items.Add(FieldByName('EMP_FANTASIA').AsString);
                 //
                 Next;
            End;
      End;
end;

function TdmDados.GetNomeLoja(iCogigo: Integer): String;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger := iCogigo;
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByName('EMP_FANTASIA').AsString;
    finally
      free;
    end;
end;

procedure TdmDados.CarregarLotesProduto(iLoja: Integer; aProduto: String;
  aCmb: TComboBox);
var qraux : TSQLquery;
    texto : string;  
begin
    texto := 'Select * from ESTOQUE Where (EST_CDLOJA = :pLOJA) and (EST_CDPROD = :pCDPROD) and (EST_QUANTIDADE > 0) ';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
        SQLConnection := dmDados.sqlSNGPN;
        sql.Add(texto);
        Params[0].AsInteger := iLoja;
        Params[1].AsString  := aProduto;
        Open;
        //
        If Not (IsEmpty) Then
         begin
              aCmb.Clear;
                First;
                while not (Eof) do
                  begin
                        aCmb.Items.Add(FieldByname('EST_NRLOTE').AsString);
                       //
                       Next;
                  End;
         End;
     finally
        free;
      end;
   {  With dmPesquisa.cdsListaLotesProduto do
      begin
           Close;
           // Select * from ESTOQUE Where (EST_CDLOJA = :pLOJA) and (EST_CDPROD = :pCDPROD) and (EST_QUANTIDADE > 0)
           Params[0].AsInteger := iLoja;
           Params[1].AsString  := aProduto;
           Open;
           //
           If not (IsEmpty) then
            begin
                aCmb.Clear;
                First;
                while not (Eof) do
                  begin
                        aCmb.Items.Add(FieldByname('EST_NRLOTE').AsString);
                       //
                       Next;
                  End;
            End;
      End; }
end;

function TdmDados.GetProdutoNoEstoque(iLoja: Integer;
  aCodigo: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select * from ESTOQUE Where (EST_CDLOJA = :pLOJA) and (EST_CDPROD = :pCDPROD)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pLOJA').AsInteger   := iLoja;
      Params.ParamByName('pCDPROD').AsString  := aCodigo;
      Open;
      //
      If Not (IsEmpty) Then
          result := True;
    finally
      free;
    end;
end;

function TdmDados.ExcluirVenda(iVenda: Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Delete from VENDAS Where (ID_VENDA = :pVENDA)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
  begin
    try
      Start;
      try
         SQLConnection := dmDados.sqlSNGPN;
         sql.Add(texto);
         Params.ParamByName('pVENDA').AsInteger   := iVenda;
         ExecSQL();
         //
         Comit(Transc);
         result := True;
      Except
         Rollback;
      End;
    finally
      free;
    end;
  End;
end;

function TdmDados.AtualizaEstoqueProduto(iLoja: Integer; aProduto,
  aLote: String; fQuant : Double): Boolean;
begin
      Result := False;
      With cdsEstoque do
        begin
             Close;
             Params[0].AsInteger := iLoja;
             Params[1].AsString  := aProduto;
             Params[2].AsString  := aLote;
             Open;
             //
             If not (IsEmpty) then
              begin
                   Edit;
                   FieldByName('EST_QUANTIDADE').AsFloat :=
                     FieldByName('EST_QUANTIDADE').AsFloat - fQuant;
                   ApplyUpdates(0);
              End;
              //
              Close;
        End;
       //
       Result := True;
end;

function TdmDados.GetVerificarQuantEstoque(iLoja: Integer; aProduto,
  aLote: String; fQuant: Double): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select * from ESTOQUE Where (EST_CDLOJA = :pLOJA) and (EST_CDPROD = :pCDPROD)';
  texto := texto + ' and (EST_NRLOTE = :pNRLOTE) ';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pLOJA').AsInteger   := iLoja;
      Params.ParamByName('pCDPROD').AsString  := aProduto;
      Params.ParamByName('pNRLOTE').AsString  := aLote;
      Open;
      //
      If Not (IsEmpty) Then
         If (FieldByName('EST_QUANTIDADE').AsFloat < fQuant) Then
              result := True;
    finally
      free;
    end;
end;

function TdmDados.AdicionaProdutoEstoque(iLoja: Integer; aProduto,
  aLote: String; fQuant: Double): Boolean;
begin
      Result := False;
      try
         With cdsEstoque do
         begin
              Close;
              Params[0].AsInteger := iLoja;
              Params[1].AsString  := aProduto;
              Params[2].AsString  := aLote;
              Open;
              //
              If not (IsEmpty) then
               begin
                    Edit;
                    FieldByName('EST_QUANTIDADE').AsFloat := FieldByName('EST_QUANTIDADE').AsFloat + fQuant;
                    ApplyUpdates(0);
               End
               Else
               begin
                    Append;
                    FieldByName('EST_CDLOJA').AsInteger := iLoja;
                    FieldByName('EST_CDPROD').AsString  := aProduto;
                    FieldByName('EST_NRLOTE').AsString  := aLote;
                    FieldByName('EST_QUANTIDADE').AsFloat := fQuant;
                    ApplyUpdates(0);
               End;
               //
               Close;
         End;
         //
         Result := True;
       Except

       End;
end;

function TdmDados.GetCodigoLojaDestino(aCNPJ: String): Integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select EMP_CODIGO, EMP_CNPJ from EMPRESAS Where (EMP_CNPJ = :pCNPJ) ';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pCNPJ').AsString := aCNPJ;
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByname('EMP_CODIGO').AsInteger;
    finally
      free;
    end;
end;

function TdmDados.AddTarefaUsuario(iUSUARIO: INTEGER; aDTMOVI: TDATE; aACAO,
  aARQUIVO: String): Boolean;
var qraux : TSQLquery;
    texto : string;
    iSequencia : Integer;
begin
  result := False;
  RefreshCDS(cdsConfig);
  cdsConfig.Edit;
  cdsConfigCFG_SEQTAREFA.AsInteger :=
     cdsConfigCFG_SEQTAREFA.AsInteger + 1;
  cdsConfig.ApplyUpdates(0);
  //
  iSequencia := cdsConfigCFG_SEQTAREFA.AsInteger;
  //
  texto := 'Insert Into TAREFAS_USUARIOS (TAR_SEQUENCIA, TAR_USUARIO, TAR_DTMOVI, TAR_ACAO, TAR_ARQUIVO) ';
  texto := texto  + 'Values (:pSEQUENCIA, :pUSUARIO, :pDTMOVI, :pACAO, :pARQUIVO) ';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
  begin
    try
      Start;
      try
         SQLConnection := dmDados.sqlSNGPN;
         sql.Add(texto);
         Params.ParamByName('pSEQUENCIA').AsInteger  := iSequencia;
         Params.ParamByName('pUSUARIO').AsInteger    := iUSUARIO;
         Params.ParamByName('pDTMOVI').AsDate        := aDTMOVI;
         Params.ParamByName('pACAO').AsString        := aACAO;
         Params.ParamByName('pARQUIVO').AsString     := aARQUIVO;
         ExecSQL();
         //
         Comit(Transc);
         result := True;
      Except
         Rollback;
      End;
    finally
      free;
    end;
  End;
end;

procedure TdmDados.ListaTarefas;
Var
    iCont : Integer;
begin
     RefreshCDS(cdsTarefas);
     cdsPeriodos.Close;
     cdsPeriodos.Open;
     cdsPeriodos.EmptyDataSet;
     iCont := 1;
     //
     with cdsTarefas do
      begin
           Last;
           While not (Bof) do
            begin
                 If (iCont <= 10) Then
                 begin
                     cdsPeriodos.Append;
                     cdsPeriodosID.AsInteger      := FieldByName('TAR_SEQUENCIA').AsInteger;
                     cdsPeriodosUSUARIO.AsInteger := FieldByName('TAR_USUARIO').AsInteger;
                     cdsPeriodosNOME_USUARIO.AsString := GetNomeUsuario(FieldByName('TAR_USUARIO').AsInteger);
                     cdsPeriodosDATA.AsDateTime   := FieldByName('TAR_DTMOVI').AsDateTime;
                     cdsPeriodosACAO.AsString     := FieldByName('TAR_ACAO').AsString;
                     cdsPeriodosARQUIVO.AsString  := FieldByName('TAR_ARQUIVO').AsString;
                     cdsPeriodosSTATUS.AsString   := FieldByName('TAR_STATUS').AsString;
                 End
                 Else
                    Break;
                 //
                 iCont := iCont + 1;
                 cdsPeriodos.Post;
                 //
                 Prior;
            End;
            //
            cdsPeriodos.First;
      End;
end;

function TdmDados.GetNomeUsuario(iCodigo: Integer): String;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select SEN_CODIGO, SEN_NOME from USUARIOS Where (SEN_CODIGO = :pCODIGO) ';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger:= iCodigo;
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByname('SEN_NOME').AsString;
    finally
      free;
    end;
end;

function TdmDados.LIMPAR_CAMPOS_ARQUIVO(aDataInicio,
  aDataFinal: TDate; iLoja : Integer): Boolean;
Var
    qraux : TSQLquery;
    texto : string;
begin
    Result := False;
   // Vendas
   If (VerificarVendaPeriodo(aDataInicio, aDataFinal)) Then
   begin
      texto := ' Update VENDAS Set ARQUIVO = :pARQUIVO ';
      texto := texto  + ' Where (DATA_VENDA >= :pDTINIC) and (DATA_VENDA <= :pDTFINA) and (ID_LOJA = :pLOJA) and (SITUACAO = :pSITUACAO)';
      QrAux := TSqlquery.Create(nil);
      with QrAux do
       try
         Start;
         try
            SQLConnection := dmDados.sqlSNGPN;
            sql.Add(texto);
            Params.ParamByName('pDTINIC').AsDateTime := aDataInicio;
            Params.ParamByName('pDTFINA').AsDateTime := aDataFinal;
            Params.ParamByName('pLOJA').AsInteger    := iLoja;
            Params.ParamByName('pSITUACAO').AsString := 'F';
            //
            Params.ParamByName('pARQUIVO').AsString  := ' ';
            //Params.ParamByName('pDATA').Clear;
            ExecSQL();
            //
            Comit(Transc);
         Except
            Rollback;
         End;
       finally
        free;
       end;
   End;  // fim-se encontrar vendas
   // Entradas
   If (VerificarEntradasPeriodo(aDataInicio, aDataFinal)) Then
   begin
      texto := ' Update ENTRADA_MEDICAMENTOS Set ARQUIVO = :pARQUIVO ';
      texto := texto  + ' Where (DATA_RECEBIMENTO >= :pDTINIC) and (DATA_RECEBIMENTO <= :pDTFINA) and (ID_LOJA = :pLOJA) and (SITUACAO = :pSITUACAO)';
      QrAux := TSqlquery.Create(nil);
      with QrAux do
       try
         Start;
         try
            SQLConnection := dmDados.sqlSNGPN;
            sql.Add(texto);
            Params.ParamByName('pDTINIC').AsDateTime := aDataInicio;
            Params.ParamByName('pDTFINA').AsDateTime := aDataFinal;
            Params.ParamByName('pLOJA').AsInteger    := iLoja;
            Params.ParamByName('pSITUACAO').AsString := 'F';
            //
            Params.ParamByName('pARQUIVO').AsString  := ' ';
            //Params.ParamByName('pDATA').Clear;
            ExecSQL();
            //
            Comit(Transc);
         Except
            Rollback;
         End;
       finally
        free;
       end;
     //
   End;
   //
   Result := True;
end;

function TdmDados.VerificarVendaPeriodo(aDataInicial,
  aDataFinal: TDate): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  Result := False;
  texto := 'Select DATA_VENDA from VENDAS Where (DATA_VENDA >= :pDTINIC) and (DATA_VENDA <= :pDTFINA)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pDTINIC').AsDate := aDataInicial;
      Params.ParamByName('pDTFINA').AsDate := aDataFinal;
      Open;
      //
      If Not (IsEmpty) Then
          result := True;
    finally
      free;
    end;
end;

function TdmDados.VerificarEntradasPeriodo(aDataInicial,
  aDataFinal: TDate): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  Result := False;
  texto := 'Select DATA_RECEBIMENTO from ENTRADA_MEDICAMENTOS Where (DATA_RECEBIMENTO >= :pDTINIC) and (DATA_RECEBIMENTO <= :pDTFINA)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pDTINIC').AsDate := aDataInicial;
      Params.ParamByName('pDTFINA').AsDate := aDataFinal;
      Open;
      //
      If Not (IsEmpty) Then
          result := True;
    finally
      free;
    end;
end;

Function TdmDados.GetIdentidadeCliente(aNumero: String): Integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select ID_COMPRADOR, NOME_COMPRADOR, NR_DOCUMETO From COMPRADOR Where (NR_DOCUMETO = :pDOCUMETO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pDOCUMETO').AsString := aNumero;
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByName('ID_COMPRADOR').AsInteger
      Else
          Result := 0;
    finally
      free;
    end;
end;

function TdmDados.GetSiglaOrgao(iCodigo: Integer): String;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select * from ORGAO_EXPEDIDOR Where (ID_ORGAO = :pID_ORGAO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pID_ORGAO').AsInteger := iCodigo;
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByname('SIGLA_ORGAO').AsString;
    finally
      free;
    end;
end;

function TdmDados.VerificarSiglaOrgao(aSigla: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select * from ORGAO_EXPEDIDOR Where (SIGLA_ORGAO = :pSIGLA_ORGAO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pSIGLA_ORGAO').AsString := aSigla;
      Open;
      //
      If Not (IsEmpty) Then
          result := True;
    finally
      free;
    end;
end;

function TdmDados.IncluirCliente(iCodigo, iTipoDoc, iOrgao: Integer; aNome,
  aNumeroDoc, aUF, aDataNasc, aSexo: String): Integer;
Var
   M_CDCLIE : Integer;
begin
     M_CDCLIE := 0;
     //
     FilterCDS(cdsComprador, fsInteger, InttoStr(iCodigo));
     //
     If not (cdsComprador.IsEmpty) Then
      begin
           M_CDCLIE := iCodigo;
           if (M_CDCLIE <> 9999999) Then
           begin
               Start;
               try
                 With cdsComprador do
                  begin
                      Edit;
                      M_CDCLIE := FieldByName('ID_COMPRADOR').AsInteger;
                      FieldByName('NOME_COMPRADOR').AsString  := aNome;
                      FieldByName('TIPO_DOCUMENTO').AsInteger := iTipoDoc;
                      FieldByName('NR_DOCUMETO').AsString     := aNumeroDoc;
                      FieldByName('ORGAO_EXPEDIDOR').AsInteger := iOrgao;
                      FieldByName('UF_EMISSOA_DOC').AsString  := aUF;
                      {if not uFuncoes.Empty(aSexo) Then
                         FieldByName('SEXO').AsString := aSexo;
                      if not uFuncoes.Empty(aDataNasc) Then
                         FieldByName('DATA_NASCIMENTO').AsDateTime := StrtoDate(aDataNasc);    }
                      //
                      ApplyUpdates(0);
                  End;
                  //
                  Comit(Transc);
               Except
                  Rollback;
               End;
           End;
      End
      Else
      begin
           //
           RefreshCDS(cdsConfig);
           cdsConfig.Edit;
           cdsConfig.FieldByName('CFG_COMPRADOR').AsInteger :=  cdsConfig.FieldByName('CFG_COMPRADOR').AsInteger + 1;
           if (cdsConfig.FieldByName('CFG_COMPRADOR').AsInteger = 9999999) Then
               cdsConfig.FieldByName('CFG_COMPRADOR').AsInteger := cdsConfig.FieldByName('CFG_COMPRADOR').AsInteger + 1;
           //   
           cdsConfig.ApplyUpdates(0);
           //
           M_CDCLIE := cdsConfigCFG_COMPRADOR.AsInteger;

                //M_CDCLIE := cdsConfigCFG_COMPRADOR.AsInteger;
                //
                Start;
                try
                  With cdsComprador do
                   begin
                       Append;
                       FieldByName('ID_COMPRADOR').AsInteger   := M_CDCLIE;
                       FieldByName('NOME_COMPRADOR').AsString  := aNome;
                       FieldByName('TIPO_DOCUMENTO').AsInteger := iTipoDoc;
                       FieldByName('NR_DOCUMETO').AsString     := aNumeroDoc;
                       FieldByName('ORGAO_EXPEDIDOR').AsInteger := iOrgao;
                       FieldByName('UF_EMISSOA_DOC').AsString  := aUF;
                       //
                       ApplyUpdates(0);
                   End;
                   //
                   Comit(Transc);
                Except
                   Rollback;
                End;
           
      End;
      //
      Result := M_CDCLIE;
end;

function TdmDados.IncluirMedico(iCodigo, iRGPROFISSIONAL,
  iCONSELHO_PROFISSIONAL: Integer; aNome, aUF, aSigla: String): Integer;
Var
   M_CDMEDI : Integer;
begin
     M_CDMEDI := 0;
     //
     FilterCDS(cdsMedico, fsInteger, InttoStr(iCodigo));
     //
     If not (cdsMedico.IsEmpty) Then
      begin
           Start;
           try
             With cdsMedico do
              begin
                  Edit;
                  M_CDMEDI := FieldByName('ID_MEDICO').AsInteger;
                  FieldByName('NOME_MEDICO').AsString           := aNome;
                  FieldByName('NR_RG_PROFISSIONAL').AsInteger    := iRGPROFISSIONAL;
                  FieldByName('CONSELHO_PROFISSIONAL').AsInteger := iCONSELHO_PROFISSIONAL;
                  FieldByName('UF_CONSELHO').AsString            := aUF;
                  FieldByName('SIGLA_CONSELHO').AsString         := aSigla;
                  //
                  ApplyUpdates(0);
              End;
              //
              Comit(Transc);
           Except
              Rollback;
           End;
      End
      Else
      begin
           //
           RefreshCDS(cdsConfig);
           cdsConfig.Edit;
           cdsConfigCFG_MEDICO.AsInteger :=
              cdsConfigCFG_MEDICO.AsInteger + 1;
           cdsConfig.ApplyUpdates(0);
           //
           M_CDMEDI := cdsConfigCFG_MEDICO.AsInteger;
           //
           Start;
           try
             With cdsMedico do
              begin
                  Append;
                  FieldByName('ID_MEDICO').AsInteger             := M_CDMEDI;
                  FieldByName('NOME_MEDICO').AsString            := aNome;
                  FieldByName('NR_RG_PROFISSIONAL').AsInteger    := iRGPROFISSIONAL;
                  FieldByName('CONSELHO_PROFISSIONAL').AsInteger := iCONSELHO_PROFISSIONAL;
                  FieldByName('UF_CONSELHO').AsString            := aUF;
                  FieldByName('SIGLA_CONSELHO').AsString         := aSigla;
                  //
                  ApplyUpdates(0);
              End;
              //
              Comit(Transc);
           Except
              Rollback;
           End;
      End;
      //
      Result := M_CDMEDI;
end;

function TdmDados.GetCodigoMedico(iRG : Integer; aUF,
  aSiglaConselho: String): Integer;
var qraux : TSQLquery;
    texto : string;
begin
  result := 0;
  texto := 'Select * from MEDICO Where (NR_RG_PROFISSIONAL = :pRG) and (UF_CONSELHO = :pUF) and (SIGLA_CONSELHO = :pSIGLA)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pRG').AsInteger   := iRG;
      Params.ParamByName('pUF').AsString    := aUF;
      Params.ParamByName('pSIGLA').AsString := aSiglaConselho;
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByName('ID_MEDICO').AsInteger;
    finally
      free;
    end;
end;

function TdmDados.GetCodigoTipoDoc(aDescricao: String): Integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select ID_DOCUMENTO, DESCRICAO from TIPO_DOCUMENTO Where (DESCRICAO = :pNOME)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pNOME').AsString  := aDescricao;
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByName('ID_DOCUMENTO').AsInteger;
    finally
      free;
    end;
end;

function TdmDados.GetCodigoOrgao(aDescricao: String): Integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select ID_ORGAO, SIGLA_ORGAO from ORGAO_EXPEDIDOR Where (SIGLA_ORGAO = :pNOME)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pNOME').AsString  := aDescricao;
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByName('ID_ORGAO').AsInteger;
    finally
      free;
    end;
end;

function TdmDados.GetCodigoConselhoProfissional(
  aDescricao: String): Integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select ID_CONSELHO, SIGLA from CONSELHOPROFISSIONAL Where (SIGLA = :pSIGLA)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pSIGLA').AsString  := aDescricao;
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByName('ID_CONSELHO').AsInteger;
    finally
      free;
    end;
end;

function TdmDados.GetValidarIdenOrgaoUF(aIdentidade, aUF: String;
  iOrgao : Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  Result := False;
  texto := 'Select * from COMPRADOR Where (NR_DOCUMETO = :pNRDOCUMETO)';
  //
  If (iOrgao <> 0) Then
     texto := texto + ' and (ORGAO_EXPEDIDOR = '+QuotedStr(InttoStr(iOrgao))+') ';
  //
  If not uFuncoes.Empty(aUF) Then
     texto := texto + ' and (UF_EMISSOA_DOC = '+QuotedStr(aUF)+') ';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pNRDOCUMETO').AsString  := aIdentidade;
      Open;
      //
      If Not (IsEmpty) Then
          Result := True;
    finally
      free;
    end;
end;

function TdmDados.GetCodigoIdenOrgaoUF(aIdentidade, aUF: String;
  iOrgao: Integer): Integer;
var qraux : TSQLquery;
    texto : string;
begin
  Result := 0;
  texto := 'Select * from COMPRADOR Where (NR_DOCUMETO = :pNRDOCUMETO)';
  texto := texto + ' and (ORGAO_EXPEDIDOR = '+QuotedStr(InttoStr(iOrgao))+') ';
  texto := texto + ' and (UF_EMISSOA_DOC = '+QuotedStr(aUF)+') ';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pNRDOCUMETO').AsString  := aIdentidade;
      Open;
      //
      If Not (IsEmpty) Then
          Result := FieldByName('ID_COMPRADOR').AsInteger;
    finally
      free;
    end;
end;

function TdmDados.GetCodigoCRMNumeroUF(aNumero: Integer; aConselho,
  aUF: String): Integer;
var qraux : TSQLquery;
    texto : string;
begin
  Result := 0;
  texto := 'Select * from MEDICO Where (NR_RG_PROFISSIONAL = :pNRDOCUMETO)';
  texto := texto + ' and (SIGLA_CONSELHO = '+QuotedStr(aConselho)+') ';
  texto := texto + ' and (UF_CONSELHO = '+QuotedStr(aUF)+') ';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pNRDOCUMETO').AsInteger  := aNumero;
      Open;
      //
      If Not (IsEmpty) Then
          Result := FieldByName('ID_MEDICO').AsInteger;
    finally
      free;
    end;
end;

function TdmDados.GetValidarCRMNumeroUF(aNumero: Integer; aConselho,
  aUF: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  Result := False;
  texto := 'Select * from MEDICO Where (NR_RG_PROFISSIONAL = :pNRDOCUMETO)';
  //
  If not uFuncoes.Empty(aConselho) Then
     texto := texto + ' and (SIGLA_CONSELHO = '+QuotedStr(aConselho)+') ';
  //
  If not uFuncoes.Empty(aUF) Then
     texto := texto + ' and (UF_CONSELHO = '+QuotedStr(aUF)+') ';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pNRDOCUMETO').AsInteger  := aNumero;
      Open;
      //
      If Not (IsEmpty) Then
          Result := True;
    finally
      free;
    end;
end;

function TdmDados.OpenbdNew : Boolean;
begin
     try
      With sqlSNGPN do
      begin
        if Connected then
          begin
               CloseDataSets;
               Connected := False;
          end;
        //
        Connected := True;
       End;
       Result := true;
     Except
          Result := False;
     End;
end;

function TdmDados.VerificarNotaEntrada(aCNPJ : String; iLoja, aNota : integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select ID_LOJA, CNPJ_ORIGEM, NR_NOTAFISCAL from ENTRADA_MEDICAMENTOS Where (NR_NOTAFISCAL = :pNOTA) and (CNPJ_ORIGEM = :pCNPJ) and (ID_LOJA = :pLOJA)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pNOTA').AsInteger := aNota;
      Params.ParamByName('pCNPJ').AsString  := aCNPJ;
      Params.ParamByName('pLOJA').AsInteger := iLoja;
      Open;
      //
      If Not (IsEmpty) Then
          result := True;
    finally
      free;
    end;
end;

procedure TdmDados.sqlSNGPNBeforeConnect(Sender: TObject);
Var
	ConfigIni : TIniFile;
	Path, aFile : String;
Begin
  aFile := ExtractFilePath(ParamStr(0)) + 'fbclient.dll';
  sqlSNGPN.VendorLib := aFile;
	ConfigIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
	sqlSNGPN.Params.Values['Database'] := ConfigIni.ReadString('CONFIG','DATABASE','');
	ConfigIni.Free;
end;

function TdmDados.VerificarQuantLojas: Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select Count(*) as QUANT from EMPRESAS';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Open;
      //
      If Not (IsEmpty) and (FieldByName('QUANT').AsInteger > 1) Then
          result := True;
    finally
      free;
    end;
end;

function TdmDados.GetValidarCNPJ(aOrigem, aDestino: String): Boolean;
begin
     If (aOrigem = aDestino) Then
         Result := true
     Else
         Result := False;
end;

function TdmDados.GetCNPJDestino(iLoja: Integer): String;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select EMP_CODIGO, EMP_CNPJ from EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger  := iLoja;
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByName('EMP_CNPJ').AsString;
    finally
      free;
    end;
end;

function TdmDados.ExcluirLoteProdutoEstoque(iLoja: Integer; aProduto,
  aLote: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
    Result := False; 
    texto := 'Delete from ESTOQUE Where (EST_CDLOJA = :pCDLOJA) and (EST_CDPROD = :pCDPROD) and (EST_NRLOTE = :pNRLOTE)';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
    try
      try
          Start;
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pCDLOJA').AsInteger := iLoja;
          Params.ParamByName('pCDPROD').AsString  := aProduto;
          Params.ParamByName('pNRLOTE').AsString  := aLote;
          ExecSQL();
          //
          Comit(Transc);
          Result := True;
       Except
          Rollback;
       End;
    finally
      free;
    end;
end;

function TdmDados.GetVefificaVendaMedico(iMedico: Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  Result := False;
  texto := 'Select count(*) as QUANT from VENDAS V Where (V.id_prescritor = :pCODIGO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger  := iMedico;
      Open;
      //
      If Not (IsEmpty) Then
       If (FieldByname('QUANT').AsInteger > 0) Then
            result := True;
    finally
      free;
    end;
end;

function TdmDados.GetVerificaVendaCliente(iCliente: Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  Result := False;
  texto := 'Select count(*) as QUANT from VENDAS V Where (V.id_comprador = :pCODIGO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger  := iCliente;
      Open;
      //
      If Not (IsEmpty) Then
       If (FieldByname('QUANT').AsInteger > 0) Then
            result := True;
    finally
      free;
    end;
end;

function TdmDados.AdicionarHistoricoProduto(iLoja, iMotivo, iUsuario,
  iDocumento: Integer; aProduto, aLote, aHoraMov, aTipoMov,
  aTipoES: String; fQuantAnterior, fQuantMovimento, fQuantAtual: Double;
  aDataMov: TDatetime): Boolean;
begin
     Result := false;
     try
         {  With cdsHistorico do
           begin
                Close;
                Params[0].AsInteger := -1;
                Params[1].AsInteger := iLoja;
                Open;
                //
                Append;
                FieldByName('HIS_LOJA').AsInteger   := iLoja;
                FieldByName('HIS_PRODUTO').AsString := aProduto;
                FieldByName('HIS_NRLOTE').AsString  := aLote;
                //FieldByName('HIS_UNIDADE').AsString := aUnidade;
                FieldByName('HIS_DATA').AsDateTime  := aDataMov;
                FieldByName('HIS_HORA').AsString    := aHoraMov;
                FieldByName('HIS_TIPO_MOVIMENTO').AsString := aTipoMov;
                FieldByName('HIS_TIPO').AsString    := aTipoES;
                if (iDocumento > 0) Then
                   FieldByName('HIS_DOCUMENTO').AsInteger := iDocumento;
                FieldByName('HIS_ANTERIOR').AsFloat := fQuantAnterior;
                FieldByName('HIS_MOVIMENTO').AsFloat:= fQuantMovimento;
                FieldByName('HIS_ATUAL').AsFloat    := fQuantAtual;
                FieldByName('HIS_MOTIVO').AsInteger := iMotivo;
                FieldByName('HIS_USUARIO').AsInteger:= iUsuario;
                //
                ApplyUpdates(0);
                //
                Result := True;
           End;     }
     Except
          on e: exception do
          begin
               Application.MessageBox(PChar('Erro ao tentar incluir historico de produto! Erro:'+#13
                       + E.Message), 'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
          End;
     End;
end;

function TdmDados.AbrirInvertario(iLoja: Integer): Boolean;
begin
     Result := False;
     //
     With cdsInvertario do
     begin
          Close;
          Params[0].AsInteger := iLoja;
          Open;
          //
          If not (IsEmpty) Then
             Result := True;
     End;
end;

function TdmDados.GerarXMLInvertario(iLoja: Integer; aCDSEstoque: TClientDataSet;
aNomeArquivo : String; aDataInvertario : TDatetime): Boolean;
Var
   aCNPJ, aCPFTransmissor, M_DTATUAL, aClasseTerapeutica : String;
   StringList: TStringList;
   aCodMSProduto, aLote, aQuantidade, aUnidade : String;
begin
    Result := false;
    //
    M_DTATUAL := uFuncoes.FormatarData(DatetoStr(aDataInvertario));
    RefreshCDS(cdsConfig);
    aCPFTransmissor := cdsConfigCFG_CPF.AsString;
    //
    FilterCDS(cdsLojas, fsInteger, InttoStr(iLoja));
    //
    If not (cdsLojas.IsEmpty) Then
        aCNPJ := cdsLojasEMP_CNPJ.AsString
    Else
        aCNPJ := cdsConfigCFG_CNPJ.AsString;
    //
    With aCDSEstoque do
    begin
          try
               StringList := TStringList.Create;
               StringList.Add('<?xml version="1.0" encoding="iso-8859-1" ?>');
               StringList.Add('<mensagemSNGPCInventario xmlns="urn:sngpc-schema">');
               StringList.Add('<cabecalho>');
               StringList.Add('<cnpjEmissor>'+uFuncoes.Alltrim(aCNPJ)+'</cnpjEmissor>');
               StringList.Add('<cpfTransmissor>'+uFuncoes.Alltrim(aCPFTransmissor)+'</cpfTransmissor>');
               StringList.Add('<data>'+M_DTATUAL+'</data>');
               StringList.Add('</cabecalho>');
               StringList.Add('<corpo>');
               //
               First;
               StringList.Add('<medicamentos>');
               //
               While not (Eof) do
               begin
                    //
                  if (aCDSEstoque.FieldByname('EST_QUANTIDADE').AsFloat > 0) Then
                  begin
                    aCodMSProduto := uFuncoes.Alltrim(aCDSEstoque.FieldByname('EST_CDPROD').AsString);
                    aLote         := uFuncoes.Alltrim(aCDSEstoque.FieldByname('EST_NRLOTE').AsString);
                    aQuantidade   := aCDSEstoque.FieldByname('EST_QUANTIDADE').AsString;

                    //
                    FilterCDS(cdsProdutos, fsString, aCodMSProduto);
                    if (cdsProdutos.IsEmpty) then
                        raise Exception.Create('Produto '+aCodMSProduto+' não encontrado!!!');
                    //
                    aUnidade      := cdsProdutos.FieldByname('PRO_UNIDADE_MEDIDA').AsString;
                    //
                    If uFuncoes.Empty(aUnidade) then
                       raise Exception.Create('Produto '+aCodMSProduto+' unidade de medida inválido.');
                    //
                    if (cdsProdutos.FieldByname('PRO_ANTIMICROBIANOS').AsString = 'S') Then
                       aClasseTerapeutica := '1'
                    Else
                       aClasseTerapeutica := '2';
                    //
                    StringList.Add('   <entradaMedicamentos>');
                    StringList.Add('      <medicamentoEntrada>');
                    StringList.Add('         <classeTerapeutica>'+aClasseTerapeutica+'</classeTerapeutica>');
                    StringList.Add('         <registroMSMedicamento>'+PChar(aCodMSProduto)+'</registroMSMedicamento>');
                    StringList.Add('         <numeroLoteMedicamento>'+PChar(aLote)+'</numeroLoteMedicamento>');
                    StringList.Add('         <quantidadeMedicamento>'+aQuantidade+'</quantidadeMedicamento>');
                    StringList.Add('         <unidadeMedidaMedicamento>'+aUnidade+'</unidadeMedidaMedicamento>');
                    //
                    StringList.Add('      </medicamentoEntrada>');
                    StringList.Add('   </entradaMedicamentos>');
                  End;
                    // PROXIMO
                    aCDSEstoque.Next;
               End;
               //
               StringList.Add('</medicamentos>');
               //
               StringList.Add('<insumos>');
               StringList.Add('</insumos>');
               StringList.Add('</corpo>');
               StringList.Add('</mensagemSNGPCInventario>');
               // salva Html
               StringList.SaveToFile( aNomeArquivo );
               StringList.Free;
               //
               Result := true;
          Except
               on e: exception do
               begin
                   Application.MessageBox(PChar('Erro ao tentar gera arquivo! Erro:'+#13
                       + E.Message), 'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
               End;
          End;
    End;
end;

function TdmDados.GetEstoqueAtualProduto(iLoja: Integer; aProduto,
  aLote: String): Double;
var qraux : TSQLquery;
    texto : string;
begin
  Result := 0;
  texto := 'Select EST_CDLOJA, EST_CDPROD, EST_NRLOTE, EST_QUANTIDADE from ESTOQUE Where (EST_CDLOJA = :pLOJA) and (EST_CDPROD = :pCDPROD) AND (EST_NRLOTE = :pLOTE)';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pLOJA').AsInteger   := iLoja;
      Params.ParamByName('pCDPROD').AsString  := aProduto;
      Params.ParamByName('pLOTE').AsString    := aLote;
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByName('EST_QUANTIDADE').AsFloat;
    finally
      free;
    end;
end;

function TdmDados.ProcurarValor(aValor, aCampo, aTabela: String): Boolean;
Var
    qryBanco : TSQLQuery;
    texto : String;
begin
     result := False;
     texto  := 'select '+aCampo+' from '+aTabela+' where ('+aCampo+' = :pValor)';
     //
     qryBanco := TSQLQuery.Create(nil);
     with qryBanco do
      try
           SQLConnection := sqlSNGPN;
           Close;
           SQL.Add(texto);
           Params.ParamByName('pValor').AsString := aValor;
           Open;
           //
           If not (IsEmpty) Then
                Result := True;
      Finally
         Free;
      End;
end;

function TdmDados.AbrirListaEstoque(iLoja: Integer): Boolean;
begin
     Result := False;
     With cdsListaEstoque do
     begin
          DisableControls;
          Close;
          Params[0].AsInteger := iLoja;
          open;
          EnableControls;
          //
          if not (IsEmpty) Then
             Result := True;
     End;
end;

function TdmDados.GetProdutoLoteEstoqueHistorico(iLoja: Integer; aCodigo,
  aLote: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  //texto := 'Select * from ESTOQUE_HISTORICO Where (EST_CDLOJA = :pLOJA) and (EST_CDPROD = :pCDPROD) AND (EST_NRLOTE = :pLOTE)';
  texto := 'Select * from ESTOQUE Where (EST_CDLOJA = :pLOJA) and (EST_CDPROD = :pCDPROD) AND (EST_NRLOTE = :pLOTE)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pLOJA').AsInteger   := iLoja;
      Params.ParamByName('pCDPROD').AsString  := aCodigo;
      Params.ParamByName('pLOTE').AsString    := aLote;
      Open;
      //
      If Not (IsEmpty) Then
          result := True;
    finally
      free;
    end;
end;

function TdmDados.ExcluirLoteProdutoEstoqueHistorico(iLoja: Integer;
  aProduto, aLote: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
    Result := False;

    texto := 'Delete from ESTOQUE_HISTORICO Where (EST_CDLOJA = :pCDLOJA) and (EST_CDPROD = :pCDPROD) and (EST_NRLOTE = :pNRLOTE)';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
    try
      try
          Start;
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pCDLOJA').AsInteger := iLoja;
          Params.ParamByName('pCDPROD').AsString  := aProduto;
          Params.ParamByName('pNRLOTE').AsString  := aLote;
          ExecSQL();
          //
          Comit(Transc);
          Result := True;
       Except
          Rollback;
       End;
    finally
      free;
    end;
end;

procedure TdmDados.cdsListaEstoqueCalcFields(DataSet: TDataSet);
begin
    { If (cdsListaEstoque.State = dsInternalCalc) then
       if not ufuncoes.Empty(cdsListaEstoqueEST_CDPROD.AsString) Then
           cdsListaEstoquePRO_DESCRICAO.AsString := GetNomeProduto(cdsListaEstoqueEST_CDPROD.AsString);}
end;


function TdmDados.AbreturaInvertario(iLoja: Integer;
  aImportaInvertario, aCPF : String): Boolean;
Var
   M_QTANTE, M_QTMOVI, M_QTATUA : Double;
   aCodigo, aLote, aTipoEntradaSaida, aMotivoAlteracao, aHoraMov, aDtVencimento : String;
   iMotivo, iUsuario : Integer;
   aDataMov, adataUltimo  : TDatetime;
   aDescricao, aNomeUsuario, aHora : String;
begin
     Result := False;
     RefreshCDS(cdsConfig);
     aDataMov := Date();
     aHoraMov := uFuncoes.RemoveChar(TimetoStr(Time));
     iUsuario := StrtoInt(uFormMainSngpc.M_CDUSUA);
     aNomeUsuario := dmDados.GetNomeUsuario(iUsuario);
     aHora := Copy(TimetoStr(Time),1,5);
     //
     if not uFuncoes.Empty(ufuncoes.RemoveChar(cdsConfigCFG_DTULTIMO_ARQUIVO_VALIDADO.AsString)) then
          adataUltimo  := cdsConfigCFG_DTULTIMO_ARQUIVO_VALIDADO.AsDateTime
      Else
          adataUltimo  := StrtoDate('15/04/2013');
     //
     With cdsListaEstoqueAtual do
     begin
          Close;
          Params[0].AsInteger := iLoja;
          Open;
          //
          If not (IsEmpty) Then
          begin
              First;
              Start;
              try
                if (aImportaInvertario = 'N') Then
                begin
                   While not (Eof) do
                    begin
                        aCodigo := FieldByName('EST_CDPROD').AsString;
                        aLote   := FieldByName('EST_NRLOTE').AsString;
                        //
                        M_QTANTE := FieldByName('EST_QUANTIDADE').AsFloat;
                        M_QTMOVI := -FieldByName('EST_QUANTIDADE').AsFloat;
                        if not uFuncoes.Empty(uFuncoes.RemoveChar(FieldByName('EST_DTVENCIMENTO').AsString)) Then
                             aDtVencimento := FieldByName('EST_DTVENCIMENTO').AsString;
                        // Historico
                        M_QTATUA :=  0;
                        //  Historico
                        iMotivo := 7;  // Abertura de Inventario
                        aTipoEntradaSaida := 'S';  // E - ENtrada/ S - Saída
                        aMotivoAlteracao  := 'A';  // A - Abertura de Inventario
                        //
                        {AdicionarHistoricoProduto(iLoja, iMotivo,  iUsuario, 0,
                                   aCodigo,
                                   aLote, aHoraMov, aMotivoAlteracao, aTipoEntradaSaida,
                                   M_QTANTE, M_QTMOVI, M_QTATUA, aDataMov);   }
                        //
                        Next;
                   End;   //fim-do-enquanto
                   //
                   ZeraEstoque(iLoja);
                   // Limpar tabela ESTOQUE
                   LimparLoteProdutoEstoqueHistorico(iLoja, aCodigo, aLote, 'T');
                   // Limpar historico de produto superior a data da ultima validação + 1
                   //LimparHistoricoProduto(iLoja, adataUltimo);
                   aNomeUsuario := dmDados.GetNomeUsuario(iUsuario);
                   aDescricao   := 'HORA:'+aHora+ ', usuário '+aNomeUsuario +' abriu inventário e NÃO importou estoque anterior.';
                   //
                   if not AddLogUsuario(iUsuario, Date(), aDescricao) Then
                    begin
                         ShowMessage('Ocorreu um erro ao tentar grava log de usuário.' );
                    End;
                End
                Else       // SEnão IMportar
                begin
                     // Limpa estoque historico
                     LimparLoteProdutoEstoqueHistorico(iLoja, aCodigo, aLote, 'T');
                     // Limpar historico de produto superior a data da ultima validação + 1
                     //LimparHistoricoProduto(iLoja, adataUltimo);
                     aNomeUsuario := dmDados.GetNomeUsuario(iUsuario);
                     aDescricao   := 'HORA:'+aHora+ ', usuário '+aNomeUsuario +' reabriu inventário com estoque anterior.';
                     //
                     if not AddLogUsuario(iUsuario, Date(), aDescricao) Then
                      begin
                          ShowMessage('Ocorreu um erro ao tentar grava log de usuário.' );
                      End;
                End;
                //
                cdsConfig.Edit;
                cdsConfigCFG_INVERTARIO_ABERTO_SISTEMA.AsString  := 'S';
                cdsConfigCFG_FLINVENTARIO.AsString := 'S';
                cdsConfigCFG_DT_INVERTARIO_ABERTO_SIS.AsDateTime := Date();
                cdsConfigCFG_CPF.AsString := aCPF;
                cdsConfigCFG_LOJA_PADRAO.AsInteger := iLoja;
                cdsConfig.ApplyUpdates(0);
                //
                Comit(Transc);
                //
                Result := true;
              Except
                 Rollback;
              End;
          End     // fim-se vazio
          Else
          begin
              Start;
              try
                cdsConfig.Edit;
                cdsConfigCFG_INVERTARIO_ABERTO_SISTEMA.AsString  := 'S';
                cdsConfigCFG_FLINVENTARIO.AsString := 'S';
                cdsConfigCFG_DT_INVERTARIO_ABERTO_SIS.AsDateTime := Date();
                cdsConfigCFG_CPF.AsString := aCPF;
                cdsConfigCFG_LOJA_PADRAO.AsInteger := iLoja;
                //
                aNomeUsuario := dmDados.GetNomeUsuario(iUsuario);
                aDescricao   := 'HORA:'+aHora+ ', usuário '+aNomeUsuario +' abriu inventário.';
                //
                if not AddLogUsuario(iUsuario, Date(), aDescricao) Then
                 begin
                         ShowMessage('Ocorreu um erro ao tentar grava log de usuário.' );
                 End;
                //
                cdsConfig.ApplyUpdates(0);
                //
                Comit(Transc);
                //
                Result := true;
              Except
                 Rollback;
              End;
          End;
     End;     // With cdsListaEstoqueAtual
end;


function TdmDados.LimparLoteProdutoEstoqueHistorico(iLoja: Integer;
  aProduto, aLote, aOpcao: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
      Result := False;
      if (aOpcao = 'T') Then
          texto := 'Delete from ESTOQUE_HISTORICO'
      Else
          texto := 'Delete from ESTOQUE_HISTORICO Where (EST_CDLOJA = :pCDLOJA) and (EST_CDPROD = :pCDPROD) and (EST_NRLOTE = :pNRLOTE)';
      QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          if (aOpcao <> 'T') Then
          begin
               Params.ParamByName('pCDLOJA').AsInteger := iLoja;
               Params.ParamByName('pCDPROD').AsString  := aProduto;
               Params.ParamByName('pNRLOTE').AsString  := aLote;
          End;
          ExecSQL();
          //
          Result := True;
      finally
          free;
      end;
end;

procedure TdmDados.dspListaEstoqueAtualGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'ESTOQUE';
end;

function TdmDados.UpdateLoteProdutoEstoqueHistorico(iLoja,
  iUsuario: Integer; aProduto, aLote, aHora, aDataVencimento : String;
  aDataMov : TDatetime; fQuantidade: Double): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
      Result := False;
      If (GetProdutoLoteEstoqueHistorico(iLoja, aProduto, aLote)) then
      begin
           texto := 'Update ESTOQUE_HISTORICO set EST_DTMOVIMENTO = :pDTMOVI, EST_HOMOVIMENTO = :pHORA, EST_USUARIO = :pUSUARIO ';
           texto := texto + ' Where (EST_CDLOJA = :pCDLOJA) and (EST_CDPROD = :pCDPROD) and (EST_NRLOTE = :pNRLOTE) and (EST_SITUACAO = '+QuotedStr('A')+')';
           QrAux := TSqlquery.Create(nil);
           with QrAux do
           try
               SQLConnection := sqlSNGPN;
               sql.Add(texto);
               Params.ParamByName('pCDLOJA').AsInteger := iLoja;
               Params.ParamByName('pCDPROD').AsString  := aProduto;
               Params.ParamByName('pNRLOTE').AsString  := aLote;
               //
               Params.ParamByName('pDTMOVI').AsDate  := aDataMov;
               Params.ParamByName('pHORA').AsString  := aHora;
               Params.ParamByName('pUSUARIO').AsInteger := iUsuario;
               //Params.ParamByName('pQUANT').AsFloat  := fQuantidade;
               //
               ExecSQL();
               //
               Result := True;
           finally
               free;
           end;
      End
      Else
      begin
           texto := 'Insert Into ESTOQUE_HISTORICO (EST_CDLOJA, EST_CDPROD, EST_NRLOTE, EST_QUANTIDADE, EST_DTMOVIMENTO, EST_HOMOVIMENTO, EST_USUARIO, EST_SITUACAO ';
           if not ufuncoes.Empty(aDataVencimento) Then
               texto := texto + ', EST_DTVENCIMENTO ';
           texto := texto + ') ';
           texto := texto + 'Values (:pCDLOJA, :pCDPROD, :pNRLOTE, :pQUANTIDADE, :pDTMOVIMENTO, :pHOMOVIMENTO, :pUSUARIO, :pSITUACAO';
           if not ufuncoes.Empty(aDataVencimento) Then
               texto := texto + ', :pDTVENCIMENTO ';
           texto := texto + ') ';
           QrAux := TSqlquery.Create(nil);
           with QrAux do
           try
               SQLConnection := sqlSNGPN;
               sql.Add(texto);
               Params.ParamByName('pCDLOJA').AsInteger := iLoja;
               Params.ParamByName('pCDPROD').AsString  := aProduto;
               Params.ParamByName('pNRLOTE').AsString  := aLote;
               //
               Params.ParamByName('pDTMOVIMENTO').AsDate  := aDataMov;
               Params.ParamByName('pHOMOVIMENTO').AsString  := aHora;
               Params.ParamByName('pUSUARIO').AsInteger := iUsuario;
               Params.ParamByName('pQUANTIDADE').AsFloat  := fQuantidade;
               Params.ParamByName('pSITUACAO').AsString := 'F';
               if not ufuncoes.Empty(aDataVencimento) Then
                  Params.ParamByName('pDTVENCIMENTO').AsDate := StrtoDate(aDataVencimento);
               //
               ExecSQL();
               //
               Result := True;
           finally
               free;
           end;
      End;
end;

function TdmDados.FecharInvertario(iLoja: Integer;
  aDtMovi, aDataFechamento : TDatetime): Boolean;
Var
   fQuantAtual, fQuantEntrada, fQuantVenda, fQuantPerda, fQuantTransferencia : Double;
   aProduto, aLote, aTipoEntradaSaida, aMotivoAlteracao, aHoraMov, aDtVencimento, aNomeUsuario, aDescricao : String;
   iMotivo, iUsuario : Integer;
begin
    Result := false;
    RefreshCDS(cdsConfig);
    iUsuario := Strtoint(uFormMainSngpc.M_CDUSUA);
    aHoraMov := TimetoStr(Time);
    //
    With cdsFecharInvertario do
    begin
         Close;
         Params[0].AsInteger := iLoja;
         //Params[1].AsString  := 'A';
         Open;
    End;
    //
    If not (cdsFecharInvertario.IsEmpty) Then
    begin
       with cdsFecharInvertario do
        begin
           With cdsHisEstoque do
            begin
                 Close;
                 Params.ParamByName('pLOJA').AsInteger := iLoja;
                 Params.ParamByName('pDATA').AsDate    := aDataFechamento;
                 open;
            End;
          //
          First;
          //
          Start;
          try
                RefreshCDS(cdsConfig);
                cdsConfig.Edit;
                cdsConfigCFG_DATA_ATUAL.AsDateTime := aDataFechamento;
                cdsConfig.Post;
                //
                With cdsFecharInvertario do
                begin
                       If not (IsEmpty) then
                       begin
                            //
                            First;
                            While not (Eof) do
                            begin
                                 iLoja    := FieldByname('EST_CDLOJA').AsInteger;
                                 aProduto := FieldByname('EST_CDPROD').AsString;
                                 aLote    := uFuncoes.Alltrim(FieldByname('EST_NRLOTE').AsString);
                                 fQuantAtual := FieldByname('EST_QUANTIDADE').AsFloat;
                                 aDtVencimento := FieldByname('EST_DTVENCIMENTO').AsString;
                                 //
                                 fQuantEntrada := GetTotalEntradaLoteProduto(iLoja, aProduto, aLote);
                                 fQuantVenda   := GetTotalVendaLoteProduto(iLoja, aProduto, aLote);
                                 fQuantPerda   := GetTotalPerdaLoteProduto(iLoja, aProduto, aLote);
                                 fQuantTransferencia := GetTotalTransferenciaProduto(iLoja, aProduto, aLote);
                                 //
                                 AddRegistroHistoricoEstoque(iLoja, iUsuario, aProduto,
                                         aLote, aDtVencimento, fQuantAtual, fQuantEntrada, fQuantVenda, fQuantPerda, fQuantTransferencia);
                                 //
                                 Next;
                            End;      // fim-do-enquanto
                            //
                            dmDados.cdsHisEstoque.ApplyUpdates(0);
                       End;     // If not (IsEmpty) then

                 End;   // With cdsFecharInvertario do
              //
              cdsConfig.Edit;
              cdsConfig.FieldByName('CFG_DATA_ATUAL').AsDateTime   := aDataFechamento+1;
              cdsConfig.FieldByName('CFG_FLINVENTARIO').AsString   := 'N';
              cdsConfig.FieldByName('CFG_DTINVENTARIO').AsDateTime := aDataFechamento;
              cdsConfig.FieldByName('CFG_DT_FECHAMENTO_INV_SISTEMA').AsDateTime := aDtMovi;
              cdsConfig.FieldByName('CFG_DTULTIMO_ARQUIVO_VALIDADO').AsDateTime := aDtMovi;
              cdsConfig.ApplyUpdates(0);
              //
              aNomeUsuario := dmDados.GetNomeUsuario(iUsuario);
              aDescricao   := 'HORA:'+Copy(aHoraMov,1,5)+ ', usuário '+aNomeUsuario +' fechou inventário com a data: '+DatetoStr(aDataFechamento);
              //
              if not dmDados.AddLogUsuario(iUsuario, Date(), aDescricao) Then
               begin
                    ShowMessage('Ocorreu um erro ao tentar grava log de usuário.' );
               End;
              //
              Comit(Transc);
              //
              RefreshCDS(cdsConfig);
              Result := True;
          Except
              Rollback;
          End;
        End;   // with-cdsFecharInvertario
    End   // fim-se not (cdsFecharInvertario.IsEmpty) Then
    Else
       raise Exception.Create('Seu inventário está vazio!!!');
end;

function TdmDados.AdicionaProdutoEstoqueNovo(iLoja: Integer; aProduto,
  aLote: String; fQuant: Double; aDataVenc: String): Boolean;
begin
      Result := False;
      With cdsEstoque do
        begin
             Close;
             Params[0].AsInteger := iLoja;
             Params[1].AsString  := aProduto;
             Params[2].AsString  := aLote;
             Open;
             //
             If not (IsEmpty) then
              begin
                   Edit;
                   FieldByName('EST_QUANTIDADE').AsFloat :=
                     FieldByName('EST_QUANTIDADE').AsFloat + fQuant;
                   ApplyUpdates(0);
              End
              Else
              begin
                   Append;
                   FieldByName('EST_CDLOJA').AsInteger := iLoja;
                   FieldByName('EST_CDPROD').AsString  := aProduto;
                   FieldByName('EST_NRLOTE').AsString  := aLote;
                   FieldByName('EST_QUANTIDADE').AsFloat := fQuant;
                   if not uFuncoes.Empty(aDataVenc) Then
                      FieldByName('EST_DTVENCIMENTO').AsDateTime := Strtodate(aDataVenc);
                   ApplyUpdates(0);
              End;
              //
              Close;
        End;
       //
       Result := True;
end;

procedure TdmDados.dspMovimentoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'MOVIMENTOS';
end;

function TdmDados.AbrirMovimento(iLoja, iUsuario: Integer;
  aDataMov: TDatetime): Boolean;
begin
      result := false;
      With cdsMovimento do
      begin
           Close;
           Params[0].AsInteger := -1;
           Open;
           //
           if (IsEmpty) then
           begin
                RefreshCDS(cdsConfig);
                cdsConfig.Edit;
                cdsConfigCFG_SEQUENCIA_MOVIMENTO.AsInteger := cdsConfigCFG_SEQUENCIA_MOVIMENTO.AsInteger + 1;
                //
                try
                   Start;
                   Append;
                   FieldByName('MOV_NUMERO').AsInteger := cdsConfigCFG_SEQUENCIA_MOVIMENTO.AsInteger;
                   FieldByName('MOV_LOJA').AsInteger   := iLoja;
                   FieldByName('MOV_DATA').AsDateTime  := aDataMov;
                   FieldByName('MOV_DTABERTURA').AsDateTime := Date();
                   FieldByName('MOV_HOABERTURA').AsString   := Copy(TimetoStr(time),1,5);
                   FieldByName('MOV_USUARIO').AsInteger := iUsuario;
                   //
                   ApplyUpdates(0);
                   //
                   cdsConfigCFG_DATA_ATUAL.AsDateTime := aDataMov;
                   cdsConfig.ApplyUpdates(0);
                   //
                   Comit(Transc);
                   Result := true;
                Except
                   Rollback;
                End;
           End;
      End;
end;

function TdmDados.FecharDiaMovimento(iNumeroMov, iLoja, iUsuario: Integer;
  aDataMov: TDatetime): Boolean;
Var
   aDtMovi : TDatetime;
begin
      result := false;
      With cdsMovimento do
      begin
           Close;
           Params[0].AsInteger := iNumeroMov;
           Open;
           //
           if not (IsEmpty) then
           begin
                RefreshCDS(cdsConfig);
                //
                try
                   Start;
                   Edit;
                   aDtMovi := FieldByName('MOV_DATA').AsDateTime + 1;
                   FieldByName('MOV_DTFECHAMENTO').AsDateTime := aDataMov;
                   FieldByName('MOV_HOFECHAMENTO').AsString   := Copy(TimetoStr(time),1,5);
                   FieldByName('MOV_SITUACAO').AsString := 'F';
                   FieldByName('MOV_USUARIO_FECHOU').AsInteger := iUsuario;
                   //
                   ApplyUpdates(0);
                   //
                   cdsConfig.Edit;
                   cdsConfigCFG_DATA_ATUAL.AsDateTime := aDtMovi;
                   cdsConfig.ApplyUpdates(0);
                   //
                   AtualizaEstoqueDia(iLoja, iUsuario, FieldByName('MOV_DATA').AsDateTime);
                   //
                   Comit(Transc);
                   Result := AbrirMovimento(iLoja, iUsuario, aDtMovi);
                Except
                   Rollback;
                End;
           End;
      End;
end;

function TdmDados.ZeraEstoque(iLoja: Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
      Result := False;
      texto := 'Delete from ESTOQUE Where (EST_CDLOJA = :pLOJA) ';

      QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pLOJA').AsInteger := iLoja;
          ExecSQL();
          //
          Result := True;
      finally
          free;
      end;
end;

function TdmDados.GetDataMovimentoAtual(iLoja: Integer): TDateTime;
var qraux : TSQLquery;
    texto : string;
begin
      Result := 0;
      texto := 'Select MOV_NUMERO, MOV_LOJA, MOV_DATA, MOV_SITUACAO from MOVIMENTOS Where (MOV_LOJA = :pLOJA) and (MOV_SITUACAO = '+QuotedStr('A')+')';
      QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pLOJA').AsInteger := iLoja;
          Open;
          //
          if not (IsEmpty) Then
              Result := FieldByname('MOV_DATA').AsDateTime;
      finally
          free;
      end;
end;

function TdmDados.GetNumeroMovimentoAtual(iLoja: Integer): Integer;
var qraux : TSQLquery;
    texto : string;
begin
      Result := 0;
      texto := 'Select MOV_NUMERO, MOV_LOJA, MOV_DATA, MOV_SITUACAO from MOVIMENTOS Where (MOV_LOJA = :pLOJA) and (MOV_SITUACAO = '+QuotedStr('A')+')';
      QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pLOJA').AsInteger := iLoja;
          Open;
          //
          if not (IsEmpty) Then
              Result := FieldByname('MOV_NUMERO').AsInteger;
      finally
          free;
      end;
end;

function TdmDados.AtualizaEstoqueDia(iLoja, iUsuario: Integer;
  aDataMov: TDatetime): Boolean;
Var
   aHoraMov : String;
begin
     Result := False;
     aHoraMov := TimetoStr(time);
     try
           With cdsHisEstoque do
           begin
                 Close;
                 Params[0].AsInteger := iLoja;
                 Params[1].AsDate    := aDataMov;
                 Open;
           End;
           //
           With cdsListaEstoque do
           begin
                Close;
                Params[0].AsInteger := iLoja;
                Open;
                //
                If not (IsEmpty) Then
                begin
                     First;
                     //
                     While not (Eof) do
                     begin
                         cdsHisEstoque.Append;
                         cdsHisEstoqueEST_CDLOJA.AsInteger := iLoja;
                         cdsHisEstoqueEST_CDPROD.AsString  := FieldByName('EST_CDPROD').AsString;
                         cdsHisEstoqueEST_NRLOTE.AsString  := FieldByName('EST_NRLOTE').AsString;
                         cdsHisEstoqueEST_QUANTIDADE.AsFloat :=  FieldByName('EST_QUANTIDADE').AsFloat;
                         if not uFuncoes.Empty(FieldByName('EST_DTVENCIMENTO').AsString) Then
                             cdsHisEstoqueEST_DTVENCIMENTO.AsDateTime := FieldByName('EST_DTVENCIMENTO').AsDateTime;
                         cdsHisEstoqueEST_DTMOVIMENTO.AsDateTime := aDataMov;
                         cdsHisEstoqueEST_HOMOVIMENTO.AsString   := aHoraMov;
                         cdsHisEstoqueEST_USUARIO.AsInteger      := iUsuario;
                         cdsHisEstoqueEST_SITUACAO.AsString      := 'F';
                         //
                         cdsHisEstoque.Post;
                         //
                         Next;
                     End;
                     //
                     cdsHisEstoque.ApplyUpdates(0);
                End;
           End;
     Except

     End;
end;

procedure TdmDados.dspHisEstoqueGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
    TableName := 'ESTOQUE_HISTORICO';
end;

procedure TdmDados.dspItensEntradaGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName:= 'MEDICAMENTO_ENTRADA';
end;

function TdmDados.LimparMovimentoDia: Boolean;
var qraux : TSQLquery;
    texto : string;
begin

     { texto := 'Select MOV_NUMERO, MOV_LOJA, MOV_DATA, MOV_SITUACAO from MOVIMENTOS ';
      QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pLOJA').AsInteger := iLoja;
          Open;
          //
          if not (IsEmpty) Then
              Result := FieldByname('MOV_NUMERO').AsInteger;
      finally
          free;
      end;  }
end;

function TdmDados.LimparHistoricoProduto(iLoja : Integer;
  aDataMov: TDatetime): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
     Result := False;
     texto := 'Delete from HISTORICO Where (HIS_LOJA = :pLOJA) and (HIS_DATA > :pDATA)';
      QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pLOJA').AsInteger := iLoja;
          Params.ParamByName('pDATA').AsDate    := aDataMov;
          ExecSQL();
          //
          Result := True;
      finally
          free;
      end;
end;

function TdmDados.GetProximoCodigoReceitaBranca: Integer;
begin
     dmDados.RefreshCDS(dmDados.cdsConfig);
     Result := dmDados.cdsConfigCFG_CONTROLE_RECEITA_BRANCA.asInteger + 1;
end;

function TdmDados.AdicionarVendaNovo(iVenda, iLoja: Integer;
  aCdsItens: TClientDataSet): Boolean;
Var
   aProduto, aLote : String;
   fQuantidade : Double;
begin
    Result := False;
    try
      With aCdsItens do
      begin
           First;
           FilterCDS(cdsItensVendas, fsInteger, InttoStr(iVenda));
           While not (Eof) do
           begin
                cdsItensVendas.Append;
                cdsItensVendasID_VENDA.AsInteger   := iVenda;
                cdsItensVendasREGISTRO_MS.AsString := FieldByName('PRO_CODIGO').AsString;
                cdsItensVendasNUMERO_LOTE.AsString := uFuncoes.Alltrim(FieldByName('PRO_NRLOTE').AsString);
                cdsItensVendasQUANT_MEDICAMENTO.AsFloat := FieldByName('PRO_QTPROD').AsFloat;
                if not uFuncoes.Empty(FieldByName('PRO_USO_PROLOGADO').AsString) Then
                    cdsItensVendasUSO_PROLONGADO.AsString := FieldByName('PRO_USO_PROLOGADO').AsString;
                //
                aProduto := FieldByName('PRO_CODIGO').AsString;
                aLote    := uFuncoes.Alltrim(FieldByName('PRO_NRLOTE').AsString);
                fQuantidade := FieldByName('PRO_QTPROD').AsFloat;

                // Atualizar Estoque
                If not SaidaProdutoEstoque(iLoja,  aProduto, aLote, FQuantidade) Then
                    raise Exception.Create('Erro ao tentar atualizar estoque do produto: '+aProduto+ ' Lote: '+aLote);
                //cdsItensVendasBAIXA_ESTOQUE.AsString := 'S';
                //
                cdsItensVendas.Post;
                //
                Next;
           End;
           cdsItensVendas.ApplyUpdates(0);
           //
           Result := true;
      End;
    Except
        on e: exception do
          begin
              if (dmDados.sqlSNGPN.InTransaction) Then
                 dmDados.Rollback;
               raise Exception.Create('Erro ao tentar incluir do produto: '+aProduto+ ' Lote: '+aLote+#13+
                                      e.Message);
          End;
    End
end;

procedure TdmDados.dspItensVendasGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'VENDAS_MEDICAMENTOS';
end;

function TdmDados.GetEstoqueLoteProduto(iLoja: Integer; aProduto,
  aLote: String): Double;
var qraux : TSQLquery;
    texto : string;
    fQuantEstoque, fQuantEntrada, fQuantVenda, fQuantPerda, fQuantTransferencia : Double;
begin
     texto := 'Select EST_CDLOJA, EST_CDPROD, EST_NRLOTE, EST_QUANTIDADE from ESTOQUE Where (EST_CDLOJA = :pLOJA) and (EST_CDPROD = :pCDPROD) and (EST_NRLOTE = :pNRLOTE) ';
     QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pLOJA').AsInteger  := iLoja;
          Params.ParamByName('pCDPROD').AsString := aProduto;
          Params.ParamByName('pNRLOTE').AsString := aLote;
          Open;
          //
          if not (IsEmpty) Then
          begin
               fQuantEstoque := FieldByName('EST_QUANTIDADE').AsFloat;
               fQuantEntrada := GetTotalEntradaLoteProduto(iLoja, aProduto, aLote);
               fQuantVenda   := GetTotalVendaLoteProduto(iLoja, aProduto, aLote);
               fQuantPerda   := GetTotalPerdaLoteProduto(iLoja, aProduto, aLote);
               fQuantTransferencia := GetTotalTransferenciaProduto(iLoja, aProduto, aLote);
               //
               Result := fQuantEstoque + fQuantEntrada - fQuantVenda - fQuantTransferencia - fQuantPerda ;
          End;
      finally
          free;
      end;
end;

function TdmDados.GetTotalEntradaLoteProduto(iLoja: Integer; aProduto,
  aLote: String): Double;
var qraux : TSQLquery;
    texto : string;
    FQuant : Double;
begin
     Result := 0;
     texto := 'Select EM.id_entrada, EM.ID_LOJA, EM.DATA_RECEBIMENTO, SUM(ME.quantidade) as QUANT from ENTRADA_MEDICAMENTOS EM ';
     texto := texto + ' INNER JOIN MEDICAMENTO_ENTRADA ME ON EM.ID_ENTRADA = ME.ID_ENTRADA Where (EM.ID_LOJA = :pLOJA) and (EM.DATA_RECEBIMENTO = :pDATA) AND (ME.REGISTRO_MS = :pCDPROD) ';
     texto := texto + ' AND (ME.numero_lote = :pNRLOTE) AND (EM.SITUACAO = '+QuotedStr('F')+') GROUP BY EM.id_entrada, EM.ID_LOJA, EM.DATA_RECEBIMENTO ORDER BY EM.id_entrada ';
     //
     QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pLOJA').AsInteger  := iLoja;
          Params.ParamByName('pDATA').AsDate     := cdsConfigCFG_DATA_ATUAL.AsDateTime;
          Params.ParamByName('pCDPROD').AsString := aProduto;
          Params.ParamByName('pNRLOTE').AsString := uFuncoes.Alltrim(aLote);
          Open;
          //
          if not (IsEmpty) Then
          Begin
              First;
              FQuant := 0;
              While not (Eof) Do
              begin
                   FQuant := FQuant + FieldByName('QUANT').AsFloat;
                   //
                   Next;
              End;
              Result := FQuant;
          End;
      finally
          free;
      end;
end;

function TdmDados.GetTotalPerdaLoteProduto(iLoja: Integer; aProduto,
  aLote: String): Double;
var qraux : TSQLquery;
    texto : string;
    FQuant : Double;
begin
     Result := 0;
     texto := 'Select P.id_loja, P.data_perda, SUM(PM.quantidade) AS QUANT from perdas P ';
     texto := texto + ' INNER JOIN perdas_medicamentos PM ON P.id_perda = PM.id_perda Where (P.id_loja = :pLOJA) and (P.data_perda = :pDATA) AND (PM.registro_ms = :pCDPROD) ';
     texto := texto + ' and  (PM.numero_lote = :pNRLOTE) AND (P.SITUACAO = '+QuotedStr('F')+') GROUP BY P.id_loja, P.data_perda, PM.registro_ms, PM.numero_lote ';
     //
     QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pLOJA').AsInteger  := iLoja;
          Params.ParamByName('pDATA').AsDate     := cdsConfigCFG_DATA_ATUAL.AsDateTime;
          Params.ParamByName('pCDPROD').AsString := aProduto;
          Params.ParamByName('pNRLOTE').AsString := uFuncoes.Alltrim(aLote);
          Open;
          //
          if not (IsEmpty) Then
           begin
                First;
                FQuant := 0;
                While not (Eof) do
                begin
                     FQuant := FQuant + fieldByName('QUANT').AsFloat;
                     //
                     Next;
                End;
                Result := FQuant;
                // FieldByName('QUANT').AsFloat;

           End;
      finally
          free;
      end;
end;

function TdmDados.GetTotalVendaLoteProduto(iLoja: Integer; aProduto,
  aLote: String): Double;
var qraux : TSQLquery;
    texto : string;
    fQuant : Double;
begin
     Result := 0;
     texto := ' Select V.id_loja, V.data_venda, SUM(VM.quant_medicamento) AS QUANT from VENDAS V ';
     texto := texto + ' INNER JOIN VENDAS_MEDICAMENTOS VM ON V.id_venda = VM.id_venda Where ( V.id_loja = :pLOJA) and (V.data_venda = :pDATA) AND (VM.registro_ms = :pCDPROD) ';
     texto := texto + ' and (VM.numero_lote = :pNRLOTE) AND (V.SITUACAO = '+QuotedStr('F')+') GROUP BY V.id_loja, V.data_venda ';
     //
     QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pLOJA').AsInteger  := iLoja;
          Params.ParamByName('pDATA').AsDate     := cdsConfigCFG_DATA_ATUAL.AsDateTime;
          Params.ParamByName('pCDPROD').AsString := aProduto;
          Params.ParamByName('pNRLOTE').AsString := uFuncoes.Alltrim(aLote);
          Open;
          //
          if not (IsEmpty) Then
           begin
                First;
                fQuant := 0;
                While not (Eof) do
                begin
                     fQuant := fQuant + FieldByName('QUANT').AsFloat;
                     //
                     Next;
                End;
                Result :=  fQuant;
           End;
      finally
          free;
      end;
end;

procedure TdmDados.dspPerdaGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
    TableName := 'PERDAS';
end;

function TdmDados.AddItemProduto(aProduto, aNomeProduto, aLote,
  aCNPJ: String; fQuant: Double): Boolean;
begin
     Result := False;
     With cdsDados do
     begin
          Append;
          FieldByName('PRO_CODIGO').AsString    := aProduto;
          FieldByName('PRO_NMPROD').AsString    := aNomeProduto;
          FieldByName('PRO_NRLOTE').AsString    := aLote;
          FieldByName('PRO_QTPROD').AsFloat     := fQuant;
          if not ufuncoes.Empty(aCNPJ) Then
             FieldByName('PRO_CNPJ_FORN').AsString := aCNPJ;
          //
          Post;
          //
          Result := True;
     End;
end;

function TdmDados.AdicionarProdutoPerdaNovo(iPerda, iLoja: Integer;
  aCdsItens: TClientDataSet): Boolean;
Var
   aProduto, aLote: String;
   fQuant : Double;
begin
      Result := False;
      try
          With aCdsItens do
          begin
             First;
             FilterCDS(cdsPerdaItens, fsInteger, InttoStr(iPerda));
             While not (Eof) do
             begin
                cdsPerdaItens.Append;
                cdsPerdaItensID_PERDA.AsInteger   := iPerda;
                cdsPerdaItensREGISTRO_MS.AsString := FieldByName('PRO_CODIGO').AsString;
                cdsPerdaItensNUMERO_LOTE.AsString := uFuncoes.Alltrim(FieldByName('PRO_NRLOTE').AsString);
                cdsPerdaItensQUANTIDADE.AsFloat   := FieldByName('PRO_QTPROD').AsFloat;
                //
                aProduto := FieldByName('PRO_CODIGO').AsString;
                aLote    := uFuncoes.Alltrim(FieldByName('PRO_NRLOTE').AsString);
                fQuant   := FieldByName('PRO_QTPROD').AsFloat;
                // Atualiza estoque
                If not (SaidaProdutoEstoque(iLoja, aProduto, aLote, fQuant)) Then
                    raise Exception.Create('Erro ao tentar atualizar estoque do produto: '+aProduto+ ' Lote: '+aLote);
                //
                //cdsPerdaItensBAIXA_ESTOQUE.AsString := 'S';
                //
                cdsPerdaItens.Post;
                //
                Next;
             End;
             cdsPerdaItens.ApplyUpdates(0);
             //
             Result := true;
        End;
      Except
             if (sqlSNGPN.InTransaction) Then
                Rollback;
      End;
end;

function TdmDados.AddNovoMotivoPerdaMedicamento: Boolean;
begin

end;

function TdmDados.AddNovoTipoReceituario: Boolean;
begin

end;

function TdmDados.ValidarChave(iEmpresa: Integer): Boolean;
Var
   aCNPJEmpresa, aMD5_Licenca, aMD5_Empresa : String;
begin
    Result := False;
    //
    FilterCDS(cdsLojas, fsInteger, InttoStr(iEmpresa));
    //
    if not (cdsLojas.IsEmpty) Then
    begin
         aCNPJEmpresa := cdsLojasEMP_CNPJ.AsString;
         aMD5_Empresa := cdsLojasEMP_CHAVE.AsString;
         //
         if not uFuncoes.Empty(aCNPJEmpresa) Then
         begin
              aMD5_Licenca := frmMain.MD5(aCNPJEmpresa + uFormMainSngpc.M_CNPJ_INFOG2);
              //
              if (aMD5_Empresa = aMD5_Licenca) Then
                  Result := True
              Else   
                 raise Exception.Create('Licença da empresa é inválido!!!'+#13+
                                        'Entre em contato com a INFOG2 - (86) 3226-4510'+#13+
                                        'ou e-mail: sac@infog2.com.br');
         End
         Else
             raise Exception.Create('CNPJ da empresa está vazio!!!');
    End;
end;

function TdmDados.GetVerificaProdutoAntimicrobiano(
  aProduto: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
     Result := False;
     texto := 'Select PRO_RG_MS_MEDICAMENTO, PRO_ANTIMICROBIANOS from PRODUTOS Where (PRO_RG_MS_MEDICAMENTO = :pPRODUTO)';
      QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pPRODUTO').AsString := aProduto;
          Open;
          //
          If not (IsEmpty) Then
             If (FieldByName('PRO_ANTIMICROBIANOS').AsString = 'S') Then
                 Result := True;
      finally
          free;
      end;
end;

function TdmDados.GetVerificaProdutoSujeitoControleEspecial(
  aProduto: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
     Result := False;
     texto := 'Select PRO_RG_MS_MEDICAMENTO, PRO_ANTIMICROBIANOS from PRODUTOS Where (PRO_RG_MS_MEDICAMENTO = :pPRODUTO)';
      QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pPRODUTO').AsString := aProduto;
          Open;
          //
          If not (IsEmpty) Then
             If (FieldByName('PRO_ANTIMICROBIANOS').AsString = 'N') Then
                 Result := True;
      finally
          free;
      end;
end;

function TdmDados.RegistrosNovos: Boolean;
begin
  Result := False;
  Start;
  try
     RefreshCDS(cdsConfig);
     // Tipo receituario
     With cdsReceituario do
     begin
         Close;
         Params.ParamByName('pID_TIPORECEITUARIO').AsInteger  := 5;
         Open;
         //
         if (IsEmpty) Then
         begin
              CdsConfig.Edit;
              cdsConfig.FieldByName('CFG_TIPORECEITUARIO').AsInteger := 5;
              CdsConfig.ApplyUpdates(0);
              //
              Append;
              FieldByName('ID_TIPORECEITUARIO').AsInteger := cdsConfig.FieldByName('CFG_TIPORECEITUARIO').AsInteger;
              FieldByName('DESCRICAO').AsString := 'RECEITA ANTIMICROBIANO EM 2 VIAS';
              //
              ApplyUpdates(0);
              Close;
         End;
     End;
     // Motivo perda
     // 8 -  POR DESVIO DE QUALIDADE'
     With dmDados.cdsMotivoPerda do
     begin
         Close;
         Params.ParamByName('pID_MOTIVOPERDA').AsInteger  := 8;
         Open;
         //
         if (IsEmpty) Then
         begin
              Append;
              FieldByName('ID_MOTIVOPERDA').AsInteger := 8;
              FieldByName('DESCRICAO').AsString       := 'POR DESVIO DE QUALIDADE';
              ApplyUpdates(0);
         End
         Else
         begin
            if (FieldByName('DESCRICAO').AsString <>'POR DESVIO DE QUALIDADE') Then
            begin
                Edit;
                FieldByName('DESCRICAO').AsString  := 'POR DESVIO DE QUALIDADE';
                //
                ApplyUpdates(0);
            End;
         End;
     End;
     //
     // Motivo perda
     // 8 -  POR DESVIO DE QUALIDADE'
     With dmDados.cdsMotivoPerda do
     begin
         Close;
         Params.ParamByName('pID_MOTIVOPERDA').AsInteger  := 9;
         Open;
         //
         if (IsEmpty) Then
         begin
              Append;
              FieldByName('ID_MOTIVOPERDA').AsInteger := 9;
              FieldByName('DESCRICAO').AsString       := 'RECOLHIMENTO DO FABRICANTE';
              ApplyUpdates(0);
              //
              CdsConfig.Edit;
              cdsConfig.FieldByName('CFG_MOTIVO_PERDA').AsInteger := 9;
              CdsConfig.ApplyUpdates(0);
         End;
         //
         close;
     End;
     // 4 - RMS - REGISTRO MINISTERIO DA SAUDE
      With dmDados.cdsConselhoProfissional  do
         begin
              close;
              Params.ParamByName('pID_CONSELHO').AsInteger := 4;
              Open;
              //
              if (IsEmpty) Then
              begin
                    Append;
                    FieldByName('ID_CONSELHO').AsInteger := 4;
                    FieldByName('SIGLA').AsString        := 'RMS';
                    FieldByName('DESCRICAO').AsString    := 'REGISTRO MINISTERIO DA SAUDE';
                    //
                    ApplyUpdates(0);
              End
              Else
              begin
                   if (FieldByName('SIGLA').AsString <> 'RMS') Then
                   begin
                        Edit;
                        FieldByName('SIGLA').AsString   := 'RMS';
                        //
                        ApplyUpdates(0);
                   End;
              End;
         End;
     //
     Comit(dmDados.Transc);
     Result := True;
  Except
      Rollback;
  End;
end;

function TdmDados.AddRegistroHastArquivo(aNomeArquivo,
  aHast: String; iUsuario: Integer): Boolean;
begin
      Result := False;
      RefreshCDS(cdsConfig);
      try
         Start;
           //
           cdsConfig.edit;
           cdsConfigCFG_SEQUENCIA_MOVIMENTO.AsInteger := cdsConfigCFG_SEQUENCIA_MOVIMENTO.AsInteger + 1;
           cdsConfig.post;
           //
           With cdsArquivoHast do
           begin
                Close;
                Params[0].AsInteger := cdsConfigCFG_SEQUENCIA_MOVIMENTO.AsInteger;
                Open;
                //
                if (IsEmpty) then
                begin
                     Append;
                     FieldByname('ARQ_CODIGO').AsInteger := cdsConfigCFG_SEQUENCIA_MOVIMENTO.AsInteger;
                     //
                     FieldByname('DATA_GERACAO').AsDateTime := Date();
                     FieldByname('HORA_GERACAO').AsString   := TimetoStr(time);
                     FieldByname('USUARIO').AsInteger       := iUsuario;
                     {FieldByname('DATA_INICIAL').AsDateTime :=
                     FieldByname('DATA_FINAL').AsDateTime := }
                     FieldByname('HASH_MD5').AsString       := aHast;
                     FieldByname('NOME_ARQUIVO').AsString   := aNomeArquivo;
                     //
                     ApplyUpdates(0);
               End;
           End;
           //
           cdsConfig.ApplyUpdates(0);
           //
           Comit(Transc);
           Result := True;
      Except
          Rollback;
      End;
end;

function TdmDados.GetNomeCLIENTE(M_CDCOMP: Integer): String;
var qraux : TSQLquery;
    texto : string;
begin
     texto := 'Select ID_COMPRADOR, NOME_COMPRADOR from COMPRADOR Where (ID_COMPRADOR = :pID)';
      QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pID').AsInteger := M_CDCOMP;
          Open;
          //
          If not (IsEmpty) Then
             Result :=  FieldByName('NOME_COMPRADOR').AsString;
      finally
          free;
      end;
end;

function TdmDados.GetNomeMedico(M_CDMEDI: Integer): String;
var qraux : TSQLquery;
    texto : string;
begin
     texto := 'Select ID_MEDICO, NOME_MEDICO from MEDICO Where (ID_MEDICO = :pID)';
      QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pID').AsInteger := M_CDMEDI;
          Open;
          //
          If not (IsEmpty) Then
             Result :=  FieldByName('NOME_MEDICO').AsString;
      finally
          free;
      end;
end;

function TdmDados.AddRegistroHistoricoEstoque(iCDLOJA, iUsuario: Integer; aProduto,
  aLote, aDTVENCIMENTO: String; fQUANTIDADE, fQTENTRADA, fQTSAIDA,
  fPERDA, fQTTransferencia: Double): Boolean;
begin
      result := false;
      with cdsHisEstoque do
      begin
           Append;
           FieldByName('EST_CDLOJA').AsInteger := iCDLOJA;
           FieldByName('EST_CDPROD').AsString  := aProduto;
           FieldByName('EST_NRLOTE').AsString  := uFuncoes.Alltrim(aLote);
           FieldByName('EST_QUANTIDADE').AsFloat := fQUANTIDADE;
           if not uFuncoes.Empty(aDTVENCIMENTO) Then
               FieldByName('EST_DTVENCIMENTO').AsDateTime := Strtodate(aDTVENCIMENTO);
           //if not uFuncoes.Empty(uFuncoes.RemoveChar( cdsConfigCFG_DATA_ATUAL.AsString)) Then
           FieldByName('EST_DTMOVIMENTO').AsDateTime := cdsConfigCFG_DATA_ATUAL.AsDateTime;
           {Else
               FieldByName('EST_DTMOVIMENTO').AsDateTime := Date();}
           FieldByName('EST_HOMOVIMENTO').AsString   := TimeToStr(time);
           //
           FieldByName('EST_QTENTRADA').AsFloat := fQTENTRADA;
           FieldByName('EST_QTSAIDA').AsFloat   := fQTSAIDA;
           FieldByName('EST_PERDA').AsFloat     := fPERDA;
           FieldByName('EST_USUARIO').AsInteger      := iUsuario;
           FieldByName('EST_SITUACAO').AsString      := 'F';
           //
           Post;
      End;
end;

function TdmDados.ExcluitRegistroHistoricoEstoque(iCDLOJA: Integer;
  aDataMov: TDatetime): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
     Result := False;
     texto := 'Delete from ESTOQUE_HISTORICO Where (EST_CDLOJA = :pIDLOJA) and (EST_DTMOVIMENTO = :pDTMOVIMENTO) ';
     QrAux := TSqlquery.Create(nil);
     with QrAux do
      try
        Start;
        try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pIDLOJA').AsInteger    := iCDLOJA;
          Params.ParamByName('pDTMOVIMENTO').AsDate  := aDataMov;
          ExecSQL();
          //
          Comit(Transc);
          Result := True;
        Except
            Rollback;
        End;
      finally
          free;
      end;
end;

function TdmDados.SaidaProdutoEstoque(iLoja: Integer; aProduto,
  aLote: String; fQuant: Double): Boolean;
begin
    Result := False;
    try
      With cdsEstoque do
        begin
             Close;
             Params[0].AsInteger := iLoja;
             Params[1].AsString  := aProduto;
             Params[2].AsString  := aLote;
             Open;
             //
             If not (IsEmpty) then
              begin
                   if (fQuant <= FieldByName('EST_QUANTIDADE').AsFloat ) Then
                   begin
                        Edit;
                        FieldByName('EST_QUANTIDADE').AsFloat :=
                             FieldByName('EST_QUANTIDADE').AsFloat - fQuant;
                        ApplyUpdates(0);
                        //
                        Result := True;
                   End
                   Else
                   begin
                        Close;
                        raise Exception.Create('Quantidade no estoque inferior a quantidade de saída do produto: '+aProduto);
                   End
              End
              Else
              begin
                   Close;
                   raise Exception.Create('Produto: '+aProduto+' não encontrado.');
              End;
              //
              Close;
        End;
    Except
          on e: exception do
          begin
              Application.MessageBox(PChar('Erro ao tentar fazer saída do estoque!'+#13
                     + 'Produto: '+aProduto+ '  Lote: '+aLote+#13
                     + 'Erro:'+#13+ E.Message),
                      'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);

          End;
    End;
end;

function TdmDados.GetNomeMotivoPerda(idMotivo: Integer): String;
var qraux : TSQLquery;
    texto : string;
begin
     texto := 'Select ID_MOTIVOPERDA, DESCRICAO from TIPOMOTIVOPERDA Where (ID_MOTIVOPERDA = :pID)';
      QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pID').AsInteger := idMotivo;
          Open;
          //
          If not (IsEmpty) Then
             Result :=  FieldByName('DESCRICAO').AsString;
      finally
          free;
      end;
end;

function TdmDados.SetEstoqueProduto(iLoja: Integer; aProduto,
  aLote: String; fQuant : Double): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
      texto := 'Update ESTOQUE set EST_QUANTIDADE = :pQUANT Where (EST_CDPROD = :pCDPROD) and (EST_NRLOTE = :pNRLOTE) and (EST_CDLOJA = :pCDLOJA) ';
      QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pCDPROD').AsString  := aProduto;
          Params.ParamByName('pNRLOTE').AsString  := aLote;
          Params.ParamByName('pCDLOJA').AsInteger := iLoja;
          Params.ParamByName('pQUANT').AsFloat    := fQuant;
          ExecSQL();
          //
          Result := true;
      finally
          free;
      end;
end;

function TdmDados.ExcluirEntrada(idEntrada: Integer): Boolean;
var qraux, qrauxItens : TSQLquery;
    texto, texto2 : string;
begin
     Result := False;
     texto  := 'Delete from ENTRADA_MEDICAMENTOS Where (ID_ENTRADA = :pID_ENTRADA) ';
     texto2 := 'Delete from MEDICAMENTO_ENTRADA Where (ID_ENTRADA = :pID_ENTRADA)';
     //
     QrAux := TSqlquery.Create(nil);
     qrauxItens := TSqlquery.Create(nil);
     //
     with QrAux do
      try
        Start;
        try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pID_ENTRADA').AsInteger    := idEntrada;
          ExecSQL();
          //
          With qrauxItens do
          begin
               SQLConnection := sqlSNGPN;
               sql.Add(texto2);
               Params.ParamByName('pID_ENTRADA').AsInteger    := idEntrada;
               ExecSQL();
          End;
          //
          Comit(Transc);
          Result := True;
        Except
            Rollback;
        End;
      finally
          free;
          //
          qrauxItens.free;
      end;
end;

function TdmDados.ExcluirPerda(idPerda: Integer): Boolean;
var qraux, qrauxItens : TSQLquery;
    texto, texto2 : string;
begin
     Result := False;
     texto  := 'Delete from PERDAS Where (ID_PERDA = :pPERDA) ';
     texto2 := 'Delete from PERDAS_MEDICAMENTOS Where (ID_PERDA = :pPERDA)';
     //
     QrAux := TSqlquery.Create(nil);
     qrauxItens := TSqlquery.Create(nil);
     //
     with QrAux do
      try
        Start;
        try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pPERDA').AsInteger  := idPerda;
          ExecSQL();
          //
          With qrauxItens do
          begin
               SQLConnection := sqlSNGPN;
               sql.Add(texto2);
               Params.ParamByName('pPERDA').AsInteger := idPerda;
               ExecSQL();
          End;
          //
          Comit(Transc);
          Result := True;
        Except
            Rollback;
        End;
      finally
          free;
          //
          qrauxItens.free;
      end;
end;

function TdmDados.ExcluirVendaNovo(idVenda: Integer): Boolean;
var qraux, qrauxItens : TSQLquery;
    texto, texto2 : string;
begin
     Result := False;
     texto  := 'Delete from VENDAS Where (ID_VENDA = :pVENDA) ';
     texto2 := 'Delete from VENDAS_MEDICAMENTOS Where (ID_VENDA = :pVENDA)';
     //
     QrAux := TSqlquery.Create(nil);
     qrauxItens := TSqlquery.Create(nil);
     //
     with QrAux do
      try
        Start;
        try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pVENDA').AsInteger  := idVenda;
          ExecSQL();
          //
          With qrauxItens do
          begin
               SQLConnection := sqlSNGPN;
               sql.Add(texto2);
               Params.ParamByName('pVENDA').AsInteger := idVenda;
               ExecSQL();
          End;
          //
          Comit(Transc);
          Result := True;
        Except
            Rollback;
        End;
      finally
          free;
          //
          qrauxItens.free;
      end;
end;

function TdmDados.GetEstoqueAnteriorProduto(iLoja: Integer; aProduto,
  aLote: String): Double;
var qraux : TSQLquery;
    texto : string;
begin
     Result := 0;
     texto := 'Select * from ESTOQUE_HISTORICO Where (EST_DTMOVIMENTO = :pDATA) and (EST_CDPROD = :pCDPROD) ' ;
     texto := texto + ' and (EST_NRLOTE = :pLOTE) and (EST_CDLOJA = :pLOJA) ';
     //
      QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pLOJA').AsInteger  := iLoja;
          Params.ParamByName('pDATA').AsDate     := cdsConfigCFG_DATA_ATUAL.AsDateTime - 1;
          Params.ParamByName('pCDPROD').AsString := aProduto;
          Params.ParamByName('pLOTE').AsString   := uFuncoes.Alltrim(aLote);
          Open;
          //
          If not (IsEmpty) Then
             Result :=  FieldByName('EST_QUANTIDADE').AsFloat;
      finally
          free;
      end;
end;

function TdmDados.ExcluirMovimento(iLoja: Integer; aDataMov: TDatetime): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
      Result := False;
      dmDados.Start;
      Try
          dmDados.RefreshCDS(cdsConfig);
          //
          texto := 'Delete from ESTOQUE_HISTORICO Where (EST_DTMOVIMENTO = :pDATA) and (EST_CDLOJA = :pCDLOJA) and  (EST_DTMOVIMENTO <> :pDTINVENTARIO)' ;
          //
           QrAux := TSqlquery.Create(nil);
           with QrAux do
           try
               SQLConnection := sqlSNGPN;
               sql.Add(texto);
               Params.ParamByName('pCDLOJA').AsInteger := iLoja;
               Params.ParamByName('pDATA').AsDate      := aDataMov;
               Params.ParamByName('pDTINVENTARIO').AsDate := dmDados.cdsConfigCFG_DTINVENTARIO.AsDateTime;
               ExecSQL();    // Excluir dia movimento
               //
               With cdsRetornaEstoque do
               begin
                    Close;
                    Params[0].AsInteger := iLoja;
                    Open;
                    //
                    If not (IsEmpty) Then
                    begin
                         First;
                         //
                         While not (Eof) do
                         begin
                             Edit;
                             FieldByName('EST_QUANTIDADE').AsFloat := GetEstoqueAnteriorProduto(iLoja,
                                                           FieldByName('EST_CDPROD').AsString,
                                                           uFuncoes.Alltrim(FieldByName('EST_NRLOTE').AsString));
                             //  Proximo
                             Next;
                         End;   // fim-enquanto
                         //
                         ApplyUpdates(0);
                    End;        // fim-se vazio
               End;             //  With cdsRetornaEstoque do
               //
               dmDados.cdsConfig.Edit;
               dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime := dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime-1;
               dmDados.cdsConfig.ApplyUpdates(0);
               // Commit
               Comit(Transc);
               Result := True;
           finally
              free;
           end;
      Except
           dmDados.Rollback;
      End;
end;

procedure TdmDados.dspRetornaEstoqueGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
    TableName := 'ESTOQUE';
end;

procedure TdmDados.dspTransferenciaGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'TRANSFERENCIA';
end;

function TdmDados.GetIdLojaDestino(aCNPJ: String): Integer;
var qraux : TSQLquery;
    texto : string;
begin
      Result := 0;
      texto := 'Select EMP_CODIGO, EMP_CNPJ from EMPRESAS Where (EMP_CNPJ = :pCNPJ) ';
      QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pCNPJ').AsString  := aCNPJ;
          Open;
          If not (IsEmpty) Then
               Result := FieldByName('EMP_CODIGO').AsInteger;
      finally
          free;
      end;
end;

procedure TdmDados.dspItensTransfGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'TRANSFERENCIA_MEDICAMENTOS';
end;

function TdmDados.AdicionarTransferenciaProduto(idTransferencia,
  iLojaOrigem, iLojaDestino: Integer; aCdsItens: TClientDataSet): Boolean;
Var
   aProduto, aLote: String;
   fQuant : Double;
begin
   Result := False;
   Try
      With aCdsItens do
      begin
           First;
           FilterCDS(cdsItensTransf, fsInteger, InttoStr(idTransferencia));
           While not (Eof) do
           begin
                cdsItensTransf.Append;
                cdsItensTransfID_TRANSFERENCIA.AsInteger   := idTransferencia;
                cdsItensTransfREGISTRO_MS.AsString         := FieldByName('PRO_CODIGO').AsString;
                cdsItensTransfNUMERO_LOTE.AsString         := uFuncoes.Alltrim(FieldByName('PRO_NRLOTE').AsString);
                cdsItensTransfQUANT_MEDICAMENTO.AsFloat    := FieldByName('PRO_QTPROD').AsFloat;
                //
                aProduto := FieldByName('PRO_CODIGO').AsString;
                aLote    := uFuncoes.Alltrim(FieldByName('PRO_NRLOTE').AsString);
                fQuant   := FieldByName('PRO_QTPROD').AsFloat;
                // Atualiza estoque
                If not (SaidaProdutoEstoque(iLojaOrigem, aProduto, aLote, fQuant)) Then
                    raise Exception.Create('Erro ao tentar atualizar estoque do produto: '+aProduto+ ' Lote: '+aLote);
                //
                cdsItensTransf.Post;
                //
                Next;
           End;
           cdsItensTransf.ApplyUpdates(0);
           //
           Result := true;
      End;
   Except
         if (sqlSNGPN.InTransaction) Then
              Rollback;
   End;
end;

function TdmDados.VerificarNotaTransferencia(aCNPJ: String; iLoja,
  aNota: integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select ID_TRANSFERENCIA, ID_LOJA, CNPJ_ORIGEM, NR_NOTAFISCAL from TRANSFERENCIA Where (NR_NOTAFISCAL = :pNOTA) and (CNPJ_ORIGEM = :pCNPJ) and (ID_LOJA = :pLOJA)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pNOTA').AsInteger := aNota;
      Params.ParamByName('pCNPJ').AsString  := aCNPJ;
      Params.ParamByName('pLOJA').AsInteger := iLoja;
      Open;
      //
      If Not (IsEmpty) Then
          result := True;
    finally
      free;
    end;
end;

function TdmDados.GetTotalTransferenciaProduto(iLoja: Integer; aProduto,
  aLote: String): Double;
var qraux : TSQLquery;
    texto : string;
    FQuant : Double;
begin
     Result := 0;
     texto := 'Select T.id_transferencia, T.id_loja, T.data_transferencia, SUM(TM.quant_medicamento) AS QUANT from TRANSFERENCIA T ';
     texto := texto + ' INNER JOIN TRANSFERENCIA_MEDICAMENTOS TM ON T.id_transferencia = TM.id_transferencia Where (T.id_loja = :pLOJA) and (T.data_transferencia = :pDATA) ';
     texto := texto + ' AND (TM.registro_ms = :pCDPROD) and (TM.numero_lote = :pNRLOTE) AND (T.SITUACAO = '+QuotedStr('F')+') GROUP BY T.id_transferencia, T.id_loja, T.data_transferencia ';
     //
     QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pLOJA').AsInteger  := iLoja;
          Params.ParamByName('pDATA').AsDate     := cdsConfigCFG_DATA_ATUAL.AsDateTime;
          Params.ParamByName('pCDPROD').AsString := aProduto;
          Params.ParamByName('pNRLOTE').AsString := uFuncoes.Alltrim(aLote);
          Open;
          //
          if not (IsEmpty) Then
           begin
                FQuant := 0;
                First;
                While not (Eof) do
                begin
                    FQuant := FQuant + FieldByName('QUANT').AsFloat;
                    //
                    Next;
                End;
                //
                Result := FQuant;
           End;
      finally
          free;
      end;
end;

function TdmDados.GetNomeLojaCNPJ(aCNPJ: String): String;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select EMP_CODIGO, EMP_CNPJ, EMP_FANTASIA from EMPRESAS Where (EMP_CNPJ = :pEMP_CNPJ)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pEMP_CNPJ').AsString := aCNPJ;
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByName('EMP_FANTASIA').AsString;
    finally
      free;
    end;
end;

function TdmDados.ExcluirTransferencia(idTransferencia: Integer): Boolean;
var qraux, qrauxItens : TSQLquery;
    texto, texto2 : string;
begin
     Result := False;
     texto  := 'Delete from TRANSFERENCIA Where (ID_TRANSFERENCIA = :pID) ';
     texto2 := 'Delete from TRANSFERENCIA_MEDICAMENTOS Where (ID_TRANSFERENCIA = :pID)';
     //
     QrAux := TSqlquery.Create(nil);
     qrauxItens := TSqlquery.Create(nil);
     //
     with QrAux do
      try
        Start;
        try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pID').AsInteger  := idTransferencia;
          ExecSQL();
          //
          With qrauxItens do
          begin
               SQLConnection := sqlSNGPN;
               sql.Add(texto2);
               Params.ParamByName('pID').AsInteger := idTransferencia;
               ExecSQL();
          End;
          //
          Comit(Transc);
          Result := True;
        Except
            Rollback;
        End;
      finally
          free;
          //
          qrauxItens.free;
      end;
end;

function TdmDados.GetTotalEntradaProduto(iLoja: Integer; aProduto: String;
  aDtMovi: TDatetime): Double;
var qraux : TSQLquery;
    texto : string;
begin
     Result := 0;
     texto := 'Select EH.EST_CDPROD, SUM(EH.EST_QTENTRADA) AS QUANT from ESTOQUE_HISTORICO EH Where (EH.EST_DTMOVIMENTO = :pDTMOV) ';
     texto := texto + ' and (EH.EST_CDLOJA = :pLOJA) and (EH.EST_CDPROD = :pCDPROD) Group by EH.EST_CDPROD ';
     //
     QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pLOJA').AsInteger  := iLoja;
          Params.ParamByName('pDTMOV').AsDate    := aDtMovi;
          Params.ParamByName('pCDPROD').AsString := aProduto;
          Open;
          //
          if not (IsEmpty) Then
              Result := FieldByName('QUANT').AsFloat;
      finally
          free;
      end;
end;

function TdmDados.GetTotalPerdaProduto(iLoja: Integer; aProduto: String;
  aDtMovi: TDatetime): Double;
var qraux : TSQLquery;
    texto : string;
begin
     Result := 0;
     texto := 'Select EH.EST_CDPROD, SUM(EH.EST_PERDA) AS QUANT from ESTOQUE_HISTORICO EH Where (EH.EST_DTMOVIMENTO = :pDTMOV) ';
     texto := texto + ' and (EH.EST_CDLOJA = :pLOJA) and (EH.EST_CDPROD = :pCDPROD) Group by EH.EST_CDPROD ';
     //
     QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pLOJA').AsInteger  := iLoja;
          Params.ParamByName('pDTMOV').AsDate    := aDtMovi;
          Params.ParamByName('pCDPROD').AsString := aProduto;
          Open;
          //
          if not (IsEmpty) Then
              Result := FieldByName('QUANT').AsFloat;
      finally
          free;
      end;
end;

function TdmDados.GetTotalTransfProduto(iLoja: Integer; aProduto: String;
  aDtMovi: TDatetime): Double;
var qraux : TSQLquery;
    texto : string;
begin
     Result := 0;
     texto := 'Select EH.EST_CDPROD, SUM(EH.EST_QTTRANSFERENCIA) AS QUANT from ESTOQUE_HISTORICO EH Where (EH.EST_DTMOVIMENTO = :pDTMOV) ';
     texto := texto + ' and (EH.EST_CDLOJA = :pLOJA) and (EH.EST_CDPROD = :pCDPROD) Group by EH.EST_CDPROD ';
     //
     QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pLOJA').AsInteger  := iLoja;
          Params.ParamByName('pDTMOV').AsDate    := aDtMovi;
          Params.ParamByName('pCDPROD').AsString := aProduto;
          Open;
          //
          if not (IsEmpty) Then
              Result := FieldByName('QUANT').AsFloat;
      finally
          free;
      end;
end;

function TdmDados.GetTotalVendaProduto(iLoja: Integer; aProduto: String;
  aDtMovi: TDatetime): Double;
var qraux : TSQLquery;
    texto : string;
begin
     Result := 0;
     texto := 'Select EH.EST_CDPROD, SUM(EH.EST_QTSAIDA) AS QUANT from ESTOQUE_HISTORICO EH Where (EH.EST_DTMOVIMENTO = :pDTMOV) ';
     texto := texto + ' and (EH.EST_CDLOJA = :pLOJA) and (EH.EST_CDPROD = :pCDPROD) Group by EH.EST_CDPROD ';
     //
     QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pLOJA').AsInteger  := iLoja;
          Params.ParamByName('pDTMOV').AsDate    := aDtMovi;
          Params.ParamByName('pCDPROD').AsString := aProduto;
          Open;
          //
          if not (IsEmpty) Then
              Result := FieldByName('QUANT').AsFloat;
      finally
          free;
      end;
end;

function TdmDados.GetQuantidadeProdutoData(iLoja: Integer;
  aProduto: String; aDtMovi: TDatetime): Double;
var qraux : TSQLquery;
    texto : string;
begin
     Result := 0;
     texto := 'Select EH.EST_CDPROD, SUM(EH.EST_QUANTIDADE) AS QUANT from ESTOQUE_HISTORICO EH Where (EH.EST_DTMOVIMENTO = :pDTMOV) ';
     texto := texto + ' and (EH.EST_CDLOJA = :pLOJA) and (EH.EST_CDPROD = :pCDPROD) Group by EH.EST_CDPROD ';
     //
     QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pLOJA').AsInteger  := iLoja;
          Params.ParamByName('pDTMOV').AsDate    := aDtMovi;
          Params.ParamByName('pCDPROD').AsString := aProduto;
          Open;
          //
          if not (IsEmpty) Then
              Result := FieldByName('QUANT').AsFloat;
      finally
          free;
      end;
end;

function TdmDados.GetQuantProdutoPeriodo(iLoja: Integer; aProduto,
  aNomeCampo: String; aDtInicial, aDtFinal: TDatetime): Double;
var qraux : TSQLquery;
    texto : string;
begin
     Result := 0;
     texto := 'Select EH.EST_CDPROD, SUM(EH.'+aNomeCampo+') AS QUANT from ESTOQUE_HISTORICO EH ';
     texto := texto + ' Where (EH.EST_CDPROD = :pCDPROD) AND (EH.EST_DTMOVIMENTO >= :pDATA1) ';
     texto := texto + ' and (EH.EST_DTMOVIMENTO <= :pDATA2) and (EH.EST_CDLOJA = :pLOJA) Group by EH.EST_CDPROD ';
     //
     QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pLOJA').AsInteger  := iLoja;
          Params.ParamByName('pDATA1').AsDate    := aDtInicial;
          Params.ParamByName('pDATA2').AsDate    := aDtFinal;
          Params.ParamByName('pCDPROD').AsString := aProduto;
          Open;
          //
          if not (IsEmpty) Then
              Result := FieldByName('QUANT').AsFloat;
      finally
          free;
      end;
end;

function TdmDados.SetClasseTerapeuticaProduto(aProduto,
  aClasse: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  Result := False;
  texto := 'Update PRODUTOS set PRO_ANTIMICROBIANOS = :pClasse Where (PRO_RG_MS_MEDICAMENTO = :pPRODUTO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      Start;
      try
         SQLConnection := dmDados.sqlSNGPN;
         sql.Add(texto);
         Params.ParamByName('pPRODUTO').AsString := aProduto;
         Params.ParamByName('pClasse').AsString  := aClasse;
         ExecSQL();
         //
         Comit(Transc);
         //
         Result := True;
      Except
         Rollback;
      End;
    finally
      free;
    end;
end;

function TdmDados.GetClasseTerapeuticaProduto(aProduto: String): String;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select PRO_RG_MS_MEDICAMENTO, PRO_ANTIMICROBIANOS from PRODUTOS Where (PRO_RG_MS_MEDICAMENTO = :pPRODUTO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pPRODUTO').AsString := aProduto;
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByName('PRO_ANTIMICROBIANOS').AsString;
    finally
      free;
    end;
end;

function TdmDados.GetUnidadeMedidaProduto(aProduto: String): String;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select PRO_RG_MS_MEDICAMENTO, PRO_UNIDADE_MEDIDA from PRODUTOS Where (PRO_RG_MS_MEDICAMENTO = :pPRODUTO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pPRODUTO').AsString := aProduto;
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByName('PRO_UNIDADE_MEDIDA').AsString;
    finally
      free;
    end;
end;

function TdmDados.SetUnidadeMedidaProduto(aProduto,
  aUnidade: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  Result := False;
  texto := 'Update PRODUTOS set PRO_UNIDADE_MEDIDA = :pUND Where (PRO_RG_MS_MEDICAMENTO = :pPRODUTO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      Start;
      try
         SQLConnection := dmDados.sqlSNGPN;
         sql.Add(texto);
         Params.ParamByName('pPRODUTO').AsString := aProduto;
         Params.ParamByName('pUND').AsString     := aUnidade;
         ExecSQL();
         //
         Comit(Transc);
         //
         Result := True;
      Except
         Rollback;
      End;
    finally
      free;
    end;
end;

function TdmDados.LimparEstoqueLoja(iLoja: Integer): boolean;
var qraux : TSQLquery;
    texto : string;
begin
  Result := False;
  texto := 'delete from ESTOQUE Where (EST_CDLOJA = :pCDLOJA)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      Start;
      try
         SQLConnection := dmDados.sqlSNGPN;
         sql.Add(texto);
         Params.ParamByName('pCDLOJA').AsInteger := iLoja;
         ExecSQL();
         //
         Comit(Transc);
         //
         Result := True;
      Except
         Rollback;
      End;
    finally
      free;
    end;
end;

function TdmDados.AddProduto(aProduto, aDescricao: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  Result := False;
  texto := 'Insert Into PRODUTOS (PRO_RG_MS_MEDICAMENTO, PRO_MEDICAMENTO) values (:pMS_MEDICAMENTO, :pMEDICAMENTO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      Start;
      try
         SQLConnection := dmDados.sqlSNGPN;
         sql.Add(texto);
         Params.ParamByName('pMS_MEDICAMENTO').AsString := aProduto;
         Params.ParamByName('pMEDICAMENTO').AsString    := aDescricao;
         ExecSQL();
         //
         Comit(Transc);
         //
         Result := True;
      Except
         Rollback;
      End;
    finally
      free;
    end;
end;

function TdmDados.GetMaxIdPerda: Integer;
var qraux : TSQLquery;
    texto : string;
begin
  result := 0;
  texto := 'Select Max(ID_PERDA) as IDMAX from PERDAS';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByName('IDMAX').AsInteger;
    finally
      free;
    end;
end;

function TdmDados.GetMaxIdEntrada: Integer;
var qraux : TSQLquery;
    texto : string;
begin
  result := 0;
  texto := 'Select Max(ID_ENTRADA) as IDMAX from ENTRADA_MEDICAMENTOS';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByName('IDMAX').AsInteger;
    finally
      free;
    end;
end;

function TdmDados.GetMaxIdVenda: Integer;
var qraux : TSQLquery;
    texto : string;
begin
  result := 0;
  texto := 'Select Max(ID_VENDA) as IDMAX from VENDAS';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByName('IDMAX').AsInteger;
    finally
      free;
    end;
end;

function TdmDados.GetDataUltimoMov(aDtMovi: TDatetime): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select distinct EH.EST_DTMOVIMENTO, EH.EST_SITUACAO from ESTOQUE_HISTORICO EH ';
  texto := texto + ' Where (EH.EST_DTMOVIMENTO = :pDTMOVI) and (EH.EST_SITUACAO = :pSITUACAO) ';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pDTMOVI').AsDate     := aDtMovi;
      Params.ParamByName('pSITUACAO').AsString := 'F';
      Open;
      //
      If Not (IsEmpty) Then
          result := True;
    finally
      free;
    end;
end;

function TdmDados.SetStatusArquivo(iCodigo: Integer;
  aStatus: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Update TAREFAS_USUARIOS set TAR_STATUS = :pSTATUS Where TAR_SEQUENCIA = :pCODIGO';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger := iCodigo;
      Params.ParamByName('pSTATUS').AsString  := aStatus;
      ExecSQL();
      //
      Result := True;
    finally
      free;
    end;
end;

function TdmDados.ExcluirEstoqueMovimentoDia(iLoja: Integer;
  aDataMov: TDatetime): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Delete from ESTOQUE_HISTORICO Where (EST_DTMOVIMENTO = :pDATA) and (EST_CDLOJA = :pLOJA)';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pDATA').AsDate    := aDataMov;
      Params.ParamByName('pLOJA').AsInteger := iLoja;
      //
      Start;
      try
         ExecSQL();
         //
         Comit(Transc);
         //
         result := true;
      Except
          Rollback;
      End;
      //
      Result := True;
    finally
      free;
    end;
end;

function TdmDados.AddClienteVenda: Boolean;
begin
     Result := false;
     //
     RefreshCDS(cdsConfig);
     //
     Start;
     try
        With dmDados.cdsComprador  do
        begin
            close;
            Params.ParamByName('pID_COMPRADOR').AsInteger := 9999999;
            Open;
            //
            if (IsEmpty) Then
            begin
                 Append;
                 FieldByName('ID_COMPRADOR').AsInteger   := 9999999;
                 FieldByName('NOME_COMPRADOR').AsString  := 'VENDA AO CONSUMIDOR';
                 FieldByName('NR_DOCUMETO').AsString     := '1';
                 FieldByName('TIPO_DOCUMENTO').AsInteger := 2;
                 FieldByName('ORGAO_EXPEDIDOR').AsInteger := 20;
                 FieldByName('UF_EMISSOA_DOC').AsString  := cdsConfigCFG_UF_PADRAO.AsString;
                 ApplyUpdates(0);
                 //
                 Comit(Transc);
                 //
                 Result  := true;
                 //
                 Close;
            End;
        End;
    Except
         Rollback;
    End;
end;

function TdmDados.VerificaMovimentoVenda(iLoja: Integer; aProduto,
  aLote, aDataMov: String ) : Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'select V.id_venda, V.data_venda, VE.registro_ms, VE.numero_lote, Sum(VE.quant_medicamento) as QUANT from vendas_medicamentos VE Inner join VENDAS V ON V.id_venda = VE.id_venda ';
  texto := texto + ' WHERE (V.data_venda = :pDTMOVI) AND (V.id_loja = :pLOJA) and (VE.registro_ms = :pCDPROD) and (VE.numero_lote = :pLOTE)';
  texto := texto + ' Group by V.id_venda, V.data_venda, VE.registro_ms, VE.numero_lote ';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pDTMOVI').AsDate    := StrtoDate(aDataMov);
      Params.ParamByName('pLOJA').AsInteger   := iLoja;
      Params.ParamByName('pCDPROD').AsString  := uFuncoes.Alltrim(aProduto);
      Params.ParamByName('pLOTE').AsString    := uFuncoes.Alltrim(aLote);
      Open;
      //
      if not (IsEmpty) Then
         if (FieldByName('QUANT').AsFloat > 0) Then
                Result := True;
    finally
      free;
    end;
end;

function TdmDados.GetQuantEntradasPeriodo(iLoja: Integer; aDtInicio,
  aDtFinal: TDatetime): integer;
var qraux : TSQLquery;
    texto : string;
begin
  result := 0;
  texto := 'Select Count(*) as QUANT from ENTRADA_MEDICAMENTOS E where (E.id_loja = :pLOJA) AND ';
  texto := texto + ' (E.DATA_RECEBIMENTO >= :pDATA1) and (E.DATA_RECEBIMENTO <= :pDATA2)';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pLOJA').AsInteger  := iLoja;
      Params.ParamByName('pDATA1').AsDate    := aDtInicio;
      Params.ParamByName('pDATA2').AsDate    := aDtFinal;
      Open;
      //
      if not (IsEmpty) Then
          Result :=  fieldByName('QUANT').AsInteger;
    finally
      free;
    end;
end;

function TdmDados.VerificaItensVenda(idVenda: Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select ID_VENDA,  REGISTRO_MS, NUMERO_LOTE from VENDAS_MEDICAMENTOS where (ID_VENDA = :pVENDA)  ';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pVENDA').AsInteger  := idVenda;
      Open;
      //
      if not (IsEmpty) Then
          Result := True;
    finally
      free;
    end;
end;

function TdmDados.GetGeneratorVenda: Integer;
var qraux : TSQLquery;
    texto : string;
begin
  result := 0;
  texto := 'SELECT GEN_ID(GEN_VENDA_CODIGO, 1) FROM RDB$DATABASE';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Open;
      //
      Result := Fields[0].AsInteger;
    finally
      free;
    end;   
end;

procedure TdmDados.GetError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
      Application.MessageBox(PChar('Ocorreu um erro ao tentar gravar o registro. '+#13+
                  'Mensagem Original : '+ E.Message), 'Atenção',MB_OK+MB_ICONSTOP);
end;

function TdmDados.AddVenda(idVenda: Integer;
  aCdsVenda: TClientDataSet): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  if (aCdsVenda.FieldByName('TIPO_RECEITUARIO').AsInteger <> 5) Then
      begin
           texto := 'Insert Into VENDAS (ID_VENDA, ID_LOJA, DATA_VENDA, TIPO_RECEITUARIO, NR_NOT_MEDICAMENTO, ID_PRESCRITOR, USO_MEDICAMENTO, ID_COMPRADOR, DATA_CADASTRO, USUARIO, DATA_RECEITA, HORA_VENDA) ';
           texto := texto + ' values (:pID_VENDA, :pID_LOJA, :pDATA_VENDA, :pTIPO_RECEITUARIO, :pNR_NOT_MEDICAMENTO, :pID_PRESCRITOR, :pUSO_MEDICAMENTO, :pID_COMPRADOR, :pDATA_CADASTRO, :pUSUARIO, :pDATA_RECEITA, :pHORA_VENDA) ';
      End
      Else
      begin
           texto := 'Insert Into VENDAS (ID_VENDA, ID_LOJA, DATA_VENDA, TIPO_RECEITUARIO, NR_NOT_MEDICAMENTO, ID_PRESCRITOR, USO_MEDICAMENTO, ID_COMPRADOR, DATA_CADASTRO, USUARIO, DATA_RECEITA, HORA_VENDA ';
           texto := texto + ', PAC_NOME, PAC_IDADE, PAC_UND_IDADE, PAC_SEXO, PAC_DATA_NASC) ';

           texto := texto + ' values (:pID_VENDA, :pID_LOJA, :pDATA_VENDA, :pTIPO_RECEITUARIO, :pNR_NOT_MEDICAMENTO, :pID_PRESCRITOR, :pUSO_MEDICAMENTO, :pID_COMPRADOR, :pDATA_CADASTRO, :pUSUARIO, :pDATA_RECEITA, :pHORA_VENDA, ';
           texto := texto + ' :pPAC_NOME, :pPAC_IDADE, :pPAC_UND_IDADE, :pPAC_SEXO, :pPAC_DATA_NASC)';
      End;
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pID_VENDA').AsInteger  := idVenda;
      Params.ParamByName('pID_LOJA').AsInteger   := aCdsVenda.FieldByName('ID_LOJA').AsInteger;
      Params.ParamByName('pDATA_VENDA').AsDate   := aCdsVenda.FieldByName('DATA_VENDA').AsDateTime;
      Params.ParamByName('pTIPO_RECEITUARIO').AsInteger  := aCdsVenda.FieldByName('TIPO_RECEITUARIO').AsInteger;
      Params.ParamByName('pNR_NOT_MEDICAMENTO').AsString := aCdsVenda.FieldByName('NR_NOT_MEDICAMENTO').AsString;
      Params.ParamByName('pID_PRESCRITOR').AsInteger     := aCdsVenda.FieldByName('ID_PRESCRITOR').AsInteger;
      Params.ParamByName('pUSO_MEDICAMENTO').AsInteger   := aCdsVenda.FieldByName('USO_MEDICAMENTO').AsInteger;
      Params.ParamByName('pID_COMPRADOR').AsInteger      := aCdsVenda.FieldByName('ID_COMPRADOR').AsInteger;
      Params.ParamByName('pDATA_CADASTRO').AsDate        := aCdsVenda.FieldByName('DATA_CADASTRO').AsDateTime;
      Params.ParamByName('pUSUARIO').AsInteger           := aCdsVenda.FieldByName('USUARIO').AsInteger;
      Params.ParamByName('pDATA_RECEITA').AsDate         := aCdsVenda.FieldByName('DATA_RECEITA').AsDateTime;
      Params.ParamByName('pHORA_VENDA').AsString         := aCdsVenda.FieldByName('HORA_VENDA').AsString;
      //
      if (aCdsVenda.FieldByName('TIPO_RECEITUARIO').AsInteger = 5) Then
      begin
           Params.ParamByName('pPAC_NOME').AsString   := aCdsVenda.FieldByName('PAC_NOME').AsString;
           Params.ParamByName('pPAC_IDADE').AsInteger := aCdsVenda.FieldByName('PAC_IDADE').AsInteger;
           Params.ParamByName('pPAC_UND_IDADE').AsInteger := aCdsVenda.FieldByName('PAC_UND_IDADE').AsInteger;
           Params.ParamByName('pPAC_SEXO').AsString   := aCdsVenda.FieldByName('PAC_SEXO').AsString;
           Params.ParamByName('pPAC_DATA_NASC').AsDate := aCdsVenda.FieldByName('PAC_DATA_NASC').AsDateTime;
      End;
      //
      ExecSQL();
      Result := True;
    finally
      free;
    end;
end;

function TdmDados.AddLogUsuario(iUSUARIO: INTEGER; aDTMOVI: TDATE;
  aACAO: String): Boolean;
var qraux : TSQLquery;
    texto : string;
    iSequencia : Integer;
begin
  result := False;
  RefreshCDS(cdsConfig);
  cdsConfig.Edit;
  cdsConfigCFG_SEQTAREFA.AsInteger :=
     cdsConfigCFG_SEQTAREFA.AsInteger + 1;
  cdsConfig.ApplyUpdates(0);
  //
  iSequencia := cdsConfigCFG_SEQTAREFA.AsInteger;
  //
  texto := 'Insert Into TAREFAS_USUARIOS (TAR_SEQUENCIA, TAR_USUARIO, TAR_DTMOVI, TAR_ACAO, TAR_STATUS) ';
  texto := texto  + 'Values (:pSEQUENCIA, :pUSUARIO, :pDTMOVI, :pACAO, :pSTATUS) ';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
  begin
    try
         SQLConnection := dmDados.sqlSNGPN;
         sql.Add(texto);
         Params.ParamByName('pSEQUENCIA').AsInteger  := iSequencia;
         Params.ParamByName('pUSUARIO').AsInteger    := iUSUARIO;
         Params.ParamByName('pDTMOVI').AsDate        := aDTMOVI;
         Params.ParamByName('pACAO').AsString        := aACAO;
         Params.ParamByName('pSTATUS').AsString      := 'U';
         ExecSQL();
         //
         result := True;
    finally
      free;
    end;
  End;

end;

end.

