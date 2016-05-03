unit udmPesquisa;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, Controls;

type
  TdmPesquisa = class(TDataModule)
    dstTpDocumento: TSQLDataSet;
    dspTipoDoc: TDataSetProvider;
    cdsTipoDoc: TClientDataSet;
    cdsTipoDocID_DOCUMENTO: TIntegerField;
    cdsTipoDocDESCRICAO: TStringField;
    dstOrgExpedidor: TSQLDataSet;
    dspOrgExpedidor: TDataSetProvider;
    cdsOrgExpedidor: TClientDataSet;
    cdsOrgExpedidorID_ORGAO: TIntegerField;
    cdsOrgExpedidorDESCRICAO: TStringField;
    dstConsProfissional: TSQLDataSet;
    dspConsProfis: TDataSetProvider;
    cdsConsProfissional: TClientDataSet;
    cdsConsProfissionalID_CONSELHO: TIntegerField;
    cdsConsProfissionalDESCRICAO: TStringField;
    qryBusca: TSQLQuery;
    dstConsulta: TSQLDataSet;
    dspConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    dstBusca: TSQLDataSet;
    dspBusca: TDataSetProvider;
    cdsBuscaMedico: TClientDataSet;
    cdsBuscaMedicoID_MEDICO: TIntegerField;
    cdsBuscaMedicoNOME_MEDICO: TStringField;
    cdsConsLojas: TClientDataSet;
    cdsConsPerdas: TClientDataSet;
    cdsConsReceituario: TClientDataSet;
    cdsConsUsoMedicam: TClientDataSet;
    cdsUndInsumo: TClientDataSet;
    cdsTipoMotPerda: TClientDataSet;
    cdsTipoMotPerdaDESCRICAO: TStringField;
    qryAuxi: TSQLQuery;
    cdsPesquisa: TClientDataSet;
    cdsConsProfissionalSIGLA: TStringField;
    cdsValidarMedico: TClientDataSet;
    cdsValidarCliente: TClientDataSet;
    cdsPesLojas: TClientDataSet;
    cdsPesLojasEMP_FANTASIA: TStringField;
    cdsPesLojasEMP_CNPJ: TStringField;
    dstPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsListaLojas: TClientDataSet;
    cdsListaLojasEMP_CODIGO: TIntegerField;
    cdsListaLojasEMP_FANTASIA: TStringField;
    cdsAddItensVenda: TClientDataSet;
    cdsAddItensVendaID_VENDA: TIntegerField;
    cdsAddItensVendaREGISTRO_MS: TStringField;
    cdsAddItensVendaNUMERO_LOTE: TStringField;
    cdsAddItensVendaQUANT_MEDICAMENTO: TBCDField;
    cdsAddItensVendaFLUXO_INSUMO: TStringField;
    cdsAddItensVendaUND_MEDIDA_INSUMO: TIntegerField;
    cdsAddItensVendaUND_FARMACO_TECNICA: TIntegerField;
    cdsItensEstoque: TClientDataSet;
    cdsItensEstoqueEST_CDLOJA: TIntegerField;
    cdsItensEstoqueEST_CDPROD: TStringField;
    cdsItensEstoqueEST_NRLOTE: TStringField;
    cdsItensEstoqueEST_QUANTIDADE: TFMTBCDField;
    cdsItensEstoqueEST_DTVENCIMENTO: TDateField;
    cdsListaLotesProduto: TClientDataSet;
    cdsListaLotesProdutoEST_CDLOJA: TIntegerField;
    cdsListaLotesProdutoEST_CDPROD: TStringField;
    cdsListaLotesProdutoEST_NRLOTE: TStringField;
    cdsListaLotesProdutoEST_QUANTIDADE: TFMTBCDField;
    cdsListaLotesProdutoEST_DTVENCIMENTO: TDateField;
    cdsListaTipoDocumento: TClientDataSet;
    cdsConselhos: TClientDataSet;
    cdsConselhosID_CONSELHO: TIntegerField;
    cdsConselhosSIGLA: TStringField;
    cdsListaTipoDocumentoID_DOCUMENTO: TIntegerField;
    cdsListaTipoDocumentoDESCRICAO: TStringField;
    dstListaVenda: TSQLDataSet;
    dstListaVendaID_VENDA: TIntegerField;
    dstListaVendaREGISTRO_MS: TStringField;
    dstListaVendaNUMERO_LOTE: TStringField;
    dstListaVendaQUANT_MEDICAMENTO: TBCDField;
    dstListaVendaFLUXO_INSUMO: TStringField;
    dstListaVendaUND_MEDIDA_INSUMO: TIntegerField;
    dstListaVendaUND_FARMACO_TECNICA: TIntegerField;
    dspListaVenda: TDataSetProvider;
    cdsListaVenda: TClientDataSet;
    cdsListaVendaID_VENDA: TIntegerField;
    cdsListaVendaREGISTRO_MS: TStringField;
    cdsListaVendaNUMERO_LOTE: TStringField;
    cdsListaVendaQUANT_MEDICAMENTO: TBCDField;
    cdsListaVendaFLUXO_INSUMO: TStringField;
    cdsListaVendaUND_MEDIDA_INSUMO: TIntegerField;
    cdsListaVendaUND_FARMACO_TECNICA: TIntegerField;
    cdsBalancoProdutos: TClientDataSet;
    cdsBalancoProdutosCDS_CODIGOMS: TStringField;
    cdsBalancoProdutosCDS_DESCRICAO: TStringField;
    cdsBalancoProdutosCDS_ESTINICIAL: TFloatField;
    cdsBalancoProdutosCDS_ENTRADA: TFloatField;
    cdsBalancoProdutosCDS_SAIDA: TFloatField;
    cdsBalancoProdutosCDS_PERDAS: TFloatField;
    cdsBalancoProdutosCDS_ESTFINAL: TFloatField;
    dstListaBalanco: TSQLDataSet;
    cdsListaEntrada: TClientDataSet;
    dspListaBalanco: TDataSetProvider;
    cdsListaPerdas: TClientDataSet;
    cdsListaSaida: TClientDataSet;
    cdsListaSaidaPRO_RG_MS_MEDICAMENTO: TStringField;
    cdsListaSaidaPRO_MEDICAMENTO: TStringField;
    cdsListaSaidaQUANT: TFMTBCDField;
    cdsListaEntradaPRO_RG_MS_MEDICAMENTO: TStringField;
    cdsListaEntradaPRO_MEDICAMENTO: TStringField;
    cdsListaEntradaQUANT: TFMTBCDField;
    cdsListaPerdasPRO_RG_MS_MEDICAMENTO: TStringField;
    cdsListaPerdasPRO_MEDICAMENTO: TStringField;
    cdsListaPerdasQUANT: TFMTBCDField;
    cdsProdutosEstoque: TClientDataSet;
    cdsProdutosEstoqueEST_CDLOJA: TIntegerField;
    cdsProdutosEstoqueEST_CDPROD: TStringField;
    cdsProdutosEstoquePRO_MEDICAMENTO: TStringField;
    cdsBalancoProdutosCDS_CODMS: TStringField;
    dstListaBal: TSQLDataSet;
    dspListaBal: TDataSetProvider;
    cdsListaBal: TClientDataSet;
    cdsBalancoProdutosCDS_ESTATUAL: TFloatField;
    dstListaEstoque: TSQLDataSet;
    dspListaEstoque: TDataSetProvider;
    cdsListaEstoque: TClientDataSet;
    cdsListaEstoqueEST_CDLOJA: TIntegerField;
    cdsListaEstoqueEST_CDPROD: TStringField;
    cdsListaEstoqueEST_NRLOTE: TStringField;
    cdsListaEstoqueEST_QUANTIDADE: TFMTBCDField;
    cdsListaEstoqueEST_DTVENCIMENTO: TDateField;
    cdsProdutosEstoqueEST_INICIAL: TFloatField;
    cdsProdutosEstoqueEST_ENTRADA: TFloatField;
    cdsProdutosEstoqueEST_VENDAS: TFloatField;
    cdsProdutosEstoqueEST_PERDAS: TFloatField;
    cdsProdutosEstoqueEST_TRANSFERENCIAS: TFloatField;
    cdsProdutosEstoqueEST_FINAL: TFloatField;
    procedure cdsBalancoProdutosCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsProdutosEstoqueCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetArquivoXML(W_DTINIC, W_DTFINA : TDate) : String;
    Function GetSiglaConselho(W_NMSIGL : String) : boolean;
    Function GetNomeConselho(W_NMSIGL : String) : String;
    Function Get_CRM_Medico(W_CDMEDI : Integer) : Integer;
    Function Get_UF_Medico(W_CDMEDI : Integer; W_NMSIGL : String) : String;
    Function Validar_Medico_Sigla(W_CDMEDI : Integer; W_NMSIGL, W_UFMEDI : String) : Boolean;
    Function GeraBalanco(iLoja, iOrdem : Integer; aDtInicio, aDtFinal : TDateTime): Boolean;
    Function GeraBalancoCalculado(iLoja, iOrdem : Integer; aDtInicio, aDtFinal : TDateTime; aProduto : String): Boolean;
    Function GeraBalancoCalculadoNovo(iLoja, iOrdem : Integer; aDtInicio, aDtFinal : TDateTime): Boolean;
    Function AddItemBalanco(aCodigo, aDescricao : String;
         fEstInicial, fEntrada, fSaida, fPerdas, fEstAtual : Double) : Boolean;
    Function GetEntradaMedicamento(aCodigo : string; aDtInicio, aDtFinal : TDatetime): Double;
    Function GetSaidaMedicamento(aCodigo : string; aDtInicio, aDtFinal : TDatetime): Double;
    Function GetPerdaMedicamento(aCodigo : string; aDtInicio, aDtFinal : TDatetime): Double;
    //
    Function GetMovimentoProduto(iLoja :  Integer; aCodigo : string; aDtInicio, aDtFinal : TDatetime): Boolean;
    Function GetMovimentoProdutoNovo(iLoja :  Integer; aCodigo : string; aDtInicio, aDtFinal : TDatetime): Boolean;
    Function GetEstoqueAtualProduto(iLoja : Integer; aCodigo : string) : Double;
  end;

