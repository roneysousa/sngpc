unit uFrmGeraArquivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, ComCtrls, Mask, ToolEdit,
  BmsXPProgressBar, FMTBcd, DB, SqlExpr, DBClient, Provider, Grids, DBGrids;

type
  TfrmGerarArquivo = class(TForm)
    Panel4: TPanel;
    Image1: TImage;
    PageControl1: TPageControl;
    Panel1: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    TabSheet1: TTabSheet;
    edtDTINIC: TDateEdit;
    edtDTFINA: TDateEdit;
    Label1: TLabel;
    Panel2: TPanel;
    lblPercentual: TLabel;
    BmsXPProgressBar1: TBmsXPProgressBar;
    Label2: TLabel;
    Label14: TLabel;
    cmbLojas: TComboBox;
    Panel3: TPanel;
    grdConsultar: TDBGrid;
    dsPeriodos: TDataSource;
    dstPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsEntradas: TClientDataSet;
    cdsEntradasID_ENTRADA: TIntegerField;
    cdsEntradasID_LOJA: TIntegerField;
    cdsEntradasNR_NOTAFISCAL: TIntegerField;
    cdsEntradasTIPO_OPERACAO_NF: TIntegerField;
    cdsEntradasCNPJ_ORIGEM: TStringField;
    cdsEntradasCNPJ_DESTINO: TStringField;
    cdsEntradasDATA_RECEBIMENTO: TDateField;
    cdsEntradasDATA_NOTA: TDateField;
    cdsEntradasFLINSUMO: TStringField;
    cdsEntradasSITUACAO: TStringField;
    cdsEntradasARQUIVO: TStringField;
    cdsEntradasDATA_ARQUIVO: TDateField;
    cdsEntradaProdutos: TClientDataSet;
    cdsEntradaProdutosID_ENTRADA: TIntegerField;
    cdsEntradaProdutosREGISTRO_MS: TStringField;
    cdsEntradaProdutosNUMERO_LOTE: TStringField;
    cdsEntradaProdutosQUANTIDADE: TBCDField;
    cdsEntradaProdutosFLUXO_INSUMO: TStringField;
    cdsEntradaProdutosUND_ENTRADA: TStringField;
    cdsEntradaProdutosCNPJ_FORNECEDOR: TStringField;
    cdsEntradaProdutosDATA_VENCIMENTO: TDateField;
    dstMovEntrada: TSQLDataSet;
    dstMovEntradaItem: TSQLDataSet;
    dspMovEntrada: TDataSetProvider;
    dspMovEntradaItem: TDataSetProvider;
    cdsMovEntrada: TClientDataSet;
    cdsMovEntradaItem: TClientDataSet;
    cdsMovEntradaID_ENTRADA: TIntegerField;
    cdsMovEntradaID_LOJA: TIntegerField;
    cdsMovEntradaDATA_RECEBIMENTO: TDateField;
    cdsMovEntradaNR_NOTAFISCAL: TIntegerField;
    cdsMovEntradaTIPO_OPERACAO_NF: TIntegerField;
    cdsMovEntradaCNPJ_ORIGEM: TStringField;
    cdsMovEntradaCNPJ_DESTINO: TStringField;
    cdsMovEntradaDATA_NOTA: TDateField;
    cdsMovEntradaSITUACAO: TStringField;
    cdsMovEntradaARQUIVO: TStringField;
    cdsMovEntradaDATA_ARQUIVO: TDateField;
    cdsMovEntradaItemID_ENTRADA: TIntegerField;
    cdsMovEntradaItemREGISTRO_MS: TStringField;
    cdsMovEntradaItemNUMERO_LOTE: TStringField;
    cdsMovEntradaItemQUANTIDADE: TBCDField;
    cdsMovEntradaItemPRO_ANTIMICROBIANOS: TStringField;
    cdsMovEntradaItemPRO_UNIDADE_MEDIDA: TStringField;
    dstMovVendas: TSQLDataSet;
    dspMovVendas: TDataSetProvider;
    cdsMovVendas: TClientDataSet;
    cdsMovVendasID_VENDA: TIntegerField;
    cdsMovVendasID_LOJA: TIntegerField;
    cdsMovVendasDATA_VENDA: TDateField;
    cdsMovVendasDATA_RECEITA: TDateField;
    cdsMovVendasTIPO_RECEITUARIO: TIntegerField;
    cdsMovVendasNR_NOT_MEDICAMENTO: TStringField;
    cdsMovVendasID_PRESCRITOR: TIntegerField;
    cdsMovVendasUSO_MEDICAMENTO: TIntegerField;
    cdsMovVendasID_COMPRADOR: TIntegerField;
    cdsMovVendasSITUACAO: TStringField;
    cdsMovVendasARQUIVO: TStringField;
    cdsMovVendasDATA_ARQUIVO: TDateField;
    cdsMovVendasPAC_NOME: TStringField;
    cdsMovVendasPAC_IDADE: TIntegerField;
    cdsMovVendasPAC_UND_IDADE: TIntegerField;
    cdsMovVendasPAC_SEXO: TStringField;
    dstMovVendasItens: TSQLDataSet;
    dspMovVendasItens: TDataSetProvider;
    cdsMovVendasItens: TClientDataSet;
    cdsMovVendasItensID_VENDA: TIntegerField;
    cdsMovVendasItensREGISTRO_MS: TStringField;
    cdsMovVendasItensNUMERO_LOTE: TStringField;
    cdsMovVendasItensQUANT_MEDICAMENTO: TBCDField;
    cdsMovVendasItensPRO_ANTIMICROBIANOS: TStringField;
    cdsMovVendasItensPRO_UNIDADE_MEDIDA: TStringField;
    dstMovPerdas: TSQLDataSet;
    dstMovPerdasItens: TSQLDataSet;
    dspMovPerdas: TDataSetProvider;
    dspMovPerdasItens: TDataSetProvider;
    cdsMovPerdas: TClientDataSet;
    cdsMovPerdasItens: TClientDataSet;
    cdsMovPerdasItensID_PERDA: TIntegerField;
    cdsMovPerdasItensREGISTRO_MS: TStringField;
    cdsMovPerdasItensNUMERO_LOTE: TStringField;
    cdsMovPerdasItensQUANTIDADE: TFMTBCDField;
    cdsMovPerdasItensFLUXO_INSUMO: TStringField;
    cdsMovPerdasItensUND_PERDA: TStringField;
    cdsMovPerdasItensCNPJ_FORNECEDOR: TStringField;
    cdsMovPerdasID_PERDA: TIntegerField;
    cdsMovPerdasID_LOJA: TIntegerField;
    cdsMovPerdasMOTIVO_PERDA: TIntegerField;
    cdsMovPerdasSITUACAO: TStringField;
    cdsMovPerdasARQUIVO: TStringField;
    cdsMovPerdasDATA_ARQUIVO: TDateField;
    cdsMovPerdasDATA_PERDA: TDateField;
    cdsMovPerdasItensPRO_ANTIMICROBIANOS: TStringField;
    cdsMovPerdasItensPRO_UNIDADE_MEDIDA: TStringField;
    cdsMovVendasItensUSO_PROLONGADO: TStringField;
    cdsMovVendasPAC_CID: TIntegerField;
    dstMovTransferencias: TSQLDataSet;
    dstItemTransf: TSQLDataSet;
    dspMovTransferencias: TDataSetProvider;
    dspItemTransf: TDataSetProvider;
    cdsMovTransferencias: TClientDataSet;
    cdsItemTransf: TClientDataSet;
    cdsMovTransferenciasID_TRANSFERENCIA: TIntegerField;
    cdsMovTransferenciasID_LOJA: TIntegerField;
    cdsMovTransferenciasNR_NOTAFISCAL: TIntegerField;
    cdsMovTransferenciasTIPO_OPERACAO: TIntegerField;
    cdsMovTransferenciasDATA_NOTA: TDateField;
    cdsMovTransferenciasCNPJ_ORIGEM: TStringField;
    cdsMovTransferenciasCNPJ_DESTINO: TStringField;
    cdsMovTransferenciasDATA_TRANSFERENCIA: TDateField;
    cdsMovTransferenciasFLUXO_INSUMO: TStringField;
    cdsMovTransferenciasSITUACAO: TStringField;
    cdsMovTransferenciasARQUIVO: TStringField;
    cdsMovTransferenciasDATA_ARQUIVO: TDateField;
    cdsMovTransferenciasDATA_CADASTRO: TDateField;
    cdsMovTransferenciasUSUARIO: TIntegerField;
    cdsItemTransfID_TRANSFERENCIA: TIntegerField;
    cdsItemTransfREGISTRO_MS: TStringField;
    cdsItemTransfNUMERO_LOTE: TStringField;
    cdsItemTransfQUANT_MEDICAMENTO: TBCDField;
    cdsItemTransfPRO_ANTIMICROBIANOS: TStringField;
    cdsItemTransfPRO_UNIDADE_MEDIDA: TStringField;
    btnConfirma: TBitBtn;
    procedure BtCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure cmbLojasExit(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
  private
    { Private declarations }
    function GERAR_ARQUIVO_NOVO(iLoja : Integer; M_DTINIC, M_DTFINA : TDateTime ): Boolean;
    Procedure ConfirmacaoArquivo();
  public
    { Public declarations }
  end;

var
  frmGerarArquivo: TfrmGerarArquivo;

implementation

uses uFuncoes, udmDados, udmPesquisa, uFormMainSngpc, uFrmConfirmaArquivo;

{$R *.dfm}

procedure TfrmGerarArquivo.BtCancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmGerarArquivo.FormShow(Sender: TObject);
begin
     dmDados.RefreshCDS(dmDados.cdsConfig);
     //
     {edtDTINIC.Date := Date()-1;
     edtDTFINA.Date := Date()-1;}
     //
     edtDTINIC.Date := dmDados.cdsConfigCFG_DTULTIMO_ARQUIVO_VALIDADO.AsDateTime+1;
     //
     if (edtDTINIC.Date + 6 < dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime) then
         edtDTFINA.Date := edtDTINIC.Date + 6
     Else
         if (edtDTINIC.Date + 6 > dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime) then
             edtDTFINA.Date := dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime
         Else
             edtDTFINA.Clear;
     //
     dmDados.ListaTarefas;
     //
     dmDados.CarregarLojas(cmbLojas);
     //
     If not (dmDados.VerificarQuantLojas()) Then
         cmbLojas.ItemIndex := 0
     Else
         cmbLojas.ItemIndex := -1;
end;

procedure TfrmGerarArquivo.BtGravarClick(Sender: TObject);
Var
   M_DTPERI : TDate;
   W_NMARQU, aACAO : String;
   M_CDLOJA : Integer;
begin
      //
      If uFuncoes.Empty(cmbLojas.Text) Then
       begin
            Application.MessageBox(PChar('Selecione a Loja.'),
               'ARQUIVO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            cmbLojas.SetFocus;
            Exit;
       End;
       //
       If not uFuncoes.Empty(ufuncoes.RemoveChar(edtDTINIC.Text))
          and not uFuncoes.Empty(ufuncoes.RemoveChar(edtDTFINA.Text)) Then
        begin
            try
              if (edtDTFINA.Date < edtDTINIC.Date) Then
               begin
                   edtDTFINA.SetFocus;
                   Raise Exception.Create('Período final deve ser maior ou igual ao período inicial.');
               End;
            except
                on EConvertError do
                begin
                    ShowMessage ('Data Inválida!');
                    edtDTFINA.SetFocus;
                End;
            end;
        End;
        //
        if (edtDTFINA.Date > edtDTINIC.Date + 6) Then
            begin
                 edtDTFINA.SetFocus;
                 Raise Exception.Create('Período final superior a 7 dias do período inicial.');
            End;
       //
       if not (dmDados.GetDataUltimoMov(edtDTFINA.Date)) Then
            begin
                 edtDTFINA.SetFocus;
                 Raise Exception.Create('Movimento do dia '+edtDTFINA.Text +' ainda não foi fechado.');
            End;
       //
       If Application.MessageBox('Confirma a geração do arquivo?',
            'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then
              Exit;
       //
      dmDados.RefreshCDS(dmDados.cdsConfig);
      M_DTPERI := dmDados.cdsConfigCFG_DTULTIMO_ARQUIVO_VALIDADO.AsDateTime;
      M_CDLOJA := dmDados.GetCodigoLoja(cmbLojas.Text);
      //
      try
         If (GERAR_ARQUIVO_NOVO(M_CDLOJA, edtDTINIC.Date, edtDTFINA.Date)) then
          begin
               dmDados.FilterCDS(dmDados.cdsLojas, fsInteger, InttoStr(M_CDLOJA));
               If not (dmDados.cdsLojas.IsEmpty) Then
                begin
                     With dmDados.cdsLojas do
                      begin
                           Edit;
                           FieldByName('EMP_ULTIMO_PERIODO').AsDateTime := edtDTFINA.Date;
                           //
                           Post;
                           ApplyUpdates(0);
                           //
                           Close;
                      End;
                End;
               aACAO := edtDTINIC.Text + ' A ' + edtDTFINA.Text + ' - '+ TimetoStr(Time);
               W_NMARQU := StrZero(dmDados.cdsConfig.FieldByName('CFG_ARQUIVO').AsString,8)+'.XML';
               dmDados.AddTarefaUsuario(StrtoInt(uFormMainSngpc.M_CDUSUA), Date(), aACAO, W_NMARQU);
               //
               Application.MessageBox(PChar('Arquivo '+W_NMARQU+' gerado com sucesso.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               Close;
          End;
      Except
          on e: exception do
          begin
              Application.MessageBox(PChar('Erro na geração do arquivo! Erro:'+#13
                      + E.Message),
                      'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
          End;
      End;
end;

procedure TfrmGerarArquivo.edtDTINICExit(Sender: TObject);
begin
     If not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINIC.Text)) Then
     begin
        try
            edtDTINIC.Date := StrToDate(edtDTINIC.Text);
            //
            if not (dmDados.GetDataUltimoMov(edtDTINIC.Date)) Then
            begin
                 edtDTINIC.SetFocus;
                 Raise Exception.Create('Movimento do dia '+edtDTINIC.Text +' ainda não foi fechado.');
            End;
            //
        except
              on EConvertError do
              begin
                  ShowMessage ('Data Inválida!');
                  edtDTINIC.SetFocus;
              End;
        end;
     End;
end;

procedure TfrmGerarArquivo.edtDTFINAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINA.Text)) Then
     begin
        try
            edtDTFINA.Date := StrToDate(edtDTFINA.Text);
            if (edtDTFINA.Date < edtDTINIC.Date) Then
              Raise Exception.Create('Período final deve ser maior ou igual ao período inicial.');
            //
            if not (dmDados.GetDataUltimoMov(edtDTFINA.Date)) Then
            begin
                 edtDTFINA.SetFocus;
                 Raise Exception.Create('Movimento do dia '+edtDTFINA.Text +' ainda não foi fechado.');
            End; 
            //
            if (edtDTFINA.Date > edtDTINIC.Date + 6) Then
            begin
                 edtDTFINA.SetFocus;
                 Raise Exception.Create('Período final superior a 7 dias do período inicial.');
            End;
        except
              on EConvertError do
              begin
                  ShowMessage ('Data Inválida!');
                  edtDTFINA.SetFocus;
              End;
        end;
     End;
end;

procedure TfrmGerarArquivo.cmbLojasExit(Sender: TObject);
Var
    M_CDLOJA : Integer;
begin
     If not uFuncoes.Empty(cmbLojas.Text) Then
      begin
           M_CDLOJA := dmDados.GetCodigoLoja(cmbLojas.Text);
           //
           dmDados.FilterCDS(dmDados.cdsLojas, fsInteger, InttoStr(M_CDLOJA));
           IF not (dmDados.cdsLojas.IsEmpty) Then
             begin
                  edtDTINIC.Date := dmDados.cdsLojasEMP_ULTIMO_PERIODO.AsDateTime + 1;
                  edtDTFINA.Date := edtDTINIC.Date;
                  dmDados.cdsLojas.Close;
             End;
      End;
end;

function TfrmGerarArquivo.GERAR_ARQUIVO_NOVO(iLoja: Integer; M_DTINIC,
  M_DTFINA: TDateTime): Boolean;
var
  StringList: TStringList;
  M_PEINIC, M_PEFINA, M_NMPAST, M_NMARQU, M_UF, aCNPJ, aUsoProlongado : String;
  iMotivoPerda : Integer;
  aSexo : String;
begin
     Result := False;
     StringList := TStringList.Create;
     Try
         M_PEINIC := uFuncoes.FormatarData(DatetoStr(M_DTINIC));
         M_PEFINA := uFuncoes.FormatarData(DatetoStr(M_DTFINA));
         //
         dmDados.RefreshCDS(dmDados.cdsConfig);
         M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
         // novo
         dmDados.cdsConfig.Edit;
         dmDados.cdsConfig.FieldByName('CFG_ARQUIVO').AsInteger :=
            dmDados.cdsConfig.FieldByName('CFG_ARQUIVO').AsInteger + 1;
         //dmDados.cdsConfig.FieldByName('CFG_DTULTIMO_ARQUIVO_VALIDADO').AsDateTime := edtDTFINA.Date;
         //M_DTARQU := Date();
         dmDados.cdsConfig.Post;
         //
         dmDados.FilterCDS(dmDados.cdsLojas, fsInteger, InttoStr(iLoja));
         //
         If not (dmDados.cdsLojas.IsEmpty) Then
             aCNPJ := dmDados.cdsLojasEMP_CNPJ.AsString
         Else
             aCNPJ := dmDados.cdsConfigCFG_CNPJ.AsString;
         //
         M_NMARQU := StrZero(dmDados.cdsConfig.FieldByName('CFG_ARQUIVO').AsString,8)+'.XML';
         // inicia HTML
         StringList.Add('<?xml version="1.0" encoding="ISO-8859-1"?>');
         //StringList.Add('<mensagemSNGPC xmlns="http://www.anvisa.gov.br/sngpc/schema">');
         StringList.Add('<mensagemSNGPC xmlns="urn:sngpc-schema">');
         // cabeçalho
         StringList.Add('<cabecalho>');
         StringList.Add('  <cnpjEmissor>'+uFuncoes.Alltrim(aCNPJ)+'</cnpjEmissor>');
         StringList.Add('  <cpfTransmissor>'+uFuncoes.Alltrim(dmDados.cdsConfigCFG_CPF.AsString)+'</cpfTransmissor>');
         StringList.Add('  <dataInicio>'+M_PEINIC+'</dataInicio>');
         StringList.Add('  <dataFim>'+M_PEFINA+'</dataFim>');
         StringList.Add('</cabecalho>');
         StringList.Add('<corpo>');
         StringList.Add('<medicamentos>');
         //    Entradas de Produtos
         With cdsMovEntrada do
         begin
              close;
              Params.ParamByName('pLOJA').AsInteger   := iLoja;
              Params.ParamByName('pDATA1').AsDateTime := M_DTINIC;
              Params.ParamByName('pDATA2').AsDateTime := M_DTFINA;
              Open;
              //
              if not (IsEmpty) Then    // se existe entrada
              begin
                   First;
                   While not (Eof) do
                   begin
                        StringList.Add('<entradaMedicamentos>');
                        //
                        StringList.Add('<notaFiscalEntradaMedicamento>');
                        StringList.Add('   <numeroNotaFiscal>'+uFuncoes.Alltrim(FieldByName('NR_NOTAFISCAL').AsString)+'</numeroNotaFiscal>');
                        StringList.Add('   <tipoOperacaoNotaFiscal>'+uFuncoes.Alltrim(FieldByName('TIPO_OPERACAO_NF').AsString)+'</tipoOperacaoNotaFiscal>');
                        StringList.Add('   <dataNotaFiscal>'+uFuncoes.FormatarData(FieldByName('DATA_NOTA').AsString)+'</dataNotaFiscal>');
                        StringList.Add('   <cnpjOrigem>'+uFuncoes.Alltrim(FieldByName('CNPJ_ORIGEM').AsString)+'</cnpjOrigem>');
                        StringList.Add('   <cnpjDestino>'+uFuncoes.Alltrim(FieldByName('CNPJ_DESTINO').AsString)+'</cnpjDestino>');
                        StringList.Add('</notaFiscalEntradaMedicamento>');
                        // Itens da entrada
                        With cdsMovEntradaItem do
                        begin
                             Close;
                             Params[0].AsInteger := cdsMovEntradaID_ENTRADA.AsInteger;
                             Open;
                             //
                             if not (IsEmpty) Then
                             begin
                                  First;
                                  While not (Eof) do
                                  begin
                                       if uFuncoes.Empty(FieldByName('PRO_ANTIMICROBIANOS').AsString) Then
                                       begin
                                            raise Exception.Create('Verifique o cadastro do produto: '+FieldByName('REGISTRO_MS').AsString+#13+'Campo [Medicamento Antimicrobianos] está vazio!');
                                       End;
                                       //
                                       if uFuncoes.Empty(FieldByName('PRO_UNIDADE_MEDIDA').AsString) Then
                                       begin
                                            raise Exception.Create('Verifique o cadastro do produto: '+FieldByName('REGISTRO_MS').AsString+#13+'Campo [ Unidade Medida ] está vazio!');
                                       End;
                                       //
                                       StringList.Add('<medicamentoEntrada>');
                                       If (FieldByName('PRO_ANTIMICROBIANOS').AsString = 'N') Then
                                           StringList.Add('<classeTerapeutica>2</classeTerapeutica>')   // 2 Sujeito a controle Especial
                                       Else
                                           StringList.Add('<classeTerapeutica>1</classeTerapeutica>');  // 1 Antimicrobiano
                                       StringList.Add('   <registroMSMedicamento>'+uFuncoes.Alltrim(FieldByName('REGISTRO_MS').AsString)+'</registroMSMedicamento>');
                                       StringList.Add('   <numeroLoteMedicamento>'+uFuncoes.Alltrim(FieldByName('NUMERO_LOTE').AsString)+'</numeroLoteMedicamento>');
                                       StringList.Add('   <quantidadeMedicamento>'+FieldByName('QUANTIDADE').AsString+'</quantidadeMedicamento>');
                                       StringList.Add('   <unidadeMedidaMedicamento>'+uFuncoes.Alltrim(FieldByName('PRO_UNIDADE_MEDIDA').AsString)+'</unidadeMedidaMedicamento>');
                                       StringList.Add('</medicamentoEntrada>');
                                      //
                                      Next;
                                  End;
                             End;
                        End;
                        //
                        StringList.Add('<dataRecebimentoMedicamento>'+uFuncoes.FormatarData(cdsMovEntrada.FieldByName('DATA_RECEBIMENTO').AsString)+'</dataRecebimentoMedicamento>');
                        StringList.Add('</entradaMedicamentos>');
                        //
                        Edit;
                        FieldByname('arquivo').AsString := M_NMARQU;
                        Post;
                        //
                        Next;
                   End;   //fim-do-enquanto
                   //
                   cdsMovEntrada.ApplyUpdates(0);
              End
              Else
              begin
                   if (dmDados.GetQuantEntradasPeriodo(iLoja, M_DTINIC, M_DTFINA) > 0) Then
                      raise Exception.Create('Erro ao tentar lança entradas de medicamentos.');
              End;
         End;   // With cdsMovEntrada do
         // Venda
         With cdsMovVendas do
         begin
               Close;
               Params.ParamByName('pLOJA').AsInteger         := iLoja;
               Params.ParamByName('pDATA_INICIO').AsDateTime := M_DTINIC;
               Params.ParamByName('pDATA_FINAL').AsDateTime  := M_DTFINA;
               Params.ParamByName('SITUACAO').AsString       := 'F';
               Open;
               //
               if not (IsEmpty) Then
               begin
                    First;
                    While not (Eof) do
                    begin
                         StringList.Add('<saidaMedicamentoVendaAoConsumidor>');
                         //
                         StringList.Add('    <tipoReceituarioMedicamento>'+uFuncoes.Alltrim(FieldByName('TIPO_RECEITUARIO').AsString)+'</tipoReceituarioMedicamento>');
                         StringList.Add('    <numeroNotificacaoMedicamento>'+uFuncoes.Alltrim(FieldByName('NR_NOT_MEDICAMENTO').AsString)+'</numeroNotificacaoMedicamento>');
                         StringList.Add('    <dataPrescricaoMedicamento>'+uFuncoes.FormatarData(FieldByName('DATA_RECEITA').AsString)+'</dataPrescricaoMedicamento>');
                         // dados do médico
                         StringList.Add('    <prescritorMedicamento>');
                         //
                         dmDados.FilterCDS(dmDados.cdsMedico, fsInteger, FieldByName('ID_PRESCRITOR').AsString);
                         If not (dmDados.cdsMedico.IsEmpty) Then
                         begin
                              StringList.Add('   <nomePrescritor>'+uFuncoes.Alltrim(dmDados.cdsMedico.FieldByName('NOME_MEDICO').AsString)+'</nomePrescritor>');
                              StringList.Add('   <numeroRegistroProfissional>'+uFuncoes.Alltrim(uFuncoes.Alltrim(dmDados.cdsMedico.FieldByName('NR_RG_PROFISSIONAL').AsString))+'</numeroRegistroProfissional>');
                              M_UF := dmDados.cdsMedico.FieldByName('UF_CONSELHO').AsString;
                              StringList.Add('   <conselhoProfissional>'+uFuncoes.Alltrim(uFuncoes.GetConselhoProfissao(dmDados.cdsMedico.FieldByName('CONSELHO_PROFISSIONAL').AsInteger))+'</conselhoProfissional>');
                              StringList.Add('   <UFConselho>'+uFuncoes.Alltrim(M_UF)+'</UFConselho>');
                         End
                         Else
                             raise Exception.Create('Cadastro de Médico não encontrado.');
                         StringList.Add('    </prescritorMedicamento>');
                         //
                         StringList.Add('    <usoMedicamento>'+FieldByName('USO_MEDICAMENTO').AsString+'</usoMedicamento>');
                         // Dados do comprador
                         //StringList.Add('    <compradorMedicamento>');
                         If (uFuncoes.GetCliente(FieldByName('ID_COMPRADOR').AsInteger)) Then
                          begin
                             if (FieldByName('ID_COMPRADOR').AsInteger <> 9999999) Then
                             begin
                                 StringList.Add('<compradorMedicamento>');
                                 dmDados.FilterCDS(dmDados.cdsComprador, fsInteger, FieldByName('ID_COMPRADOR').AsString);
                                 StringList.Add('   <nomeComprador>'+dmDados.cdsComprador.FieldByName('NOME_COMPRADOR').AsString+'</nomeComprador>');
                                 StringList.Add('   <tipoDocumento>'+dmDados.cdsComprador.FieldByName('TIPO_DOCUMENTO').AsString+'</tipoDocumento>');
                                 StringList.Add('   <numeroDocumento>'+dmDados.cdsComprador.FieldByName('NR_DOCUMETO').AsString+'</numeroDocumento>');
                                 M_UF := dmDados.cdsComprador.FieldByName('UF_EMISSOA_DOC').AsString;
                                 StringList.Add('   <orgaoExpedidor>'+uFuncoes.GetOrgaoExpedidor(dmDados.cdsComprador.FieldByName('ORGAO_EXPEDIDOR').AsInteger)+'</orgaoExpedidor>');
                                 StringList.Add('   <UFEmissaoDocumento>'+M_UF+'</UFEmissaoDocumento>');
                                 StringList.Add('</compradorMedicamento>');
                             End;
                          End
                          Else
                              raise Exception.Create('Cadastro de Comprador não encontrado.');
                         // StringList.Add('    </compradorMedicamento>');
                         // Dados Paciente
                         if (cdsMovVendasTIPO_RECEITUARIO.AsInteger = 5) AND (cdsMovVendasUSO_MEDICAMENTO.AsString <> '2') then
                         begin
                              StringList.Add('    <pacienteMedicamento>');     // TO-DO
                              if ufuncoes.Empty(cdsMovVendasPAC_NOME.AsString) Then
                                 raise Exception.Create('Campo Nome do Paciente está Vazio!!! Número da venda : '+cdsMovVendasID_VENDA.AsString);
                              StringList.Add('    <nome>'+uFuncoes.Alltrim(cdsMovVendasPAC_NOME.AsString)+'</nome>');
                              if ufuncoes.Empty(cdsMovVendasPAC_IDADE.AsString) Then
                                 raise Exception.Create('Campo Idade do Paciente está Vazio!!! Número da venda : '+cdsMovVendasID_VENDA.AsString);
                              StringList.Add('    <idade>'+uFuncoes.Alltrim(cdsMovVendasPAC_IDADE.AsString)+'</idade>');
                              if ufuncoes.Empty(cdsMovVendasPAC_UND_IDADE.AsString) Then
                                 raise Exception.Create('Campo Unidade de Idade do Paciente está Vazio!!! Número da venda : '+cdsMovVendasID_VENDA.AsString);
                              StringList.Add('    <unidadeIdade>'+uFuncoes.Alltrim(cdsMovVendasPAC_UND_IDADE.AsString)+'</unidadeIdade>');
                              aSexo := cdsMovVendasPAC_SEXO.AsString;
                              If ufuncoes.Empty(aSexo) Then
                                 raise Exception.Create('Campo Sexo do Paciente está Vazio!!! Número da venda : '+cdsMovVendasID_VENDA.AsString);
                              If (aSexo = 'M') Then
                                  StringList.Add('    <sexo>1</sexo>');
                              If (aSexo = 'F') Then
                                  StringList.Add('    <sexo>2</sexo>');
                              StringList.Add('    <cid></cid>');
                              StringList.Add('    </pacienteMedicamento>');
                         End;
                         {Else
                         begin
                              StringList.Add('    <nome></nome>');
                              StringList.Add('    <idade></idade>');
                              StringList.Add('    <unidadeIdade></unidadeIdade>');
                              StringList.Add('    <sexo></sexo>');
                              StringList.Add('    <cid></cid>');
                         End; }
                         //

                         // Itens da Venda
                         With cdsMovVendasItens do
                         begin
                              Close;
                              Params[0].AsInteger := cdsMovVendasID_VENDA.AsInteger;
                              Open;
                              //
                              if not (IsEmpty) Then
                              begin
                                   First;
                                   While not (Eof) do
                                   begin
                                        if uFuncoes.Empty(FieldByName('PRO_ANTIMICROBIANOS').AsString) Then
                                        begin
                                            raise Exception.Create('Verifique o cadastro do produto: '+FieldByName('REGISTRO_MS').AsString+#13+'Campo [Medicamento Antimicrobianos] está vazio!');
                                        End;
                                        //
                                        if uFuncoes.Empty(FieldByName('PRO_UNIDADE_MEDIDA').AsString) Then
                                        begin
                                            raise Exception.Create('Verifique o cadastro do produto: '+FieldByName('REGISTRO_MS').AsString+#13+'Campo [ Unidade Medida ] está vazio!');
                                        End;
                                        //
                                        StringList.Add('<medicamentoVenda>');
                                        If not uFuncoes.Empty(FieldByName('USO_PROLONGADO').AsString) Then    // TO-Do
                                            StringList.Add('    <usoProlongado>'+FieldByName('USO_PROLONGADO').AsString+'</usoProlongado>')
                                        Else
                                            StringList.Add('    <usoProlongado></usoProlongado>');
                                        StringList.Add('    <registroMSMedicamento>'+ufuncoes.Alltrim(FieldByName('REGISTRO_MS').AsString)+'</registroMSMedicamento>');
                                        StringList.Add('    <numeroLoteMedicamento>'+ufuncoes.Alltrim(FieldByName('NUMERO_LOTE').AsString)+'</numeroLoteMedicamento>');
                                        StringList.Add('    <quantidadeMedicamento>'+FieldByName('QUANT_MEDICAMENTO').AsString+'</quantidadeMedicamento>');
                                        StringList.Add('    <unidadeMedidaMedicamento>'+ufuncoes.Alltrim(FieldByName('PRO_UNIDADE_MEDIDA').AsString)+'</unidadeMedidaMedicamento> ');
                                        StringList.Add('</medicamentoVenda>');
                                        //
                                        Next;
                                   End;
                              End;
                         End;
                         //
                         StringList.Add('<dataVendaMedicamento>'+uFuncoes.FormatarData(cdsMovVendasDATA_VENDA.AsString)+'</dataVendaMedicamento>');
                         StringList.Add('</saidaMedicamentoVendaAoConsumidor>');
                         //
                         Edit;
                         FieldByname('arquivo').AsString := M_NMARQU;
                         Post;
                         // Proxima venda
                         Next;
                    End;
                    //
                    cdsMovVendas.ApplyUpdates(0);
               End;
         End;  // With cdsMovVendas do
         //   Transferencias
         //StringList.Add('<saidaMedicamentoTransferencia>');
         //
         With cdsMovTransferencias do
         begin
              close;
              Params.ParamByName('pLOJA').AsInteger := iLoja;
              Params.ParamByName('pDATA1').AsDate   := M_DTINIC;
              Params.ParamByName('pDATA2').AsDate   := M_DTFINA;
              Open;
              //
              if not (IsEmpty) Then    // se existe Transferencia
              begin
                   First;
                   While not (Eof) do
                   begin
                        //
                        StringList.Add('<saidaMedicamentoTransferencia>');
                        StringList.Add('<notaFiscalTransferenciaMedicamento>');
                        StringList.Add('<numeroNotaFiscal>'+uFuncoes.Alltrim(fieldByName('NR_NOTAFISCAL').AsString)+'</numeroNotaFiscal>');
                        StringList.Add('<tipoOperacaoNotaFiscal>'+uFuncoes.Alltrim(fieldByName('TIPO_OPERACAO').AsString)+'</tipoOperacaoNotaFiscal>');
                        StringList.Add('<dataNotaFiscal>'+uFuncoes.FormatarData(FieldByName('DATA_NOTA').AsString)+'</dataNotaFiscal>');
                        StringList.Add('<cnpjOrigem>'+uFuncoes.Alltrim(FieldByName('CNPJ_ORIGEM').AsString)+'</cnpjOrigem>');
                        StringList.Add('<cnpjDestino>'+uFuncoes.Alltrim(FieldByName('CNPJ_DESTINO').AsString)+'</cnpjDestino>');
                        StringList.Add('</notaFiscalTransferenciaMedicamento>');
                        // Itens da Transferencia
                        With cdsItemTransf do
                        begin
                             Close;
                             Params[0].AsInteger := cdsMovTransferenciasID_TRANSFERENCIA.AsInteger;
                             Open;
                             //
                             if not (IsEmpty) Then
                             begin
                                  First;
                                  While not (Eof) do
                                  begin
                                       if uFuncoes.Empty(FieldByName('PRO_ANTIMICROBIANOS').AsString) Then
                                       begin
                                            raise Exception.Create('Verifique o cadastro do produto: '+FieldByName('REGISTRO_MS').AsString+#13+'Campo [Medicamento Antimicrobianos] está vazio!');
                                       End;
                                       //
                                       if uFuncoes.Empty(FieldByName('PRO_UNIDADE_MEDIDA').AsString) Then
                                       begin
                                            raise Exception.Create('Verifique o cadastro do produto: '+FieldByName('REGISTRO_MS').AsString+#13+'Campo [ Unidade Medida ] está vazio!');
                                       End;
                                       //
                                       StringList.Add('<medicamentoTransferencia>');
                                       {If (FieldByName('PRO_ANTIMICROBIANOS').AsString = 'N') Then
                                           StringList.Add('<classeTerapeutica>2</classeTerapeutica>')   // 2 Sujeito a controle Especial
                                       Else
                                           StringList.Add('<classeTerapeutica>1</classeTerapeutica>');  // 1 Antimicrobiano  }
                                       StringList.Add('   <registroMSMedicamento>'+uFuncoes.Alltrim(FieldByName('REGISTRO_MS').AsString)+'</registroMSMedicamento>');
                                       StringList.Add('   <numeroLoteMedicamento>'+uFuncoes.Alltrim(FieldByName('NUMERO_LOTE').AsString)+'</numeroLoteMedicamento>');
                                       StringList.Add('   <quantidadeMedicamento>'+FieldByName('QUANT_MEDICAMENTO').AsString+'</quantidadeMedicamento>');
                                       StringList.Add('   <unidadeMedidaMedicamento>'+uFuncoes.Alltrim(FieldByName('PRO_UNIDADE_MEDIDA').AsString)+'</unidadeMedidaMedicamento>');
                                       StringList.Add('</medicamentoTransferencia>');
                                      // Proximo item
                                      Next;
                                  End;
                             End;
                        End;
                        //
                        StringList.Add('<dataTransferenciaMedicamento>'+uFuncoes.FormatarData(cdsMovTransferencias.FieldByName('DATA_TRANSFERENCIA').AsString)+'</dataTransferenciaMedicamento>');
                        StringList.Add('</saidaMedicamentoTransferencia>');
                        //
                        Next;
                   End;
              End;
         End;   // With cdsMovTransferencias do
         //StringList.Add('</saidaMedicamentoTransferencia>');
         //   Perdas
         With cdsMovPerdas do
         begin
              Close;
              Params.ParamByName('pLOJA').AsInteger   := iLoja;
              Params.ParamByName('pDATA1').AsDateTime := M_DTINIC;
              Params.ParamByName('pDATA2').AsDateTime := M_DTFINA;
              open;
              //
              If not (IsEmpty) Then
               begin
                    First;
                    //
                    While not (Eof) do
                    begin
                         iMotivoPerda := FieldByName('MOTIVO_PERDA').AsInteger;
                         //
                         with cdsMovPerdasItens do
                         begin
                              Close;
                              Params[0].AsInteger := cdsMovPerdasID_PERDA.AsInteger;
                              Open;
                              //
                              if not (IsEmpty) then
                              begin
                                   First;
                                   While not (Eof) do
                                   begin
                                        StringList.Add('<saidaMedicamentoPerda>');
                                        StringList.Add('<motivoPerdaMedicamento>'+InttoStr(iMotivoPerda)+'</motivoPerdaMedicamento>');
                                        StringList.Add('   <medicamentoPerda>');
                                        StringList.Add('   <registroMSMedicamento>'+ufuncoes.Alltrim(FieldByName('REGISTRO_MS').AsString)+'</registroMSMedicamento> ');
                                        StringList.Add('   <numeroLoteMedicamento>'+ufuncoes.Alltrim(FieldByName('NUMERO_LOTE').AsString)+'</numeroLoteMedicamento>');
                                        StringList.Add('   <quantidadeMedicamento>'+FieldByName('QUANTIDADE').AsString+'</quantidadeMedicamento>');
                                        StringList.Add('   <unidadeMedidaMedicamento>'+ufuncoes.Alltrim(FieldByName('PRO_UNIDADE_MEDIDA').AsString)+'</unidadeMedidaMedicamento>');
                                        StringList.Add('   </medicamentoPerda>');
                                        StringList.Add('<dataPerdaMedicamento>'+uFuncoes.FormatarData(cdsMovPerdasDATA_PERDA.AsString)+'</dataPerdaMedicamento>');
                                        StringList.Add('</saidaMedicamentoPerda>');
                                        //
                                        Next;
                                   End;
                              End;
                         End;
                         //
                         Edit;
                         FieldByname('arquivo').AsString := M_NMARQU;
                         Post;
                         //
                         Next;
                    End;
                    //
                    cdsMovPerdas.ApplyUpdates(0);
               End;
         End;
         //
         {StringList.Add('<entradaMedicamentoTransformacao>');
         StringList.Add('</entradaMedicamentoTransformacao>');
         StringList.Add('<saidaMedicamentoTransformacaoVendaAoConsumidor>');
         StringList.Add('</saidaMedicamentoTransformacaoVendaAoConsumidor>');
         StringList.Add('<saidaMedicamentoTransformacaoPerda>');
         StringList.Add('</saidaMedicamentoTransformacaoPerda>'); }
         //
         StringList.Add('</medicamentos>');
         //
         StringList.Add('<insumos>');
         StringList.Add('</insumos>');
         //
         StringList.Add('</corpo>');
         StringList.Add('</mensagemSNGPC>');
         // salva Html
         StringList.SaveToFile( M_NMPAST+'\'+M_NMARQU);
         //
         dmDados.Start;
         try
               dmDados.cdsConfig.ApplyUpdates(0);
               //
               dmDados.Comit(dmDados.Transc);
               //
               Result := True;
         Except
              dmDados.Rollback;
         End;
      Finally
         StringList.Free;
      End;

  // Copiar arquivo
{  Origem  := M_NMPAST+'\'+M_NMARQU;
  Destino := M_NMPAST+'\Arquivos\'+M_NMARQU;}
  //CopiaArquivo(Origem, Destino);
end;

procedure TfrmGerarArquivo.ConfirmacaoArquivo;
Var
  aData : String;
begin
    if (dmDados.cdsPeriodos.Active) and not (dmDados.cdsPeriodos.IsEmpty) Then
    begin
       aData := Copy(dmDados.cdsPeriodos.fieldByName('ACAO').AsString,14,10);
       try
             Strtodate(aData);
       Except
             Raise Exception.Create('Formato de data inválida.');
       End;
       //
       Application.CreateForm(TFrmConfirmaArquivo, FrmConfirmaArquivo);
       Try
           uFrmConfirmaArquivo.aDataMov   := aData;
           uFrmConfirmaArquivo.idRegistro := dmDados.cdsPeriodosID.AsInteger;
           If (FrmConfirmaArquivo.ShowModal = mrOk) Then
             begin
                  dmDados.cdsPeriodos.Edit;
                  dmDados.cdsPeriodosSTATUS.AsString := 'V';
                  dmDados.cdsPeriodos.Post;
             End;
       Finally
           FrmConfirmaArquivo.Free;
       End;
    End;
end;

procedure TfrmGerarArquivo.grdConsultarDblClick(Sender: TObject);
begin
    ConfirmacaoArquivo;
end;

procedure TfrmGerarArquivo.btnConfirmaClick(Sender: TObject);
begin
      ConfirmacaoArquivo;
end;

End.
