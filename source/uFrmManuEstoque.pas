unit uFrmManuEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, Mask, DBCtrls, StdCtrls, Buttons, ToolEdit,
  RXDBCtrl, CurrEdit;

type
  TfrmManuEstoque = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtGravar: TBitBtn;
    BtCancelar: TBitBtn;
    Label1: TLabel;
    edtLoja: TEdit;
    Label2: TLabel;
    dbeCDPROD: TDBEdit;
    dsEstoque: TDataSource;
    Label3: TLabel;
    dbeLote: TDBEdit;
    Label4: TLabel;
    dbeQuant: TDBEdit;
    Label5: TLabel;
    dbeDTVENC: TDBDateEdit;
    edtNMPROD: TEdit;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    spLocalizar: TSpeedButton;
    rgTipoMedicamento: TRadioGroup;
    rgUnidade: TRadioGroup;
    BitBtn1: TBitBtn;
    procedure dsEstoqueDataChange(Sender: TObject; Field: TField);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeLoteExit(Sender: TObject);
    procedure dbeDTVENCExit(Sender: TObject);
    procedure dbeQuantExit(Sender: TObject);
    procedure dbeCDPRODExit(Sender: TObject);
    procedure dbeCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure spLocalizarClick(Sender: TObject);
    procedure dbeLoteEnter(Sender: TObject);
    procedure dbeCDPRODChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeLoteKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbeQuantKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure HabilitarControles(aStatus : Boolean);
    procedure GetDadosProduto(aProduto : String);
    Function SetDadosProduto(aProduto : String): Boolean;
  public
    { Public declarations }
  end;

var
  frmManuEstoque: TfrmManuEstoque;
  M_NMLOJA, M_NMPROD : String;
  M_QTANTE, M_QTMOVI, M_QTATUA : double;
  M_CDLOJA : Integer;

implementation

uses udmPesquisa, udmDados, uFuncoes, uFormMainSngpc, ufrmLocProduto,
  uFrmCadProdutos;

{$R *.dfm}

procedure TfrmManuEstoque.dsEstoqueDataChange(Sender: TObject;
  Field: TField);
begin
    BtCancelar.Enabled  := dsEstoque.DataSet.State in [dsEdit, dsInsert];
    BtGravar.Enabled    := dsEstoque.DataSet.State in [dsEdit, dsInsert];
    //
    dbeCDPROD.Enabled   := dsEstoque.DataSet.State in [dsInsert];
    dbeLote.Enabled     := dsEstoque.DataSet.State in [dsInsert];
    //
    spLocalizar.Enabled := dsEstoque.DataSet.State in [dsInsert];
end;

procedure TfrmManuEstoque.BtCancelarClick(Sender: TObject);
begin
     If (dsEstoque.DataSet.State in [dsInsert, dsEdit]) Then
         dsEstoque.DataSet.Cancel;
     //
     Close;
end;

procedure TfrmManuEstoque.BtGravarClick(Sender: TObject);
Var
  aDataMov: TDatetime;
  //aHoraMov, aMotivo, aTipoEntradaSaida, aTipoMov, aMotivoAlteracao: String;
  iLoja, iUsuario, iMotivo  : Integer;
  aProduto, aContinuar : String;