var
  dmPesquisa: TdmPesquisa;
  W_NMCONS : String;
  iLoja : Integer;
  aDtInicial, aDtFinal : TDatetime;

implementation

uses udmDados, DateUtils, uFuncoes;

{$R *.dfm}

{ TdmPesquisa }

function TdmPesquisa.GetArquivoXML(W_DTINIC, W_DTFINA: TDate): String;
begin
     With cdsPesquisa do
      begin
           Active := False;
           CommandText := 'Select DATA_VENDA, ARQUIVO, DATA_ARQUIVO from VENDAS Where (DATA_VENDA >= :pDTINIC) and (DATA_VENDA <= :pDTFINA) and (ARQUIVO <> :pARQUIVO) ';
           Params.ParamByName('pDTINIC').AsDate := W_DTINIC;
           Params.ParamByName('pDTFINA').AsDate := W_DTFINA;
           Params.ParamByName('pARQUIVO').AsString := ' ';
           Active := True;
           //
           if not(IsEmpty) Then
             Result := FieldByName('ARQUIVO').AsString;
      End;
end;

function TdmPesquisa.GetNomeConselho(W_NMSIGL: String): String;
begin
     result := cdsPesquisa.FieldByName('DESCRICAO').AsString;
end;

function TdmPesquisa.GetSiglaConselho(W_NMSIGL: String): boolean;
begin
     Result := False;
     W_NMCONS := '';
     With cdsPesquisa do
      begin
           Active := False;
           CommandText := 'Select ID_CONSELHO, SIGLA, DESCRICAO from CONSELHOPROFISSIONAL Where (SIGLA = :pSIGLA) ';
           Params.ParamByName('pSIGLA').ASString := W_NMSIGL;
           Active := True;
           //
           if not(IsEmpty) Then
           begin
             Result := True;
             W_NMCONS := fieldByName('DESCRICAO').AsString; 
           End;
      End;
