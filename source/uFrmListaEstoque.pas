unit uFrmListaEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Mask, Buttons, Grids, DBGrids, DB,
  DBCtrls;

type
  TfrmListaEstoque = class(TForm)
    Panel1: TPanel;
    pnlSuperior: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Label14: TLabel;
    Label4: TLabel;
    spLocalizar: TSpeedButton;
    cmbLojas: TComboBox;
    edtCDPROD: TMaskEdit;
    pnlGrid: TPanel;
    Panel4: TPanel;
    grdConsultar: TDBGrid;
    dsListaProdutos: TDataSource;
    btnFechar: TBitBtn;
    BtAdicionar: TBitBtn;
    BtEditar: TBitBtn;
    BtExcluir: TBitBtn;
    btnImprimir: TBitBtn;
    btnGeraArquivo: TBitBtn;
    DBNavigator1: TDBNavigator;
    lblRegistro: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbLojasChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spLocalizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtCDPRODExit(Sender: TObject);
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure dsListaProdutosDataChange(Sender: TObject; Field: TField);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure edtCDPRODChange(Sender: TObject);
    procedure btnGeraArquivoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitarBotoes(aStatus : Boolean);
    Procedure AbriJanela(iLoja : Integer; aOperacao, aProduto, aLote : String);
    Procedure AbrirListaProdutos();
  public
    { Public declarations }
  end;

var
  frmListaEstoque: TfrmListaEstoque;
  M_CDLOJA : Integer;

implementation

uses udmDados, uFuncoes, ufrmLocProduto, uFrmManuEstoque, uFormMainSngpc;

{$R *.dfm}

procedure TfrmListaEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dmDados.cdsListaEstoque.Close;
end;

procedure TfrmListaEstoque.cmbLojasChange(Sender: TObject);
begin
     AbrirListaProdutos;
end;

procedure TfrmListaEstoque.FormShow(Sender: TObject);
begin
     //HabilitarBotoes(false);
     dmDados.CarregarLojas(cmbLojas);
     cmbLojas.SetFocus;
end;

procedure TfrmListaEstoque.spLocalizarClick(Sender: TObject);
begin
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

procedure TfrmListaEstoque.btnFecharClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmListaEstoque.edtCDPRODExit(Sender: TObject);
Var
   M_CDLOJA : Integer;
   aProduto : String;
begin
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
      End;
end;

procedure TfrmListaEstoque.edtCDPRODKeyPress(Sender: TObject;
  var Key: Char);
begin
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
          if (grdConsultar.Enabled) Then;
             grdConsultar.SetFocus;
     End;
end;

procedure TfrmListaEstoque.dsListaProdutosDataChange(Sender: TObject;
  Field: TField);
begin
     BtAdicionar.Enabled := (dsListaProdutos.DataSet.Active) and (dsListaProdutos.DataSet.State in [dsBrowse]);
     BtEditar.Enabled    := (dsListaProdutos.DataSet.Active) and (dsListaProdutos.DataSet.State in [dsBrowse]);
     BtExcluir.Enabled   := (dsListaProdutos.DataSet.Active) and (dsListaProdutos.DataSet.State in [dsBrowse]);
     //
    // btnGeraArquivo.Enabled   := (dsListaProdutos.DataSet.Active) and (dsListaProdutos.DataSet.State in [dsBrowse]);
     btnGeraArquivo.Enabled := (dsListaProdutos.DataSet.Active) and not (dsListaProdutos.DataSet.IsEmpty);
     btnImprimir.Enabled      := (dsListaProdutos.DataSet.Active) and (dsListaProdutos.DataSet.State in [dsBrowse]);
     //
     lblRegistro.Caption := 'Registro(s): '+InttoStr(dsListaProdutos.DataSet.RecNo)+'/'+
                                            InttoStr(dsListaProdutos.DataSet.RecordCount);
     //
     edtCDPROD.Visible := (dsListaProdutos.DataSet.Active) and not (dsListaProdutos.DataSet.IsEmpty) and (dsListaProdutos.DataSet.State in [dsBrowse]);
     spLocalizar.Visible := (dsListaProdutos.DataSet.Active) and not (dsListaProdutos.DataSet.IsEmpty) and (dsListaProdutos.DataSet.State in [dsBrowse]);
     Label4.Visible := (dsListaProdutos.DataSet.Active) and not (dsListaProdutos.DataSet.IsEmpty) and (dsListaProdutos.DataSet.State in [dsBrowse]);
