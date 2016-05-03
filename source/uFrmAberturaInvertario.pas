unit uFrmAberturaInvertario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, DBClient, Provider, DB, SqlExpr, jpeg,
  ExtCtrls, Buttons, Grids, DBGrids, StdCtrls, ComCtrls, Mask, DBCtrls,
  xmldom, XMLIntf, msxmldom, XMLDoc, Xmlxform;

type
  TfrmCadAberturaInvertario = class(TfrmCadastro)
    Label1: TLabel;
    dbeDescricao: TDBEdit;
    Label2: TLabel;
    dbeCPF: TDBEdit;
    Label3: TLabel;
    dbeCRF: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    cmbUF: TDBComboBox;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    btnAbrirInvertario: TBitBtn;
    Label10: TLabel;
    cmbEmpresa: TDBLookupComboBox;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    Label13: TLabel;
    DBEdit2: TDBEdit;
    btnAbrirXML: TBitBtn;
    OpenD: TOpenDialog;
    XmlD: TXMLDocument;
    XMLTransformProvider1: TXMLTransformProvider;
    cdsInvertario: TClientDataSet;
    DBGrid1: TDBGrid;
    dsInvertario: TDataSource;
    cdsInvertarioclasseTerapeutica: TStringField;
    cdsInvertarioregistroMSMedicamento: TStringField;
    cdsInvertarionumeroLoteMedicamento: TStringField;
    cdsInvertarioquantidadeMedicamento: TStringField;
    cdsInvertariounidadeMedidaMedicamento: TStringField;
    procedure dbeCPFKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCRFKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit6KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure BtCancelarClick(Sender: TObject);
    procedure dbeCPFExit(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure btnAbrirInvertarioClick(Sender: TObject);
    procedure btnAbrirXMLClick(Sender: TObject);
  private
    { Private declarations }
    procedure REGISTRO;
  public
    { Public declarations }
  end;

var
  frmCadAberturaInvertario: TfrmCadAberturaInvertario;

implementation

uses udmDados, uFormMainSngpc, uFuncoes;

{$R *.dfm}

procedure TfrmCadAberturaInvertario.dbeCPFKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   If not( key in['0'..'9',#8, #13] ) then
      key:=#0;
end;

procedure TfrmCadAberturaInvertario.dbeCRFKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   If not( key in['0'..'9',#8, #13] ) then
      key:=#0; 
end;

procedure TfrmCadAberturaInvertario.DBEdit6KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   If not( key in['0'..'9',#8, #13] ) then
      key:=#0; 
end;

procedure TfrmCadAberturaInvertario.REGISTRO;
begin
     dmDados.RefreshCDS(dmDados.cdsConfig);
     With dmDados.cdsFarmaceutico  do
         begin
              close;
              Params[0].AsInteger := 1;
              Open;
         End;
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadAberturaInvertario.FormShow(Sender: TObject);
begin
  inherited;
     REGISTRO;
     //
     dmDados.RefreshCDS(dmDados.cdsListaEmpresa);
     //
     if (dmDados.cdsFarmaceutico.IsEmpty) Then
      begin
           dmDados.cdsFarmaceutico.Append;
           dmDados.cdsFarmaceuticoFAR_CODIGO.AsInteger := dmDados.cdsConfigCFG_FARMACEUTICO.AsInteger + 1;
           dbeDescricao.SetFocus;
      ENd;
end;

procedure TfrmCadAberturaInvertario.BtGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbeDescricao.Text) Then
       Begin
           Application.MessageBox('Digite o nome farmacêutico.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeDescricao.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(uFuncoes.RemoveChar( dbeCPF.Text)) Then
       Begin
           Application.MessageBox('Digite o CPF.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeCPF.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(dbeCRF.Text) Then
       Begin
           Application.MessageBox('Digite o CRF.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeCRF.SetFocus;
           Exit;
       End;
       //
       If uFuncoes.Empty(cmbEmpresa.Text) Then
       Begin
           Application.MessageBox('Selecione a empresa.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbEmpresa.SetFocus;
           Exit;
       End;
     //
     If (dsCadastro.DataSet.State in [dsinsert]) Then
     begin
          dmDados.RefreshCDS(dmDados.cdsConfig);
          dmDados.cdsConfig.Edit;
          dmDados.cdsConfigCFG_FARMACEUTICO.AsInteger := dmDados.cdsConfigCFG_FARMACEUTICO.AsInteger + 1;
          dmDados.cdsConfig.ApplyUpdates(0);
          //
          dmDados.cdsFarmaceuticoFAR_CODIGO.AsInteger := dmDados.cdsConfigCFG_FARMACEUTICO.AsInteger;
          dmDados.cdsFarmaceuticoFAR_DATACADASTRO.AsDateTime := Date();
          dmDados.cdsFarmaceuticoFAR_HORACADASTRO.AsString   := Copy(TimetoStr(Time),1,5);
          dmDados.cdsFarmaceuticoFAR_USUARIO.AsInteger       := StrtoInt(uFormMainSngpc.M_CDUSUA);
     End;
     //
     dmDados.Start;
     try
          //
          dmDados.cdsFarmaceutico.ApplyUpdates(0);
          //
          dmDados.Comit(dmDados.Transc);
     Except
          on Exc:Exception do
            begin
               Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               dmDados.Rollback;
               BtCancelarClick(Sender);
            End;
     End;

  inherited;
  TabSheet2.TabVisible := False;

end;

procedure TfrmCadAberturaInvertario.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
     btnAbrirInvertario.Enabled := dsCadastro.DataSet.State in [dsBrowse];
     btnAbrirXML.Enabled        := dsCadastro.DataSet.State in [dsBrowse];
end;

procedure TfrmCadAberturaInvertario.BtCancelarClick(Sender: TObject);
begin
      dsCadastro.DataSet.Cancel;
  inherited;
     TabSheet2.TabVisible := False;
     //
     if (dsCadastro.DataSet.IsEmpty) or (dsCadastro.DataSet.RecordCount = 0) then
        Close;
end;

procedure TfrmCadAberturaInvertario.dbeCPFExit(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(uFuncoes.RemoveChar( dbeCPF.Text)) Then
   Begin
        If not (uFuncoes.CPF(dbeCPF.Text)) Then
        Begin
            MessageDlg('CPF inválido!!!', mtInformation, [mbOk], 0);
            dbeCPF.Clear;
            dbeCPF.SetFocus;
            Exit;
        End;
   End;
end;

procedure TfrmCadAberturaInvertario.BtEditarClick(Sender: TObject);
begin
  inherited;
 if  not (dsCadastro.DataSet.IsEmpty)
    and (dsCadastro.DataSet.RecordCount > 0) then
  Begin
       dmDados.RefreshCDS(dmDados.cdsListaEmpresa);
       dsCadastro.DataSet.Edit;
       dbeDescricao.SetFocus;
  End;
end;

procedure TfrmCadAberturaInvertario.btnAbrirInvertarioClick(
  Sender: TObject);
Var
    aResp, aCPF : String;
    iLoja : Integer;
begin
  inherited;
     if uFuncoes.Empty(dsCadastro.DataSet.FieldByname('FAR_CPF').AsString) Then
     begin
         Application.MessageBox('Campo CPF está vazio.','ATENÇÃO',
                            MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
         Exit;
     End;
     //
     if not (frmMain.ValidarAcesso()) Then
      begin
           Raise Exception.Create('Acesso Negado!!!'+#13+'Entre em contato com Infog2 (86) 3226-4510.' );
      End;
     //
     If Application.MessageBox('Confirma abertura de Inventário?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
     begin
           aResp := 'N';
           //
           If Application.MessageBox('Importar o estoque anterior '+#13+'para o novo Inventário?',
              'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1+MB_APPLMODAL) = idYes then
             aResp := 'S';
           //
           dsCadastro.DataSet.Edit;
           iLoja := dsCadastro.DataSet.FieldByname('FAR_EMPRESA').AsInteger;
           aCPF  := uFuncoes.RemoveChar(dsCadastro.DataSet.FieldByname('FAR_CPF').AsString);
           dsCadastro.DataSet.Cancel;
           //
            If (dmDados.AbreturaInvertario(iLoja, aResp, aCPF)) Then
             begin
                    Application.MessageBox('Abertura de inventário realizada com sucesso.','ATENÇÃO',
                            MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                    btnAbrirInvertario.Enabled := false;        
             End
           Else
                    Application.MessageBox('Erro ao tentar abrir inventário.','ATENÇÃO',
                            MB_OK+MB_ICONSTOP+MB_APPLMODAL);
     End;
end;

procedure TfrmCadAberturaInvertario.btnAbrirXMLClick(Sender: TObject);
Var
   aNomeArquivo : String;
   aProduto, aClasse, aClassePro, aUnd, aLote : String;
begin
    aNomeArquivo := ExtractFilePath( Application.ExeName )+'ToDp.xtr';
    //
    if not FileExists(aNomeArquivo) Then
    begin
         Application.MessageBox('Arquivo de transformação não encontrado.','ATENÇÃO',
             MB_OK+MB_ICONSTOP+MB_APPLMODAL);
         Exit;
    End;
    //
     If Application.MessageBox('Confirma importação de dados?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1+MB_APPLMODAL) = idNo then
           Exit;
  btnAbrirXML.Enabled := false;
  try
     try
         if OpenD.Execute Then
         begin
              cdsInvertario.Close;
              XMLTransformProvider1.TransformRead.TransformationFile :=
                  ExtractFilePath( Application.ExeName )+'ToDp.xtr';
              XMLTransformProvider1.XMLDataFile := OpenD.FileName;
              cdsInvertario.Open;
              //
              Screen.Cursor := crHourGlass;
              //
              if not (cdsInvertario.IsEmpty)Then
              begin
                   dmDados.LimparEstoqueLoja(dsCadastro.DataSet.fieldByname('FAR_EMPRESA').AsInteger);
                   //
                   dmDados.FilterCDS( dmDados.cdsImpEstoque, fsInteger, dsCadastro.DataSet.fieldByname('FAR_EMPRESA').AsString);
                //
                With cdsInvertario do
                   begin
                        First;
                        DisableControls;
                        While not (Eof) do
                        begin
                             aProduto := FieldByName('registroMSMedicamento').AsString;
                             aClasse  := FieldByName('classeTerapeutica').AsString;
                             aUnd     := FieldByName('unidadeMedidaMedicamento').AsString;
                             aLote    := FieldByName('numeroLoteMedicamento').AsString; 
                             //
                             if  (aClasse = '1') Then
                                 aClassePro := 'S'
                             Else
                                 aClassePro := 'N';
                             //
                             if not (dmDados.ProcurarValor(aProduto, 'PRO_RG_MS_MEDICAMENTO', 'PRODUTOS')) Then
                                dmDados.AddProduto(aProduto, 'DESCRIÇÃO NÃO CADASTRADA');
                             //
                             dmDados.SetClasseTerapeuticaProduto(aProduto, aClassePro);
                             //
                             dmDados.SetUnidadeMedidaProduto(aProduto, aUnd);
                             //

                             Next;
                        End;
                        //
                        EnableControls;
                   End;
                //
                dmDados.Start;
                try           
                   //
                   With cdsInvertario do
                   begin
                        First;
                        DisableControls;
                        While not (Eof) do
                        begin
                             aProduto := FieldByName('registroMSMedicamento').AsString;
                             aClasse  := FieldByName('classeTerapeutica').AsString;
                             aUnd     := FieldByName('unidadeMedidaMedicamento').AsString;
                             aLote    := FieldByName('numeroLoteMedicamento').AsString;
                             //
                             dmDados.cdsImpEstoque.Append;
                             dmDados.cdsImpEstoqueEST_CDLOJA.AsInteger := dsCadastro.DataSet.fieldByname('FAR_EMPRESA').AsInteger;
                             dmDados.cdsImpEstoqueEST_CDPROD.AsString  := aProduto;
                             dmDados.cdsImpEstoqueEST_NRLOTE.AsString  := uFuncoes.Alltrim(aLote);
                             dmDados.cdsImpEstoqueEST_QUANTIDADE.AsFloat := FieldByName('quantidadeMedicamento').AsFloat;
                             //
                             dmDados.cdsImpEstoque.Post;
                             //
                             Next;
                        End;
                        //
                        EnableControls;
                   End;
                   //
                   dmDados.cdsImpEstoque.ApplyUpdates(0);
                   //
                   dmDados.Comit(dmDados.Transc);
                   //
                   dmDados.cdsImpEstoque.Close;
                   //
                    Application.MessageBox('Importação realizado com sucesso.','ATENÇÃO',
                            MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                Except
                     on e: exception do
                     begin
                          Application.MessageBox(PChar('Erro no Produto:'+aProduto+ ' - Lote: '+aLote+#13
                             + E.Message),   'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
                          dmDados.Rollback;
                     End;
                End;
             End;
         End;
     Except
          on e: exception do
          begin
              Application.MessageBox(PChar('Erro ao tentar realizar importação de invertário! Erro:'+#13
                      + E.Message), 'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
          End;
     End;
  Finally
      btnAbrirXML.Enabled := true;
      Screen.Cursor := crDefault;
  End;
  Application.ProcessMessages;

end;


{var
   stPath:String;
   i,x,j:integer;
   //xmlD:IXmlDocument; //Pela explicaçção dada acima
   Node,NodeChild,NodeAux:IXmlNode;
   No_Pai, No_Mendicamento, No_EntradaMedicamentos, No_MedicamentoEntrada : IXMLNode;
   StrTag : String;
begin
  inherited;
   Memo1.Lines.Clear;
   try
     OpenD.InitialDir := ExtractFilePath(application.ExeName);
     if not openD.Execute then
         abort;
      stPath := openD.FileName;
      StrTag := 'corpo';
      try
        XmlD.FileName := stPath;
        XmlD.Active := true;
        //
        No_Pai := XmlD.DocumentElement.ChildNodes.FindNode(StrTag);

        if Not (No_Pai = nil) then
         begin
              No_Pai.ChildNodes.First;
              //
              No_Mendicamento  := No_Pai.ChildNodes.FindNode('medicamentos');
              if Not (No_Mendicamento = nil) then
              begin
                   No_Mendicamento.ChildNodes.First;
                   for i := 0 to No_Mendicamento.ChildNodes.Count - 1 do
                   begin
                        No_EntradaMedicamentos := XmlD.DocumentElement.ChildNodes[I];
                        if Not (No_EntradaMedicamentos = nil) then
                         begin
                              No_EntradaMedicamentos.ChildNodes.First;
                              No_MedicamentoEntrada := No_EntradaMedicamentos.ChildNodes.FindNode('medicamentoEntrada');
                              if Not (No_MedicamentoEntrada = nil) then
                               begin
                                    No_MedicamentoEntrada.ChildNodes.First;
                               End
                               Else
                                   ShowMessage('Não encontro!! medicamentoEntrada');
                         End
                         Else
                                   ShowMessage('Não encontro!! EntradaMedicamentos');
                   End;  // end-for

              End;

         End;

    except
       on e:exception do
       begin
        Showmessage('Problemas ao ler o Tag'+#13+
            'Mensagem Original = '+e.Message);
        Abort;
       end;
     end;
    finally
        //OPenD.Free;
       // XmlD.Free; por ser Interface
    end;}

end.
