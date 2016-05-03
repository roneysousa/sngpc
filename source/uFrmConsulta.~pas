unit uFrmConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, FMTBcd,
  DB, SqlExpr, Provider, DBClient, jpeg, Mask, ToolEdit;

type
  TfrmConsulta = class(TForm)
    Panel1: TPanel;
    bntFechar: TBitBtn;
    dstConsulta: TSQLDataSet;
    dspConsulta: TDataSetProvider;
    cdsMedicamentos: TClientDataSet;
    cdsInsumos: TClientDataSet;
    dsMedicamentos: TDataSource;
    dsInsumos: TDataSource;
    Panel4: TPanel;
    Image1: TImage;
    btnCancelar: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    pnlSuperior: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    edtDTINCIAL: TDateEdit;
    edtDTFINAL: TDateEdit;
    btnConsulta1: TBitBtn;
    grdConsultar: TDBGrid;
    procedure bntFecharClick(Sender: TObject);
    procedure edtDTINCIALExit(Sender: TObject);
    procedure edtDTFINALExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDTINCIALEnter(Sender: TObject);
    procedure edtDTINCIAL2Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsulta: TfrmConsulta;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

procedure TfrmConsulta.bntFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmConsulta.edtDTINCIALExit(Sender: TObject);
begin
    If not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINCIAL.Text)) Then
    Begin
        try
            StrToDate(edtDTINCIAL.Text);
            edtDTINCIAL.Date := StrToDate(edtDTINCIAL.Text);
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

procedure TfrmConsulta.edtDTFINALExit(Sender: TObject);
begin
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

procedure TfrmConsulta.FormShow(Sender: TObject);
begin
      dmDados.RefreshCDS(dmDados.cdsConfig);
      if not uFuncoes.Empty(uFuncoes.RemoveChar(dmDados.cdsConfigCFG_DATA_ATUAL.AsString)) Then
      Begin
           edtDTINCIAL.Date := dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime;
           edtDTFINAL.Date  := edtDTINCIAL.Date;
      End
      Else
      begin
          edtDTINCIAL.Date := Date;
          edtDTFINAL.Date  := Date;
      End;
      //
      PageControl1.ActivePageIndex := 0; 
end;

procedure TfrmConsulta.edtDTINCIALEnter(Sender: TObject);
begin
     If not (cdsMedicamentos.IsEmpty) Then
          cdsMedicamentos.Close;
end;

procedure TfrmConsulta.edtDTINCIAL2Enter(Sender: TObject);
begin
     If not (cdsInsumos.IsEmpty) Then
          cdsInsumos.Close;
end;

end.
