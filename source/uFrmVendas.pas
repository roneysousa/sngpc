unit uFrmVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, DBClient, Provider, DB, SqlExpr, jpeg,
  ExtCtrls, Buttons, Grids, DBGrids, StdCtrls, ComCtrls, Mask, DBCtrls,
  RxGIF, ToolEdit, RXDBCtrl, CurrEdit, DBXpress;

type
  TfrmCadVendas = class(TfrmCadastro)
    pnlSup: TPanel;
    pnlGrid: TPanel;
    pnlProduto: TPanel;
    Label12: TLabel;
    dbeVenda: TDBEdit;
    Label1: TLabel;
    cmbLoja: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    Image2: TImage;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    spLocCliente: TSpeedButton;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edtCDCOMP: TEdit;
    lbl_comprador: TEdit;
    cmbTipoDoc: TComboBox;
    edtORGAO: TEdit;
    cmbUFCliente: TComboBox;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    spLocMedico: TSpeedButton;
    Label8: TLabel;
    Label13: TLabel;
    Label19: TLabel;
    edtIDMEDI: TEdit;
    edtSigla: TEdit;
    cmbUF: TComboBox;
    lbl_NMMEDI: TEdit;
    cmbUsoMedicamento: TDBLookupComboBox;
    cmbReceituario: TDBLookupComboBox;
    dbeNumeroReceita: TDBEdit;
    dbeDataReceita: TDBDateEdit;
    dbeDataVenda: TDBDateEdit;
    Label5: TLabel;
    grdProdutos: TDBGrid;
    dsProdutosVendas: TDataSource;
    Label6: TLabel;
    edtCDPROD: TEdit;
    spLocalizar: TSpeedButton;
    Label7: TLabel;
    cmbLotes: TComboBox;
    Label14: TLabel;
    edtQuantidade: TCurrencyEdit;
    edtNMDESC: TEdit;
    cmbUsoPrologado: TComboBox;
    lblUsoPrologado: TLabel;
    lblDataNascimento: TLabel;
    rgSexo: TRadioGroup;
    dbeDtNasc: TDateEdit;
    lblNomePaciente: TLabel;
    edtNomePaciente: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure dbeNumeroReceitaEnter(Sender: TObject);
    procedure dbeDataReceitaExit(Sender: TObject);
    procedure edtCDCOMPKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDCOMPExit(Sender: TObject);
    procedure edtCDCOMPChange(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure edtORGAOExit(Sender: TObject);
    procedure edtORGAOKeyPress(Sender: TObject; var Key: Char);
    procedure cmbUFClienteEnter(Sender: TObject);
    procedure cmbUFClienteExit(Sender: TObject);
    procedure edtSiglaExit(Sender: TObject);
    procedure edtIDMEDIExit(Sender: TObject);
    procedure edtIDMEDIKeyPress(Sender: TObject; var Key: Char);
    procedure edtIDMEDIChange(Sender: TObject);
    procedure cmbUFEnter(Sender: TObject);
    procedure cmbUFExit(Sender: TObject);
    procedure spLocalizarClick(Sender: TObject);
    procedure edtCDPRODExit(Sender: TObject);
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDPRODEnter(Sender: TObject);
    procedure edtCDPRODChange(Sender: TObject);
    procedure cmbLotesKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure dsProdutosVendasDataChange(Sender: TObject; Field: TField);
    procedure BtGravarClick(Sender: TObject);
    procedure dbeNumeroReceitaKeyPress(Sender: TObject; var Key: Char);
    procedure cmbReceituarioExit(Sender: TObject);
    procedure dbeDtNascExit(Sender: TObject);
    procedure cmbLotesEnter(Sender: TObject);
    procedure cmbLotesExit(Sender: TObject);
    procedure cmbUsoPrologadoExit(Sender: TObject);
    procedure cmbUsoPrologadoKeyPress(Sender: TObject; var Key: Char);
    procedure edtSiglaEnter(Sender: TObject);
    procedure cmbUsoMedicamentoExit(Sender: TObject);
    procedure lbl_compradorEnter(Sender: TObject);
    procedure lbl_NMMEDIEnter(Sender: TObject);
    procedure dbeDataReceitaEnter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmbUsoPrologadoEnter(Sender: TObject);
  private
    { Private declarations }
    Procedure CarregarTipoDocumento(aCmb : TComboBox);
    Procedure HabilitarDesabilitarControles(Estado : Boolean);
    Procedure SelecionarUF(aCmb : TCombobox; aUF : String);
    procedure MOSTRA;
    Function GetQuantProdutoVenda(aCDS : TClientDataSet; aProduto, aLote : String): Integer;
    procedure INCLUIR_ITEM(aProduto, aNomeProduto, aLote, aUsoPrologado : String; fQuant : Double);
    procedure LIMPAR_DADOS;
    procedure LimparTela;
    procedure LIMPAR;
    procedure NOVO;
    Function VerificarUsoPrologado(aCsdItens : TClientDataSet): Boolean;
    Procedure ControleUsoPrologado(bStatus: Boolean);
    Procedure DadosPaciente(bStatus: Boolean);
    Procedure LimparGridDados(aCDS : TClientDataSet);
    procedure EntreDatas(DataFinal, DataInicial: TDate; var Anos, Meses, Dias: Integer);
    Function ValidarSiglaConselho(iUsoMedicamento, iTipoReceituario : Integer; aSigla : String): Boolean;
  public
    { Public declarations }
    
  end;

var
  frmCadVendas: TfrmCadVendas;
  ScreenWidth: LongInt = 800; {I designed my form in 800x600 mode.}
  ScreenHeight: LongInt = 600;

implementation

uses udmDados, uFormMainSngpc, udmPesquisa, uFuncoes,
  uFrmLocOrgaoExpedidor, uFrmLocProdutoEstoque;

{$R *.dfm}

procedure TfrmCadVendas.FormCreate(Sender: TObject);
begin
  inherited;
   dmDados.RefreshCDS(dmDados.cdsConfig);
   //
   if not (dmDados.cdsConfigCFG_SCREEN_WIDTH.IsNull) Then
       ScreenWidth  := dmDados.cdsConfigCFG_SCREEN_WIDTH.AsInteger
   Else
       ScreenWidth  := 800;
   //
   If not (dmDados.cdsConfigCFG_SCREEN_HEIGTH.IsNull) Then
       ScreenHeight := dmDados.cdsConfigCFG_SCREEN_HEIGTH.AsInteger
   Else
       ScreenHeight := 600;
   //
   scaled := true;

    if (screen.width <> ScreenWidth) then
    begin
        height := longint(height) * longint(screen.height) DIV ScreenHeight;
        width := longint(width) * longint(screen.width) DIV ScreenWidth;
        scaleBy(screen.width, ScreenWidth);
    end;
    //
    ShortDateFormat := 'dd/mm/yyyy';
    DadosPaciente(False);
    //
    TabSheet2.TabVisible := false;
end;

procedure TfrmCadVendas.FormShow(Sender: TObject);
begin
  inherited;
      WindowState := wsMaximized;
      //
      dmDados.RefreshCDS(dmDados.cdsDados);
      dmDados.cdsDados.EmptyDataSet;
      //
      ControleUsoPrologado(false);
end;

procedure TfrmCadVendas.BtAdicionarClick(Sender: TObject);
begin
     dmDados.RefreshCDS(dmDados.cdsConfig);
     dmDados.RefreshCDS(dmDados.cdsListaEmpresa);
     dmDados.RefreshCDS(dmDados.cdsListaUsoReceituario);
     dmDados.RefreshCDS(dmDados.cdsListaUsoMedicamento);
     //
     With dmDados.cdsVendas do
     begin
          Close;
          Params[0].AsInteger := dmDados.cdsConfigCFG_VENDAS.AsInteger + 1;
          Params[1].AsInteger := dmDados.cdsConfigCFG_LOJA_PADRAO.AsInteger;
          Open;
          //
          Append;
          FieldByName('ID_VENDA').AsInteger       := dmDados.cdsConfigCFG_VENDAS.AsInteger + 1;
          FieldByName('ID_LOJA').AsInteger        := dmDados.cdsConfigCFG_LOJA_PADRAO.AsInteger;
          FieldByName('DATA_VENDA').AsDateTime    := dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime;
          FieldByName('DATA_CADASTRO').AsDateTime := Date();
          FieldByName('USUARIO').AsInteger        := StrtoInt(uFormMainSngpc.M_CDUSUA);
          FieldByName('USO_MEDICAMENTO').AsInteger := 1;
          //
     End;
  inherited;
     ControleUsoPrologado(False);
     edtSigla.Text := 'CRM';
     cmbUFCliente.ItemIndex := 16;
     cmbUF.ItemIndex := 16;
     //
    // CarregarTipoDocumento(cmbTipoDoc);
     cmbUsoMedicamento.SetFocus;
end;

procedure TfrmCadVendas.BtEditarClick(Sender: TObject);
begin
    if not (dsCadastro.DataSet.IsEmpty)
      and (dsCadastro.DataSet.RecordCount > 0) Then
    begin
         dsCadastro.DataSet.Edit;
         
         inherited;
    End;
end;

procedure TfrmCadVendas.BtCancelarClick(Sender: TObject);
begin
     dsCadastro.DataSet.Cancel;
     //
     LimparTela;
  inherited;
     TabSheet2.TabVisible := False;
end;

procedure TfrmCadVendas.CarregarTipoDocumento(aCmb: TComboBox);
begin
     dmDados.RefreshCDS(dmPesquisa.cdsListaTipoDocumento);
     //
     aCmb.Clear;
     With dmPesquisa.cdsListaTipoDocumento do
      begin
           First;
           While not (Eof) do
            begin
                 aCmb.Items.Add(FieldByName('DESCRICAO').AsString);
                 //
                 Next;
            End;
      End;
end;

procedure TfrmCadVendas.dbeNumeroReceitaEnter(Sender: TObject);
begin
  inherited;
     if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
      begin
           dbeNumeroReceita.Enabled := True;
           dsCadastro.DataSet.FieldByName('NR_NOT_MEDICAMENTO').Clear;
           //
           if (dsCadastro.DataSet.FieldByName('TIPO_RECEITUARIO').AsInteger = 1) Then
           begin
               dsCadastro.DataSet.FieldByName('NR_NOT_MEDICAMENTO').AsInteger := dmDados.GetProximoCodigoReceitaBranca();
               dbeNumeroReceita.Enabled := True;
               dbeDataReceita.SetFocus;
           End;
      End;
end;

procedure TfrmCadVendas.dbeDataReceitaExit(Sender: TObject);
Var
   iQuanDias : Double;
begin
  inherited;
      if  (dsCadastro.DataSet.State in [dsInsert, dsEdit]) then
      begin
           if not uFuncoes.Empty(Ufuncoes.RemoveChar(dbeDataReceita.text)) Then
           begin
            try
               dbeDataReceita.Date := StrToDate(dbeDataReceita.Text);
               //
               If (dbeDataReceita.Date > dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime) Then
               begin
                    Application.MessageBox('Data da receita não pode ser superior a '+#13+
                                          'data do movimento!!!','ATENÇÃO',
                     MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                    dbeDataReceita.SetFocus;
                    Exit;
               End;
               //
               iQuanDias := uFuncoes.SubData(dsCadastro.DataSet.FieldbYname('DATA_RECEITA').AsDateTime,
                                  dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime);
               //
               if (dsCadastro.DataSet.FieldByName('TIPO_RECEITUARIO').AsInteger <> 5) Then
               begin
                   if (iQuanDias > 29) Then
                   begin
                        Application.MessageBox('Quantidade de dias da data da receita superior a 30 dias.'+#13+'Data inválida para este tipo de receita','ATENÇÃO',
                           MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                        dbeDataReceita.SetFocus;
                        Exit;
                   End;
               End
               Else
               begin
                   if (iQuanDias > 9) Then
                   begin
                        Application.MessageBox('Quantidade de dias da data da receita superior a 10 dias.'+#13+'Data inválida para este tipo de receita','ATENÇÃO',
                           MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                        dbeDataReceita.SetFocus;
                        Exit;
                   End;
               End;
            except
              on EConvertError do
              begin
                   Application.MessageBox('Data Inválida!','ATENÇÃO',
                     MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                     dbeDataReceita.SetFocus;
              End;
            end;
           End;
      End;
end;

procedure TfrmCadVendas.edtCDCOMPKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
     //
     If (key = #13) and uFuncoes.Empty(edtCDCOMP.Text) Then
     begin
          Key := #0;

     End;
end;

procedure TfrmCadVendas.edtCDCOMPExit(Sender: TObject);
Var
   iCliente : Integer;
begin
    If not uFuncoes.Empty(edtCDCOMP.Text) Then
     begin
        dmDados.RefreshCDS(dmDados.cdsConfig);
        If (dmDados.cdsConfigCFG_FLZEROS.AsString = 'S') Then
            edtCDCOMP.Text :=  uFuncoes.StrZero(edtCDCOMP.Text,14);
        //
        HabilitarDesabilitarControles(True);
        edtORGAO.SetFocus;

     End
     Else
        HabilitarDesabilitarControles(False);
  inherited;

end;

procedure TfrmCadVendas.HabilitarDesabilitarControles(Estado: Boolean);
begin
     edtORGAO.Enabled     := Estado;
     cmbUFCliente.Enabled := Estado;
     //
     If (Estado) Then
        edtORGAO.SetFocus;
end;

procedure TfrmCadVendas.edtCDCOMPChange(Sender: TObject);
begin
  inherited;
      if uFuncoes.Empty(edtCDCOMP.Text) Then
       begin
            lbl_comprador.Text := '';
            edtORGAO.Clear;
            cmbUFCliente.ItemIndex := -1;
       End
       Else
           HabilitarDesabilitarControles(false);
end;

procedure TfrmCadVendas.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
    pnlSup.Enabled     := (dsCadastro.DataSet.Active) and (dsCadastro.DataSet.State in [dsInsert, dsEdit]);
    pnlGrid.Enabled    := (dsCadastro.DataSet.Active) and (dsCadastro.DataSet.State in [dsInsert, dsEdit]);
    pnlProduto.Enabled := (dsCadastro.DataSet.Active) and (dsCadastro.DataSet.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadVendas.edtORGAOExit(Sender: TObject);
Var
   iCliente, iOrgao : Integer;
begin
     If not uFuncoes.Empty(edtORGAO.Text) Then
      begin
           If not (dmDados.VerificarSiglaOrgao(edtORGAO.Text)) Then
            begin
                 Application.MessageBox('Sigla do órgão não cadastrado.','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 edtORGAO.SetFocus;
                 Exit;
            End;
            //
            If not uFuncoes.Empty(edtCDCOMP.Text) Then
            begin
                iCliente := dmDados.GetIdentidadeCliente(edtCDCOMP.Text);
                iOrgao   := dmDados.GetCodigoOrgao(edtORGAO.Text);
                If (iCliente <> 0) and (dmDados.GetValidarIdenOrgaoUF(edtCDCOMP.Text, cmbUFCliente.Text, iOrgao)) Then
                 begin
                     {dmDados.FilterCDS(dmDados.cdsComprador, fsInteger, InttoStr(iCliente));
                     lbl_comprador.Text := dmDados.cdsCompradorNOME_COMPRADOR.AsString;
                     edtORGAO.Text      := dmDados.GetSiglaOrgao(dmDados.cdsCompradorORGAO_EXPEDIDOR.AsInteger);
                     SelecionarUF(cmbUFCliente, dmDados.cdsCompradorUF_EMISSOA_DOC.AsString);}
                 End;
            End;
      End;
 inherited;      
end;

procedure TfrmCadVendas.edtORGAOKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
     if (key = #13) and uFuncoes.Empty(edtORGAO.Text) Then
      begin
           key := #0;
           //
           frmLocOrgaoExpedidor := TfrmLocOrgaoExpedidor.create(application);
           try
               frmLocOrgaoExpedidor.showmodal;
           finally
               If not (frmLocOrgaoExpedidor.cdsConsultar.IsEmpty) Then
               begin
                   edtORGAO.Text := frmLocOrgaoExpedidor.cdsConsultarSIGLA_ORGAO.AsString;
                   Perform(WM_NEXTDLGCTL, 0, 0);
               End;
               //
               frmLocOrgaoExpedidor.Release;
               frmLocOrgaoExpedidor := nil;
           end;
      End;
end;

procedure TfrmCadVendas.cmbUFClienteEnter(Sender: TObject);
begin
  inherited;
      lbl_comprador.Clear;
end;

procedure TfrmCadVendas.cmbUFClienteExit(Sender: TObject);
Var
   iCliente, iOrgao : Integer;
begin
    If not uFuncoes.Empty(edtCDCOMP.Text)
      and not uFuncoes.Empty(edtORGAO.Text) and not uFuncoes.Empty(cmbUFCliente.Text)Then
     begin
        iOrgao   := dmDados.GetCodigoOrgao(edtORGAO.Text);
        If (dmDados.GetValidarIdenOrgaoUF(edtCDCOMP.Text, cmbUFCliente.Text, iOrgao)) Then
        begin
             iCliente := dmDados.GetCodigoIdenOrgaoUF(edtCDCOMP.Text, cmbUFCliente.Text, iOrgao);
             //
             If (iCliente <> 0) Then
             begin
                 dmDados.FilterCDS(dmDados.cdsComprador, fsInteger, InttoStr(iCliente));
                 lbl_comprador.Text := dmDados.cdsCompradorNOME_COMPRADOR.AsString;
                 edtORGAO.Text      := dmDados.GetSiglaOrgao(dmDados.cdsCompradorORGAO_EXPEDIDOR.AsInteger);
                 SelecionarUF(cmbUFCliente, dmDados.cdsCompradorUF_EMISSOA_DOC.AsString);
             End;
        End
        Else
            lbl_comprador.Clear;
     End;
     inherited;
end;

procedure TfrmCadVendas.SelecionarUF(aCmb: TCombobox; aUF: String);
begin
     If (aUF = 'AC') Then
       aCmb.ItemIndex := 0;
     If (aUF = 'AL') Then
       aCmb.ItemIndex := 1;
     If (aUF = 'AM') Then
       aCmb.ItemIndex := 2;
     If (aUF = 'AP') Then
       aCmb.ItemIndex := 3;
     If (aUF = 'BA') Then
       aCmb.ItemIndex := 4;
     If (aUF = 'CE') Then
       aCmb.ItemIndex := 5;
     If (aUF = 'DF') Then
       aCmb.ItemIndex := 6;
     If (aUF = 'ES') Then
       aCmb.ItemIndex := 7;
     If (aUF = 'GO') Then
       aCmb.ItemIndex := 8;
     If (aUF = 'MA') Then
       aCmb.ItemIndex := 9;
     If (aUF = 'MG') Then
       aCmb.ItemIndex := 10;
     If (aUF = 'MS') Then
       aCmb.ItemIndex := 11;
     If (aUF = 'MT') Then
       aCmb.ItemIndex := 12;
     If (aUF = 'PA') Then
       aCmb.ItemIndex := 13;
     If (aUF = 'PB') Then
       aCmb.ItemIndex := 14;
     If (aUF = 'PE') Then
       aCmb.ItemIndex := 15;
     If (aUF = 'PI') Then
       aCmb.ItemIndex := 16;
     If (aUF = 'PR') Then
       aCmb.ItemIndex := 17;
     If (aUF = 'RJ') Then
       aCmb.ItemIndex := 18;
     If (aUF = 'RN') Then
       aCmb.ItemIndex := 19;
     If (aUF = 'RO') Then
       aCmb.ItemIndex := 20;
     If (aUF = 'RR') Then
       aCmb.ItemIndex := 21;
     If (aUF = 'RS') Then
       aCmb.ItemIndex := 22;
     If (aUF = 'SC') Then
       aCmb.ItemIndex := 23;
     If (aUF = 'SE') Then
       aCmb.ItemIndex := 24;
     If (aUF = 'SP') Then
       aCmb.ItemIndex := 25;
     If (aUF = 'TO') Then
       aCmb.ItemIndex := 26;
end;

procedure TfrmCadVendas.edtSiglaExit(Sender: TObject);
begin
  inherited;
   if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) then
   begin
     if not uFuncoes.Empty(edtSigla.Text) and not uFuncoes.Empty(cmbUsoMedicamento.Text) and not uFuncoes.Empty(cmbReceituario.Text) Then
      begin
       if not (ValidarSiglaConselho(dsCadastro.DataSet.FieldByName('USO_MEDICAMENTO').AsInteger,
                              dsCadastro.DataSet.FieldByName('TIPO_RECEITUARIO').AsInteger,  edtSigla.Text) ) Then
          begin
               edtSigla.SetFocus;
               Raise Exception.Create('Sigla do Conselho inválida para este Uso Medicamento/Tipo Receituário.');
          End;
      End;

       If not Empty(edtSigla.Text) Then
       Begin
         If not (dmPesquisa.GetSiglaConselho(edtSigla.Text)) Then
         begin
            edtSigla.SetFocus;
            raise Exception.Create('Sigla de conselho não cadastrado.');
         End
       End;
   End;
end;

procedure TfrmCadVendas.edtIDMEDIExit(Sender: TObject);
begin
  inherited;
   if (dsCadastro.DataSet.State in [dsInsert, dsedit]) Then
   begin  
     //
     If not uFuncoes.Empty(edtIDMEDI.Text) and not uFuncoes.Empty(edtSigla.Text)
         AND not uFuncoes.Empty(cmbUF.Text) Then
        If (dmDados.LOC_CRM_MEDICO(StrtoInt(edtIDMEDI.Text), cmbUF.Text) = True) Then
        begin
              lbl_NMMEDI.Text    := '';
        End;
    End;
end;

procedure TfrmCadVendas.edtIDMEDIKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
     //
     If (key = #13)
        and uFuncoes.Empty(edtIDMEDI.Text) Then
     begin
          Key := #0;
          //spLocMedicoClick(Sender);
     End;
     //
     If (key = #13)
        and not uFuncoes.Empty(edtIDMEDI.Text) Then
      begin
           Key := #0;
           cmbUF.SetFocus;
      End;
end;

procedure TfrmCadVendas.edtIDMEDIChange(Sender: TObject);
begin
  inherited;
      if uFuncoes.Empty(edtIDMEDI.Text) Then
       BEGIN
         lbl_NMMEDI.Text := '';
       End;
end;

procedure TfrmCadVendas.cmbUFEnter(Sender: TObject);
begin
  inherited;
    lbl_NMMEDI.Clear;
end;

procedure TfrmCadVendas.cmbUFExit(Sender: TObject);
Var
   iMedico : Integer;
begin
    If not uFuncoes.Empty(edtSigla.Text)
      and not uFuncoes.Empty(edtIDMEDI.Text) and not uFuncoes.Empty(cmbUF.Text)Then
     begin
        If (dmDados.GetValidarCRMNumeroUF(StrtoInt(edtIDMEDI.Text), edtSigla.Text, cmbUF.Text)) Then
        begin
             iMedico := dmDados.GetCodigoCRMNumeroUF(StrtoInt(edtIDMEDI.Text), edtSigla.Text, cmbUF.Text);
             //
             If (iMedico <> 0) Then
             begin
                 dmDados.FilterCDS(dmDados.cdsMedico, fsInteger, InttoStr(iMedico));
                 lbl_NMMEDI.Text := dmDados.cdsMedicoNOME_MEDICO.AsString;
                 //edtORGAO.Text      := dmDados.GetSiglaOrgao(dmDados.cdsCompradorORGAO_EXPEDIDOR.AsInteger);
                 //SelecionarUF(cmbUF, dmDados.cdsCompradorUF_EMISSOA_DOC.AsString);
             End;
        End
        Else
            lbl_NMMEDI.Clear;
     End;
  inherited;
end;

procedure TfrmCadVendas.spLocalizarClick(Sender: TObject);
begin
    If uFuncoes.Empty(cmbLoja.Text) Then
      begin
           cmbLoja.SetFocus;
           Exit;
      End;
    //  
    edtCDPROD.SetFocus;
    //
    frmLocProdutoEstoque := TfrmLocProdutoEstoque.create(application);
    try
        uFrmLocProdutoEstoque.M_CDLOJA := dmDados.GetCodigoLoja(cmbLoja.Text); 
        frmLocProdutoEstoque.showmodal;
    finally
        If not (frmLocProdutoEstoque.cdsConsultar.IsEmpty) Then
        begin
            edtCDPROD.Text := frmLocProdutoEstoque.cdsConsultarPRO_RG_MS_MEDICAMENTO.AsString;
            Perform(WM_NEXTDLGCTL, 0, 0);
            //edtCDPROD.SetFocus;
        End;
        //
        frmLocProdutoEstoque.Release;
        frmLocProdutoEstoque := nil;
    end;
  inherited;
end;

procedure TfrmCadVendas.edtCDPRODExit(Sender: TObject);
Var
   iLoja : Integer;
   aProduto : String;
begin
     aProduto :=  uFuncoes.StrZero(edtCDPROD.Text,13);
     //
     If not uFuncoes.Empty(edtCDPROD.Text) Then
       If (dmDados.PROCURAR_PRODUTO(aProduto)= False)  Then
       begin
            Application.MessageBox('Código de produto não cadatrado!!!',
               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
            edtCDPROD.Clear;
            edtCDPROD.SetFocus;
            Exit;
       End
       Else
       Begin
            iLoja := dmDados.GetCodigoLoja(cmbLoja.Text);
            If (dmDados.GetProdutoNoEstoque(iLoja, aProduto)) Then
            begin
                  MOSTRA;
                  //
                  if (dsCadastro.DataSet.FieldByName('TIPO_RECEITUARIO').AsInteger = 5) Then
                  begin
                       if not (dmDados.GetVerificaProdutoAntimicrobiano(aProduto)) Then
                       begin
                            edtCDPROD.SetFocus;
                            raise Exception.Create('Produto: '+aProduto+' não é antimicrobiano.');
                       End;
                  End
                  Else
                  begin
                       if not (dmDados.GetVerificaProdutoSujeitoControleEspecial(aProduto)) Then
                       begin
                            edtCDPROD.SetFocus;
                            raise Exception.Create('Produto '+aProduto+' não é Sujeito a Controle Especial.');
                       End;
                  End;
                  //
                  dmDados.CarregarLotesProduto(iLoja, aProduto, cmbLotes);
                  //
                  cmbLotes.SetFocus;
                  Exit;
            End
            Else
            begin
                Application.MessageBox('Produto não cadastro no estoque da loja.',
                   'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                edtCDPROD.Clear;
                edtCDPROD.SetFocus;
                Exit;
            End;
       End;
  inherited;

end;

procedure TfrmCadVendas.MOSTRA;
begin
     edtNMDESC.Text := udmDados.M_NMPROD;
end;

procedure TfrmCadVendas.edtCDPRODKeyPress(Sender: TObject; var Key: Char);
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
          cmbLotes.SetFocus;
     End;
end;

procedure TfrmCadVendas.edtCDPRODEnter(Sender: TObject);
begin
  inherited;
   if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
   begin
        if uFuncoes.Empty(dsCadastro.DataSet.FieldByName('TIPO_RECEITUARIO').AsString) Then
        begin
             Application.MessageBox('Selecione o tipo de Receituário.',
                   'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
             cmbReceituario.SetFocus;
             Exit;
        End;
        //
        ControleUsoPrologado(false);
        cmbUsoPrologado.Visible := False;
        //lblUsoPrologado.Visible := cmbUsoPrologado.Visible;
        if (dsCadastro.DataSet.FieldByName('TIPO_RECEITUARIO').AsInteger = 5) Then
              ControleUsoPrologado(True);
        //
        edtCDPROD.Clear;
   End;
end;

procedure TfrmCadVendas.edtCDPRODChange(Sender: TObject);
begin
  inherited;
     If uFuncoes.Empty(edtCDPROD.Text) Then
      begin
           edtNMDESC.Clear;
           cmbLotes.Clear;
      End;
end;

procedure TfrmCadVendas.cmbLotesKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
     If (key = #13) and not uFuncoes.Empty(edtCDPROD.Text)
         and not uFuncoes.Empty(cmbLotes.Text) Then
      begin
           key := #0;
           Perform(WM_NEXTDLGCTL, 0, 0);
      End;
end;

procedure TfrmCadVendas.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   //If (key = #27) and uFuncoes.Empty(edtQuantidade.Text) Then
   If (key = #27) Then
     begin
          Key := #0;
          edtCDPROD.Clear;
          edtNMDESC.Clear;
          If (edtCDPROD.Enabled) Then
             edtCDPROD.SetFocus;
          //  btCancelar
          Exit;
     End;
     //
     If (Key = #13) and not uFuncoes.Empty(edtQuantidade.Text) Then
     Begin
          Key := #0;
          cmbLotes.SetFocus;
     End;
end;

procedure TfrmCadVendas.edtQuantidadeExit(Sender: TObject);
Var
   iLoja, iQuantProduto : Integer;
   FQuantAtual : Double;
   UsoPrologado : String;
begin
        if (dsCadastro.DataSet.FieldByName('TIPO_RECEITUARIO').AsInteger = 5)
        and (cmbUsoPrologado.ItemIndex = -1) Then
        begin
             Application.MessageBox('Selecione uma opção no Campo Uso Prologado.','ATENÇÃO',
                     MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
             cmbUsoPrologado.SetFocus;
             Exit;
        End;
        //
      If (edtQuantidade.Value = 0) Then
        begin
             edtQuantidade.SetFocus;
             Exit;
        End;
        //
    If not uFuncoes.Empty(edtCDPROD.Text) and not uFuncoes.Empty(edtQuantidade.Text)
      and (edtQuantidade.Value > 0) AND not uFuncoes.Empty(cmbLotes.text)  Then
      begin
           iLoja := dmDados.GetCodigoLoja(cmbLoja.Text);
           //
           //  iLoja: Integer; aProduto,
           //  aLote: String; fQuant: Double
           // FQuantAtual := dmDados.GetEstoqueLoteProduto(iLoja, edtCDPROD.Text, cmbLotes.text);
           If (dmDados.GetVerificarQuantEstoque(
                iLoja, edtCDPROD.Text, cmbLotes.Text, edtQuantidade.Value)) Then  
            begin
                 Application.MessageBox('Quantidade digitada superior a do estoque atual.',
                   'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                 edtQuantidade.Clear;
                 edtQuantidade.SetFocus;
                 Exit;
            End;
            //
            If not (dmDados.cdsDados.IsEmpty) Then
            begin
                 iQuantProduto := GetQuantProdutoVenda(dmDados.cdsDados, edtCDPROD.Text, cmbLotes.Text);
                 //
                 if (iQuantProduto > 0) Then
                 begin
                     //If (iQuantProduto > FQuantAtual) Then
                     If (dmDados.GetVerificarQuantEstoque(
                         iLoja, edtCDPROD.Text, cmbLotes.Text, edtQuantidade.Value + iQuantProduto)) Then
                     begin
                          Application.MessageBox('Quantidade digitada superior a do estoque atual.',
                            'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                          edtQuantidade.Clear;
                          edtQuantidade.SetFocus;
                          Exit;
                     End;
                 End;
            End;
            //
           UsoPrologado := '';
           if (dsCadastro.DataSet.FieldByName('TIPO_RECEITUARIO').AsInteger = 5) Then
             begin
                  if (cmbUsoPrologado.ItemIndex = 0) Then
                      UsoPrologado := 'S'
                  Else
                      UsoPrologado := 'N';
             End;
            //   
           INCLUIR_ITEM(edtCDPROD.Text, edtNMDESC.Text, cmbLotes.Text, UsoPrologado, edtQuantidade.Value);
           LIMPAR_DADOS;
           edtCDPROD.SetFocus;
           Exit;
      End;
    //
     If uFuncoes.Empty(edtCDPROD.Text) Then
      begin
           edtCDPROD.SetFocus;
           Exit;
      End;
      //
    If uFuncoes.Empty(cmbLotes.Text) Then
      begin
           cmbLotes.SetFocus;
           Exit;
      End;
  inherited;

end;

function TfrmCadVendas.GetQuantProdutoVenda(aCDS: TClientDataSet; aProduto,
  aLote: String): Integer;
Var
   iQuant : Integer;
begin
     iQuant := 0;
     With aCDS do
      begin
           DisableControls;
           First;
           While not (Eof) do
            begin
                 if (FieldByName('PRO_CODIGO').AsString = aProduto)
                   and (FieldByName('PRO_NRLOTE').AsString = aLote)  Then
                      iQuant := iQuant + FieldByName('PRO_QTPROD').AsInteger;
                 //
                 Next;
            End;
            First;
            EnableControls;
      End;
      //
      Result := iQuant;
end;

procedure TfrmCadVendas.INCLUIR_ITEM(aProduto, aNomeProduto, aLote, aUsoPrologado: String;
  fQuant: Double);
begin
     If (pnlGrid.Enabled = False) Then
         pnlGrid.Enabled := True;
     //
     With dmDados.cdsDados do
     Begin
          Append;
          FieldByName('PRO_CODIGO').AsString   := aProduto;
          FieldByName('PRO_NMPROD').AsString   := aNomeProduto;
          FieldByName('PRO_QTPROD').AsFloat    := fQuant;
          FieldByName('PRO_NRLOTE').AsString   := aLote;
          If not uFuncoes.Empty (aUsoPrologado) Then
          FieldByName('PRO_USO_PROLOGADO').AsString := aUsoPrologado;
          Post;
     End;
end;

procedure TfrmCadVendas.LIMPAR_DADOS;
begin
    edtQuantidade.Clear;
    cmbLotes.Clear;
    edtNMDESC.Clear;
    cmbUsoPrologado.ItemIndex := -1;
end;

procedure TfrmCadVendas.BtExcluirClick(Sender: TObject);
begin
  inherited;
     If (dmDados.cdsDados.RecordCount > 0) Then
           dmDados.cdsDados.Delete;
end;

procedure TfrmCadVendas.dsProdutosVendasDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
       BtExcluir.Enabled := not (dsProdutosVendas.DataSet.IsEmpty) and (dsProdutosVendas.DataSet.RecordCount > 0);
end;

procedure TfrmCadVendas.BtGravarClick(Sender: TObject);
Var
    M_NRVEND, M_CDLOJA : Integer;
    M_TipoReceituario, M_UsoMedicamento, M_Prescritor, M_Cliente : Integer;
    M_NrNotificacao : String;
    M_DTMOVI : TDate;
    W_CDCLIE, W_CDMEDI : Integer;
    W_TPDOCU, W_CDORGA : Integer;
    W_RGPROF, W_CONPRO : Integer;
    aSexo, aDataNasc : String;
    aAnos, aMeses, aDias, idMaxVenda : integer;
    MyTransc : TTransactionDesc;
begin
     aSexo := '';
     aDataNasc := '';
     //
     If uFuncoes.Empty(cmbLoja.Text) Then
     begin
          Application.MessageBox(PChar('Selecione a Loja da Venda.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbLoja.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(cmbReceituario.Text) Then
     begin
          Application.MessageBox(PChar('Selecione o Tipo de Receituário.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbReceituario.SetFocus;
          Exit;
     End;
     //
     if (dsCadastro.DataSet.FieldByName('TIPO_RECEITUARIO').AsInteger <> 5) Then
      begin
          If uFuncoes.Empty(dbeNumeroReceita.Text) Then
          begin
              Application.MessageBox(PChar('Digite o Número da notificação.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              dbeNumeroReceita.SetFocus;
             Exit;
         End;
     End;
     //
     If uFuncoes.Empty(cmbUsoMedicamento.Text) Then
     begin
          Application.MessageBox(PChar('Selecione o uso do medicamento.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbUsoMedicamento.SetFocus;
          Exit;
     End;
     //
     If (uFuncoes.Empty(uFuncoes.RemoveChar(dbeDataReceita.Text))) Then
     begin
          Application.MessageBox(PChar('Digite a data da receita.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeDataReceita.SetFocus;
          Exit;
     End;
     // Dados do cliente
     If uFuncoes.Empty(cmbTipoDoc.Text) Then
     begin
          Application.MessageBox(PChar('Selecione o tipo de documento do cliente.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbTipoDoc.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtCDCOMP.Text) Then
     begin
          Application.MessageBox(PChar('Digite o número do documento do cliente.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtCDCOMP.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtORGAO.Text) Then
     begin
          Application.MessageBox(PChar('Digite a Sigla do órgão expedidor do cliente.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtORGAO.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(cmbUFCliente.Text) Then
     begin
          Application.MessageBox(PChar('Selecione a UF do cliente.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbUFCliente.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(lbl_comprador.Text) Then
     begin
          Application.MessageBox(PChar('Digite o nome do Cliente.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          lbl_comprador.SetFocus;
          Exit;
     End;
     // Dados do Médico
     If uFuncoes.Empty(edtSigla.Text) Then
     begin
          Application.MessageBox(PChar('Digite a sigla do conselho do médico.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtSigla.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtIDMEDI.Text) Then
     begin
          Application.MessageBox(PChar('Digite o número registro do médico.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtIDMEDI.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(cmbUF.Text) Then
     begin
          Application.MessageBox(PChar('Selecione a UF do médico.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbUF.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(lbl_NMMEDI.Text) Then
     begin
          Application.MessageBox(PChar('Digite o nome do médico.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          lbl_NMMEDI.SetFocus;
          Exit;
     End;
     //
     if (dsCadastro.DataSet.FieldByName('TIPO_RECEITUARIO').AsInteger <> 5) and (edtCDCOMP.Text = '1') then
     begin
          Application.MessageBox(PChar('Dados do comprador está inválido para este Tipo de Receituário.'),
                      'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
          edtCDCOMP.SetFocus;
          Exit;
     End;
     //  Itens
     If (dmDados.cdsDados.IsEmpty) Then
      begin
          Application.MessageBox('Não há lista de produtos para venda.',
                                 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          grdProdutos.SetFocus;
          Exit;
      End;
      //
      if (dsCadastro.DataSet.FieldByName('TIPO_RECEITUARIO').AsInteger = 5)
          and  (edtSigla.Text <> 'CRMV') Then
      begin
         if not VerificarUsoPrologado(dmDados.cdsDados) Then
         begin
              Application.MessageBox('Campo inválido.',
                                 'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
              Exit;
         End;
         //
         If (uFuncoes.Empty(edtNomePaciente.Text)) Then
         begin
              Application.MessageBox(PChar('Digite o nome do Paciente.'),
                      'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
              edtNomePaciente.SetFocus;
              Exit;
          End;
         //
         If (uFuncoes.Empty(uFuncoes.RemoveChar(dbeDtNasc.Text))) Then
         begin
              Application.MessageBox(PChar('Digite a data de nascimento do Paciente.'),
                      'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
              dbeDtNasc.SetFocus;
              Exit;
          End;
          //
          If (rgSexo.ItemIndex = -1) Then
           begin
               Application.MessageBox(PChar('Selecione o sexo do Paciente.'),
                       'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
               rgSexo.SetFocus;
               Exit;
           End;
           //
           Case rgSexo.ItemIndex of
             0 : aSexo := 'M';
             1 : aSexo := 'F';
           End;
           //
           aDataNasc := dbeDtNasc.Text;
           //
           dsCadastro.DataSet.FieldByName('PAC_NOME').AsString := edtNomePaciente.Text;
           dsCadastro.DataSet.FieldByName('PAC_SEXO').AsString := aSexo;
           dsCadastro.DataSet.FieldByName('PAC_DATA_NASC').AsDateTime := dbeDtNasc.Date;
           dsCadastro.DataSet.FieldByName('PAC_IDADE').AsString   := Inttostr(uFuncoes.IdadeAtual(dbeDtNasc.Date));
           if (dsCadastro.DataSet.FieldByName('PAC_IDADE').AsInteger >= 1) Then
              dsCadastro.DataSet.FieldByName('PAC_UND_IDADE').AsString := '1'
           Else
           begin
              EntreDatas(dsCadastro.DataSet.FieldByName('DATA_VENDA').AsDateTime, dbeDtNasc.Date, aAnos, aMeses, aDias);
              dsCadastro.DataSet.FieldByName('PAC_IDADE').AsInteger    := aMeses;
              dsCadastro.DataSet.FieldByName('PAC_UND_IDADE').AsString := '2';
           End;
      End;
     //
     W_CDORGA := dmDados.GetCodigoOrgao(edtORGAO.Text);
     //
     If (dmDados.GetValidarIdenOrgaoUF(edtCDCOMP.Text, cmbUFCliente.Text, W_CDORGA)) Then
         W_CDCLIE := dmDados.GetIdentidadeCliente(edtCDCOMP.Text)
     Else
         W_CDCLIE := 0;
     //
     If (dmDados.GetValidarCRMNumeroUF(StrtoInt(edtIDMEDI.Text), edtSigla.Text, cmbUF.Text)) Then
         W_CDMEDI := dmDados.GetCodigoCRMNumeroUF(StrtoInt(edtIDMEDI.Text), edtSigla.Text, cmbUF.Text)
     Else
         W_CDMEDI := 0;
     //dmDados.GetCodigoMedico( StrtoInt(edtIDMEDI.Text), cmbUF.Text, edtSigla.Text);
     // Grava Cliente
     // function TdmDados.IncluirCliente(iCodigo, iTipoDoc, iOrgao: Integer; aNome,
     // aNumeroDoc, aUF: String): Integer;
     W_TPDOCU := dmDados.GetCodigoTipoDoc(cmbTipoDoc.Text);
     //

     M_Cliente  := dmDados.IncluirCliente(W_CDCLIE, W_TPDOCU, W_CDORGA,
                   lbl_comprador.Text, edtCDCOMP.Text, cmbUFCliente.Text, aDataNasc, aSexo);
     If (M_Cliente = 0) Then
        raise Exception.Create('Erro ao tentar incluir cliente.');
     // Grava Médico
     // function TdmDados.IncluirMedico(iCodigo, iRGPROFISSIONAL,
     // iCONSELHO_PROFISSIONAL: Integer; aNome, aUF, aSigla: String): Integer;
     W_RGPROF := StrtoInt(edtIDMEDI.Text);
     W_CONPRO := dmDados.GetCodigoConselhoProfissional(edtSigla.Text);
     //
     M_Prescritor := dmDados.IncluirMedico(W_CDMEDI, W_RGPROF, W_CONPRO,
                    lbl_NMMEDI.Text, cmbUF.Text, edtSigla.Text);
     //
     If (M_Prescritor = 0) Then
        raise Exception.Create('Erro ao tentar incluir médico.');
     //
     M_CDLOJA := dsCadastro.DataSet.fieldByName('ID_LOJA').AsInteger;
     {M_TipoReceituario := uFuncoes.GetTipoReceituario(cmbReceituario.Text); // tipo de receituario
     M_UsoMedicamento  := uFuncoes.GetUsoMedico(cmbUsoMedicamento.Text);  }  // uso medico
     M_NrNotificacao   := dsCadastro.DataSet.fieldByName('NR_NOT_MEDICAMENTO').AsString;
     M_DTMOVI := dsCadastro.DataSet.fieldByName('DATA_VENDA').AsDateTime;
     //
     try
        idMaxVenda := dmDados.GetMaxIdVenda();
        //
        dmDados.Start;
        try
         Screen.Cursor := crHourGlass;
         //
         {MyTransc.IsolationLevel := xilREADCOMMITTED;
         MyTransc.TransactionID  := 1;
         dmDados.sqlSNGPN.StartTransaction(MyTransc); }
         //
         if (dsCadastro.DataSet.State = dsInsert) Then
         begin
              dmDados.RefreshCDS(dmDados.cdsConfig);
              //
              dmDados.cdsConfig.Edit;
              if (dmDados.cdsConfigCFG_VENDAS.AsInteger  < idMaxVenda) Then
                  dmDados.cdsConfigCFG_VENDAS.AsInteger := idMaxVenda + 1
              Else
                  dmDados.cdsConfigCFG_VENDAS.AsInteger := dmDados.cdsConfigCFG_VENDAS.AsInteger + 1;
              if (dsCadastro.DataSet.FieldByName('TIPO_RECEITUARIO').AsInteger = 1) Then
               begin
                    dmDados.cdsConfigCFG_CONTROLE_RECEITA_BRANCA.AsInteger := dmDados.cdsConfigCFG_CONTROLE_RECEITA_BRANCA.AsInteger + 1;
                    dsCadastro.DataSet.FieldByName('NR_NOT_MEDICAMENTO').AsInteger := dmDados.cdsConfigCFG_CONTROLE_RECEITA_BRANCA.AsInteger;
               End;
              // dmDados.cdsConfig.Post;
              //
              dsCadastro.DataSet.FieldByName('ID_VENDA').AsInteger := dmDados.cdsConfigCFG_VENDAS.AsInteger;
              dsCadastro.DataSet.FieldByName('HORA_VENDA').AsString := TimetoStr(Time);
         End;
         //
         dsCadastro.DataSet.FieldByName('ID_PRESCRITOR').AsInteger := M_Prescritor;
         dsCadastro.DataSet.FieldByName('ID_COMPRADOR').AsInteger  := M_Cliente;
         //
         // dmDados.cdsVendas.ApplyUpdates(0);
         //
          M_NRVEND := dsCadastro.DataSet.FieldByName('ID_VENDA').AsInteger;
          //
          If  dmDados.AddVenda(M_NRVEND, dmDados.cdsVendas) then
            begin
                 if (dmDados.AdicionarVendaNovo(M_NRVEND, M_CDLOJA, dmDados.cdsDados)) Then
                    begin
                         dmDados.cdsVendas.Post;
                         dmDados.cdsConfig.ApplyUpdates(0);
                         //
                         dmDados.Comit(dmDados.Transc);
                         //
                         Application.MessageBox(PChar(MSG_OK+#13+'Número da Venda: '+uFuncoes.StrZero(InttoStr(M_NRVEND),7)), 'Concluído', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                         //
                         LimparTela;
                         //
                         dmDados.cdsVendas.Close;
                         inherited;
                           TabSheet2.TabVisible := False;
                   End;
            End;
        Except
              on e:exception do
              begin
                  ShowMessage(e.message);
                  // dmDados.sqlSNGPN.Rollback(MyTransc);
                   dmDados.Rollback;
              End;
        End;
     finally
        //
        Screen.Cursor := crDefault;   
        //StatusBar1.Panels[1].Text := '';
     end;
     Application.ProcessMessages;
end;

procedure TfrmCadVendas.LimparTela;
begin
     If (dmDados.cdsDados.Active) Then
        dmDados.cdsDados.EmptyDataSet;
     dmDados.cdsDados.Close;
     LIMPAR;
     NOVO;
    // pnlDados.Visible := False;
     //
     cmbTipoDoc.ItemIndex := -1;
     cmbUF.ItemIndex := -1;
end;

procedure TfrmCadVendas.LIMPAR;
begin
    edtQuantidade.Clear;
    cmbLotes.Clear;
    edtNMDESC.Clear;
    //
    edtIDMEDI.Clear;
    edtCDCOMP.Clear;
    //
    edtSigla.Clear;
end;

procedure TfrmCadVendas.NOVO;
begin
     If not (dmDados.cdsDados.Active) Then
        dmDados.cdsDados.Open;
     //
     dmDados.cdsDados.EmptyDataSet;
     //
     edtCDCOMP.Clear;
     lbl_NMMEDI.Text    := '';
     lbl_comprador.Text := '';
     cmbLotes.Clear;
     //
     edtNomePaciente.Clear;
     dbeDtNasc.Clear;
     rgSexo.ItemIndex := -1;
     //
     spLocCliente.Enabled := True;
     spLocMedico.Enabled  := True;
     //
     cmbTipoDoc.ItemIndex := 1;
     //edtNRCUPO.Text := InttoStr(uFiscal.FISCAL('NumeroCupom', M_IMPRES));
     cmbUF.ItemIndex        := -1;
     cmbUFCliente.ItemIndex := -1;
     //
     HabilitarDesabilitarControles(False);
end;

procedure TfrmCadVendas.dbeNumeroReceitaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TfrmCadVendas.cmbReceituarioExit(Sender: TObject);
begin
  inherited;
     if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
      begin
          ControleUsoPrologado(false);
          DadosPaciente(False);
          if (dsCadastro.DataSet.FieldByName('TIPO_RECEITUARIO').AsInteger = 5)
             and  (edtSigla.Text <> 'CRMV') Then
           Begin
                ControleUsoPrologado(true);
                DadosPaciente(true);
           End;
          //
          LimparGridDados(dmDados.cdsDados);
      End;
end;

procedure TfrmCadVendas.dbeDtNascExit(Sender: TObject);
Var
  IdadePaciente : Integer;
begin
  inherited;
   if  (dsCadastro.DataSet.State in [dsInsert, dsEdit]) then
      begin
           if not uFuncoes.Empty(Ufuncoes.RemoveChar(dbeDtNasc.Text)) Then
           begin
            try
               dbeDtNasc.Date := StrToDate(dbeDtNasc.Text);
               //
               If (dbeDtNasc.Date > dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime) Then
               begin
                   Application.MessageBox('Data de nascimento não pode ser superior a '+#13+
                                          'data do movimento!!!','ATENÇÃO',
                     MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                    dbeDtNasc.SetFocus;
                   Exit;
               End;
               // se data de nascimento superior a 150
               IdadePaciente := uFuncoes.IdadeAtual(dbeDtNasc.Date);
               if (IdadePaciente  > 130) then
               begin
                    dbeDtNasc.SetFocus;
                    Raise Exception.Create('Data de nascimento inválido!!! '+#13+'Verifique a data de Nascimento do Paciente');
               End;
            except
              on EConvertError do
              begin
                   Application.MessageBox('Data Inválida!','ATENÇÃO',
                     MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                     dbeDtNasc.SetFocus;
              End;
            end;
           End;
      End;
end;

procedure TfrmCadVendas.cmbLotesEnter(Sender: TObject);
begin
  inherited;
      If (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
      begin
        if uFuncoes.Empty(edtCDPROD.Text) then
        begin
             edtCDPROD.SetFocus;
             Exit;
        End;        
      End;
end;

function TfrmCadVendas.VerificarUsoPrologado(
  aCsdItens: TClientDataSet): Boolean;
begin
     Result := False;
     With aCsdItens do
     begin
          First;
          While not (Eof) do
          begin
                if uFuncoes.Empty(FieldByName('PRO_USO_PROLOGADO').AsString) Then
                  begin
                       Raise Exception.Create('Campo Uso Prologado do produto: '+FieldByName('PRO_CODIGO').AsString + ' está vazio!!!');
                  End;
                //
                Next;
          End;
          Result := True;
     End;
end;

procedure TfrmCadVendas.cmbLotesExit(Sender: TObject);
begin
  inherited;
   If (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
     if (dsCadastro.DataSet.FieldByName('TIPO_RECEITUARIO').AsInteger = 5) Then
            cmbUsoPrologado.SetFocus
      Else
      begin
           if not uFuncoes.Empty(cmbLotes.Text) Then
                edtQuantidade.SetFocus
           Else
                edtCDPROD.SetFocus;
      End;
end;

procedure TfrmCadVendas.cmbUsoPrologadoExit(Sender: TObject);
begin
  inherited;
      If (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
        if not uFuncoes.Empty(cmbUsoPrologado.Text) Then
            edtQuantidade.SetFocus
        Else
            cmbUsoPrologado.SetFocus;
end;

procedure TfrmCadVendas.cmbUsoPrologadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
       if (key = #13) and not uFuncoes.Empty(cmbUsoPrologado.Text) Then
       begin
             key := #0;
             edtQuantidade.SetFocus;
       End;
end;

procedure TfrmCadVendas.ControleUsoPrologado(bStatus: Boolean);
begin
      grdProdutos.Columns[6].Visible := bStatus;
      lblUsoPrologado.Visible        := bStatus;
      cmbUsoPrologado.Visible        := bStatus;
      //
      if (edtSigla.Text = 'CRMV') then
      begin
            lblDataNascimento.Visible     := False;
           dbeDtNasc.Visible              := False;
           rgSexo.Visible                 := False;
           //
           lblNomePaciente.Visible        := False;
           edtNomePaciente.Visible        := False;
      End
      Else
      begin
           lblDataNascimento.Visible      := bStatus;
           dbeDtNasc.Visible              := bStatus;
           rgSexo.Visible                 := bStatus;
           //
           lblNomePaciente.Visible        := bStatus;
           edtNomePaciente.Visible        := bStatus;
      End; 
end;

procedure TfrmCadVendas.LimparGridDados(aCDS: TClientDataSet);
begin
    if (aCDS.Active) Then
       aCDS.EmptyDataSet;
end;

procedure TfrmCadVendas.DadosPaciente(bStatus: Boolean);
begin
      if (bStatus) Then
      begin
           pnlSup.Height    := 365;
           GroupBox2.Height := 219;
           GroupBox3.Height := GroupBox2.Height;
      End
      Else
      begin
           pnlSup.Height    := 281;
           GroupBox2.Height := 143;
           GroupBox3.Height := GroupBox2.Height;
      End;
end;

procedure TfrmCadVendas.EntreDatas(DataFinal, DataInicial: TDate; var Anos,
  Meses, Dias: Integer);
// Retorna a diferença em Dias, Meses e Anos entre 2 datas
//
  function Calcula(Periodo: Integer): Integer ;
  var
    intCont: Integer ;
  begin
    intCont := 0 ;
    repeat
      Inc(intCont) ;
      DataFinal := IncMonth(DataFinal,Periodo * -1) ;
    until DataFinal < DataInicial ;
    DataFinal := IncMonth(DataFinal,Periodo) ;
    Inc(intCont,-1) ;
    Result := intCont ;
  end;
begin

  if DataFinal <= DataInicial then
  begin
    Anos := 0 ;
    Meses := 0 ;
    Dias := 0 ;
    exit ;
  end;

  Anos := Calcula(12) ;
  Meses := Calcula(1) ;
  Dias := Round(DataFinal - DataInicial);

end;

function TfrmCadVendas.ValidarSiglaConselho(iUsoMedicamento,
  iTipoReceituario: Integer; aSigla: String): Boolean;
begin
     Result := False;
     //
   if not uFuncoes.Empty(cmbUsoMedicamento.Text) and not uFuncoes.Empty(cmbReceituario.Text) Then
   begin
     if (iUsoMedicamento = 1) Then
     begin
          if (iTipoReceituario < 5) Then
          begin
              if (aSigla = 'CRO') or (aSigla = 'CRM') or (aSigla = 'RMS') Then
              begin
                   Result := true;
                   Exit;
              End;
          End
          Else
          begin
                if (aSigla <> 'CRMV') Then
                begin
                      Result := true;
                      Exit;
                End;
          End;
     End
     Else
     begin
          if (iTipoReceituario < 5) Then
          begin
              if (aSigla = 'CRMV') Then
              begin
                   Result := true;
                   Exit;
              End;
          End
          Else
          begin
                if (aSigla = 'CRMV') Then
                begin
                      Result := true;
                      Exit;
                End;
          End;
     End;
   End;
end;

procedure TfrmCadVendas.edtSiglaEnter(Sender: TObject);
begin
  inherited;
 if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) then
     begin
          if uFuncoes.Empty(cmbUsoMedicamento.Text) Then
          begin
               cmbUsoMedicamento.SetFocus;
               Exit;
          End;
          //
          if uFuncoes.Empty(cmbReceituario.Text) Then
          begin
               cmbReceituario.SetFocus;
               Exit;
          End;
     End;
end;

procedure TfrmCadVendas.cmbUsoMedicamentoExit(Sender: TObject);
begin
  inherited;
     if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) then
     begin
          if not uFuncoes.Empty(cmbUsoMedicamento.Text) Then
          begin
               if (dsCadastro.DataSet.FieldByName('USO_MEDICAMENTO').AsInteger = 2) Then
                   edtSigla.Text := 'CRMV'
               Else
                   edtSigla.Text := 'CRM';
          End;
     End;
end;

procedure TfrmCadVendas.lbl_compradorEnter(Sender: TObject);
begin
  inherited;
   if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) then
    begin
      If uFuncoes.Empty(edtCDCOMP.Text) Then
      begin
          edtCDCOMP.SetFocus;
          Exit;
      End;
      If uFuncoes.Empty(edtORGAO.Text) Then
      begin
          edtORGAO.SetFocus;
          Exit;
      End;

      If uFuncoes.Empty(cmbUFCliente.Text) Then
      begin
          cmbUFCliente.SetFocus;
          Exit;
      End;
   End;
end;

procedure TfrmCadVendas.lbl_NMMEDIEnter(Sender: TObject);
begin
  inherited;
   if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) then
      If uFuncoes.Empty(cmbUF.Text) Then
      begin
          cmbUF.SetFocus;
          Exit;
      End;
end;

procedure TfrmCadVendas.dbeDataReceitaEnter(Sender: TObject);
begin
  inherited;
  if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
   begin
        if uFuncoes.Empty(dsCadastro.DataSet.FieldByName('TIPO_RECEITUARIO').AsString) Then
        begin
             Application.MessageBox('Selecione o tipo de Receituário.',
                   'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
             cmbReceituario.SetFocus;
             Exit;
        End;
   End;     
end;

procedure TfrmCadVendas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
     if (BtGravar.Enabled) Then
     begin
         CanClose := False;

         If Application.MessageBox('Deseja gravar venda?',
            'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then
               CanClose := True;
     End;
end;

procedure TfrmCadVendas.cmbUsoPrologadoEnter(Sender: TObject);
begin
  inherited;
       If (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
           if uFuncoes.Empty(cmbLotes.Text) Then
             begin
                  cmbLotes.SetFocus;
                  Exit;
             End;
end;

end.
