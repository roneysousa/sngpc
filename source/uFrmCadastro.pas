unit uFrmCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DBClient, Provider, DB, SqlExpr, Buttons, Grids,
  DBGrids, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, jpeg, ToolEdit,
  RXDBCtrl;

type
  TfrmCadastro = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    lblConsultar: TLabel;
    rgConsultar: TRadioGroup;
    edtConsultar: TEdit;
    btnConsultar: TBitBtn;
    grdConsultar: TDBGrid;
    Panel3: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    Panel1: TPanel;
    BtAdicionar: TBitBtn;
    BtEditar: TBitBtn;
    BtExcluir: TBitBtn;
    BtPesquisar: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    Panel4: TPanel;
    Image1: TImage;
    dsCadastro: TDataSource;
    procedure BtSairClick(Sender: TObject);
    procedure rgConsultarClick(Sender: TObject);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtPesquisarClick(Sender: TObject);
    procedure dsConsultarStateChange(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure TabSheet2Show(Sender: TObject);
    procedure edtConsultarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure habilitaBotoes(const oper: Char);
    procedure habilitaCampos(const tof: Boolean);
    procedure ChangeEnter(Sender: TObject);
    procedure ChangeExit(Sender: TObject);
    
  protected
    strOper : Char;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;
  M_CODCOR : TColor;

implementation

uses uFuncoes, udmDados;

{$R *.dfm}

procedure TfrmCadastro.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmCadastro.habilitaBotoes(const oper: Char);
begin
  case oper of
    'I': //Inclusão
    begin
      BtAdicionar.Enabled := False;
      BtGravar.Enabled := True;
      BtCancelar.Enabled := True;
      BtExcluir.Enabled := False;
      BtSair.Enabled := False;
      PageControl1.Pages[1].TabVisible := False;
      //sbStatus.Panels[0].Text := 'Incluindo';
    end;
    'A': //Alteração
    begin
      BtAdicionar.Enabled := False;
      BtGravar.Enabled := True;
      BtCancelar.Enabled := True;
      BtExcluir.Enabled := True;
      BtSair.Enabled := False;
      PageControl1.Pages[1].TabVisible := False;
      //sbStatus.Panels[0].Text := 'Alterando';
    end;
    'C': //Consulta
    begin
      BtAdicionar.Enabled := True;
      BtGravar.Enabled := False;
      BtCancelar.Enabled := False;
      BtExcluir.Enabled := False;
      BtSair.Enabled := True;
      PageControl1.Pages[1].TabVisible := True;
      //sbStatus.Panels[0].Text := 'Consultando';
    end;
  end;
end;

procedure TfrmCadastro.habilitaCampos(const tof: Boolean);
var
  i : Integer;
  cor : TColor;
begin
  if tof then
    cor := clWindow
  else
    cor := clBtnFace;
  for i := 0 to PageControl1.Pages[0].ControlCount - 1 do
  begin
    if (PageControl1.Pages[0].Controls[i] is TEdit) then
    begin
      (PageControl1.Pages[0].Controls[i] as TEdit).Enabled := tof;
      (PageControl1.Pages[0].Controls[i] as TEdit).Color := cor;
    end
    else
    if (PageControl1.Pages[0].Controls[i] is TComboBox) then
    begin
      (PageControl1.Pages[0].Controls[i] as TComboBox).Enabled := tof;
      (PageControl1.Pages[0].Controls[i] as TComboBox).Color := cor;
    end
    else
    if (PageControl1.Pages[0].Controls[i] is TMaskEdit) then
    begin
      (PageControl1.Pages[0].Controls[i] as TMaskEdit).Enabled := tof;
      (PageControl1.Pages[0].Controls[i] as TMaskEdit).Color := cor;
    end
    else
    if (PageControl1.Pages[0].Controls[i] is TDBLookupComboBox) then
    begin
      (PageControl1.Pages[0].Controls[i] as TDBLookupComboBox).Enabled := tof;
      (PageControl1.Pages[0].Controls[i] as TDBLookupComboBox).Color := cor;
    end
    Else
    if (PageControl1.Pages[0].Controls[i] is TDBEdit) then
    begin
      (PageControl1.Pages[0].Controls[i] as TDBEdit).Enabled := tof;
      (PageControl1.Pages[0].Controls[i] as TDBEdit).Color := cor;
    end
    else
    if (PageControl1.Pages[0].Controls[i] is TRadioGroup) then
      (PageControl1.Pages[0].Controls[i] as TRadioGroup).Enabled := tof
    else
    if (PageControl1.Pages[0].Controls[i] is TCheckBox) then
      (PageControl1.Pages[0].Controls[i] as TCheckBox).Enabled := tof;
  end;
end;

procedure TfrmCadastro.rgConsultarClick(Sender: TObject);
begin
  case rgConsultar.ItemIndex of
    0:
    begin
      lblConsultar.Caption := 'Código:';
      edtConsultar.Clear;
    end;
    1:
    begin
      lblConsultar.Caption := 'Nome/Descrição:';
      edtConsultar.Clear;
    end;
  end;
  if edtConsultar.CanFocus then
    edtConsultar.SetFocus;
end;

procedure TfrmCadastro.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
  if rgConsultar.ItemIndex = 0 then
  begin
    if not( key in['0'..'9', #8, #13] ) then
    begin
      beep;
      key:=#0;
    end;
  end;
  //
  If (key = #13) and not uFuncoes.Empty(edtConsultar.Text) Then
    begin
         Key := #0;
         If (btnConsultar.Enabled = True) Then
            btnConsultar.SetFocus;
    End;
end;

procedure TfrmCadastro.edtConsultarChange(Sender: TObject);
begin
  If uFuncoes.Empty(edtConsultar.Text) Then
      cdsConsultar.Close;
  //
  btnConsultar.Enabled := not Empty(edtConsultar.Text);
end;

procedure TfrmCadastro.btnConsultarClick(Sender: TObject);
begin
  strOper := 'A';
  //limpaCampos;
  {habilitaBotoes(strOper);
  habilitaCampos(True);}
end;

procedure TfrmCadastro.sbPrimeiroClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
        dsConsultar.DataSet.First;
end;

procedure TfrmCadastro.sbProximoClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
        dsConsultar.DataSet.Next;
end;

procedure TfrmCadastro.sbAnteriorClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
         dsConsultar.DataSet.Prior;
end;

procedure TfrmCadastro.sbUltimoClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
        dsConsultar.DataSet.Last;
end;

procedure TfrmCadastro.grdConsultarDblClick(Sender: TObject);
begin
  strOper := 'A';
  {habilitaBotoes(strOper);
  habilitaCampos(True);}
end;

procedure TfrmCadastro.BtAdicionarClick(Sender: TObject);
begin
  strOper := 'I';
  if dsConsultar.DataSet.Active then
    dsConsultar.DataSet.Close;
  //
  TabSheet2.TabVisible := False;     
end;

procedure TfrmCadastro.BtGravarClick(Sender: TObject);
begin
  strOper := 'C';
  TabSheet2.TabVisible := True;   
end;

procedure TfrmCadastro.BtCancelarClick(Sender: TObject);
begin
  strOper := 'C';
  TabSheet2.TabVisible := True;
{  if dsConsultar.DataSet.Active then
    dsConsultar.DataSet.Close;
  habilitaBotoes(strOper);
  habilitaCampos(False);}
end;

procedure TfrmCadastro.BtExcluirClick(Sender: TObject);
begin
  strOper := 'C';
{  if dsConsultar.DataSet.Active then
    dsConsultar.DataSet.Close;
  habilitaBotoes(strOper);
  habilitaCampos(False);}
end;

procedure TfrmCadastro.BtEditarClick(Sender: TObject);
begin
  strOper := 'A';
{  habilitaBotoes(strOper);
  habilitaCampos(True);}
  TabSheet2.TabVisible := False;
end;

procedure TfrmCadastro.BtPesquisarClick(Sender: TObject);
begin
     PageControl1.ActivePageIndex := 1;
end;

procedure TfrmCadastro.dsConsultarStateChange(Sender: TObject);
begin
//  btnAlterar.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty);
end;

procedure TfrmCadastro.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
  sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
  sbAnterior.Enabled := sbPrimeiro.Enabled;
  sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
  sbProximo.Enabled := sbUltimo.Enabled;
end;

procedure TfrmCadastro.TabSheet2Show(Sender: TObject);
begin
     edtConsultar.Clear; 
     cdsConsultar.Close;
     //
     btnConsultar.Enabled := False;
     edtConsultar.SetFocus; 
end;


procedure TfrmCadastro.edtConsultarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If (cdsConsultar.Active = True) Then
   Begin
     IF (KEY = VK_UP) then
          cdsConsultar.Prior;
     //
     IF (KEY = VK_DOWN) then
          cdsConsultar.Next;
   End;
end;

procedure TfrmCadastro.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
     BtAdicionar.Enabled := dsCadastro.DataSet.State in [dsBrowse];
     BtEditar.Enabled    := dsCadastro.DataSet.State in [dsBrowse];
     BtExcluir.Enabled   := dsCadastro.DataSet.State in [dsBrowse];
     //
     BtPesquisar.Enabled := dsCadastro.DataSet.State in [dsBrowse];
     BtGravar.Enabled    := dsCadastro.DataSet.State in [dsInsert, dsEdit];
     BtCancelar.Enabled  := dsCadastro.DataSet.State in [dsInsert, dsEdit];
     //
     BtSair.Enabled      := dsCadastro.DataSet.State in [dsBrowse];
end;

procedure TfrmCadastro.ChangeEnter(Sender: TObject);
begin
    if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
    begin
         if Sender is TDBEdit then
           TDBEdit(Sender).Color := M_CODCOR
         else if Sender is TDBLookupComboBox then
           TDBLookupComboBox(Sender).Color := M_CODCOR
         else if Sender is TDBComboBox then
           TDBComboBox(Sender).Color := M_CODCOR
         else if Sender is TDBMemo then
           TDBMemo(Sender).Color := M_CODCOR
         else if Sender is TDBDateEdit then
           TDBDateEdit(Sender).Color := M_CODCOR;
    End;
end;

procedure TfrmCadastro.ChangeExit(Sender: TObject);
begin
if Sender is TDBEdit then
    TDBEdit(Sender).Color := clWindow
  else if Sender is TDBLookupComboBox then
    TDBLookupComboBox(Sender).Color := clWindow
  else if Sender is TDBComboBox then
    TDBComboBox(Sender).Color := clWindow
  else if Sender is TDBMemo then
    TDBMemo(Sender).Color := clWindow;
end;

procedure TfrmCadastro.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  M_CODCOR := StringtoColor('clYellow');
  KeyPreview := true;
  //
 { for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TDBEdit then
    begin
      TDBEdit(Components[I]).OnEnter  := ChangeEnter;
      TDBEdit(Components[I]).OnExit   := ChangeExit;
    end
    else
    if Components[I] is TDBLookupComboBox then
    begin
      TDBLookupComboBox(Components[I]).OnEnter := ChangeEnter;
      TDBLookupComboBox(Components[I]).OnExit  := ChangeExit;
    end
    else
    if Components[I] is TDBComboBox then
    begin
      TDBComboBox(Components[I]).OnEnter := ChangeEnter;
      TDBComboBox(Components[I]).OnExit  := ChangeExit;
    end
    else
    if Components[I] is TDBMemo then
    begin
      TDBMemo(Components[I]).OnEnter   := ChangeEnter;
      TDBMemo(Components[I]).OnExit    := ChangeExit;
    end
  end; }
end;

procedure TfrmCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dsCadastro.DataSet.Close;
end;

end.
