unit uFrmLocPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, FMTBcd, DBClient,
  Provider, DB, SqlExpr;

type
  TfrmLocalizaPadrao = class(TForm)
    Panel2: TPanel;
    lblConsultar: TLabel;
    rgConsultar: TRadioGroup;
    edtConsultar: TEdit;
    btnConsultar: TBitBtn;
    Panel3: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    Panel1: TPanel;
    grdConsultar: TDBGrid;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    procedure rgConsultarClick(Sender: TObject);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure edtConsultarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocalizaPadrao: TfrmLocalizaPadrao;

implementation

uses uFuncoes, udmDados;

{$R *.dfm}

procedure TfrmLocalizaPadrao.rgConsultarClick(Sender: TObject);
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

procedure TfrmLocalizaPadrao.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
  if rgConsultar.ItemIndex = 0 then
  begin
    if not( key in['0'..'9', #8] ) then
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

procedure TfrmLocalizaPadrao.sbPrimeiroClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
        dsConsultar.DataSet.First;
end;

procedure TfrmLocalizaPadrao.sbAnteriorClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
         dsConsultar.DataSet.Prior;
end;

procedure TfrmLocalizaPadrao.sbProximoClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
        dsConsultar.DataSet.Next;
end;

procedure TfrmLocalizaPadrao.sbUltimoClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
        dsConsultar.DataSet.Last;
end;

procedure TfrmLocalizaPadrao.FormShow(Sender: TObject);
begin
     edtConsultar.Clear; 
     cdsConsultar.Close;
     //
     edtConsultar.SetFocus;
end;

procedure TfrmLocalizaPadrao.grdConsultarDblClick(Sender: TObject);
begin
      If (cdsConsultar.Active) Then
         Close; 
end;

procedure TfrmLocalizaPadrao.edtConsultarChange(Sender: TObject);
begin
  If uFuncoes.Empty(edtConsultar.Text) Then
      cdsConsultar.Close;
  //
  btnConsultar.Enabled := (edtConsultar.Text <> '');
end;

procedure TfrmLocalizaPadrao.edtConsultarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If (cdsConsultar.Active) Then
   Begin
     IF (KEY = VK_UP) then
          cdsConsultar.Prior;
     //
     IF (KEY = VK_DOWN) then
          cdsConsultar.Next;
   End;
end;

procedure TfrmLocalizaPadrao.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
  sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
  sbAnterior.Enabled := sbPrimeiro.Enabled;
  sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
  sbProximo.Enabled := sbUltimo.Enabled;
end;

end.