end;

function TdmPesquisa.Get_CRM_Medico(W_CDMEDI: Integer): Integer;
begin
     With qryBusca do
      begin
           SQL.Clear;
           Close;
           SQl.Add('Select * from MEDICO Where (ID_MEDICO = :pID) ');
           Params.ParamByName('pID').AsInteger := W_CDMEDI;
           Open;
           //
           If not (IsEmpty) Then
               Result := FieldByName('NR_RG_PROFISSIONAL').AsInteger;
      End;
end;

function TdmPesquisa.Get_UF_Medico(W_CDMEDI: Integer;
  W_NMSIGL: String): String;
begin
     With qryBusca do
      begin
           SQL.Clear;
           Close;
           SQl.Add('Select * from MEDICO Where (NR_RG_PROFISSIONAL = :pID) and (SIGLA_CONSELHO = :pSIGLA)');
           Params.ParamByName('pID').AsInteger   := W_CDMEDI;
           Params.ParamByName('pSIGLA').AsString := W_NMSIGL;
           Open;
           //
           If not (IsEmpty) Then
               Result := FieldByName('UF_CONSELHO').AsString;
      End;
end;

function TdmPesquisa.Validar_Medico_Sigla(W_CDMEDI: Integer;
  W_NMSIGL, W_UFMEDI: String): Boolean;
begin
     Result := False;
     With qryBusca do
      begin
           SQL.Clear;
           Close;
           SQl.Add('Select * from MEDICO Where (NR_RG_PROFISSIONAL = :pID) and (SIGLA_CONSELHO = :pSIGLA) and (UF_CONSELHO = :pUF)');
           Params.ParamByName('pID').AsInteger   := W_CDMEDI;
           Params.ParamByName('pSIGLA').AsString := W_NMSIGL;
           Params.ParamByName('pUF').AsString    := W_UFMEDI;
           Open;
           //
           If not (IsEmpty) Then
               Result := True;
      End;
end;

