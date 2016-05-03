unit uFrmRelMovProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmRelPadrao, StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit,
  FMTBcd, DB, SqlExpr, DBClient, Provider, Grids, DBGrids, ppBands,
  ppCache, ppClass, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport,
  ppCtrls, ppVar, ppPrnabl;

type
  TFrmRelMovProduto = class(TfrmRelPadrao)
    Label21: TLabel;
    cmbLojas: TComboBox;
    Label3: TLabel;
    edtDTINCIAL: TDateEdit;
    Label1: TLabel;
    edtDTFINAL: TDateEdit;
    Label2: TLabel;
    edtCDPROD: TEdit;
    spLocalizar: TSpeedButton;
    lbl_NMPROD: TEdit;
    lblNumLote: TLabel;
    cmbLote: TComboBox;
    cdsListaMovimento: TClientDataSet;
    cdsListaMovimentoLOJA: TIntegerField;
    cdsListaMovimentoTIPO_MOV: TStringField;
    cdsListaMovimentoNR_SEQUENCIA: TIntegerField;
    cdsListaMovimentoDATA_MOV: TDateField;
    cdsListaMovimentoREGISTRO_MS: TStringField;
    cdsListaMovimentoNRLOTE: TStringField;
    cdsListaMovimentoQUANTIDADE: TFloatField;
    cdsListaMovimentoUSUARIO: TIntegerField;
    dstListaDados: TSQLDataSet;
    dspListaDados: TDataSetProvider;
    cdsListaEntrada: TClientDataSet;
    cdsListaEntradaID_ENTRADA: TIntegerField;
    cdsListaEntradaDATA_RECEBIMENTO: TDateField;
    cdsListaEntradaREGISTRO_MS: TStringField;
    cdsListaEntradaNUMERO_LOTE: TStringField;
    cdsListaEntradaQUANTIDADE: TBCDField;
    cdsListaVendas: TClientDataSet;
    cdsListaVendasID_VENDA: TIntegerField;
    cdsListaVendasDATA_VENDA: TDateField;
    cdsListaVendasREGISTRO_MS: TStringField;
    cdsListaVendasNUMERO_LOTE: TStringField;
    cdsListaVendasQUANT_MEDICAMENTO: TBCDField;
    DBGrid1: TDBGrid;
    dsDados: TDataSource;
    qryListaEntrada: TSQLQuery;
    dspListaEntrada: TDataSetProvider;
    ppRepDados: TppReport;
    ppDBPDados: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    cdsListaMovimentoNOME_PRODUTO: TStringField;
    cdsListaMovimentoNOME_USUARIO: TStringField;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine1: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppLabel2: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel1: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel3: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    lblPeriodo: TppLabel;
    ppLabel4: TppLabel;
    lblProduto: TppLabel;
    ppLabel12: TppLabel;
    lblLoja: TppLabel;
    ppLabel13: TppLabel;
    ppDBText4: TppDBText;
    cdsListaVendasUSUARIO: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure edtDTINCIALExit(Sender: TObject);
    procedure edtDTFINALExit(Sender: TObject);
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDPRODExit(Sender: TObject);
    procedure spLocalizarClick(Sender: TObject);
    procedure edtCDPRODChange(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure cdsListaMovimentoCalcFields(DataSet: TDataSet);
    procedure edtCDPRODEnter(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarLotes(iLoja : Integer; aProduto : String);
    Function AddRegistro(iLoja, iSequencia, iUsuario : Integer; aDataMov : TDatetime;
             aProduto, aLote, aTipoMov : String; fQuantidade : Double): Boolean;
    procedure InvertarioInicial(iLoja : Integer; aDtInvertario : String;
           aProduto, aLote : String);
    procedure ListadeEntradas(iLoja : Integer; aDtInicial, aDtFinal : String;
           aProduto, aLote : String);
    procedure ListadeVendas(iLoja : Integer; aDtInicial, aDtFinal : String;
           aProduto, aLote : String);
    procedure ListadePerdas(iLoja : Integer; aDtInicial, aDtFinal : String;
           aProduto, aLote : String);

  public
    { Public declarations }
  end;

var
  FrmRelMovProduto: TFrmRelMovProduto;

implementation

uses udmDados, uFuncoes, ufrmLocProduto;

{$R *.dfm}

procedure TFrmRelMovProduto.FormShow(Sender: TObject);
begin
  inherited;
       dmDados.CarregarLojas(cmbLojas);
       //
       edtDTINCIAL.Date := Date();
       edtDTFINAL.Date  := edtDTINCIAL.Date;
       //
       dstListaDados.CommandText := '';
       cmbLojas.ItemIndex := 0;
end;

procedure TFrmRelMovProduto.edtDTINCIALExit(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINCIAL.Text)) Then
    Begin
        try
            StrToDate(edtDTINCIAL.Text);
            edtDTINCIAL.Date := StrToDate(edtDTINCIAL.Text);
            //
             If (edtDTINCIAL.Date > Date) Then
              begin
                   edtDTINCIAL.Date := Date();
                   Exit;
              End;
        except
          on EConvertError do
          Begin
               ShowMessage ('Data Inválida!');
               edtDTINCIAL.SetFocus;
               Exit;
          End;
        end;
    End;
end;

procedure TFrmRelMovProduto.edtDTFINALExit(Sender: TObject);
begin
  inherited;
   If not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINAL.Text)) Then
    Begin
        try
            StrToDate(edtDTFINAL.Text);
            edtDTFINAL.Date := StrToDate(edtDTFINAL.Text);
            //
            If (edtDTFINAL.Date < edtDTINCIAL.Date) Then
              begin
                   edtDTFINAL.SetFocus;
                   Exit;
              End;
              //
              If (edtDTFINAL.Date > Date) Then
              begin
                   edtDTFINAL.Date := Date();
                   Exit;
              End;
        except
          on EConvertError do
          Begin
               ShowMessage ('Data Inválida!');
               edtDTFINAL.SetFocus;
               Exit;
          End;
        end;
   End;
