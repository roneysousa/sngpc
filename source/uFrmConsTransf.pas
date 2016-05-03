unit uFrmConsTransf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmConsulta, FMTBcd, DB, DBClient, Provider, SqlExpr, jpeg,
  ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, ToolEdit, ComCtrls;

type
  TfrmConsTransf = class(TfrmConsulta)
    cdsMedicamentosNR_NOTAFISCAL: TIntegerField;
    cdsMedicamentosDATA_NOTA: TDateField;
    cdsMedicamentosREGISTRO_MS: TStringField;
    cdsMedicamentosPRO_MEDICAMENTO: TStringField;
    cdsMedicamentosNUMERO_LOTE: TStringField;
    cdsInsumosNR_NOTAFISCAL: TIntegerField;
    cdsInsumosDATA_NOTA: TDateField;
    cdsInsumosEMP_FANTASIA: TStringField;
    cdsInsumosEMP_FANTASIA_1: TStringField;
    cdsInsumosREGISTRO_MS: TStringField;
    cdsInsumosPRO_MEDICAMENTO: TStringField;
    cdsInsumosNUMERO_LOTE: TStringField;
    cdsInsumosCNPJ_FORNECEDOR: TStringField;
    cdsMedicamentosID_TRANSFERENCIA: TIntegerField;
    cdsInsumosID_TRANSFERENCIA: TIntegerField;
    cdsMedicamentosDATA_TRANSFERENCIA: TDateField;
    cdsMedicamentosSITUACAO: TStringField;
    cdsMedicamentosARQUIVO: TStringField;
    cdsMedicamentosDATA_ARQUIVO: TDateField;
    cdsInsumosARQUIVO: TStringField;
    cdsInsumosDATA_ARQUIVO: TDateField;
    cdsMedicamentosQUANT_MEDICAMENTO: TBCDField;
    cdsInsumosQUANT_MEDICAMENTO: TBCDField;
    cdsMedicamentosCNPJ_ORIGEM: TStringField;
    cdsMedicamentosCNPJ_DESTINO: TStringField;
    procedure btnConsulta1Click(Sender: TObject);
    procedure btnConsultar2Click(Sender: TObject);
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
  frmConsTransf: TfrmConsTransf;

implementation

uses udmDados;

{$R *.dfm}

procedure TfrmConsTransf.Cons_Medicamentos(aDtInicial, aDtFim: TDate;
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

procedure TfrmConsTransf.btnConsulta1Click(Sender: TObject);
begin
  inherited;
       btnCancelar.Enabled := False;
       Cons_Medicamentos(edtDTINCIAL.Date, edtDTFINAL.Date, 'N');
end;

procedure TfrmConsTransf.btnConsultar2Click(Sender: TObject);
begin
  inherited;
      btnCancelar.Enabled := False;

end;

procedure TfrmConsTransf.FormShow(Sender: TObject);
begin
  inherited;
     btnCancelar.Enabled := False;
end;

procedure TfrmConsTransf.dsMedicamentosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
      btnCancelar.Enabled := (cdsMedicamentosSITUACAO.AsString = 'F');
end;

procedure TfrmConsTransf.btnCancelarClick(Sender: TObject);
Var
   W_NRTRAN : integer;
begin
  inherited;
  if (PageControl1.ActivePageIndex = 0) Then
  begin
    if not (cdsMedicamentos.IsEmpty) and
       (cdsMedicamentos.RecordCount > 0) then
     begin
         If Application.MessageBox('Deseja cancelar transferência?' , 'Cancelamento',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
         Begin
              W_NRTRAN := cdsMedicamentosID_TRANSFERENCIA.AsInteger;
              if not (dmdados.Cancela_Transf(W_NRTRAN)) Then
                  raise Exception.Create('Erro no cancelamento da transferência.');
              //
              Cons_Medicamentos(edtDTINCIAL.Date, edtDTFINAL.Date, 'N');
         end;
     End;
  End;
end;

end.
