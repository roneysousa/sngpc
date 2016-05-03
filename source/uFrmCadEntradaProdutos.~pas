unit uFrmCadEntradaProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, DBClient, Provider, DB, SqlExpr, jpeg,
  ExtCtrls, Buttons, Grids, DBGrids, StdCtrls, ComCtrls, Mask, DBCtrls,
  ToolEdit, RXDBCtrl, CurrEdit;

type
  TfrmCadEntradaProdutos = class(TfrmCadastro)
    Panel5: TPanel;
    Panel6: TPanel;
    pnlProduto: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    cmbLoja: TDBLookupComboBox;
    Label3: TLabel;
    dbeNumeroNota: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    dbeDataEmissao: TDBDateEdit;
    dbeDtRecebimento: TDBDateEdit;
    Label6: TLabel;
    dbeCNPJOrigem: TDBEdit;
    Label16: TLabel;
    edtCDPROD: TEdit;
    spLocalizar: TSpeedButton;
    edtNMDESC: TEdit;
    Label17: TLabel;
    edtNRLOTE: TEdit;
    Label19: TLabel;
    edtQuantidade: TCurrencyEdit;
    dsItensEntrada: TDataSource;
    btnCadProduto: TBitBtn;
    rgTipoEntrada: TDBRadioGroup;
    rgClasse: TRadioGroup;
    rgUnidade: TRadioGroup;
    procedure BtEditarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure dbeNumeroNotaKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCNPJOrigemExit(Sender: TObject);
    procedure spLocalizarClick(Sender: TObject);
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure dbeDataEmissaoExit(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure edtCDPRODEnter(Sender: TObject);
    procedure edtCDPRODExit(Sender: TObject);
    procedure edtNRLOTEExit(Sender: TObject);
    procedure edtNRLOTEKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure dsItensEntradaDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCadProdutoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
     //procedure REGISTRO;
     Procedure BUSCAR(idEntrada : Integer);
     procedure MOSTRA;
     procedure INCLUIR_ITEM(aProduto, aLote : String; fQuant : Double);
     procedure Limpar_Itens;
     Function GravarItens(idEntrada, iLoja : Integer; aCdsItens : TClientDataSet): Boolean;
  public
    { Public declarations }
  end;

var
  frmCadEntradaProdutos: TfrmCadEntradaProdutos;

implementation

uses udmDados, uFuncoes, ufrmLocProduto, DateUtils, uFormMainSngpc,
  uFrmCadProdutos;

{$R *.dfm}

procedure TfrmCadEntradaProdutos.BUSCAR(idEntrada: Integer);
begin
   With dmDados.cdsEntradaProdutos do
     begin
         Close;
         Params.ParamByName('pID_COMPRADOR').AsInteger  := idEntrada;
         Open;
     End;
end;

procedure TfrmCadEntradaProdutos.BtEditarClick(Sender: TObject);
Var
  aDataMov : TDatetime;
begin                   
    if  not (dsCadastro.DataSet.IsEmpty)
       and (dsCadastro.DataSet.RecordCount > 0) then
    Begin
         dmDados.RefreshCDS(dmDados.cdsConfig);
         aDataMov := dmDados.GetDataMovimentoAtual(dmDados.cdsConfigCFG_LOJA_PADRAO.AsInteger);
         //
         if (dsCadastro.DataSet.FieldByName('DATA_RECEBIMENTO').AsDateTime = aDataMov ) Then
         begin
              inherited;
              dsCadastro.DataSet.Edit;
              dbeNumeroNota.SetFocus;
         End;
    End;
end;

procedure TfrmCadEntradaProdutos.BtCancelarClick(Sender: TObject);
begin
      dsCadastro.DataSet.Cancel;
      Limpar_Itens;
      dmDados.cdsDados.EmptyDataSet;
  inherited;
      TabSheet2.TabVisible := False; 
end;

procedure TfrmCadEntradaProdutos.BtGravarClick(Sender: TObject);
Var
   idMaxEntrada : Integer;
begin
     If uFuncoes.Empty(cmbLoja.Text) Then
       Begin
           Application.MessageBox('Selecione a loja.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbLoja.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(dbeNumeroNota.Text) Then
       Begin
           Application.MessageBox('Digite o número da nota.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeNumeroNota.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(uFuncoes.RemoveChar(dbeDataEmissao.Text)) Then
       Begin
             Application.MessageBox('Digite a data de Emissão da nota.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeDataEmissao.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(uFuncoes.RemoveChar(dbeCNPJOrigem.Text)) Then
       Begin
           Application.MessageBox('Digite o CNPJ do fornecedor.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeCNPJOrigem.SetFocus;
           Exit;
       End;
      //
      if (rgTipoEntrada.ItemIndex = -1) then
      Begin
           Application.MessageBox('Selecione o tipo operação Nota Fiscal.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           rgTipoEntrada.SetFocus;
           Exit;
       End;
      //
      if (dsItensEntrada.DataSet.RecordCount = 0) Then
      begin
           Application.MessageBox('Adicione itens na entrada de produto.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           if (pnlProduto.Enabled) Then
              edtCDPROD.SetFocus;
           Exit;
      End;
      //
      idMaxEntrada := dmDados.GetMaxIdEntrada();
      try
          //
          dmDados.RefreshCDS(dmDados.cdsConfig);
          dmDados.Start;
          //
          if (dsCadastro.DataSet.State in [dsinsert]) then
            begin  
                 //
                 dmDados.CdsConfig.Edit;
                 if (dmDados.cdsConfig.FieldByName('CFG_ENTRADAS_MEDICAMENTOS').AsInteger < idMaxEntrada) Then
                     dmDados.cdsConfig.FieldByName('CFG_ENTRADAS_MEDICAMENTOS').AsInteger := idMaxEntrada + 1
                 Else
                     dmDados.cdsConfig.FieldByName('CFG_ENTRADAS_MEDICAMENTOS').AsInteger := dmDados.cdsConfig.FieldByName('CFG_ENTRADAS_MEDICAMENTOS').AsInteger + 1;
                 dsCadastro.DataSet.FieldByName('ID_ENTRADA').AsInteger :=
                        dmDados.cdsConfig.FieldByName('CFG_ENTRADAS_MEDICAMENTOS').AsInteger;
                 dsCadastro.DataSet.FieldByName('HORA_RECEBIMENTO').AsString := TimetoStr(time);
                 dsCadastro.DataSet.FieldByName('USUARIO').AsInteger         := StrtoInt(uFormMainSngpc.M_CDUSUA);
                 dsCadastro.DataSet.FieldByName('DATA_CADASTRO').AsDateTime  := Date();
                 //
                 dmDados.CdsConfig.Post;
             end;
          //
          dmDados.cdsEntradaProdutos.ApplyUpdates(0);
          //
          if (GravarItens(dsCadastro.DataSet.FieldByName('ID_ENTRADA').AsInteger,
                      dsCadastro.DataSet.FieldByName('ID_LOJA').AsInteger,
                     dmDados.cdsDados)) Then
           begin
                 //
                 dmDados.CdsConfig.ApplyUpdates(0);
                 //
                 dmDados.Comit(dmDados.Transc);
                 //
                 Limpar_Itens;
                 //
                 Application.MessageBox(PChar(uFuncoes.MSG_OK),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 //
          End;
     Except
          on Exc:Exception do
            begin
               dmDados.Rollback;
               //
               Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message), 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               BtCancelarClick(Sender);
            End;
     End;
     //
  inherited;
     TabSheet2.TabVisible := False;
end;

procedure TfrmCadEntradaProdutos.dbeNumeroNotaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TfrmCadEntradaProdutos.dbeCNPJOrigemExit(Sender: TObject);
Var
   iLoja : integer;
   aCNPJDestino : String;
begin
    if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
    begin
         if not (uFuncoes.Empty(ufuncoes.RemoveChar(dbeCNPJOrigem.Text))) Then
         begin
             try
               If not (uFuncoes.CGC(uFuncoes.StrZero(dbeCNPJOrigem.Text,14))) Then
               Begin
                   Application.MessageBox(PChar('CNPJ inválido!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
                   dbeCNPJOrigem.Clear;
                   dbeCNPJOrigem.SetFocus;
                   Exit;
               End;
             Except
                   dbeCNPJOrigem.Clear;
                   dbeCNPJOrigem.SetFocus;
                   raise Exception.Create('Erro no CNPJ.');
             End;
             //
             iLoja := dmDados.GetCodigoLoja(cmbLoja.Text);
             aCNPJDestino := dmDados.GetCNPJDestino(iLoja);
             //
             If (dbeCNPJOrigem.Text = aCNPJDestino) Then
             Begin
                  Application.MessageBox(PChar('CNPJ não pode ser igual ao de destino.'),
                      'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
                  dbeCNPJOrigem.SetFocus;
                  Exit;
             End;
             //
             If (dmDados.VerificarNotaEntrada(dbeCNPJOrigem.Text,
                  dmDados.GetCodigoLoja(cmbLoja.Text), StrtoInt(dbeNumeroNota.text))) Then
               begin
                    Application.MessageBox(PChar('Número de nota fiscal já cadastrado '+#13
                       +'para este Fornecedor.'),
                     'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
                    Exit;
               End;
         End;
    End;
   inherited;
end;

procedure TfrmCadEntradaProdutos.spLocalizarClick(Sender: TObject);
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

procedure TfrmCadEntradaProdutos.edtCDPRODKeyPress(Sender: TObject;
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
          edtNRLOTE.SetFocus;
     End;
end;

procedure TfrmCadEntradaProdutos.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
     pnlProduto.Enabled := dsCadastro.DataSet.State in [dsInsert, dsEdit];
     BtExcluir.Enabled  := (dsCadastro.DataSet.State in [dsInsert, dsEdit])
                           and not (dsItensEntrada.DataSet.IsEmpty) and (dsItensEntrada.DataSet.RecordCount > 0);
end;

procedure TfrmCadEntradaProdutos.dbeDataEmissaoExit(Sender: TObject);
begin
     if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
      begin
          If not (uFuncoes.Empty(ufuncoes.RemoveChar(dbeDataEmissao.Text))) Then
           try
               dbeDataEmissao.Date := StrToDate(dbeDataEmissao.Text);
               //
               If (dbeDataEmissao.Date > dbeDtRecebimento.Date) Then
                 begin
                      dbeDataEmissao.SetFocus;
                      raise Exception.Create('Data não pode ser superior a data movimento.');
                 End;
           except
                 on EConvertError do
                 begin
                     ShowMessage ('Data Inválida!');
                     dbeDataEmissao.SetFocus;
                 End;
           end;
      End;
  inherited;
end;

procedure TfrmCadEntradaProdutos.BtAdicionarClick(Sender: TObject);
Var
   M_NRCNPJ : String;
begin
     // habilitaControles(True);
     dmDados.RefreshCDS(dmDados.cdsConfig);
     dmDados.RefreshCDS(dmDados.cdsListaEmpresa);
     dmDados.RefreshCDS(dmDados.cdsDados);
     dmDados.cdsDados.EmptyDataSet;
     //
     dmDados.FilterCDS(dmDados.cdsEntradaProdutos, fsInteger, '-1');
     With dmDados.cdsEntradaProdutos do
     begin
           Append;
           dmDados.cdsEntradaProdutosID_ENTRADA.AsInteger :=
               dmDados.cdsConfigCFG_ENTRADAS_MEDICAMENTOS.AsInteger + 1;
           dmDados.cdsEntradaProdutosID_LOJA.AsInteger := dmDados.cdsConfigCFG_LOJA_PADRAO.AsInteger;
           dmDados.cdsEntradaProdutosDATA_RECEBIMENTO.AsDateTime := dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime;
           dmDados.cdsEntradaProdutosTIPO_OPERACAO_NF.AsInteger  := 1;   // Compra
              // dmDados.GetDataMovimentoAtual(dmDados.cdsConfigCFG_LOJA_PADRAO.AsInteger);
           //
           dmDados.FilterCDS(dmDados.cdsLojas, fsInteger, InttoStr(dmDados.cdsConfigCFG_LOJA_PADRAO.AsInteger));
           If not (dmDados.cdsLojas.IsEmpty) Then
               M_NRCNPJ := dmDados.cdsLojasEMP_CNPJ.AsString
           Else
               M_NRCNPJ := dmDados.cdsConfigCFG_CNPJ.AsString;
           dmDados.cdsEntradaProdutosCNPJ_DESTINO.AsString := M_NRCNPJ
     End;
     //
     cmbLoja.SetFocus;
  inherited;
end;

procedure TfrmCadEntradaProdutos.edtCDPRODEnter(Sender: TObject);
begin
  inherited;
    if uFuncoes.Empty(cmbLoja.Text) Then
     begin
          cmbLoja.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(dbeNumeroNota.Text) Then
     begin
         dbeNumeroNota.SetFocus;
         Exit;
     End;
     //
     If uFuncoes.Empty(uFuncoes.RemoveChar(dbeDataEmissao.Text)) Then
     begin
         dbeDataEmissao.SetFocus;
         Exit;
     End;
     //
     If uFuncoes.Empty(uFuncoes.RemoveChar(dbeCNPJOrigem.Text)) Then
     begin
         dbeCNPJOrigem.SetFocus;
         Exit;
     End; 
     //
     rgClasse.ItemIndex := -1;
     rgUnidade.ItemIndex := -1;
end;

procedure TfrmCadEntradaProdutos.edtCDPRODExit(Sender: TObject);
Var
   iLoja : Integer;
   aProduto : String;
begin
     aProduto :=  uFuncoes.StrZero(edtCDPROD.Text,13);
     //
     If not uFuncoes.Empty(edtCDPROD.Text) Then
       If (dmDados.PROCURAR_PRODUTO(uFuncoes.StrZero(edtCDPROD.Text,13))= False)  Then
       begin
            Application.MessageBox('Código de produto não cadatrado!!!',
               'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
            edtCDPROD.Clear;
            edtCDPROD.SetFocus;
            Exit;
       End
       Else
       Begin
            MOSTRA;
            edtNRLOTE.SetFocus;
       End;
   inherited;
end;

procedure TfrmCadEntradaProdutos.MOSTRA;
Var
   aClasse, aUnidade : String;
begin
     edtNMDESC.Text := dmDados.GetNomeProduto(StrZero(edtCDPROD.Text,13));
     //
     aClasse := dmDados.GetClasseTerapeuticaProduto(edtCDPROD.Text);
     aUnidade := dmDados.GetUnidadeMedidaProduto(edtCDPROD.Text);
     //
     if (aClasse = 'S') then
         rgClasse.ItemIndex := 0
     eLSE
         rgClasse.ItemIndex := 1;
     //
     if (aUnidade = '1') then
         rgUnidade.ItemIndex := 0
     Else
         rgUnidade.ItemIndex := 1;
end;

procedure TfrmCadEntradaProdutos.edtNRLOTEExit(Sender: TObject);
Var
   W_CDLOJA : integer;
   aProduto : String;
begin
    if not uFuncoes.Empty (edtCDPROD.Text) and
       not uFuncoes.Empty(edtNRLOTE.Text) Then
     begin
          dmDados.RefreshCDS(dmDados.cdsConfig);
          If (dmDados.cdsConfigCFG_FLZEROS.AsString = 'S') Then
              edtNRLOTE.Text :=  uFuncoes.StrZero(edtNRLOTE.Text,10);
          //
          aProduto := edtCDPROD.Text;
     End;
  inherited;

end;

procedure TfrmCadEntradaProdutos.edtNRLOTEKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  { If not( key in['0'..'9',#8, #13] ) then
        key:=#0;   }
   //     
   if (key = #13) and not uFuncoes.Empty(edtNRLOTE.Text) Then
      begin
           key := #0;
           edtQuantidade.SetFocus;
      End;
end;

procedure TfrmCadEntradaProdutos.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if (key = #13) and (edtQuantidade.Value > 0) Then
      begin
           key := #0;
           edtCDPROD.SetFocus;
      End;
end;

procedure TfrmCadEntradaProdutos.edtQuantidadeExit(Sender: TObject);
Var
    iLoja : Integer;
    aProduto, aLote : String;
begin
      //
      if not Empty(edtCDPROD.Text)
       and not Empty(edtNRLOTE.Text)
       and (edtQuantidade.Value > 0) Then
        begin
             if (rgClasse.ItemIndex = -1) Then
             begin
                  rgClasse.SetFocus;
                  raise Exception.Create('Seleciona a classe teraupêtica do produto.');
             End;
             //
             if (rgUnidade.ItemIndex = -1) Then
             begin
                  rgUnidade.SetFocus;
                  Raise Exception.Create('Seleciona a unidade de medida do produto.');
             End;
             //
             //
             INCLUIR_ITEM(edtCDPROD.Text, edtNRLOTE.Text, edtQuantidade.Value);
        End;
  inherited;
end;

procedure TfrmCadEntradaProdutos.edtQuantidadeEnter(Sender: TObject);
begin
   if not uFuncoes.Empty(edtCDPROD.Text) and uFuncoes.Empty(edtNRLOTE.Text) Then
      begin
           edtNRLOTE.SetFocus;
           exit;
      End;
  inherited;

end;


procedure TfrmCadEntradaProdutos.INCLUIR_ITEM(aProduto, aLote: String;
  fQuant: Double);
Var
  aClasse, aUnidade: String;
begin
     With dmDados.cdsDados do
     Begin
          Append;
          FieldByName('PRO_CODIGO').AsString   := aProduto;
          //FieldByName('PRO_CDBARR').AsString   := aProduto;
          FieldByName('PRO_NMPROD').AsString   := edtNMDESC.Text;
          FieldByName('PRO_NRLOTE').AsString   := aLote;
          FieldByName('PRO_QTPROD').AsFloat    := fQuant;
          //
          Post;
          //  Atualiza Classe terapêutica
          Case rgClasse.ItemIndex of
            0 : aClasse := 'S';
            1 : aClasse := 'N';
          End;
          dmDados.SetClasseTerapeuticaProduto(aProduto, aClasse);
          //
          Case rgUnidade.ItemIndex of
              0: aUnidade := '1';
              1: aUnidade := '2';
          End;
          //
          dmDados.SetUnidadeMedidaProduto(aProduto, aUnidade);
     End;
     //
     Limpar_Itens;
     //
     edtCDPROD.SetFocus;
end;

procedure TfrmCadEntradaProdutos.Limpar_Itens;
begin
     edtCDPROD.Clear;
     edtNMDESC.Clear;
     edtNRLOTE.Clear;
     edtQuantidade.Clear;
     //
     rgClasse.ItemIndex := -1;
end;

procedure TfrmCadEntradaProdutos.BtExcluirClick(Sender: TObject);
begin
   if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
   begin
     if not (dsItensEntrada.DataSet.IsEmpty)
       and (dsItensEntrada.DataSet.RecordCount > 0) Then
            dsItensEntrada.DataSet.Delete;
   End;
  inherited;  
end;

procedure TfrmCadEntradaProdutos.dsItensEntradaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
     BtExcluir.Enabled :=  (not (dsItensEntrada.DataSet.IsEmpty)) and (dsItensEntrada.DataSet.RecordCount > 0);
end;

function TfrmCadEntradaProdutos.GravarItens(idEntrada, iLoja : Integer;
  aCdsItens: TClientDataSet): Boolean;
var qraux : TSQLquery;
    texto, aProduto, aLote : string;
    FQuantidade : Double;
begin
      Result := False;
      // Limpar itens anteriores
      texto := 'Delete from MEDICAMENTO_ENTRADA Where (ID_ENTRADA = :pID)';
      QrAux := TSqlquery.Create(nil);
      with QrAux do
      try
          SQLConnection := dmDados.sqlSNGPN;
          sql.Add(texto);
          Params.ParamByName('pID').AsInteger := idEntrada;
          ExecSQL();
          //
      finally
          free;
      end;
      //
   try
      dmDados.FilterCDS(dmDados.cdsItensEntrada, fsInteger, InttoStr(idEntrada));
      aCdsItens.First;
      While not (aCdsItens.Eof) do
      begin
         with dmDados.cdsItensEntrada do
         begin
             Append;
             FieldByName('ID_ENTRADA').AsInteger := idEntrada;
             FieldByName('REGISTRO_MS').AsString := aCdsItens.FieldByName('PRO_CODIGO').AsString;
             FieldByName('NUMERO_LOTE').AsString := uFuncoes.Alltrim(aCdsItens.FieldByName('PRO_NRLOTE').AsString);
             FieldByName('QUANTIDADE').AsFloat   := aCdsItens.FieldByName('PRO_QTPROD').AsFloat;
             //FieldByName('BAIXA_ESTOQUE').AsString := 'S';
             //
             aProduto := aCdsItens.FieldByName('PRO_CODIGO').AsString;
             aLote    := uFuncoes.Alltrim(aCdsItens.FieldByName('PRO_NRLOTE').AsString);
             FQuantidade := aCdsItens.FieldByName('PRO_QTPROD').AsFloat;
             // Atualizar Estoque
             If not dmDados.AdicionaProdutoEstoque(iLoja,  aProduto, aLote, FQuantidade) Then
                  raise Exception.Create('Erro ao tentar atualizar estoque do produto: '+aProduto+ ' Lote: '+aLote);
             //
             //FieldByName('BAIXA_ESTOQUE').AsString := 'S';
             //
             Post;
         End;
         //
         aCdsItens.Next;
      End;
      //
      dmDados.cdsItensEntrada.ApplyUpdates(0);
      //
      aCdsItens.First;
      //
      Result := True;
  Except
       on e: exception do
         begin
             if (dmDados.sqlSNGPN.InTransaction) Then
                dmDados.Rollback;
             raise Exception.Create('Erro ao tentar incluir do produto: '+aProduto+ ' Lote: '+aLote+#13+
                                e.Message);
         End;
  End;
end;

procedure TfrmCadEntradaProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
       if (dmDados.cdsDados.Active) then
           dmDados.cdsDados.EmptyDataSet;
  inherited;
end;

procedure TfrmCadEntradaProdutos.btnCadProdutoClick(Sender: TObject);
begin
  inherited;
     frmMain.AbreForm(TfrmCadProdutos, frmCadProdutos);
end;

procedure TfrmCadEntradaProdutos.FormShow(Sender: TObject);
begin
  inherited;
    dsCadastro.DataSet.Close;
    //
    TabSheet2.TabVisible := False;
end;

procedure TfrmCadEntradaProdutos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
         BtCancelarClick(Sender);
  inherited;
end;

End.