end;

procedure TFrmRelMovProduto.edtCDPRODKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
 If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
     //
     If (key = #13) and uFuncoes.Empty(edtCDPROD.Text)  Then
     Begin
          Key := #0;
          spLocalizarClick(Sender);
     End;
     //
     If (key = #13) and not uFuncoes.Empty(edtCDPROD.Text)  Then
     Begin
          Key := #0;
          if (cmbLote.Enabled) Then;
             cmbLote.SetFocus;
     End;
end;

procedure TFrmRelMovProduto.edtCDPRODExit(Sender: TObject);
Var
   M_CDLOJA : Integer;
   aProduto : String;
begin
  inherited;
     If not (uFuncoes.Empty(cmbLojas.Text))
        and not uFuncoes.Empty(edtCDPROD.Text) Then
      begin
           aProduto :=  uFuncoes.StrZero(edtCDPROD.Text,13);
           //
           If Not (dmDados.ProcurarValor(aProduto, 'PRO_RG_MS_MEDICAMENTO','PRODUTOS'))  Then
           begin
                Application.MessageBox('Código de produto não cadatrado!!!',
                   'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
                edtCDPROD.Clear;
                edtCDPROD.SetFocus;
                Exit;
           End;
           //
           lbl_NMPROD.Text :=  dmDados.GetNomeProduto(aProduto);
           CarregarLotes(dmDados.GetCodigoLoja(cmbLojas.Text), edtCDPROD.Text);
      End;
end;

procedure TFrmRelMovProduto.spLocalizarClick(Sender: TObject);
begin
   inherited;
    edtCDPROD.SetFocus;
    frmLocProduto := TfrmLocProduto.create(application);
    try
        frmLocProduto.showmodal;
    finally
        If not (frmLocProduto.cdsConsultar.IsEmpty) Then
        begin
            edtCDPROD.Text := frmLocProduto.cdsConsultarPRO_RG_MS_MEDICAMENTO.AsString;
            Perform(WM_NEXTDLGCTL, 0, 0);
            //edtCDPROD.SetFocus;
        End;
        //
        frmLocProduto.Release;
        frmLocProduto := nil;
    end;
end;

procedure TFrmRelMovProduto.CarregarLotes(iLoja: Integer;
  aProduto: String);
var qraux : TSQLquery;
    texto : string;
begin
    texto := 'Select E.EST_CDPROD, E.EST_NRLOTE FROM ESTOQUE E WHERE (E.EST_CDPROD = :pCODIGO) AND (E.EST_CDLOJA = :pLOJA)' ;
    //
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
           SQLConnection := dmDados.sqlSNGPN;
           sql.Add(texto);
           Params.ParamByName('pCODIGO').AsString := uFuncoes.StrZero(aProduto, 13);
           Params.ParamByName('pLOJA').AsInteger  := iLoja;
           Open;
           //
           cmbLote.Clear;
           If not (IsEmpty) Then
            begin
                 First;
                 While not (Eof) do
                 begin
                      cmbLote.Items.Add(uFuncoes.Alltrim(FieldByName('EST_NRLOTE').AsString));
                      //
                      Next;
                 End;
            End;
     finally
         free;
     end;
end;

procedure TFrmRelMovProduto.edtCDPRODChange(Sender: TObject);
begin
  inherited;
       if uFuncoes.Empty(edtCDPROD.Text) then
          lbl_NMPROD.Clear;
end;

procedure TFrmRelMovProduto.btnVisualizarClick(Sender: TObject);
Var
   aDtInicio, aDtFinal, aDtInvertario : String;
   iLoja : Integer;
begin
  inherited;
      if uFuncoes.Empty(cmbLojas.Text) then
      begin
           cmbLojas.SetFocus;
           Exit;
      End;
      //
      if uFuncoes.Empty( uFuncoes.RemoveChar(edtDTINCIAL.Text)) then
          aDtInicio := '01/01/2010'
      Else
          aDtInicio := edtDTINCIAL.Text;
      //
      if uFuncoes.Empty( uFuncoes.RemoveChar(edtDTFINAL.Text)) then
          aDtFinal  := DatetoStr(Date)
      Else
          aDtFinal := edtDTFINAL.Text;
      //
      if uFuncoes.Empty(edtCDPROD.Text) then
      begin
           Application.MessageBox('Digite o código do produto!!!',
                   'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
           edtCDPROD.SetFocus;
           Exit;
      End;
      //
      if uFuncoes.Empty(cmbLote.Text) then
      begin
          Application.MessageBox('Selecione o lote do produto!!!',
                   'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
           cmbLote.SetFocus;
           Exit;
      End;
      //
      dmDados.RefreshCDS(cdsListaMovimento);
      cdsListaMovimento.EmptyDataSet;
      //
      aDtInvertario := dmDados.cdsConfigCFG_DT_FECHAMENTO_INV_SISTEMA.AsString;
      iLoja := dmDados.GetCodigoLoja(cmbLojas.Text);
      InvertarioInicial(iLoja, aDtInvertario, edtCDPROD.Text, cmbLote.Text);
      ListadeEntradas(iLoja, aDtInicio, aDtFinal, edtCDPROD.Text, cmbLote.Text);
      ListadeVendas(iLoja, aDtInicio, aDtFinal, edtCDPROD.Text, cmbLote.Text);
      ListadePerdas(iLoja, aDtInicio, aDtFinal, edtCDPROD.Text, cmbLote.Text);
      //
      If not (cdsListaMovimento.IsEmpty) Then
      begin
           With ppRepDados do
           begin
                lblLoja.Caption := cmbLojas.Text;
                lblPeriodo.Caption := edtDTINCIAL.Text +' A '+ edtDTFINAL.Text;
                lblProduto.Caption := edtCDPROD.Text +' - '+lbl_NMPROD.Text;
                PrintReport;
           End;
      End
      Else
      begin
          Application.MessageBox('Não há movimento no período indicado!!!',
                   'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
      End;
end;

function TFrmRelMovProduto.AddRegistro(iLoja, iSequencia,
  iUsuario: Integer; aDataMov: TDatetime; aProduto, aLote,
  aTipoMov: String; fQuantidade: Double): Boolean;
begin
     Result := False;
     try
           With cdsListaMovimento do
           begin
                Append;
                FieldByName('LOJA').AsInteger     := iLoja;
                FieldByName('TIPO_MOV').AsString  := aTipoMov;
                FieldByName('NR_SEQUENCIA').AsInteger := iSequencia;
                FieldByName('DATA_MOV').AsDateTime := aDataMov;
                FieldByName('REGISTRO_MS').AsString := aProduto;
                FieldByName('NRLOTE').AsString     := aLote;
                FieldByName('QUANTIDADE').AsFloat  := fQuantidade;
                FieldByName('USUARIO').AsInteger   := iUsuario;
                //
                Post;
           End;
     Except

     End;
end;

procedure TFrmRelMovProduto.ListadeEntradas(iLoja: Integer; aDtInicial,
  aDtFinal: String; aProduto, aLote: String);
var qraux : TSQLquery;
    texto : string;
begin
      Texto := 'Select E.id_entrada, E.data_recebimento, ME.registro_ms, ME.numero_lote, ME.quantidade, E.USUARIO from MEDICAMENTO_ENTRADA ME ';
      Texto := Texto + ' Inner join ENTRADA_MEDICAMENTOS E ON E.id_entrada = ME.id_entrada WHERE (E.data_recebimento >= :pDTINICIO) ';
      Texto := Texto + ' AND (E.data_recebimento <= :pDTFINAL) AND (E.id_loja = :pLOJA) and (ME.registro_ms = :pCDPROD) and (ME.numero_lote = :pLOTE)';
      //
      QrAux := TSqlquery.Create(nil);
      with QrAux do
        try
          SQLConnection := dmDados.sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pDTINICIO').AsDateTime := StrtoDate(aDtInicial);
          Params.ParamByName('pDTFINAL').AsDateTime  := StrtoDate(aDtFinal);
          Params.ParamByName('pLOJA').AsInteger      := iLoja;
          Params.ParamByName('pCDPROD').AsString     := uFuncoes.Alltrim(aProduto);
          Params.ParamByName('pLOTE').AsString       := uFuncoes.Alltrim(aLote);
          Open;
          //
          if not (IsEmpty) then
           begin
                First;
                While not (Eof) do
                begin
                     AddRegistro(iLoja, FieldByName('ID_ENTRADA').AsInteger, 1,
                         FieldByName('DATA_RECEBIMENTO').AsDateTime,
                         FieldByName('REGISTRO_MS').AsString,
                         FieldByName('NUMERO_LOTE').AsString, 'E',FieldByName('QUANTIDADE').AsFloat);
                     //
                     Next;
                End;
           End;
        finally
          free;
        end;
      {With cdsListaEntrada do
      begin
           Close;
           Params.ParamByName('pDTINICIO').AsDateTime := aDtInicial;
           Params.ParamByName('pDTFINAL').AsDateTime  := aDtFinal;
           Params.ParamByName('pLOJA').AsInteger      := iLoja;
           Params.ParamByName('pCDPROD').AsString     := uFuncoes.Alltrim(aProduto);
           Params.ParamByName('pCDPROD').AsString     := uFuncoes.Alltrim(aLote);
           Open;
           //
           if not (IsEmpty) then
           begin
                First;
                While not (Eof) do
                begin
                     AddRegistro(iLoja, FieldByName('ID_ENTRADA').AsInteger, 1,
                         FieldByName('DATA_RECEBIMENTO').AsDateTime,
                         FieldByName('REGISTRO_MS').AsString,
                         FieldByName('NUMERO_LOTE').AsString, 'E',FieldByName('QUANTIDADE').AsFloat);
                     //
                     Next;
                End;
           End;
      End; }
end;

procedure TFrmRelMovProduto.ListadeVendas(iLoja: Integer; aDtInicial,
  aDtFinal: String; aProduto, aLote: String);
begin
 With cdsListaVendas do
      begin
           Close;
           Params[0].AsDate := StrtoDate(aDtInicial);
           Params[1].AsDate := StrtoDate(aDtFinal);
           Params[2].AsInteger := iLoja;
           Params[3].AsString := aProduto;
           Params[4].AsString := aLote;
           Open;
           if not (IsEmpty) then
           begin
                First;
                While not (Eof) do
                begin
                     AddRegistro(iLoja, FieldByName('ID_VENDA').AsInteger, FieldByName('USUARIO').AsInteger,
                         FieldByName('DATA_VENDA').AsDateTime,
                         FieldByName('REGISTRO_MS').AsString,
                         FieldByName('NUMERO_LOTE').AsString, 'V',FieldByName('QUANT_MEDICAMENTO').AsFloat);
                     //
                     Next;
                End;
           End;
      End;
end;

procedure TFrmRelMovProduto.cdsListaMovimentoCalcFields(DataSet: TDataSet);
begin
  inherited;
       if (cdsListaMovimento.State = dsInternalCalc) Then
       begin
           {if not uFuncoes.Empty(cdsListaMovimentoREGISTRO_MS.AsString) Then
                cdsListaMovimentoNOME_PRODUTO.AsString := dmDados.GetNomeProduto(cdsListaMovimentoREGISTRO_MS.AsString);}
            //
           if not uFuncoes.Empty(cdsListaMovimentoUSUARIO.AsString) Then
                cdsListaMovimentoNOME_USUARIO.AsString := dmDados.GetNomeUsuario(cdsListaMovimentoUSUARIO.AsInteger);

       End;
end;

procedure TFrmRelMovProduto.edtCDPRODEnter(Sender: TObject);
begin
  inherited;
       cmbLote.Clear;
end;

procedure TFrmRelMovProduto.ListadePerdas(iLoja: Integer; aDtInicial,
  aDtFinal, aProduto, aLote: String);
var qraux : TSQLquery;
    texto : string;
begin
      Texto := 'select P.id_perda, P.data_perda, PM.registro_ms, PM.numero_lote, PM.quantidade, P.USUARIO ';
      Texto := Texto + ' from perdas_medicamentos PM Inner join PERDAS P ON P.id_perda = PM.id_perda ';
      Texto := Texto + ' WHERE (P.data_perda >= :pDTINICIO) AND (P.data_perda <= :pDTFINAL) AND (P.id_loja = :pLOJA) and (PM.registro_ms = :pCDPROD) ';
      Texto := Texto + ' and (PM.numero_lote = :pLOTE) ';
      //
      QrAux := TSqlquery.Create(nil);
      with QrAux do
        try
          SQLConnection := dmDados.sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pDTINICIO').AsDateTime := StrtoDate(aDtInicial);
          Params.ParamByName('pDTFINAL').AsDateTime  := StrtoDate(aDtFinal);
          Params.ParamByName('pLOJA').AsInteger      := iLoja;
          Params.ParamByName('pCDPROD').AsString     := uFuncoes.Alltrim(aProduto);
          Params.ParamByName('pLOTE').AsString       := uFuncoes.Alltrim(aLote);
          Open;
          //
          if not (IsEmpty) then
           begin
                First;
                While not (Eof) do
                begin
                     AddRegistro(iLoja, FieldByName('id_perda').AsInteger, FieldByName('USUARIO').AsInteger,
                         FieldByName('data_perda').AsDateTime,
                         FieldByName('REGISTRO_MS').AsString,
                         FieldByName('NUMERO_LOTE').AsString, 'P',FieldByName('quantidade').AsFloat);
                     //
                     Next;
                End;
           End;
        finally
          free;
        end;
end;

procedure TFrmRelMovProduto.InvertarioInicial(iLoja: Integer;
  aDtInvertario, aProduto, aLote: String);
var qraux : TSQLquery;
    texto : string;
begin
      Texto := 'select EH.est_sequencia, EH.est_cdloja, EH.est_cdprod, EH.est_nrlote, EH.est_quantidade, EH.est_dtmovimento, EH.est_homovimento, EH.EST_USUARIO ';
      Texto := Texto + ' FROM ESTOQUE_HISTORICO EH ';
      Texto := Texto + ' WHERE (EH.est_dtmovimento = :pDTMOVI) AND (EH.est_cdloja = :pLOJA) and (EH.est_cdprod = :pCDPROD) ';
      Texto := Texto + ' and (EH.est_nrlote = :pLOTE) ';
      //
      QrAux := TSqlquery.Create(nil);
      with QrAux do
        try
          SQLConnection := dmDados.sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pDTMOVI').AsDateTime := StrtoDate(aDtInvertario);
          Params.ParamByName('pLOJA').AsInteger      := iLoja;
          Params.ParamByName('pCDPROD').AsString     := uFuncoes.Alltrim(aProduto);
          Params.ParamByName('pLOTE').AsString       := uFuncoes.Alltrim(aLote);
          Open;
          //
          if not (IsEmpty) then
           begin
                First;
                While not (Eof) do
                begin
                     AddRegistro(iLoja, FieldByName('est_sequencia').AsInteger, FieldByName('EST_USUARIO').AsInteger,
                         FieldByName('est_dtmovimento').AsDateTime,
                         FieldByName('est_cdprod').AsString,
                         FieldByName('est_nrlote').AsString, 'I',FieldByName('est_quantidade').AsFloat);
                     //
                     Next;
                End;
           End;
        finally
          free;
        end;
end;

End.
