unit uFrmConsPerdas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmConsulta, FMTBcd, DB, DBClient, Provider, SqlExpr, jpeg,
  ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, ToolEdit, ComCtrls;

type
  TfrmConsPerdas = class(TfrmConsulta)
    cdsMedicamentosDATA_PERDA: TDateField;
    cdsMedicamentosREGISTRO_MS: TStringField;
    cdsMedicamentosPRO_MEDICAMENTO: TStringField;
    cdsMedicamentosNUMERO_LOTE: TStringField;
    cdsMedicamentosQUANTIDADE: TFMTBCDField;
    cdsMedicamentosDESCRICAO: TStringField;
    cdsInsumosDATA_PERDA: TDateField;
    cdsInsumosREGISTRO_MS: TStringField;
    cdsInsumosPRO_MEDICAMENTO: TStringField;
    cdsInsumosNUMERO_LOTE: TStringField;
    cdsInsumosQUANTIDADE: TFMTBCDField;
    cdsInsumosDESCRICAO: TStringField;
    cdsMedicamentosSITUACAO: TStringField;
    cdsMedicamentosID_PERDA: TIntegerField;
    cdsMedicamentosARQUIVO: TStringField;
    cdsMedicamentosDATA_ARQUIVO: TDateField;
    cdsInsumosARQUIVO: TStringField;
    cdsInsumosDATA_ARQUIVO: TDateField;
    procedure btnConsulta1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsMedicamentosDataChange(Sender: TObject; Field: TField);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Cons_Medicamentos(aDtInicial, aDtFim : TDate; aFluxo : String);
  public
    { Public declarations }
  end;

var
  frmConsPerdas: TfrmConsPerdas;

implementation

uses udmDados;

{$R *.dfm}

{ TfrmConsPerdas }

procedure TfrmConsPerdas.Cons_Medicamentos(aDtInicial, aDtFim: TDate;
  aFluxo: String);
begin
   If (aFluxo = 'N') Then
   begin
     With cdsMedicamentos do
      begin
           Close;
           Params[0].AsDate   := aDtInicial;
           Params[1].AsDate   := aDtFim;
           Params[2].AsString := aFluxo;
           Open;
           //
           If (IsEmpty) Then
            raise Exception.Create('Não há movimento no período indicado.');
      End;
   End;
   //
   If (aFluxo = 'S') Then
   begin
      With cdsinsumos do
        begin
           Close;
           Params[0].AsDate   := aDtInicial;
           Params[1].AsDate   := aDtFim;
           Params[2].AsString := aFluxo;
           Open;
           //
           If (IsEmpty) Then
            raise Exception.Create('Não há movimento no período indicado.');
      End;
   End;
end;

procedure TfrmConsPerdas.btnConsulta1Click(Sender: TObject);
begin
  inherited;
       btnCancelar.Enabled := False;
       Cons_Medicamentos(edtDTINCIAL.Date, edtDTFINAL.Date, 'N');
end;

procedure TfrmConsPerdas.FormShow(Sender: TObject);
begin
  inherited;
    btnCancelar.Enabled := False;
end;

procedure TfrmConsPerdas.dsMedicamentosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
      btnCancelar.Enabled := (cdsMedicamentosSITUACAO.AsString = 'F');
end;

procedure TfrmConsPerdas.btnCancelarClick(Sender: TObject);
Var
   W_NRPERD : integer;
begin
  inherited;
  if (PageControl1.ActivePageIndex = 0) Then
  begin
    if not (cdsMedicamentos.IsEmpty) and
       (cdsMedicamentos.RecordCount > 0) then
     begin
         If Application.MessageBox('Deseja cancelar perda?' , 'Cancelamento',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
         Begin
              W_NRPERD := cdsMedicamentosID_PERDA.AsInteger;
              if not (dmdados.Cancela_Perda(W_NRPERD)) Then
                  raise Exception.Create('Erro no cancelamento da perda.');
              //
              Cons_Medicamentos(edtDTINCIAL.Date, edtDTFINAL.Date, 'N');
         end;
     End;
  End;
end;

end.
