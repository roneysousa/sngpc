unit uFrmInventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, DBCtrls, Grids, DBGrids, DB,
  Mask;

type
  TfrmInvertario = class(TForm)
    pnlSuperior: TPanel;
    Image1: TImage;
    Panel1: TPanel;
    pnlDados: TPanel;
    pnlInferior: TPanel;
    btnFechar: TBitBtn;
    Label14: TLabel;
    cmbLojas: TComboBox;
    Label4: TLabel;
    edtNMDESC: TEdit;
    spLocalizar: TSpeedButton;
    DBGrid1: TDBGrid;
    dsProduto: TDataSource;
    Panel2: TPanel;
    BtAdicionar: TBitBtn;
    BtEditar: TBitBtn;
    edtCDPROD: TMaskEdit;
    BtExcluir: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
    procedure spLocalizarClick(Sender: TObject);
    procedure edtCDPRODExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCDPRODChange(Sender: TObject);
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure dsProdutoDataChange(Sender: TObject; Field: TField);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCDPRODEnter(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
  private
    { Private declarations }
    Procedure AbriJanela(iLoja : Integer; aProduto, aLote : String);
    Procedure Busca(iLoja: Integer; aProduto : String);
  public
    { Public declarations }
  end;

var
  frmInvertario: TfrmInvertario;

implementation

uses udmPesquisa, ufrmLocProduto, uFuncoes, udmDados, DBClient,
  uFrmManuEstoque;

{$R *.dfm}

procedure TfrmInvertario.btnFecharClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmInvertario.spLocalizarClick(Sender: TObject);
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

procedure TfrmInvertario.edtCDPRODExit(Sender: TObject);
Var
   M_CDLOJA : Integer;
   aProduto : String;
begin
     If not (uFuncoes.Empty(cmbLojas.Text))
      and not uFuncoes.Empty(edtCDPROD.Text) Then
      begin
           aProduto :=  uFuncoes.StrZero(edtCDPROD.Text,13);
           //
           If (dmDados.PROCURAR_PRODUTO(aProduto)= False)  Then
           begin
                Application.MessageBox('Código de produto não cadatrado!!!',
                 'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
                edtCDPROD.Clear;
                edtCDPROD.SetFocus;
                Exit;
           End;
           M_CDLOJA := dmDados.GetCodigoLoja(cmbLojas.Text);
           //
           Busca(M_CDLOJA, edtCDPROD.Text);
           edtNMDESC.Text := dmDados.GetNomeProduto(edtCDPROD.Text);
      End;
end;

procedure TfrmInvertario.FormShow(Sender: TObject);
begin
     BtAdicionar.Enabled := False;
     BtEditar.Enabled    := False;
     BtExcluir.Enabled   := False;
     //
     dmDados.CarregarLojas(cmbLojas);
     cmbLojas.SetFocus;
end;

procedure TfrmInvertario.edtCDPRODChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDPROD.Text) Then
      begin
           edtNMDESC.Clear;
           dmPesquisa.cdsItensEstoque.close;
           BtEditar.Enabled := False;
      End;
end;

procedure TfrmInvertario.edtCDPRODKeyPress(Sender: TObject; var Key: Char);
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
          if (DBGrid1.Enabled) Then;
             DBGrid1.SetFocus;
     End;

end;

procedure TfrmInvertario.dsProdutoDataChange(Sender: TObject;
  Field: TField);
begin
    BtAdicionar.Enabled := (dsProduto.DataSet.Active) AND (dsProduto.DataSet.State in [dsBrowse]);
    BtEditar.Enabled    := (dsProduto.DataSet.Active) AND NOT (dsProduto.DataSet.IsEmpty) AND (dsProduto.DataSet.State in [dsBrowse]);
    BtExcluir.Enabled   := (dsProduto.DataSet.Active) AND NOT (dsProduto.DataSet.IsEmpty) AND (dsProduto.DataSet.State in [dsBrowse]);
end;

procedure TfrmInvertario.AbriJanela(iLoja : Integer; aProduto, aLote : String);
begin
      Application.CreateForm(TfrmManuEstoque, frmManuEstoque);
      try
          With dmDados.cdsEstoque do
           begin
                Close;
                Params.ParamByName('pCDLOJA').AsInteger := iLoja;
                Params.ParamByName('pPROD').AsString    := aProduto;
                Params.ParamByName('pNRLOTE').AsString  := aLote;
                Open;
                //
                If (IsEmpty) Then
                 begin
                      Append;
                      FieldByName('EST_CDLOJA').AsInteger := iLoja;
                      FieldByName('EST_CDPROD').AsString  := aProduto;
                 End
                 Else
                      Edit;
           End;
           //
           frmManuEstoque.ShowModal;
      Finally
          frmManuEstoque.Free;
          //
          Busca(iLoja, aProduto);
          edtNMDESC.Text := dmDados.GetNomeProduto(aProduto);
      End;
end;

procedure TfrmInvertario.BtAdicionarClick(Sender: TObject);
Var
   iLoja : Integer;
begin
    If (dmPesquisa.cdsItensEstoque.Active) Then
    begin
         iLoja := dmDados.GetCodigoLoja(cmbLojas.Text);
         AbriJanela(iLoja, edtCDPROD.Text, ' ');
    End;
end;

procedure TfrmInvertario.BtEditarClick(Sender: TObject);
Var
   iLoja : Integer;
begin
    If not (dmPesquisa.cdsItensEstoque.IsEmpty) Then
    begin
         iLoja := dmDados.GetCodigoLoja(cmbLojas.Text);
         AbriJanela(iLoja,
             dmPesquisa.cdsItensEstoqueEST_CDPROD.AsString,
             dmPesquisa.cdsItensEstoqueEST_NRLOTE.AsString);
    End;         
end;

procedure TfrmInvertario.Busca(iLoja: Integer; aProduto: String);
begin
     If not (uFuncoes.Empty(cmbLojas.Text))
      and not uFuncoes.Empty(edtCDPROD.Text) Then
      begin
           //
           With dmPesquisa.cdsItensEstoque do
            begin
                 DisableControls;
                 Close;
                 Params.ParamByName('pLOJA').AsInteger  :=  iLoja;
                 Params.ParamByName('pCDPROD').AsString :=  aProduto;
                 Open;
                 EnableControls;
            End;
      End;
end;

procedure TfrmInvertario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dmPesquisa.cdsItensEstoque.close;
end;

procedure TfrmInvertario.edtCDPRODEnter(Sender: TObject);
begin
     dsProduto.DataSet.Close;
     //
     BtAdicionar.Enabled := False;
     BtEditar.Enabled    := False;
     BtExcluir.Enabled   := False;
end;

procedure TfrmInvertario.BtExcluirClick(Sender: TObject);
begin
    If Application.MessageBox('Deseja excluir este registro?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
      Begin
           //
           dmPesquisa.cdsItensEstoque.Delete;
           dmPesquisa.cdsItensEstoque.ApplyUpdates(0);
           //
           Application.MessageBox('Lote excluído com sucesso.',
                'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
      end;
end;

end.
