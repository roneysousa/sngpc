unit uFrmCadFechamentoMovimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, DBClient, Provider, DB, SqlExpr, jpeg,
  ExtCtrls, Buttons, Grids, DBGrids, StdCtrls, ComCtrls, ImgList;

type
  TfrmCadFechamentoMovimento = class(TfrmCadastro)
    BitBtn1: TBitBtn;
    btnConfirma: TBitBtn;
    Panel5: TPanel;
    Panel6: TPanel;
    PageControl2: TPageControl;
    tsEntradas: TTabSheet;
    tsVendas: TTabSheet;
    tsPerdas: TTabSheet;
    dstListas: TSQLDataSet;
    dpsListas: TDataSetProvider;
    cdsListaEntradas: TClientDataSet;
    cdsListaVendas: TClientDataSet;
    cdsListaPerdas: TClientDataSet;
    cdsListaEntradasID_ENTRADA: TIntegerField;
    cdsListaEntradasID_LOJA: TIntegerField;
    cdsListaEntradasNR_NOTAFISCAL: TIntegerField;
    cdsListaEntradasTIPO_OPERACAO_NF: TIntegerField;
    cdsListaEntradasCNPJ_ORIGEM: TStringField;
    cdsListaEntradasCNPJ_DESTINO: TStringField;
    cdsListaEntradasDATA_RECEBIMENTO: TDateField;
    cdsListaEntradasDATA_NOTA: TDateField;
    cdsListaEntradasFLINSUMO: TStringField;
    cdsListaEntradasSITUACAO: TStringField;
    cdsListaEntradasARQUIVO: TStringField;
    cdsListaEntradasDATA_ARQUIVO: TDateField;
    cdsListaEntradasHORA_RECEBIMENTO: TStringField;
    cdsListaEntradasDATA_CADASTRO: TDateField;
    cdsListaEntradasUSUARIO: TIntegerField;
    cdsListaVendasID_VENDA: TIntegerField;
    cdsListaVendasID_LOJA: TIntegerField;
    cdsListaVendasDATA_VENDA: TDateField;
    cdsListaVendasDATA_RECEITA: TDateField;
    cdsListaVendasTIPO_RECEITUARIO: TIntegerField;
    cdsListaVendasNR_NOT_MEDICAMENTO: TStringField;
    cdsListaVendasID_PRESCRITOR: TIntegerField;
    cdsListaVendasUSO_MEDICAMENTO: TIntegerField;
    cdsListaVendasID_COMPRADOR: TIntegerField;
    cdsListaVendasFLUXO_INSUMO: TStringField;
    cdsListaVendasSITUACAO: TStringField;
    cdsListaVendasARQUIVO: TStringField;
    cdsListaVendasDATA_ARQUIVO: TDateField;
    cdsListaVendasPAC_CODIGO: TIntegerField;
    cdsListaVendasPAC_NOME: TStringField;
    cdsListaVendasPAC_IDADE: TIntegerField;
    cdsListaVendasPAC_DATA_NASC: TDateField;
    cdsListaVendasPAC_UND_IDADE: TIntegerField;
    cdsListaVendasPAC_SEXO: TStringField;
    cdsListaVendasPAC_CID: TIntegerField;
    cdsListaVendasDATA_CADASTRO: TDateField;
    cdsListaVendasHORA_VENDA: TStringField;
    cdsListaVendasUSUARIO: TIntegerField;
    dbGridEntradas: TDBGrid;
    dsEntradas: TDataSource;
    dsVendas: TDataSource;
    dsPerdas: TDataSource;
    dbGridVendas: TDBGrid;
    dbGridPerdas: TDBGrid;
    Label1: TLabel;
    edtDataMov: TEdit;
    cdsListaEntradasNOME_LOJA: TStringField;
    cdsListaVendasNOME_CLIENTE: TStringField;
    cdsListaVendasNOME_MEDICO: TStringField;
    dstListaItens: TSQLDataSet;
    dspListaItens: TDataSetProvider;
    cdsItensEntrada: TClientDataSet;
    cdsListaItensVenda: TClientDataSet;
    cdsListaItensPerda: TClientDataSet;
    cdsItensEntradaID_ENTRADA: TIntegerField;
    cdsItensEntradaREGISTRO_MS: TStringField;
    cdsItensEntradaNUMERO_LOTE: TStringField;
    cdsItensEntradaQUANTIDADE: TBCDField;
    cdsItensEntradaPRO_ANTIMICROBIANOS: TStringField;
    cdsItensEntradaPRO_UNIDADE_MEDIDA: TStringField;
    cdsListaItensVendaID_VENDA: TIntegerField;
    cdsListaItensVendaREGISTRO_MS: TStringField;
    cdsListaItensVendaNUMERO_LOTE: TStringField;
    cdsListaItensVendaQUANT_MEDICAMENTO: TBCDField;
    cdsListaItensVendaPRO_ANTIMICROBIANOS: TStringField;
    cdsListaItensVendaPRO_UNIDADE_MEDIDA: TStringField;
    cdsListaItensVendaUSO_PROLONGADO: TStringField;
    tsEstoque: TTabSheet;
    dbGridEstoque: TDBGrid;
    cdsListaEstoqueAnterior: TClientDataSet;
    cdsListaEstoqueAnteriorEST_CDLOJA: TIntegerField;
    cdsListaEstoqueAnteriorEST_CDPROD: TStringField;
    cdsListaEstoqueAnteriorPRO_MEDICAMENTO: TStringField;
    cdsListaEstoqueAnteriorEST_NRLOTE: TStringField;
    cdsListaEstoqueAnteriorEST_QUANTIDADE: TFMTBCDField;
    cdsListaEstoqueAnteriorEST_DTVENCIMENTO: TDateField;
    cdsListaEstoqueAnteriorEST_DTMOVIMENTO: TDateField;
    cdsListaEstoqueAnteriorTOTAL_VENDAS: TFloatField;
    cdsListaEstoqueAnteriorTOTAL_ENTRADAS: TFloatField;
    cdsListaEstoqueAnteriorTOTAL_PERDAS: TFloatField;
    cdsListaEstoqueAnteriorTOTAL_TRANSFERENCIAS: TFloatField;
    dsListaEstoqueAnterior: TDataSource;
    cdsListaEstoqueAnteriorSALDO: TFloatField;
    cdsListaEstoqueAnteriorOK: TBooleanField;
    ImageList1: TImageList;
    pnlItensEntrada: TPanel;
    DBGrid1: TDBGrid;
    dsItensEntrada: TDataSource;
    cdsItensEntradaNOME_PRODUTO: TStringField;
    cdsListaItensVendaNOME_PRODUTO: TStringField;
    dsItensVenda: TDataSource;
    pnlItensVenda: TPanel;
    DBGrid2: TDBGrid;
    Panel7: TPanel;
    DBGrid3: TDBGrid;
    dsItensPerdas: TDataSource;
    cdsListaPerdasID_PERDA: TIntegerField;
    cdsListaPerdasID_LOJA: TIntegerField;
    cdsListaPerdasDATA_CADASTRO: TDateField;
    cdsListaPerdasDATA_PERDA: TDateField;
    cdsListaPerdasMOTIVO_PERDA: TIntegerField;
    cdsListaPerdasDESCRICAO_PERDA: TStringField;
    cdsListaItensPerdaID_PERDA: TIntegerField;
    cdsListaItensPerdaREGISTRO_MS: TStringField;
    cdsListaItensPerdaNUMERO_LOTE: TStringField;
    cdsListaItensPerdaQUANTIDADE: TFMTBCDField;
    cdsListaItensPerdaNOME_PRODUTO: TStringField;
    cdsListaEstoqueAnteriorNOME_PRODUTO: TStringField;
    cdsEstoque: TClientDataSet;
    cdsEstoqueCDS_CDLOJA: TIntegerField;
    cdsEstoqueCDS_CDPROD: TStringField;
    cdsEstoqueCDS_DESCRICAO: TStringField;
    cdsEstoqueCDS_NRLOTE: TStringField;
    cdsEstoqueCDS_QTANTE: TFloatField;
    cdsEstoqueCDS_QTENTR: TFloatField;
    cdsEstoqueCDS_QTVEND: TFloatField;
    cdsEstoqueCDS_QTPERD: TFloatField;
    cdsEstoqueCDS_QTTRAN: TFloatField;
    cdsEstoqueCDS_SALDO: TFloatField;
    cdsEstoqueCDS_SITUACAO: TBooleanField;
    cdsEstoqueCDS_DTVENCIMENTO: TDateField;
    cdsMovEstoque: TClientDataSet;
    dsMovEstoque: TDataSource;
    cdsListaTransferencias: TClientDataSet;
    dsTransferencias: TDataSource;
    cdsListaTransferenciasID_TRANSFERENCIA: TIntegerField;
    cdsListaTransferenciasID_LOJA: TIntegerField;
    cdsListaTransferenciasDATA_NOTA: TDateField;
    cdsListaTransferenciasCNPJ_ORIGEM: TStringField;
    cdsListaTransferenciasCNPJ_DESTINO: TStringField;
    cdsListaTransferenciasDATA_TRANSFERENCIA: TDateField;
    cdsListaTransferenciasSITUACAO: TStringField;
    tsTransferencia: TTabSheet;
    dbGridTransferecias: TDBGrid;
    Panel8: TPanel;
    DBGrid5: TDBGrid;
    cdsListaTransferenciasLOJA_ORIGEM: TStringField;
    cdsListaTransferenciasLOJA_DESTINO: TStringField;
    cdsListaItensTransferencia: TClientDataSet;
    dsItensTransferencia: TDataSource;
    cdsListaItensTransferenciaID_TRANSFERENCIA: TIntegerField;
    cdsListaItensTransferenciaREGISTRO_MS: TStringField;
    cdsListaItensTransferenciaNUMERO_LOTE: TStringField;
    cdsListaItensTransferenciaQUANT_MEDICAMENTO: TBCDField;
    cdsListaItensTransferenciaFLUXO_INSUMO: TStringField;
    cdsListaItensTransferenciaNOME_PRODUTO: TStringField;
    Panel9: TPanel;
    btnExcluirEntrada: TBitBtn;
    Panel10: TPanel;
    btnExcluirVenda: TBitBtn;
    Panel11: TPanel;
    btnExcluirPerda: TBitBtn;
    Panel12: TPanel;
    btnExcluirTransf: TBitBtn;
    lblRegistro: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure cdsListaEntradasCalcFields(DataSet: TDataSet);
    procedure cdsListaVendasCalcFields(DataSet: TDataSet);
    procedure cdsListaEstoqueAnteriorCalcFields(DataSet: TDataSet);
    procedure dbGridEstoqueDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure cdsItensEntradaCalcFields(DataSet: TDataSet);
    procedure cdsListaItensVendaCalcFields(DataSet: TDataSet);
    procedure dsEntradasDataChange(Sender: TObject; Field: TField);
    procedure dsVendasDataChange(Sender: TObject; Field: TField);
    procedure dsPerdasDataChange(Sender: TObject; Field: TField);
    procedure cdsListaPerdasCalcFields(DataSet: TDataSet);
    procedure cdsListaItensPerdaCalcFields(DataSet: TDataSet);
    procedure cdsEstoqueCalcFields(DataSet: TDataSet);
    procedure cdsListaTransferenciasCalcFields(DataSet: TDataSet);
    procedure cdsListaItensTransferenciaCalcFields(DataSet: TDataSet);
    procedure dsTransferenciasDataChange(Sender: TObject; Field: TField);
    procedure btnExcluirEntradaClick(Sender: TObject);
    procedure btnExcluirVendaClick(Sender: TObject);
    procedure btnExcluirPerdaClick(Sender: TObject);
    procedure btnExcluirTransfClick(Sender: TObject);
    procedure dsMovEstoqueDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure AbrirMovimento(aDataMov : TDateTime);
    procedure CarregarDadosEstoqueAnterior(iLoja : Integer; aDataMov : TDatetime);
    Function VerificarValidadeEstoque(aCDSEstoque : TClientDataSet): Boolean;
    Procedure Mostrar_Itens_Entrada(idEntrada : Integer);
    Procedure Mostrar_Itens_Venda(idVenda : Integer);
    Procedure Mostrar_Itens_Perda(idPerda : Integer);
    Procedure Mostrar_Itens_Transferencia(idTransferencia : Integer);
    Procedure AtualizarDados();
  public
    { Public declarations }
  end;