procedure TdmPesquisa.cdsBalancoProdutosCalcFields(DataSet: TDataSet);
begin
     If not uFuncoes.Empty(cdsBalancoProdutosCDS_CODIGOMS.AsString) Then
        cdsBalancoProdutosCDS_CODMS.AsString :=
           Copy(cdsBalancoProdutosCDS_CODIGOMS.AsString,1,1)+'.'+
           Copy(cdsBalancoProdutosCDS_CODIGOMS.AsString,2,4)+'.'+
           Copy(cdsBalancoProdutosCDS_CODIGOMS.AsString,6,4)+'.'+
           Copy(cdsBalancoProdutosCDS_CODIGOMS.AsString,10,3)+'-'+
           Copy(cdsBalancoProdutosCDS_CODIGOMS.AsString,13,1);
      //
      cdsBalancoProdutosCDS_ESTFINAL.AsFloat :=
         cdsBalancoProdutosCDS_ESTINICIAL.AsFloat -
         (cdsBalancoProdutosCDS_ENTRADA.AsFloat -
         (cdsBalancoProdutosCDS_SAIDA.AsFloat + cdsBalancoProdutosCDS_PERDAS.AsFloat));
end;

function TdmPesquisa.GeraBalanco(iLoja, iOrdem : Integer; aDtInicio, aDtFinal: TDateTime): Boolean;
Var
   aTextoEstoque : String;
   fEntrada, fSaida, fPerda : Double;
begin
     result := False;
     //
     aTextoEstoque := 'select E.est_cdloja, E.est_cdprod, P.pro_medicamento from ESTOQUE E ';
     aTextoEstoque := aTextoEstoque + 'inner join PRODUTOS P on P.pro_rg_ms_medicamento = E.est_cdprod ';
     aTextoEstoque := aTextoEstoque + ' Where (E.est_cdloja = '+QuotedStr(InttoStr(iLoja))+' )';
     aTextoEstoque := aTextoEstoque + ' group by E.est_cdloja, E.est_cdprod, P.pro_medicamento ';
     if (iOrdem = 1) Then
        aTextoEstoque := aTextoEstoque + ' order by E.est_cdprod '
     Else
        aTextoEstoque := aTextoEstoque + ' order by P.pro_medicamento ';
     //
     cdsBalancoProdutos.Close;
     cdsBalancoProdutos.Open;
     cdsBalancoProdutos.EmptyDataSet;
     //
     With cdsProdutosEstoque do
      begin
           Close;
           CommandText := aTextoEstoque;
           Open;
           //
           If not (IsEmpty) then
            begin
                 First;
                 While not (EoF) do
                 begin
                      fEntrada := GetEntradaMedicamento(FieldByName('EST_CDPROD').AsString, aDtInicio, aDtFinal);
                      fSaida   := GetSaidaMedicamento(FieldByName('EST_CDPROD').AsString, aDtInicio, aDtFinal);
                      fPerda   := GetPerdaMedicamento(FieldByName('EST_CDPROD').AsString, aDtInicio, aDtFinal);
                      //
                      AddItemBalanco(FieldByName('EST_CDPROD').AsString,
                          FieldByName('PRO_MEDICAMENTO').AsString, 0, fEntrada, fSaida, fPerda, 0);
                      //
                      Next;
                 End;
            End;
      End;
      //
      Result := true;
end;

function TdmPesquisa.AddItemBalanco(aCodigo, aDescricao: String;
  fEstInicial, fEntrada, fSaida, fPerdas, fEstAtual: Double): Boolean;
begin
     Result := False;
     //
     With cdsBalancoProdutos do
      begin
           Append;
           FieldByname('CDS_CODIGOMS').AsString  := aCodigo;
           FieldByname('CDS_DESCRICAO').AsString := aDescricao;
           FieldByname('CDS_ESTINICIAL').AsFloat := fEstInicial;
           FieldByname('CDS_ENTRADA').AsFloat    := fEntrada;
           FieldByname('CDS_SAIDA').AsFloat      := fSaida;
           FieldByname('CDS_PERDAS').AsFloat     := fPerdas;
           //FieldByname('CDS_ESTATUAL').AsFloat   := fEntrada - (fSaida + fPerdas) ;
           FieldByname('CDS_ESTATUAL').AsFloat   := (fEstInicial + fEntrada) - (fSaida + fPerdas) ;
           //
           Post;
      End;
      //
      Result := True;
end;

function TdmPesquisa.GetEntradaMedicamento(aCodigo: string; aDtInicio,
  aDtFinal: TDatetime): Double;
begin
     Result := 0;
     With cdsListaEntrada do
      begin
           Close;
           Params.ParamByName('pCODIGO').AsString := aCodigo;
           Params.ParamByName('pDTINIC').AsDate   := aDtInicio;
           Params.ParamByName('pDTFINA').AsDate   := aDtFinal;
           Open;
           //
           If not (IsEmpty) then
              Result := FieldbyName('QUANT').AsFloat;
      End;
end;

function TdmPesquisa.GetPerdaMedicamento(aCodigo: string; aDtInicio,
  aDtFinal: TDatetime): Double;