end;

procedure TfrmListaEstoque.HabilitarBotoes(aStatus: Boolean);
begin
      BtAdicionar.Enabled := aStatus;
      BtEditar.Enabled    := aStatus;
      BtExcluir.Enabled   := aStatus;
end;

procedure TfrmListaEstoque.AbriJanela(iLoja: Integer; aOperacao, aProduto,
  aLote: String);
begin
     if ufuncoes.Empty(cmbLojas.Text) Then
     begin
         cmbLojas.SetFocus;
         Exit;
     End;
     //
     if (aOperacao = 'I') Then
     begin
          Application.CreateForm(TfrmManuEstoque, frmManuEstoque);
          try
             With dmDados.cdsEstoqueHistorico do
             begin
                  Close;
                  Params.ParamByName('pCDLOJA').AsInteger := iLoja;
                  Params.ParamByName('pCDPROD').AsString    := aProduto;
                  Params.ParamByName('pNRLOTE').AsString  := '9999999999';
                  Open;
                  //
                  If (IsEmpty) Then
                   begin
                        Append;
                        FieldByName('EST_CDLOJA').AsInteger := iLoja;
                        {FieldByName('EST_DTMOVIMENTO').AsDateTime := Date();
                        FieldByName('EST_USUARIO').AsInteger      := StrtoInt(uFormMainSngpc.M_CDUSUA); }
                   End;
             End;
             //
             uFrmManuEstoque.M_CDLOJA := iLoja;
             uFrmManuEstoque.M_NMLOJA := cmbLojas.Text;

             frmManuEstoque.ShowModal;
          Finally
             frmManuEstoque.Free;
          End;
     End
     Else
     begin
          Application.CreateForm(TfrmManuEstoque, frmManuEstoque);
          try
             With dmDados.cdsEstoqueHistorico do
             begin
                  Close;
                  Params.ParamByName('pCDLOJA').AsInteger := iLoja;
                  Params.ParamByName('pCDPROD').AsString    := aProduto;
                  Params.ParamByName('pNRLOTE').AsString  := aLote;
                  Open;
                  //
                  If (IsEmpty) Then
                   begin
                        Edit;
                        FieldByName('EST_DTMOVIMENTO').AsDateTime := Date();
                        FieldByName('EST_USUARIO').AsInteger      := StrtoInt(uFormMainSngpc.M_CDUSUA);
                   End;
             End;
             //
             uFrmManuEstoque.M_CDLOJA := iLoja;
             uFrmManuEstoque.M_NMLOJA := cmbLojas.Text;
             //
             frmManuEstoque.ShowModal;
          Finally
             frmManuEstoque.Free;
          End;
     End;
     //
     AbrirListaProdutos;
end;

procedure TfrmListaEstoque.BtAdicionarClick(Sender: TObject);
Var
   iLoja : Integer;
begin
     if uFuncoes.Empty(cmbLojas.Text) then
     begin
          cmbLojas.SetFocus;
          Exit;
     End;
     //
     iLoja := dmDados.GetCodigoLoja(cmbLojas.Text);
     if not (dmDados.ValidarChave(iLoja)) Then
          Exit;
     M_CDLOJA := dmDados.GetCodigoLoja(cmbLojas.Text);
     AbriJanela(M_CDLOJA, 'I', '0000000000000', '9999999999');
end;

procedure TfrmListaEstoque.BtEditarClick(Sender: TObject);
Var
   aCodProduto, aLote : String;

   iLoja : Integer;