var
  frmCadFechamentoMovimento: TfrmCadFechamentoMovimento;
  aDataMovAnterior : TDatetime;
  iLoja : Integer;

implementation

uses udmDados, uFuncoes, udmPesquisa, Math, uFormMainSngpc;

{$R *.dfm}

procedure TfrmCadFechamentoMovimento.FormShow(Sender: TObject);
begin
  inherited;
      TabSheet2.TabVisible := false;
      //
      dstListas.CommandText := '';
      dstListaItens.CommandText := '';
      //
      dmDados.RefreshCDS(dmDados.cdsConfig);
      edtDataMov.Text :=  dmDados.cdsConfigCFG_DATA_ATUAL.AsString;
      AbrirMovimento(dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime);
      //
      AtualizarDados();
      //
      PageControl2.ActivePageIndex := 0;
      //
      Sleep(10);
      frmMain.Info.Panels[1].Text := '';
      //
end;

procedure TfrmCadFechamentoMovimento.btnConfirmaClick(Sender: TObject);
Var
   aProduto, aLote : String;
   iLoja, iUsuario : Integer;
   fQuantidade, fQuantAtual, fQuantEntrada, fQuantVenda, fQuantPerda, fQuantTransferencias, fSaldo : Double;
   aDataVenc : String;
   idEntrada, idVenda, idPerda : Integer;
   aDataMov : TDatetime;
