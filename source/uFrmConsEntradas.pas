unit uFrmConsEntradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmConsulta, FMTBcd, DB, DBClient, Provider, SqlExpr, jpeg,
  ExtCtrls, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, ToolEdit;

type
  TfrmConsEntradas = class(TfrmConsulta)
    cdsMedicamentosID_ENTRADA: TIntegerField;
    cdsMedicamentosNR_NOTAFISCAL: TIntegerField;
    cdsMedicamentosDATA_NOTA: TDateField;
    cdsMedicamentosDATA_RECEBIMENTO: TDateField;
    cdsMedicamentosCNPJ_ORIGEM: TStringField;
    cdsMedicamentosCNPJ_DESTINO: TStringField;
    cdsInsumosID_ENTRADA: TIntegerField;
    cdsInsumosNR_NOTAFISCAL: TIntegerField;
    cdsInsumosDATA_NOTA: TDateField;
    cdsInsumosDATA_RECEBIMENTO: TDateField;
    cdsInsumosCNPJ_ORIGEM: TStringField;
    cdsInsumosCNPJ_DESTINO: TStringField;
    cdsMedicamentosSITUACAO: TStringField;
    cdsMedicamentosARQUIVO: TStringField;
    cdsMedicamentosDATA_ARQUIVO: TDateField;
    cdsInsumosARQUIVO: TStringField;
    cdsInsumosDATA_ARQUIVO: TDateField;
    DBGrid1: TDBGrid;
    dspPadrao: TSQLDataSet;
    dspPadrao2: TDataSetProvider;
    cdsItensEntrada: TClientDataSet;
    dsItensEntrada: TDataSource;
    cdsItensEntradaID_ENTRADA: TIntegerField;
    cdsItensEntradaREGISTRO_MS: TStringField;
    cdsItensEntradaPRO_MEDICAMENTO: TStringField;
    cdsItensEntradaNUMERO_LOTE: TStringField;
    cdsItensEntradaQUANTIDADE: TBCDField;
    cdsMedicamentosID_LOJA: TIntegerField;
    procedure btnConsulta1Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsMedicamentosDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure edtDTINCIALEnter(Sender: TObject);
  private
    { Private declarations }
    Procedure Cons_Medicamentos(aDtInicial, aDtFim : TDate; aFluxo : String);
    procedure ItensEntrada(aEntrada : integer);    
  public
    { Public declarations }
  end;

var
  frmConsEntradas: TfrmConsEntradas;

implementation

uses udmDados;

{$R *.dfm}

{ TfrmConsEntradas }

procedure TfrmConsEntradas.Cons_Medicamentos(aDtInicial, aDtFim: TDate; aFluxo : String);
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

procedure TfrmConsEntradas.btnConsulta1Click(Sender: TObject);
begin
  inherited;
        btnCancelar.Enabled := False;
        Cons_Medicamentos(edtDTINCIAL.Date, edtDTFINAL.Date, 'N');
end;

procedure TfrmConsEntradas.btnCancelarClick(Sender: TObject);
Var
   W_NRENTR : integer;
begin
  inherited;
  if (PageControl1.ActivePageIndex = 0) Then
  begin
    if not (cdsMedicamentos.IsEmpty) and
       (cdsMedicamentos.RecordCount > 0) then
     begin
         If Application.MessageBox('Deseja cancelar entrada?' , 'Cancelamento',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
         Begin
              W_NRENTR := cdsMedicamentosID_ENTRADA.AsInteger;
              if not (dmdados.Cancela_Entrada(W_NRENTR, cdsMedicamentosID_LOJA.AsInteger)) Then
                  raise Exception.Create('Erro no cancelamento da entrada.');
              //
              Cons_Medicamentos(edtDTINCIAL.Date, edtDTFINAL.Date, 'N');
         end;
     End;
  End;
end;

procedure TfrmConsEntradas.dsMedicamentosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
      btnCancelar.Enabled := (cdsMedicamentosSITUACAO.AsString = 'F');
      //
      ItensEntrada(cdsMedicamentosID_ENTRADA.AsInteger);      
end;

procedure TfrmConsEntradas.FormShow(Sender: TObject);
begin
  inherited;
     btnCancelar.Enabled := False;
end;

procedure TfrmConsEntradas.ItensEntrada(aEntrada: integer);
begin
     With cdsItensEntrada do
      begin
           DisableControls;
           Close;
           Params[0].AsInteger := aEntrada;
           Open;
           EnableControls;
      End;
end;

procedure TfrmConsEntradas.edtDTINCIALEnter(Sender: TObject);
begin
  inherited;
    If (dsItensEntrada.DataSet.Active) Then
          dsItensEntrada.DataSet.close;
end;

end.