begin
     Result := 0;
     With cdsListaPerdas do
      begin
           Close;
           Params.ParamByName('pCODIGO').AsString := aCodigo;
           Params.ParamByName('pDTINIC').AsDate   := aDtInicio;
           Params.ParamByName('pDTFINA').AsDate   := aDtFinal;
           Open;
           //
           If not (IsEmpty) then
              Result := FieldbyName('QUANT').AsFloat;
      End;
end;

function TdmPesquisa.GetSaidaMedicamento(aCodigo: string; aDtInicio,
  aDtFinal: TDatetime): Double;
begin
     Result := 0;
     With cdsListaSaida do
      begin
           Close;
           Params.ParamByName('pCODIGO').AsString := aCodigo;
           Params.ParamByName('pDTINIC').AsDate   := aDtInicio;
           Params.ParamByName('pDTFINA').AsDate   := aDtFinal;
           Open;
           //
           If not (IsEmpty) then
              Result := FieldbyName('QUANT').AsFloat;
      End;
end;

function TdmPesquisa.GeraBalancoCalculado(iLoja, iOrdem: Integer;
  aDtInicio, aDtFinal: TDateTime; aProduto : String): Boolean;
Var
   aTextoEstoque : String;
   fEntrada, fSaida, fPerda : Double;
begin
     result := False;
     //
     aTextoEstoque := 'Select E.est_cdloja, E.est_cdprod, P.pro_medicamento from ESTOQUE E ';
     aTextoEstoque := aTextoEstoque + 'inner join PRODUTOS P on P.pro_rg_ms_medicamento = E.est_cdprod ';
     aTextoEstoque := aTextoEstoque + ' Where (E.est_cdloja = '+QuotedStr(InttoStr(iLoja))+' ) ';
     if (aProduto <> 'T') Then
       aTextoEstoque := aTextoEstoque + ' and (PRO_ANTIMICROBIANOS = '+QuotedStr(aProduto)+') ';
     aTextoEstoque := aTextoEstoque + ' group by E.est_cdloja, E.est_cdprod, P.pro_medicamento ';
     //
     if (iOrdem = 1) Then
        aTextoEstoque := aTextoEstoque + ' order by E.est_cdprod '
     Else
        aTextoEstoque := aTextoEstoque + ' order by P.pro_medicamento ';
     //
     cdsBalancoProdutos.Close;
     cdsBalancoProdutos.Open;
     cdsBalancoProdutos.EmptyDataSet;
     //
     With cdsProdutosEstoque do
      begin
           Close;
           CommandText := aTextoEstoque;
           Open;
           //
           {If not (IsEmpty) then
            begin
                 First;
                 While not (EoF) do
                 begin
                      //GetMovimentoProduto(iLoja, FieldByName('est_cdprod').AsString, aDtInicio, aDtFinal);
                      GetMovimentoProdutoNovo(iLoja, FieldByName('est_cdprod').AsString, aDtInicio, aDtFinal);
                      //
                      Next;
                 End;
            End;  }
      End;
      //
      Result := true;
end;

function TdmPesquisa.GetMovimentoProduto(iLoja :  Integer; aCodigo: string; aDtInicio,
  aDtFinal: TDatetime): Boolean;
Var
   M_ESTINI, M_ESTFIN, M_QTSAID, M_QTENTR, M_QTPERD : DOUBLE;
   M_ESTFINENT, M_ESTFINSAI, M_ESTFINPER : Double;
   M_ESTIINIENT, M_ESTINISAI, M_ESTINIPER : Double;
   M_ESTATUAL : Double;
   M_DTATUAL : TDateTime;
   aTexto, aNomeProduto : String;