begin
     if (dsEstoque.DataSet.State = dsInsert) Then
     begin
          If uFuncoes.Empty(dbeCDPROD.Text) Then
          begin
             Application.MessageBox('Digite o código MS produto.','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             dbeCDPROD.SetFocus;
             Exit;
         End;
     End;
     //
     If uFuncoes.Empty(dbeLote.Text) Then
      begin
           Application.MessageBox('Digite o lote do produto.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeLote.SetFocus;
           Exit;
      End;
      //
     If uFuncoes.Empty(dbeQuant.Text) Then
      begin
           Application.MessageBox('Digite a quantidade do produto.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeQuant.SetFocus;
           Exit;
      End;
     //
     if (rgTipoMedicamento.ItemIndex = -1) then
     begin
          Application.MessageBox('Selecione a classe do medicamento.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           rgTipoMedicamento.SetFocus;
           Exit;
     End;
     //
     if (rgUnidade.ItemIndex = -1) then
     begin
          Application.MessageBox('Selecione a unidade de medida do medicamento.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           rgUnidade.SetFocus;
           Exit;
     End;
     //
     aContinuar := 'N';
     if (dsEstoque.DataSet.State = dsInsert) then
        aContinuar := 'S';
     {aDataMov := Date();
     aHoraMov := uFuncoes.RemoveChar(TimetoStr(Time));
     iUsuario := StrtoInt(uFormMainSngpc.M_CDUSUA);
     iMotivo  := 1;  // 1 - Invertario;
     aMotivoAlteracao := 'I';  // I - Invertario
     //
     if (M_QTANTE > M_QTATUA) Then
        aTipoEntradaSaida := 'S'
     Else
         if (M_QTANTE < M_QTATUA) Then
            aTipoEntradaSaida := 'E';   }
     //
     dmDados.Start;
     try
         iLoja := dmDados.cdsEstoqueHistoricoEST_CDLOJA.AsInteger;
         aProduto := dmDados.cdsEstoqueHistoricoEST_CDPROD.AsString;
         // 
         //dmDados.cdsEstoqueHistorico.FieldByName('EST_HOMOVIMENTO').AsString := TimetoStr(Time);
         //
         dmDados.cdsEstoqueHistorico.ApplyUpdates(0);
         //
         SetDadosProduto(aProduto);
         //
         dmDados.Comit(dmDados.Transc);
         //
         //Close;
     Except
         dmDados.Rollback;
     End;
     //
     Application.MessageBox(PChar(uFuncoes.MSG_OK),'ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
     //
     if (aContinuar = 'S') Then
     begin
          rgUnidade.ItemIndex := -1;
          rgTipoMedicamento.ItemIndex := -1;
          //
          dsEstoque.DataSet.Append;
          dsEstoque.DataSet.FieldByName('EST_CDLOJA').AsInteger := iLoja;
          dbeCDPROD.SetFocus;
     End
     Else
         Close;
end;

procedure TfrmManuEstoque.FormShow(Sender: TObject);
begin
      edtLoja.Text   := dmDados.GetNomeLoja(dmDados.cdsEstoqueHistoricoEST_CDLOJA.AsInteger);
      if (dmDados.cdsEstoqueHistorico.State = dsInsert) Then
      begin
          HabilitarControles(true);
          dbeCDPROD.SetFocus;
      End;
      //
      if (dmDados.cdsEstoqueHistorico.State = dsEdit) Then
      begin
          HabilitarControles(false);
          edtNMPROD.Text := dmDados.GetNomeProduto(dsEstoque.DataSet.FieldByName('EST_CDPROD').AsString);
          // dmDados.cdsEstoqueHistoricoEST_CDPROD.AsString);
          dbeQuant.SetFocus;
      End;
      //
      if not uFuncoes.Empty(dsEstoque.DataSet.FieldByName('EST_CDPROD').AsString) Then
          edtNMPROD.Text := dmDados.GetNomeProduto(dsEstoque.DataSet.FieldByName('EST_CDPROD').AsString);
      //
      if not uFuncoes.Empty(dsEstoque.DataSet.FieldByName('EST_CDPROD').AsString) Then
      BEGIN
          GetDadosProduto(dsEstoque.DataSet.FieldByName('EST_CDPROD').AsString);
          dsEstoque.DataSet.Edit;
      End;
      //    
      M_QTANTE := dmDados.cdsEstoqueEST_QUANTIDADE.AsFloat;
      //
      CurrencyEdit1.Value := M_QTANTE;
end;

procedure TfrmManuEstoque.dbeLoteExit(Sender: TObject);
Var
    iLoja : Integer;
    aProduto, aLote : String;
begin
    dmDados.RefreshCDS(dmDados.cdsConfig);
    If (dmDados.cdsConfigCFG_FLZEROS.AsString = 'S') Then
      dmDados.cdsEstoqueHistoricoEST_NRLOTE.AsString :=
           uFuncoes.StrZero(dmDados.cdsEstoqueHistoricoEST_NRLOTE.AsString,10);
    //
    iLoja    := dmDados.cdsEstoqueHistoricoEST_CDLOJA.AsInteger;
    aProduto := dmDados.cdsEstoqueHistoricoEST_CDPROD.AsString;
    aLote    := dmDados.cdsEstoqueHistoricoEST_NRLOTE.AsString;
    //
    If (dsEstoque.DataSet.State in [dsInsert]) Then
        If not uFuncoes.Empty(dbeLote.Text) Then
          if (dmDados.GetProdutoLoteEstoqueHistorico(
              dmDados.cdsEstoqueHistoricoEST_CDLOJA.AsInteger,
              dmDados.cdsEstoqueHistoricoEST_CDPROD.AsString,
              dmDados.cdsEstoqueHistoricoEST_NRLOTE.AsString)) Then
            begin
                 Application.MessageBox('Número de lote já cadastro no estoque.','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 dmDados.cdsEstoqueHistoricoEST_NRLOTE.Clear;
                 dbeLote.SetFocus;
                 //
                 Exit;
            End;
end;

procedure TfrmManuEstoque.dbeDTVENCExit(Sender: TObject);
begin
    If not uFuncoes.Empty(uFuncoes.RemoveChar(dbeDTVENC.text)) Then
      try
          dbeDTVENC.Date := StrToDate(dbeDTVENC.Text);
          //
          If (dbeDTVENC.Date < Date()) Then
           begin
                ShowMessage ('Data de vencimento inferior a atual.');
                dbeDTVENC.SetFocus;
                dbeDTVENC.Clear;
                Exit;
           End;
      except
          on EConvertError do
            ShowMessage ('Data Inválida!');
      end;
end;

procedure TfrmManuEstoque.dbeQuantExit(Sender: TObject);
begin
     If not uFuncoes.Empty(dbeQuant.Text) Then
     begin
          If (dmDados.cdsEstoqueEST_QUANTIDADE.AsFloat = M_QTANTE) Then
              M_QTMOVI := 0
          else
              M_QTMOVI := dmDados.cdsEstoqueEST_QUANTIDADE.AsFloat - M_QTANTE;

          M_QTATUA := dmDados.cdsEstoqueEST_QUANTIDADE.AsFloat;
          //
          CurrencyEdit2.Value := M_QTMOVI;
          CurrencyEdit3.Value := M_QTATUA;
     End;
end;

procedure TfrmManuEstoque.dbeCDPRODExit(Sender: TObject);
Var
   M_CDLOJA : Integer;
   aProduto : String;
begin
     If not uFuncoes.Empty(dbeCDPROD.Text) Then
      begin
           aProduto :=  uFuncoes.StrZero(dbeCDPROD.Text,13);
           //
           If Not (dmDados.ProcurarValor(aProduto, 'PRO_RG_MS_MEDICAMENTO','PRODUTOS'))  Then
           begin
                Application.MessageBox('Código de produto não cadatrado!!!',
                   'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
                dbeCDPROD.Clear;
                dbeCDPROD.SetFocus;
                Exit;
           End
           Else
           begin
               edtNMPROD.Text := dmDados.GetNomeProduto(aProduto);
               GetDadosProduto(aProduto);
           End;
      End;
end;

procedure TfrmManuEstoque.dbeCDPRODKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
     //
     If (key = #13) and uFuncoes.Empty(uFuncoes.RemoveChar(dbeCDPROD.Text))  Then
     Begin
          Key := #0;
          if (dsEstoque.DataSet.State = dsInsert) Then
               spLocalizarClick(Sender);
     End;
     //
     If (key = #13) and not uFuncoes.Empty(dbeCDPROD.Text)  Then
     Begin
          Key := #0;
          if (dbeLote.Enabled) Then;
             dbeLote.SetFocus;
     End;
end;

procedure TfrmManuEstoque.spLocalizarClick(Sender: TObject);
begin
    dbeCDPROD.SetFocus;
    frmLocProduto := TfrmLocProduto.create(application);
    try
        frmLocProduto.showmodal;
    finally
        If not (frmLocProduto.cdsConsultar.IsEmpty) Then
        begin
            dbeCDPROD.Text := frmLocProduto.cdsConsultarPRO_RG_MS_MEDICAMENTO.AsString;
            Perform(WM_NEXTDLGCTL, 0, 0);
        End;
        //
        frmLocProduto.Release;
        frmLocProduto := nil;
    end;
end;

procedure TfrmManuEstoque.dbeLoteEnter(Sender: TObject);
begin
     if (dsEstoque.DataSet.State = dsInsert)
       and uFuncoes.Empty(dbeCDPROD.Text) Then
            dbeCDPROD.SetFocus;
end;

procedure TfrmManuEstoque.HabilitarControles(aStatus: Boolean);
begin
    if (aStatus) Then
    begin
         dbeCDPROD.Enabled := aStatus;
         dbeLote.Enabled   := aStatus;
    End
    Else
    begin
         dbeCDPROD.Enabled := aStatus;
         dbeLote.Enabled   := aStatus;
         //
         dbeCDPROD.ReadOnly := true;
         dbeLote.ReadOnly := true;
         //
         dbeCDPROD.Color := clGray;
         dbeLote.Color   := clGray;
         //
         dbeCDPROD.Font.Color := clBlue;
         dbeLote.Font.Color   := clBlue;
    End;
end;

procedure TfrmManuEstoque.dbeCDPRODChange(Sender: TObject);
begin
     if uFuncoes.Empty(dbeCDPROD.Text) Then
        edtNMPROD.Clear;
end;

procedure TfrmManuEstoque.FormCreate(Sender: TObject);
begin
      KeyPreview := True;
end;

procedure TfrmManuEstoque.GetDadosProduto(aProduto: String);
begin
     dmDados.FilterCDS(dmDados.cdsProdutos, fsString, aProduto);
     if not (dmDados.cdsProdutos.IsEmpty) then
     begin
          if (dmDados.cdsProdutosPRO_ANTIMICROBIANOS.AsString = 'S') then
              rgTipoMedicamento.ItemIndex := 0
          Else
              rgTipoMedicamento.ItemIndex := 1;
          //
          if (dmDados.cdsProdutosPRO_UNIDADE_MEDIDA.AsString = '1') then
              rgUnidade.ItemIndex := 0
          Else
              rgUnidade.ItemIndex := 1;
     End;
     dmDados.cdsProdutos.close;
end;

function TfrmManuEstoque.SetDadosProduto(aProduto: String): Boolean;
begin
     Result := False;
     //
     try
         dmDados.FilterCDS(dmDados.cdsProdutos, fsString, aProduto);
         if not (dmDados.cdsProdutos.IsEmpty) then
         begin
            dmDados.cdsProdutos.Edit;
            //
            Case rgTipoMedicamento.ItemIndex of
              0 : dmDados.cdsProdutosPRO_ANTIMICROBIANOS.AsString := 'S';
              1 : dmDados.cdsProdutosPRO_ANTIMICROBIANOS.AsString := 'N';
            End;
            //
            Case rgUnidade.ItemIndex of
              0 : dmDados.cdsProdutosPRO_UNIDADE_MEDIDA.AsString := '1';
              1 : dmDados.cdsProdutosPRO_UNIDADE_MEDIDA.AsString := '2';
            End;
            //
            dmDados.cdsProdutos.ApplyUpdates(0);
            //
            Result := true;
         End;
         dmDados.cdsProdutos.close;
     Except

     End;
end;

procedure TfrmManuEstoque.dbeLoteKeyPress(Sender: TObject; var Key: Char);
begin
  {  If not( key in['0'..'9',#8, #13] ) then
        key:=#0; }
    If (key = #13) and not uFuncoes.Empty(dbeLote.Text)  Then
     Begin
          Key := #0;
          if (dbeQuant.Enabled) Then;
             dbeQuant.SetFocus;
     End;

end;

procedure TfrmManuEstoque.BitBtn1Click(Sender: TObject);
begin
     frmMain.AbreForm(TfrmCadProdutos, frmCadProdutos);
end;

procedure TfrmManuEstoque.dbeQuantKeyPress(Sender: TObject; var Key: Char);
begin
    If (key = #13) and not uFuncoes.Empty(dbeQuant.Text)  Then
     Begin
          Key := #0;
          if (dbeDTVENC.Enabled) Then;
             dbeDTVENC.SetFocus;
     End;
end;

End.