begin
    if uFuncoes.Empty(cmbLojas.Text) then
     begin
          cmbLojas.SetFocus;
          Exit;
     End;

     //
     iLoja := dmDados.GetCodigoLoja(cmbLojas.Text);
     if not (dmDados.ValidarChave(iLoja)) Then
          Exit;


   if (dsListaProdutos.DataSet.Active) and
         not (dsListaProdutos.DataSet.IsEmpty) Then
     begin
        M_CDLOJA    := dmDados.GetCodigoLoja(cmbLojas.Text);
        aCodProduto := dsListaProdutos.DataSet.fieldByName('EST_CDPROD').AsString;
        aLote       := dsListaProdutos.DataSet.fieldByName('EST_NRLOTE').AsString;
        //
        AbriJanela(M_CDLOJA, 'A',
                   dsListaProdutos.DataSet.fieldByName('EST_CDPROD').AsString,
                   dsListaProdutos.DataSet.fieldByName('EST_NRLOTE').AsString);
        //
        AbrirListaProdutos;
        //
        dmDados.cdsListaEstoque.locate('EST_CDPROD;EST_NRLOTE',VarArrayOf([aCodProduto,aLote]),[]);
    End;               
end;

procedure TfrmListaEstoque.BtExcluirClick(Sender: TObject);
Var
    iLoja : Integer;
    aProd, aLote : String;
begin
    if uFuncoes.Empty(cmbLojas.Text) then
     begin
          cmbLojas.SetFocus;
          Exit;
     End;

     //
     iLoja := dmDados.GetCodigoLoja(cmbLojas.Text);
     if not (dmDados.ValidarChave(iLoja)) Then
          Exit;
   if uFuncoes.Empty(cmbLojas.Text) then
     begin
          cmbLojas.SetFocus;
          Exit;
     End;
      if (dsListaProdutos.DataSet.Active) and
         not (dsListaProdutos.DataSet.IsEmpty) and
         not uFuncoes.Empty(cmbLojas.Text) Then
         begin
              iLoja := dsListaProdutos.DataSet.FieldByName('EST_CDLOJA').AsInteger;
              If Application.MessageBox('Deseja excluir este registro?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
               Begin
                   aProd := dsListaProdutos.DataSet.FieldByName('EST_CDPROD').AsString;
                   aLote := dsListaProdutos.DataSet.FieldByName('EST_NRLOTE').AsString;
                   //dsListaProdutos.DataSet.Close;
                   //
                   {dmDados.cdsListaEstoque.Delete;
                   dmDados.cdsListaEstoque.ApplyUpdates(0);}
                  If (dmDados.ExcluirLoteProdutoEstoqueHistorico(iLoja, aProd, aLote)) Then
                     if (dmDados.ExcluirLoteProdutoEstoque(iLoja, aProd, aLote)) Then
                         Application.MessageBox('Lote excluído com sucesso.',
                             'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              end;
              //
              dmDados.AbrirListaEstoque(iLoja);
         End;
end;

procedure TfrmListaEstoque.AbrirListaProdutos;
begin
     if not uFuncoes.Empty(cmbLojas.Text) then
      begin
          M_CDLOJA := dmDados.GetCodigoLoja(cmbLojas.Text);
          dmDados.AbrirListaEstoque(M_CDLOJA);
      End;
end;

procedure TfrmListaEstoque.grdConsultarDblClick(Sender: TObject);
begin
      BtEditarClick(Sender);
end;

procedure TfrmListaEstoque.edtCDPRODChange(Sender: TObject);
begin
    if not (dsListaProdutos.DataSet.IsEmpty) Then
    begin
         dsListaProdutos.DataSet.Locate('EST_CDPROD',edtCDPROD.Text,[loPartialKey]);
    End;
end;

procedure TfrmListaEstoque.btnGeraArquivoClick(Sender: TObject);
begin
    if uFuncoes.Empty(cmbLojas.Text) Then
    begin
         Application.MessageBox('Selecione a loja.',
                            'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
         cmbLojas.SetFocus;
         Exit;
    End;
end;

procedure TfrmListaEstoque.btnImprimirClick(Sender: TObject);
begin
   if uFuncoes.Empty(cmbLojas.Text) Then
    begin
         Application.MessageBox('Selecione a loja.',
                            'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
         cmbLojas.SetFocus;
         Exit;
    End;
end;

end.