begin
  inherited;
     If Application.MessageBox('Confirma fechamento de movimento do dia?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
     begin
          iUsuario := StrtoInt(uFormMainSngpc.M_CDUSUA);
          //
          dmDados.RefreshCDS(dmDados.cdsConfig);
          aDataMov :=  dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime;
          iLoja    :=  dmDados.cdsConfigCFG_LOJA_PADRAO.AsInteger;
       //
     try
       btnConfirma.Enabled := false;
       //
       dmDados.ExcluirEstoqueMovimentoDia(iLoja, aDataMov);
       //
       dmDados.Start;
       try
          //
          With cdsEstoque do
          begin
              With dmDados.cdsHisEstoque do
               begin
                    Close;
                    Params.ParamByName('pLOJA').AsInteger := iLoja;
                    Params.ParamByName('pDATA').AsDate    := aDataMov;
                    Open;
               End;
               //
               First;
               While not (Eof) do
                 Begin
                        iLoja    := FieldByname('CDS_CDLOJA').AsInteger;
                        aProduto := FieldByname('CDS_CDPROD').AsString;
                        aLote    := uFuncoes.Alltrim(FieldByname('CDS_NRLOTE').AsString);
                        fQuantAtual := FieldByname('CDS_SALDO').AsFloat;
                        aDataVenc := FieldByname('CDS_DTVENCIMENTO').AsString;
                        fSaldo   :=  FieldByname('CDS_SALDO').AsFloat;
                        //
                        fQuantEntrada := dmDados.GetTotalEntradaLoteProduto(iLoja, aProduto, aLote);
                        fQuantVenda   := dmDados.GetTotalVendaLoteProduto(iLoja, aProduto, aLote);
                        fQuantPerda   := dmDados.GetTotalPerdaLoteProduto(iLoja, aProduto, aLote);
                        fQuantTransferencias := dmDados.GetTotalTransferenciaProduto(iLoja, aProduto, aLote);
                        //
                        dmDados.AddRegistroHistoricoEstoque(iLoja, iUsuario, aProduto,
                                aLote, aDataVenc, fQuantAtual, fQuantEntrada, fQuantVenda, fQuantPerda, fQuantTransferencias);
                        //
                        dmDados.SetEstoqueProduto(iLoja, aProduto, aLote, fSaldo);
                        // Proximo
                        Next;
                 End;      // fim-do-enquanto
                 //
                 dmDados.cdsHisEstoque.ApplyUpdates(0);
          End;
          //
          dmDados.cdsConfig.Edit;
          dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime := dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime+1;
          dmDados.cdsConfig.ApplyUpdates(0);
          //
          dmDados.Comit(dmDados.Transc);
          //
          Application.MessageBox(PChar(MSG_OK), 'Concluído', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          //
          Close;
       Except
           dmDados.Rollback;
           //
           dmDados.ExcluitRegistroHistoricoEstoque(iLoja, aDataMov + 1);
       End;
      Finally
           btnConfirma.Enabled := True;
      End;
      Application.ProcessMessages;
     End;
end;

procedure TfrmCadFechamentoMovimento.AbrirMovimento(aDataMov: TDateTime);
begin
      With cdsListaEntradas do
      begin
           Close;
           Params[0].AsDate :=  aDataMov;
           Open;
      End;
      //
       With cdsListaVendas do
      begin
           Close;
           Params[0].AsDate :=  aDataMov;
           Open;
      End;
      //
      With cdsListaPerdas do
      begin
           Close;
           Params[0].AsDate :=  aDataMov;
           Open;
      End;
      //
      With cdsListaTransferencias do
      begin
           Close;
           Params[0].AsDate := aDataMov;
           Open;
      End;
end;

procedure TfrmCadFechamentoMovimento.cdsListaEntradasCalcFields(
  DataSet: TDataSet);
begin
  inherited;
     If not uFuncoes.Empty(cdsListaEntradasID_LOJA.AsString) Then
        cdsListaEntradasNOME_LOJA.AsString := dmDados.GetNomeLoja(cdsListaEntradasID_LOJA.AsInteger);
end;

procedure TfrmCadFechamentoMovimento.cdsListaVendasCalcFields(
  DataSet: TDataSet);
begin
  inherited;
     If  (cdsListaVendas.State = dsInternalCalc) Then
     begin
          if not uFuncoes.Empty(cdsListaVendasID_COMPRADOR.AsString) Then
              cdsListaVendasNOME_CLIENTE.AsString := dmDados.GetNomeCLIENTE(cdsListaVendasID_COMPRADOR.AsInteger);
          if not uFuncoes.Empty(cdsListaVendasID_PRESCRITOR.AsString) Then
              cdsListaVendasNOME_MEDICO.AsString := dmDados.GetNomeMedico(cdsListaVendasID_PRESCRITOR.AsInteger);

     End;
end;

procedure TfrmCadFechamentoMovimento.CarregarDadosEstoqueAnterior(
  iLoja: Integer; aDataMov: TDatetime);
begin
    // With cdsListaEstoqueAnterior do
     With cdsMovEstoque do
     begin
          Close;
          //Params.ParamByName('pDTMOVI').AsDate  := aDataMov;
          Params.ParamByName('pLOJA').AsInteger := iLoja;
          open;
          //
          if NOT (IsEmpty) Then
          Begin
               dmDados.RefreshCDS(cdsEstoque);
               cdsEstoque.EmptyDataSet;
               //
               First;
               While not (Eof) do
               begin
                    cdsEstoque.Append;
                    cdsEstoqueCDS_CDLOJA.AsInteger := iLoja;
                    cdsEstoqueCDS_CDPROD.AsString  := FieldByName('EST_CDPROD').AsString;
                    cdsEstoqueCDS_NRLOTE.AsString  := uFuncoes.Alltrim(FieldByName('EST_NRLOTE').AsString);
                    cdsEstoqueCDS_DESCRICAO.AsString  := dmDados.GetNomeProduto(FieldByName('EST_CDPROD').AsString);
                    If not uFuncoes.Empty(FieldByName('EST_DTVENCIMENTO').AsString) Then
                       cdsEstoqueCDS_DTVENCIMENTO.AsDateTime := FieldByName('EST_DTVENCIMENTO').AsDateTime;
                    cdsEstoqueCDS_QTANTE.AsFloat   := dmDados.GetEstoqueAnteriorProduto(iLoja,
                                              FieldByName('EST_CDPROD').AsString, FieldByName('EST_NRLOTE').AsString);
                    //
                    cdsEstoqueCDS_QTENTR.AsFloat   := dmDados.GetTotalEntradaLoteProduto(iLoja, FieldByName('EST_CDPROD').AsString, uFuncoes.Alltrim(FieldByName('EST_NRLOTE').AsString));
                    cdsEstoqueCDS_QTVEND.AsFloat   := dmDados.GetTotalVendaLoteProduto(iLoja, FieldByName('EST_CDPROD').AsString, uFuncoes.Alltrim(FieldByName('EST_NRLOTE').AsString) );
                    cdsEstoqueCDS_QTPERD.AsFloat   := dmDados.GetTotalPerdaLoteProduto(iLoja, FieldByName('EST_CDPROD').AsString, uFuncoes.Alltrim(FieldByName('EST_NRLOTE').AsString));
                    cdsEstoqueCDS_QTTRAN.AsFloat   := dmDados.GetTotalTransferenciaProduto(iLoja, FieldByName('EST_CDPROD').AsString, uFuncoes.Alltrim(FieldByName('EST_NRLOTE').AsString));
                    {cdsEstoqueCDS_SALDO.AsFloat    := 0;// FieldByName('').AsString;
                    cdsEstoqueCDS_SITUACAO.AsString := '';}
                    //
                    cdsEstoque.post;
                    //
                    Next;
               End;
          End
          Else
              raise Exception.Create('Erro ao tentar abrir estoque do dia anterir.');
     End;
end;

procedure TfrmCadFechamentoMovimento.cdsListaEstoqueAnteriorCalcFields(
  DataSet: TDataSet);
begin
  inherited;
   { If (cdsListaEstoqueAnterior.State in [dsInternalCalc]) Then
      If  not uFuncoes.Empty(cdsListaEstoqueAnteriorEST_CDPROD.AsString) Then
      begin
          cdsListaEstoqueAnteriorNOME_PRODUTO.AsString := dmDados.GetNomeProduto(cdsListaEstoqueAnteriorEST_CDPROD.AsString);
      End;  }
    //
    cdsListaEstoqueAnteriorTOTAL_ENTRADAS.AsFloat := dmDados.GetTotalEntradaLoteProduto(iLoja, cdsListaEstoqueAnteriorEST_CDPROD.AsString,  cdsListaEstoqueAnteriorEST_NRLOTE.AsString);
    cdsListaEstoqueAnteriorTOTAL_VENDAS.AsFloat   := dmDados.GetTotalVendaLoteProduto(iLoja, cdsListaEstoqueAnteriorEST_CDPROD.AsString,  cdsListaEstoqueAnteriorEST_NRLOTE.AsString);
    cdsListaEstoqueAnteriorTOTAL_PERDAS.AsFloat   := dmDados.GetTotalPerdaLoteProduto(iLoja, cdsListaEstoqueAnteriorEST_CDPROD.AsString,  cdsListaEstoqueAnteriorEST_NRLOTE.AsString);
    cdsListaEstoqueAnteriorTOTAL_TRANSFERENCIAS.AsFloat := 0;
    //
    cdsListaEstoqueAnteriorSALDO.AsFloat := cdsListaEstoqueAnteriorEST_QUANTIDADE.AsFloat + cdsListaEstoqueAnteriorTOTAL_ENTRADAS.AsFloat -
                                            cdsListaEstoqueAnteriorTOTAL_VENDAS.AsFloat - cdsListaEstoqueAnteriorTOTAL_PERDAS.AsFloat -
                                             cdsListaEstoqueAnteriorTOTAL_TRANSFERENCIAS.AsFloat;
    //
    if (cdsListaEstoqueAnteriorSALDO.AsFloat >= 0) Then
        cdsListaEstoqueAnteriorOK.AsBoolean := true
    Else
        cdsListaEstoqueAnteriorOK.AsBoolean := false;
end;

function TfrmCadFechamentoMovimento.VerificarValidadeEstoque(
  aCDSEstoque: TClientDataSet): Boolean;
begin
     Result := True;
     try
         With aCDSEstoque do
         begin
              First;
              While not (Eof) do
              begin
                   if (FieldByName('CDS_SALDO').AsFloat < 0) Then
                   begin
                        Result := false;
                        dbGridEstoque.SetFocus;
                        raise Exception.Create('Saldo negativo do produto: ' + FieldByName('CDS_CDPROD').AsString+ ' Lote: '+FieldByName('CDS_NRLOTE').AsString+#13+
                                               'Verifique os movimentos do produto.' );
                        Break;
                   End;
                   //
                   Next;
              End;
         End;
     Except

     End;
end;

procedure TfrmCadFechamentoMovimento.dbGridEstoqueDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  R: TRect;
begin
  {pinta checkbox}
  if Column.Field = cdsEstoqueCDS_SITUACAO then
  begin
    dbGridEstoque.Canvas.FillRect(Rect);
    ImageList1.Draw(dbGridEstoque.Canvas, Rect.Left + 10, Rect.Top + 1, 0);
    if cdsEstoqueCDS_SITUACAO.AsBoolean then
      ImageList1.Draw(dbGridEstoque.Canvas, Rect.Left + 10, Rect.Top + 1, 2)
    else
      ImageList1.Draw(dbGridEstoque.Canvas, Rect.Left + 10, Rect.Top + 1, 1);
  end;

end;

procedure TfrmCadFechamentoMovimento.cdsItensEntradaCalcFields(
  DataSet: TDataSet);
begin
  inherited;
      If not uFuncoes.Empty(cdsItensEntradaREGISTRO_MS.AsString) Then
         cdsItensEntradaNOME_PRODUTO.AsString := dmDados.GetNomeProduto(cdsItensEntradaREGISTRO_MS.AsString);
end;

procedure TfrmCadFechamentoMovimento.cdsListaItensVendaCalcFields(
  DataSet: TDataSet);
begin
  inherited;
     If not uFuncoes.Empty(cdsListaItensVendaREGISTRO_MS.AsString) Then
         cdsListaItensVendaNOME_PRODUTO.AsString := dmDados.GetNomeProduto(cdsListaItensVendaREGISTRO_MS.AsString);
end;

procedure TfrmCadFechamentoMovimento.Mostrar_Itens_Entrada(
  idEntrada: Integer);
begin
     dmDados.FilterCDS(cdsItensEntrada, fsInteger, InttoStr(idEntrada));
end;

procedure TfrmCadFechamentoMovimento.Mostrar_Itens_Perda(idPerda: Integer);
begin
    dmDados.FilterCDS(cdsListaItensPerda, fsInteger, InttoStr(idPerda));
end;

procedure TfrmCadFechamentoMovimento.Mostrar_Itens_Venda(idVenda: Integer);
begin
    dmDados.FilterCDS(cdsListaItensVenda, fsInteger, InttoStr(idVenda));
end;

procedure TfrmCadFechamentoMovimento.dsEntradasDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
    if  (dsEntradas.DataSet.Active) and (dsEntradas.DataSet.RecordCount > 0) then
        Mostrar_Itens_Entrada(dsEntradas.DataSet.fieldByName('ID_ENTRADA').AsInteger);
     //    
end;

procedure TfrmCadFechamentoMovimento.dsVendasDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
    if  (dsVendas.DataSet.Active) and (dsVendas.DataSet.RecordCount > 0) then
        Mostrar_Itens_Venda(dsVendas.DataSet.fieldByName('ID_VENDA').AsInteger);
    //

end;

procedure TfrmCadFechamentoMovimento.dsPerdasDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if  (dsPerdas.DataSet.Active) and (dsPerdas.DataSet.RecordCount > 0) then
        Mostrar_Itens_Perda(dsPerdas.DataSet.fieldByName('ID_PERDA').AsInteger);
  //
end;

procedure TfrmCadFechamentoMovimento.cdsListaPerdasCalcFields(
  DataSet: TDataSet);
begin
  inherited;
       if not ufuncoes.Empty(cdsListaPerdasMOTIVO_PERDA.AsString) Then
           cdsListaPerdasDESCRICAO_PERDA.AsString := dmDados.GetNomeMotivoPerda(cdsListaPerdasMOTIVO_PERDA.AsInteger);
end;

procedure TfrmCadFechamentoMovimento.cdsListaItensPerdaCalcFields(
  DataSet: TDataSet);
begin
  inherited;
     If not uFuncoes.Empty(cdsListaItensPerdaREGISTRO_MS.AsString) Then
         cdsListaItensPerdaNOME_PRODUTO.AsString := dmDados.GetNomeProduto(cdsListaItensPerdaREGISTRO_MS.AsString);
end;

procedure TfrmCadFechamentoMovimento.AtualizarDados;
begin
      iLoja := dmDados.cdsConfigCFG_LOJA_PADRAO.AsInteger;
      aDataMovAnterior := dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime - 1;
      CarregarDadosEstoqueAnterior(iLoja, aDataMovAnterior);
      //
      btnConfirma.Enabled := VerificarValidadeEstoque(cdsEstoque);
      //
      if (btnConfirma.Enabled) Then
        cdsEstoque.First;
end;

procedure TfrmCadFechamentoMovimento.cdsEstoqueCalcFields(
  DataSet: TDataSet);
begin
  inherited;
    //
    cdsEstoqueCDS_SALDO.AsFloat := (cdsEstoqueCDS_QTANTE.AsFloat + cdsEstoqueCDS_QTENTR.AsFloat) -
                                   cdsEstoqueCDS_QTVEND.AsFloat - cdsEstoqueCDS_QTPERD.AsFloat -
                                   cdsEstoqueCDS_QTTRAN.AsFloat;
    //
    if (cdsEstoqueCDS_SALDO.AsFloat >= 0) Then
        cdsEstoqueCDS_SITUACAO.AsBoolean := true
    Else
        cdsEstoqueCDS_SITUACAO.AsBoolean := false;
end;

procedure TfrmCadFechamentoMovimento.cdsListaTransferenciasCalcFields(
  DataSet: TDataSet);
begin
  inherited;
      If (cdsListaTransferencias.State = dsInternalCalc) Then
      begin
           if not uFuncoes.Empty(cdsListaTransferenciasCNPJ_ORIGEM.AsString) Then
               cdsListaTransferenciasLOJA_ORIGEM.AsString := dmDados.GetNomeLojaCNPJ(cdsListaTransferenciasCNPJ_ORIGEM.AsString);
           if not uFuncoes.Empty(cdsListaTransferenciasCNPJ_DESTINO.AsString) Then
               cdsListaTransferenciasLOJA_DESTINO.AsString := dmDados.GetNomeLojaCNPJ(cdsListaTransferenciasCNPJ_DESTINO.AsString); 
      End;
end;

procedure TfrmCadFechamentoMovimento.cdsListaItensTransferenciaCalcFields(
  DataSet: TDataSet);
begin
  inherited;
       if (cdsListaItensTransferencia.State = dsInternalCalc) Then
       begin
            if not uFuncoes.Empty(cdsListaItensTransferenciaREGISTRO_MS.AsString) Then
                cdsListaItensTransferenciaNOME_PRODUTO.AsString := dmDados.GetNomeProduto(cdsListaItensTransferenciaREGISTRO_MS.AsString);
       End;
end;

procedure TfrmCadFechamentoMovimento.dsTransferenciasDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if  (dsTransferencias.DataSet.Active) and (dsTransferencias.DataSet.RecordCount > 0) then
        Mostrar_Itens_Transferencia(dsTransferencias.DataSet.fieldByName('ID_TRANSFERENCIA').AsInteger);
  //
end;

procedure TfrmCadFechamentoMovimento.Mostrar_Itens_Transferencia(
  idTransferencia: Integer);
begin
     dmDados.FilterCDS(cdsListaItensTransferencia, fsInteger, InttoStr(idTransferencia));
end;

procedure TfrmCadFechamentoMovimento.btnExcluirEntradaClick(
  Sender: TObject);
Var
   idRegistro, iLoja : Integer;
   aProduto, aLote : String;
   fQuant : Double;
begin
  inherited;
     //
           if not (cdsListaEntradas.IsEmpty) Then
             begin
                   If Application.MessageBox(PChar(uFormMainSngpc.M_NMUSUA +', você confirma a exclusão de registro de entrada?'),
                          'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
                     begin
                          idRegistro := cdsListaEntradasID_ENTRADA.AsInteger;
                          iLoja := cdsListaEntradasID_LOJA.AsInteger;
                          //
                          If (dmDados.ExcluirEntrada(idRegistro)) Then
                          begin
                               cdsListaEntradas.Delete;
                               //
                               cdsItensEntrada.First;
                               While not (cdsItensEntrada.Eof) do
                               begin
                                    aProduto := cdsItensEntradaREGISTRO_MS.AsString;
                                    aLote    := uFuncoes.Alltrim(cdsItensEntradaNUMERO_LOTE.AsString);
                                    fQuant   := cdsItensEntradaQUANTIDADE.AsFloat;
                                    //
                                    dmDados.SaidaProdutoEstoque(iLoja, aProduto, aLote, fQuant);
                                    //
                                    cdsItensEntrada.Next;
                               End;
                               cdsItensEntrada.Close;
                               //
                               Application.MessageBox(PChar('Registro excluído com sucesso.'),
                                   'Atenção', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                               AtualizarDados();
                          End
                          Else
                              raise Exception.Create('Erro ao tentar excluir entrada de produto.');
                     End
                     Else
                         Exit;
             End
             Else
                 Application.MessageBox(PChar('Não há registro de entrada para ser excluído.'), 'Atenção', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadFechamentoMovimento.btnExcluirVendaClick(Sender: TObject);
Var
   idRegistro, iLoja : Integer;
   aProduto, aLote : String;
   fQuant : Double;
begin
  inherited;
 //
             if not (cdsListaVendas.IsEmpty) Then
             begin
                   If Application.MessageBox(PChar(uFormMainSngpc.M_NMUSUA +', você confirma a exclusão de registro de venda?'),
                          'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
                     begin
                          idRegistro := cdsListaVendasID_VENDA.AsInteger;
                          //
                          If (dmDados.ExcluirVendaNovo(idRegistro)) Then
                          begin
                               cdsListaVendas.Delete;
                               cdsListaItensVenda.Close;
                               Application.MessageBox(PChar('Registro excluído com sucesso.'),
                                   'Atenção', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                               AtualizarDados();
                          End
                          Else
                              raise Exception.Create('Erro ao tentar excluir venda de produto.');
                     End
                     Else
                         Exit;
             End
             Else
                 Application.MessageBox(PChar('Não há registro de venda para ser excluído.'), 'Atenção', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadFechamentoMovimento.btnExcluirPerdaClick(Sender: TObject);
Var
   idRegistro, iLoja : Integer;
   aProduto, aLote : String;
   fQuant : Double;
begin
  inherited;
          if not (cdsListaPerdas.IsEmpty) Then
             begin
                   If Application.MessageBox(PChar(uFormMainSngpc.M_NMUSUA +', você confirma a exclusão de registro de perda?'),
                          'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
                     begin
                          idRegistro := cdsListaPerdasID_PERDA.AsInteger;
                          //
                          If (dmDados.ExcluirPerda(idRegistro)) Then
                          begin
                               cdsListaPerdas.Delete;
                               cdsListaItensPerda.Close;
                               Application.MessageBox(PChar('Registro excluído com sucesso.'),
                                   'Atenção', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                               AtualizarDados();
                          End
                          Else
                              raise Exception.Create('Erro ao tentar excluir perda de produto.');
                     End
                     Else
                         Exit;
             End
             Else
                 Application.MessageBox(PChar('Não há registro de perda para ser excluído de perda.'), 'Atenção', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadFechamentoMovimento.btnExcluirTransfClick(
  Sender: TObject);
Var
   idRegistro, iLoja : Integer;
   aProduto, aLote : String;
   fQuant : Double;
begin
  inherited;
 if not (cdsListaTransferencias.IsEmpty) Then
             begin
                   If Application.MessageBox(PChar(uFormMainSngpc.M_NMUSUA +', você confirma a exclusão de registro de transferência?'),
                          'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
                     begin
                          idRegistro := cdsListaTransferenciasID_TRANSFERENCIA.AsInteger;
                          //
                          If (dmDados.ExcluirTransferencia(idRegistro)) Then
                          begin
                               cdsListaTransferencias.Delete;
                               cdsListaItensTransferencia.Close;
                               Application.MessageBox(PChar('Registro excluído com sucesso.'),
                                   'Atenção', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                               AtualizarDados();
                          End
                          Else
                              raise Exception.Create('Erro ao tentar excluir transferência de produto.');
                     End
                     Else
                         Exit;
             End
             Else
                 Application.MessageBox(PChar('Não há registro de transferência para ser excluído.'), 'Atenção', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadFechamentoMovimento.dsMovEstoqueDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
   if (dsMovEstoque.DataSet.Active) and not (dsMovEstoque.DataSet.IsEmpty) Then
      lblRegistro.Caption := 'Registro(s): '+InttoStr(dsMovEstoque.DataSet.RecNo)+'/'+
                           InttoStr(dsMovEstoque.DataSet.RecordCount);
end;

procedure TfrmCadFechamentoMovimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var
   i : integer;
begin
     for I := 0 to Pred(ComponentCount) do
          if Components[i] is TClientDataSet  then
             begin
                 TClientDataSet(Components[i]).Close;
             end;
  inherited;
end;

end.
