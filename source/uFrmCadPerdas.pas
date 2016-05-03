unit uFrmCadPerdas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, DBClient, Provider, DB, SqlExpr, jpeg,
  ExtCtrls, Buttons, Grids, DBGrids, StdCtrls, ComCtrls, DBCtrls, Mask,
  ToolEdit, RXDBCtrl, CurrEdit;

type
  TfrmCadPerdas = class(TfrmCadastro)
    Panel5: TPanel;
    pnlGrid: TPanel;
    pnlProduto: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    dbeDataPerda: TDBDateEdit;
    cmbMotivoPerda: TDBLookupComboBox;
    Label4: TLabel;
    cmbLoja: TDBLookupComboBox;
    Label2: TLabel;
    grdConsultar2: TDBGrid;
    dsItens: TDataSource;
    Label16: TLabel;
    edtCDPROD: TEdit;
    spLocalizar: TSpeedButton;
    edtNMDESC: TEdit;
    Label17: TLabel;
    edtNRLOTE: TEdit;
    Label19: TLabel;
    edtQuantidade: TCurrencyEdit;
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure dbeDataPerdaExit(Sender: TObject);
    procedure spLocalizarClick(Sender: TObject);
    procedure edtCDPRODEnter(Sender: TObject);
    procedure edtCDPRODExit(Sender: TObject);
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure edtNRLOTEExit(Sender: TObject);
    procedure edtNRLOTEKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure dsItensDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure LimparCampos;
    Procedure Mostra;
  public
    { Public declarations }
  end;

var
  frmCadPerdas: TfrmCadPerdas;

implementation

uses udmDados, uFormMainSngpc, uFuncoes, ufrmLocProduto;

{$R *.dfm}

procedure TfrmCadPerdas.BtAdicionarClick(Sender: TObject);
begin
     dmDados.RefreshCDS(dmDados.cdsConfig);
     dmDados.RefreshCDS(dmDados.cdsDados);
     dmDados.RefreshCDS(dmDados.cdsListaEmpresa);
     dmDados.cdsDados.EmptyDataSet;
     dmDados.FilterCDS(dmDados.cdsPerda, fsInteger, '-1');
     with dmDados.cdsPerda do
     begin
          Append;
          FieldByName('ID_PERDA').AsInteger       := dmDados.cdsConfigCFG_PERDAS.AsInteger + 1;
          FieldByName('ID_LOJA').AsInteger        := dmDados.cdsConfigCFG_LOJA_PADRAO.AsInteger;
          FieldByName('DATA_CADASTRO').AsDateTime := dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime;
          FieldByName('DATA_PERDA').AsDateTime    := dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime;
          FieldByName('USUARIO').AsInteger        := StrtoInt(uFormMainSngpc.M_CDUSUA);
     End;
     //
     dbeDataPerda.SetFocus;
     //
  inherited;
end;

procedure TfrmCadPerdas.BtExcluirClick(Sender: TObject);
begin
  inherited;
    if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
    begin
         if not (dmDados.cdsDados.IsEmpty) and (dmDados.cdsDados.RecordCount > 0) Then
             dmDados.cdsDados.Delete;
    End;
end;

procedure TfrmCadPerdas.BtCancelarClick(Sender: TObject);
begin
     dsCadastro.DataSet.Cancel;
  inherited;
    TabSheet2.TabVisible := False;
     if (dmDados.cdsDados.Active) Then
       dmDados.cdsDados.EmptyDataSet;
    LimparCampos;
end;

procedure TfrmCadPerdas.LimparCampos;
begin
   if (pnlProduto.Enabled) then
   begin
     edtCDPROD.Clear;
     edtNMDESC.Clear;
     edtNRLOTE.Clear;
     edtQuantidade.Clear;
   End;
   //
  
end;

procedure TfrmCadPerdas.BtGravarClick(Sender: TObject);
Var
     idMaxPerda : Integer;
