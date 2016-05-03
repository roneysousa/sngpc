program InfoG2SNGPC;

uses
  Forms,
  uFormMainSngpc in 'uFormMainSngpc.pas' {frmMain},
  udmDados in 'udmDados.pas' {dmDados: TDataModule},
  udmPesquisa in 'udmPesquisa.pas' {dmPesquisa: TDataModule},
  uFuncoes in 'uFuncoes.pas',
  uSobre in 'uSobre.pas' {frmSobre},
  uLogon in 'uLogon.pas' {frmLogon},
  uFrmCadastro in 'uFrmCadastro.pas' {frmCadastro},
  uFrmCadLoja in 'uFrmCadLoja.pas' {frmCadLojas},
  uFrmCadComprador in 'uFrmCadComprador.pas' {frmCadComprador},
  uFrmCadMedicos in 'uFrmCadMedicos.pas' {frmCadMedico},
  uFrmCadProdutos in 'uFrmCadProdutos.pas' {frmCadProdutos},
  uFrmCadReceituario in 'uFrmCadReceituario.pas' {frmCadReceituario},
  uFrmCadUsoMedicamneto in 'uFrmCadUsoMedicamneto.pas' {frmCadUsoMedicamento},
  uFrmCadConsProfissional in 'uFrmCadConsProfissional.pas' {frmCadConsProfissional},
  uFrmCadOpNotaFiscal in 'uFrmCadOpNotaFiscal.pas' {frmCadOpNotaFiscal},
  uFrmCadMotivoPerda in 'uFrmCadMotivoPerda.pas' {frmCadMotivoPerda},
  uFrmCadUndInsumo in 'uFrmCadUndInsumo.pas' {frmCadUndInsumo},
  uFrmCadUndFarmaco in 'uFrmCadUndFarmaco.pas' {frmCadUndFarmaco},
  uFrmCadTipoDoc in 'uFrmCadTipoDoc.pas' {frmCadTipoDocumento},
  uFrmCadOrgaoExpedidor in 'uFrmCadOrgaoExpedidor.pas' {frmCadOrgaoExpedidor},
  uFrmConfig in 'uFrmConfig.pas' {frmConfig},
  uFrmCadUsuarios in 'uFrmCadUsuarios.pas' {frmCadUsuarios},
  uFrmInventario in 'uFrmInventario.pas' {frmInvertario},
  uFrmLocPadrao in 'uFrmLocPadrao.pas' {frmLocalizaPadrao},
  ufrmLocProduto in 'ufrmLocProduto.pas' {frmLocProduto},
  uFrmManuEstoque in 'uFrmManuEstoque.pas' {frmManuEstoque},
  uFrmListaEstoque in 'uFrmListaEstoque.pas' {frmListaEstoque},
  uFrmCadEntradaProdutos in 'uFrmCadEntradaProdutos.pas' {frmCadEntradaProdutos},
  uFrmAberturaInvertario in 'uFrmAberturaInvertario.pas' {frmCadAberturaInvertario},
  uFrmFecharInvertario in 'uFrmFecharInvertario.pas' {FrmFecharInvertario},
  uFrmConsultaEstoque in 'uFrmConsultaEstoque.pas' {frmConsultaEstoque},
  uFrmTransmitiArquivo in 'uFrmTransmitiArquivo.pas' {FrmTransmitirArquivo},
  sngpc_homologacao in 'sngpc_homologacao.pas',
  uMD5 in 'uMD5.pas',
  uFrmVendas in 'uFrmVendas.pas' {frmCadVendas},
  uFrmLocOrgaoExpedidor in 'uFrmLocOrgaoExpedidor.pas' {frmLocOrgaoExpedidor},
  uFrmLocProdutoEstoque in 'uFrmLocProdutoEstoque.pas' {frmLocProdutoEstoque},
  uFrmCadPerdas in 'uFrmCadPerdas.pas' {frmCadPerdas},
  uFrmGeraArquivo in 'uFrmGeraArquivo.pas' {frmGerarArquivo},
  uFrmConsulta in 'uFrmConsulta.pas' {frmConsulta},
  uFrmConsVendas in 'uFrmConsVendas.pas' {frmConsultaVendas},
  uFrmConsEntradas in 'uFrmConsEntradas.pas' {frmConsEntradas},
  uFrmConsPerdas in 'uFrmConsPerdas.pas' {frmConsPerdas},
  uFrmCadFechamentoMovimento in 'uFrmCadFechamentoMovimento.pas' {frmCadFechamentoMovimento},
  uFrmImportaDados in 'uFrmImportaDados.pas' {FrmImportaDados},
  uFrmCadTransferencia in 'uFrmCadTransferencia.pas' {FrmCadTransferencia},
  uFrmConsTransf in 'uFrmConsTransf.pas' {frmConsTransf},
  uFrmRelPadrao in 'uFrmRelPadrao.pas' {frmRelPadrao},
  uFrmRelEstoque in 'uFrmRelEstoque.pas' {frmRelEstoque},
  uFrmRelBalanco in 'uFrmRelBalanco.pas' {frmRelBalanco},
  uFrmConfirmaArquivo in 'uFrmConfirmaArquivo.pas' {FrmConfirmaArquivo},
  uFrmCadFechamentoMovimento2 in 'uFrmCadFechamentoMovimento2.pas' {frmCadFechamentoMovimento2},
  uFrmRelMovProduto in 'uFrmRelMovProduto.pas' {FrmRelMovProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TdmPesquisa, dmPesquisa);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