begin
    Result := false;
    M_ESTINI := 0;
    M_ESTFIN := 0;
    M_QTSAID := 0;
    M_QTENTR := 0;
    M_QTPERD := 0;
    //
    M_ESTIINIENT := 0;
    M_ESTINISAI  := 0;
    M_ESTINIPER  := 0;
    //
    M_ESTFINENT := 0;
    M_ESTFINSAI := 0;
    M_ESTFINPER := 0;
    //
    M_DTATUAL  := Date();
    M_ESTATUAL := GetEstoqueAtualProduto(iLoja, aCodigo);
    // perdas
    aTexto := 'Select PE.id_perda, PE.registro_ms, P.data_perda, Sum(PE.quantidade) AS QUANT from PERDAS_MEDICAMENTOS PE ';
    aTexto := aTexto +'Inner Join PERDAS P ON  PE.id_perda = P.id_perda ';
    aTexto := aTexto +'Where (ID_LOJA = :pLOJA) and (PE.registro_ms = :pPRODUTO) and (P.data_perda <= :pDTFINA) ';
    aTexto := aTexto +'AND (P.SITUACAO = '+QuotedStr ('F')+') Group by PE.id_perda, PE.registro_ms, P.data_perda ';
    //
    With cdsListaBal do
    begin
          Close;
          CommandText :=  aTexto;
          Params.ParamByName('pLOJA').AsInteger   := iLoja;
          Params.ParamByName('pPRODUTO').AsString :=  aCodigo;
          Params.ParamByName('pDTFINA').AsDate    := M_DTATUAL;
          Open;
          //
          If not (IsEmpty) Then
           begin
                First;
                While not (Eof) do
                  begin
                      If (FieldByname('data_perda').AsDateTime >= aDtInicio)
                       and (FieldByname('data_perda').AsDateTime <= aDtFinal) Then
                          M_QTPERD := M_QTPERD + FieldByname('QUANT').AsFloat;
                      //
                      If (FieldByname('data_perda').AsDateTime < aDtInicio) Then
                          M_ESTINIPER := M_ESTINIPER + FieldByname('QUANT').AsFloat;
                      //
                      If (FieldByname('data_perda').AsDateTime > aDtFinal) Then
                          M_ESTFINPER := M_ESTFINPER + FieldByname('QUANT').AsFloat;
                      //
                      Next;
                  End;
           End;
    End;
    // saídas
    aTexto := 'Select VM.registro_ms, V.data_venda, Sum(VM.quant_medicamento) AS QUANT from VENDAS_MEDICAMENTOS VM ';
    aTexto := aTexto +'Inner Join VENDAS V ON V.id_venda = VM.id_venda ';
    aTexto := aTexto +'Where (VM.registro_ms = :pPRODUTO) and (V.id_loja = :pLOJA) and (v.data_venda <= :pDTFINA)  ';
    aTexto := aTexto +'AND (V.situacao = ' + QuotedStr('F') +') Group by VM.registro_ms, V.data_venda ';
    With cdsListaBal do
    begin
          Close;
          CommandText :=  aTexto;
          Params.ParamByName('pLOJA').AsInteger   := iLoja;
          Params.ParamByName('pPRODUTO').AsString := aCodigo;
          Params.ParamByName('pDTFINA').AsDate    := M_DTATUAL;
          Open;
          //
          If not (IsEmpty) Then
           begin
                First;
                While not (Eof) do
                  begin
                      If (FieldByname('data_venda').AsDateTime >= aDtInicio)
                       and (FieldByname('data_venda').AsDateTime <= aDtFinal) Then
                           M_QTSAID := M_QTSAID + FieldByname('QUANT').AsFloat;
                       //
                      If (FieldByname('data_venda').AsDateTime < aDtInicio) Then
                          M_ESTINISAI := M_ESTINISAI + FieldByname('QUANT').AsFloat;

                      If (FieldByname('data_venda').AsDateTime > aDtFinal) Then
                           M_ESTFINSAI := M_ESTFINSAI + FieldByname('QUANT').AsFloat;
                       //
                       Next;
                  End;
           End;
    End;
    // entradas
    aTexto := 'Select ME.id_entrada, ME.registro_ms, EM.data_recebimento, Sum(ME.quantidade) as QUANT from MEDICAMENTO_ENTRADA ME ';
    aTexto := aTexto +'Inner Join ENTRADA_MEDICAMENTOS EM ON  EM.id_entrada = ME.id_entrada ';
    aTexto := aTexto +'Where (ME.registro_ms = :pPRODUTO) and (EM.id_loja = :pLOJA) and (EM.data_recebimento <= :pDTFINA) ';
    aTexto := aTexto +'AND (EM.SITUACAO = '+QuotedStr('F') + ') Group by ME.id_entrada, ME.registro_ms, EM.data_recebimento ';
    With cdsListaBal do
    begin
          Close;
          CommandText :=  aTexto;
          Params.ParamByName('pLOJA').AsInteger   := iLoja;
          Params.ParamByName('pPRODUTO').AsString := aCodigo;
          Params.ParamByName('pDTFINA').AsDate    := M_DTATUAL;
          Open;
          //
          If not (IsEmpty) Then
           begin
                First;
                While not (Eof) do
                  begin
                      If (FieldByname('data_recebimento').AsDateTime >= aDtInicio)
                       and (FieldByname('data_recebimento').AsDateTime <= aDtFinal) Then
                           M_QTENTR := M_QTENTR + FieldByname('QUANT').AsFloat;
                       //
                      If (FieldByname('data_recebimento').AsDateTime > aDtFinal) Then
                           M_ESTFINENT := M_ESTFINENT + FieldByname('QUANT').AsFloat;
                      If  (FieldByname('data_recebimento').AsDateTime < aDtInicio) Then
                           M_ESTIINIENT := M_ESTIINIENT + FieldByname('QUANT').AsFloat;
                       //
                       Next;
                  End;

           End;
    End;
    //
    aNomeProduto := dmDados.GetNomeProduto(aCodigo);
    AddItemBalanco(aCodigo, aNomeProduto, M_ESTIINIENT - ( M_ESTINISAI + M_ESTINIPER),
            M_QTENTR, M_QTSAID, M_QTPERD, M_ESTATUAL);
    //
    Result := True;