begin
      If uFuncoes.Empty(cmbLoja.Text) Then
         begin
              Application.MessageBox(PChar('Selecione a loja.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              cmbLoja.SetFocus;
              Exit;
         End;
         //
         If uFuncoes.Empty(uFuncoes.RemoveChar(dbeDataPerda.Text)) Then
         begin
              Application.MessageBox(PChar('Digite a data da perda.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              dbeDataPerda.SetFocus;
              Exit;
         End;
         //
         If uFuncoes.Empty(cmbMotivoPerda.Text) Then
         begin
            Application.MessageBox(PChar('Selecione o tipo da perda.'),
                        'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            cmbMotivoPerda.SetFocus;
            Exit;
         End;
         //
         If (dsItens.DataSet.IsEmpty) Then
         begin
              Application.MessageBox('Não há produto(s) lançado(s).',
                                 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              grdConsultar2.SetFocus;
              Exit;
         End;
         //
         If Application.MessageBox('Confirma perda de produto?',
              'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1+MB_APPLMODAL) = idNo then
                Exit;
         //
         idMaxPerda := dmDados.GetMaxIdPerda();
         dmDados.RefreshCDS(dmDados.cdsConfig);
         //   
         dmDados.Start;
         try
            If (dsCadastro.DataSet.State = dsInsert) Then
            begin

                dmDados.cdsConfig.Edit;
                if (dmDados.cdsConfigCFG_PERDAS.AsInteger < idMaxPerda) Then
                    dmDados.cdsConfigCFG_PERDAS.AsInteger := idMaxPerda + 1
                Else
                    dmDados.cdsConfigCFG_PERDAS.AsInteger := dmDados.cdsConfigCFG_PERDAS.AsInteger + 1;
                dmDados.cdsConfig.ApplyUpdates(0);
                //
                dsCadastro.DataSet.FieldByName('ID_PERDA').AsInteger := dmDados.cdsConfigCFG_PERDAS.AsInteger;
            End;
            //
            dmDados.cdsPerda.ApplyUpdates(0);
            //
            if (dmDados.AdicionarProdutoPerdaNovo(dsCadastro.DataSet.FieldByName('ID_PERDA').AsInteger,
                                              dsCadastro.DataSet.FieldByName('ID_LOJA').AsInteger,
                                              dmDados.cdsDados)) Then
              begin
                   //
                   dmDados.Comit(dmDados.Transc);
                   //
                   Application.MessageBox(PChar(MSG_OK), 'Concluído', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   //
                   LimparCampos;
                   dsCadastro.DataSet.Close;
                   dmDados.cdsDados.Close;
              End;
        Except
            on e: exception do
             begin
                  Application.MessageBox(PChar('Erro ao tentar realizar perda de produto! Erro:'+#13
                      + E.Message), 'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
                  //
                  dmDados.Rollback;
             End;
        End;
  inherited;
        TabSheet2.TabVisible := False;
end;

procedure TfrmCadPerdas.dbeDataPerdaExit(Sender: TObject);
begin
 if  (dsCadastro.DataSet.State in [dsInsert, dsEdit]) then
      begin
           if not uFuncoes.Empty(Ufuncoes.RemoveChar(dsCadastro.DataSet.FieldByName('DATA_PERDA').AsString)) Then
           begin
            try
               dbeDataPerda.Date := StrToDate(dbeDataPerda.Text);
               //
               If (dbeDataPerda.Date > dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime) Then
               begin
                   Application.MessageBox('Data da perda não pode ser superior a '+#13+
                                          'data do movimento!!!','ATENÇÃO',
                     MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                    dbeDataPerda.SetFocus;
                   Exit;
               End;
               //
               If (dbeDataPerda.Date < dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime) Then
               begin
                   Application.MessageBox('Data da perda não pode ser inferior a '+#13+
                                          'data do movimento!!!','ATENÇÃO',
                     MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                    dbeDataPerda.SetFocus;
                   Exit;
               End;

            except
              on EConvertError do
              begin
                   Application.MessageBox('Data Inválida!','ATENÇÃO',
                     MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                     dbeDataPerda.SetFocus;
              End;
            end;
           End;
      End;

  inherited;

end;

procedure TfrmCadPerdas.spLocalizarClick(Sender: TObject);
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

procedure TfrmCadPerdas.edtCDPRODEnter(Sender: TObject);
begin
  inherited;
    if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
    begin
       if uFuncoes.Empty(cmbLoja.Text) Then
       begin
            cmbLoja.SetFocus;
            Exit;
       End;
       //
       if uFuncoes.Empty(cmbMotivoPerda.Text) Then
       begin
            cmbMotivoPerda.SetFocus;
            Exit;
       End;

    End;
end;

procedure TfrmCadPerdas.edtCDPRODExit(Sender: TObject);
Var
   iLoja : Integer;
   aProduto : String;
begin
     aProduto :=  uFuncoes.StrZero(edtCDPROD.Text,13);
     //
     If not uFuncoes.Empty(edtCDPROD.Text) Then
       If not (dmDados.PROCURAR_PRODUTO(uFuncoes.StrZero(edtCDPROD.Text,13)))  Then
       begin
            Application.MessageBox('Código de produto não cadatrado!!!',
               'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
            edtCDPROD.Clear;
            edtCDPROD.SetFocus;
            Exit;
       End
       Else
       Begin
            if not (dmDados.GetProdutoNoEstoque(dsCadastro.DataSet.FieldByname('ID_LOJA').AsInteger,
                   edtCDPROD.Text)) Then
            begin
                 Application.MessageBox('Não há produto no estoque!!!',
                   'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                 edtCDPROD.Clear;
                 edtCDPROD.SetFocus;
                 Exit;
            End;
            //
            MOSTRA;
            edtNRLOTE.SetFocus;
       End;
  inherited;
end;

procedure TfrmCadPerdas.Mostra;
begin
     edtNMDESC.Text := dmDados.GetNomeProduto(StrZero(edtCDPROD.Text,13));
end;

procedure TfrmCadPerdas.edtCDPRODKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmCadPerdas.edtNRLOTEExit(Sender: TObject);
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
          W_CDLOJA := dmDados.GetCodigoLoja(cmbLoja.Text);
          //
          aProduto := edtCDPROD.Text;
          //
          If not (dmDados.GetProdutoLoteEstoque(W_CDLOJA, aProduto, edtNRLOTE.Text)) Then
           begin
                  Application.MessageBox('Lote não existe no estoque.',
                     'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
                  edtNRLOTE.Clear;
                  edtNRLOTE.SetFocus;
                  Exit;
           End;
           // Localizar na lista
           if (dsItens.DataSet.Locate('PRO_CODIGO;PRO_NRLOTE', VarArrayOf([edtCDPROD.Text, edtNRLOTE.Text]),[])) Then
            begin
                 Application.MessageBox('Produto/Lote já lançado nessa lista de perdas.',
                     'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
                 edtNRLOTE.SetFocus;
                 Exit;
            End;
     End;
  inherited;
end;

procedure TfrmCadPerdas.edtNRLOTEKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   if (key = #13) and not uFuncoes.Empty(edtNRLOTE.Text) Then
      begin
           key := #0;
           edtQuantidade.SetFocus;
      End;
end;

procedure TfrmCadPerdas.edtQuantidadeEnter(Sender: TObject);
begin
  inherited;
    if uFuncoes.Empty(edtCDPROD.Text) then
    begin
         edtCDPROD.SetFocus;
         Exit;
    End;
    //
    if uFuncoes.Empty(edtNRLOTE.Text) then
    begin
         edtNRLOTE.SetFocus;
         Exit;
    End;
    //
    if not uFuncoes.Empty(edtCDPROD.Text) and uFuncoes.Empty(edtNRLOTE.Text) Then
      begin
           edtNRLOTE.SetFocus;
           exit;
      End;
end;

procedure TfrmCadPerdas.edtQuantidadeExit(Sender: TObject);
Var
    iLoja : Integer;
    aProduto, aLote : String;
    fQuantAtual : Double;
begin
  if not uFuncoes.Empty(edtCDPROD.Text) and not uFuncoes.Empty(edtNRLOTE.Text) Then
   begin
     iLoja := dmDados.GetCodigoLoja(cmbLoja.Text);
     //
     aProduto := edtCDPROD.Text;
     aLote    := edtNRLOTE.Text;
     //
     fQuantAtual := dmDados.GetEstoqueLoteProduto(iLoja, aProduto, aLote);
     {If (dmDados.GetVerificarQuantEstoque(
          iLoja, aProduto, aLote, edtQuantidade.Value)) Then }
       If (edtQuantidade.Value > fQuantAtual) Then
        begin
             Application.MessageBox('Quantidade digitada superior a do estoque atual.',
                   'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
             edtQuantidade.Clear;
             If (edtQuantidade.Enabled) Then
                  edtQuantidade.SetFocus;
              Exit;
        End;
      //
      if not Empty(edtCDPROD.Text) and not Empty(edtNRLOTE.Text)
          and (edtQuantidade.Value > 0) Then
           begin
                if (dmDados.AddItemProduto(edtCDPROD.Text, edtNMDESC.Text, edtNRLOTE.Text, '',edtQuantidade.Value)) then
                begin
                     LimparCampos;
                     edtCDPROD.SetFocus;
                End;
           End;
   End;
  inherited;

end;

procedure TfrmCadPerdas.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    if (key = #13) and (edtQuantidade.Value > 0) Then
      begin
           key := #0;
           edtCDPROD.SetFocus;
      End;
end;

procedure TfrmCadPerdas.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
    { if (dsItens.DataSet.Active) Then
         BtExcluir.Enabled := not (dsItens.DataSet.IsEmpty) and (dsItens.DataSet.RecordCount > 0);   }
end;

procedure TfrmCadPerdas.dsItensDataChange(Sender: TObject; Field: TField);
begin
  inherited;
     if (dsItens.DataSet.Active) Then
       BtExcluir.Enabled := not (dsItens.DataSet.IsEmpty) and (dsItens.DataSet.RecordCount > 0);
end;

procedure TfrmCadPerdas.FormShow(Sender: TObject);
begin
  inherited;
   if (dmDados.cdsDados.Active) then
      dmDados.cdsDados.EmptyDataSet;
  //      TabSheet2.TabVisible := False;
end;

procedure TfrmCadPerdas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
         BtCancelarClick(Sender);
  inherited;                     
end;

procedure TfrmCadPerdas.FormCreate(Sender: TObject);
begin
// inherited;
end;

end.