end;

function TdmPesquisa.GetEstoqueAtualProduto(iLoja: Integer;
  aCodigo: string): Double;
var qraux : TSQLquery;
    texto : string;
begin
     Result := 0;
     //
     texto := 'Select E.EST_CDLOJA, E.est_cdprod, Sum(E.est_quantidade) as QUANT from ESTOQUE E ';
     texto := texto + 'Where (E.est_cdloja = :pCDLOJA) AND (E.est_cdprod = :pCODIGO) GROUP BY E.EST_CDLOJA, E.est_cdprod ';
     QrAux := TSqlquery.Create(nil);
     with QrAux do
       try
         SQLConnection := dmDados.sqlSNGPN;
         sql.Add(texto);
         Params.ParamByName('pCDLOJA').AsInteger  := iLoja;
         Params.ParamByName('pCODIGO').AsString   := aCodigo;
         Open;
         //
         If Not (IsEmpty) Then
             result := FieldByName('QUANT').AsFloat;
       finally
         free;
       end;
end;

function TdmPesquisa.GeraBalancoCalculadoNovo(iLoja, iOrdem: Integer;
  aDtInicio, aDtFinal: TDateTime): Boolean;
Var
   aTextoEstoque : String;
   fEntrada, fSaida, fPerda : Double;
begin
     Result := False;
     try

         Result := true;
     Except

     End;
end;

function TdmPesquisa.GetMovimentoProdutoNovo(iLoja: Integer;
  aCodigo: string; aDtInicio, aDtFinal: TDatetime): Boolean;
Var
   M_ESTINI, M_ESTFIN, M_QTSAID, M_QTENTR, M_QTPERD : DOUBLE;
   M_ESTFINENT, M_ESTFINSAI, M_ESTFINPER : Double;
   M_ESTIINIENT, M_ESTINISAI, M_ESTINIPER : Double;
   M_ESTATUAL : Double;
   M_DTATUAL : TDateTime;
   aTexto, aNomeProduto : String;
   qraux : TSQLquery;
begin
    Result := False;
    M_ESTINI := 0;
    M_ESTFIN := 0;
    M_QTSAID := 0;
    M_QTENTR := 0;
    M_QTPERD := 0;
    //
    M_ESTIINIENT := 0;
    M_ESTINISAI  := 0;
    M_ESTINIPER  := 0;
    //
    M_ESTFINENT := 0;
    M_ESTFINSAI := 0;
    M_ESTFINPER := 0;
    //
    M_DTATUAL  := Date();
    M_ESTATUAL := GetEstoqueAtualProduto(iLoja, aCodigo);
    // perdas
    aTexto := 'Select PE.registro_ms, SUM(PE.quantidade) AS QUANT from perdas_medicamentos PE ';
    aTexto := aTexto + ' inner Join PERDAS P on PE.id_perda = P.id_perda ';
    aTexto := aTexto + ' Where (PE.registro_ms = :pPRODUTO) and (p.id_loja = :pLOJA) and (P.data_perda >= :pDTINICIAL) and (P.data_perda <= :pDTFINAL) ';
    aTexto := aTexto + ' AND (P.situacao = :pSITUACAO) Group BY PE.registro_ms ';
    //
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
         SQLConnection := dmDados.sqlSNGPN;
          sql.Add(aTexto);
          Params.ParamByName('pLOJA').AsInteger     := iLoja;
          Params.ParamByName('pPRODUTO').AsString   := aCodigo;
          Params.ParamByName('pDTINICIAL').AsDate   := aDtInicio;
          Params.ParamByName('pDTFINAL').AsDate     := Date();
          Params.ParamByName('pSITUACAO').AsString  := 'F';
          Open;
          //
          If not (IsEmpty) Then
             M_ESTINIPER :=  FieldByName('QUANT').AsFloat;
     finally
          Free;
     end;
    // saídas
    aTexto := 'select VM.registro_ms, Sum(VM.quant_medicamento) as QUANT from vendas_medicamentos VM ';
    aTexto := aTexto +' inner Join VENDAS VE on VM.id_venda = VE.id_venda ';
    aTexto := aTexto +' Where (VM.registro_ms = :pPRODUTO) and (VE.id_loja = :pLOJA) and (VE.data_venda >= :pDTINICIAL) AND (VE.data_venda <= :pDTFINAL) ';
    aTexto := aTexto +' AND (VE.situacao = :pSITUACAO) Group by VM.registro_ms ';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
         SQLConnection := dmDados.sqlSNGPN;
          sql.Add(aTexto);
          Params.ParamByName('pLOJA').AsInteger    := iLoja;
          Params.ParamByName('pPRODUTO').AsString  := aCodigo;
          Params.ParamByName('pDTINICIAL').AsDate   := aDtInicio;
          Params.ParamByName('pDTFINAL').AsDate     := Date();
          Params.ParamByName('pSITUACAO').AsString := 'F';
          Open;
          //
          If not (IsEmpty) Then
           begin
               M_ESTINISAI :=  FieldByName('QUANT').AsFloat;
           End;
     finally
          Free;
     end;
    // entradas
    aTexto := 'select ME.registro_ms, Sum(ME.quantidade) as QUANT from MEDICAMENTO_ENTRADA ME ';
    aTexto := aTexto + ' inner Join entrada_medicamentos E on ME.id_entrada = E.id_entrada ';
    aTexto := aTexto + ' Where (ME.registro_ms = :pPRODUTO) AND (E.id_loja = :pLOJA) and (E.data_recebimento >= :pDTINICIAL) AND (E.data_recebimento <= :pDTFINAL) AND (E.situacao = :pSITUACAO) ';
    aTexto := aTexto + ' Group by ME.registro_ms ';
    //
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
         SQLConnection := dmDados.sqlSNGPN;
          sql.Add(aTexto);
          Params.ParamByName('pLOJA').AsInteger     := iLoja;
          Params.ParamByName('pPRODUTO').AsString   := aCodigo;
          Params.ParamByName('pDTINICIAL').AsDate   := aDtInicio;
          Params.ParamByName('pDTFINAL').AsDate     := Date();
          Params.ParamByName('pSITUACAO').AsString  := 'F';
          Open;
          //
          If not (IsEmpty) Then
              M_ESTIINIENT :=  FieldByName('QUANT').AsFloat;
     finally
          Free;
     end;
    //
    M_QTENTR := GetEntradaMedicamento(aCodigo, aDtInicio, aDtFinal);
    M_QTSAID := GetSaidaMedicamento(aCodigo, aDtInicio, aDtFinal);
    M_QTPERD := GetPerdaMedicamento(aCodigo, aDtInicio, aDtFinal);
    //
    aNomeProduto := dmDados.GetNomeProduto(aCodigo);
    // M_ESTATUAL +
    AddItemBalanco(aCodigo, aNomeProduto, M_ESTATUAL + (M_ESTINISAI + M_ESTINIPER) - M_ESTIINIENT,   //+(M_QTSAID+M_QTPERD)-M_QTENTR
            M_QTENTR, M_QTSAID, M_QTPERD, M_ESTATUAL);
    {AddItemBalanco(aCodigo, aNomeProduto, M_ESTIINIENT - ( M_ESTINISAI + M_ESTINIPER),
            M_QTENTR, M_QTSAID, M_QTPERD, M_ESTATUAL);}
    //
    Result := True;
end;

procedure TdmPesquisa.DataModuleCreate(Sender: TObject);
begin
     dstPadrao.CommandText := '';
end;

procedure TdmPesquisa.cdsProdutosEstoqueCalcFields(DataSet: TDataSet);
begin
     if (cdsProdutosEstoque.State = dsInternalCalc) Then
     begin
         if (aDtInicial > 0) and (aDtFinal > 0) Then
         begin
             cdsProdutosEstoqueEST_INICIAL.AsFloat :=
                       dmDados.GetQuantidadeProdutoData(iLoja, cdsProdutosEstoqueEST_CDPROD.AsString, aDtInicial - 1);
             cdsProdutosEstoqueEST_ENTRADA.AsFloat := dmDados.GetQuantProdutoPeriodo(iLoja, cdsProdutosEstoqueEST_CDPROD.AsString, 'EST_QTENTRADA', aDtInicial, aDtFinal);
             cdsProdutosEstoqueEST_VENDAS.AsFloat  := dmDados.GetQuantProdutoPeriodo(iLoja, cdsProdutosEstoqueEST_CDPROD.AsString, 'EST_QTSAIDA', aDtInicial, aDtFinal);
             cdsProdutosEstoqueEST_PERDAS.AsFloat  := dmDados.GetQuantProdutoPeriodo(iLoja, cdsProdutosEstoqueEST_CDPROD.AsString, 'EST_PERDA', aDtInicial, aDtFinal);
             cdsProdutosEstoqueEST_TRANSFERENCIAS.AsFloat := dmDados.GetQuantProdutoPeriodo(iLoja, cdsProdutosEstoqueEST_CDPROD.AsString, 'EST_QTTRANSFERENCIA', aDtInicial, aDtFinal);
         End;
         //
         cdsProdutosEstoqueEST_FINAL.AsFloat :=
               cdsProdutosEstoqueEST_INICIAL.AsFloat + cdsProdutosEstoqueEST_ENTRADA.AsFloat -
               cdsProdutosEstoqueEST_VENDAS.AsFloat -
               cdsProdutosEstoqueEST_PERDAS.AsFloat -
               cdsProdutosEstoqueEST_TRANSFERENCIAS.AsFloat;
     End;
end;

end.
