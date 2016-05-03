unit uFrmConsVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmConsulta, FMTBcd, DB, DBClient, Provider, SqlExpr, jpeg,
  ExtCtrls, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, ToolEdit;

type
  TfrmConsultaVendas = class(TfrmConsulta)
    cdsInsumosID_VENDA: TIntegerField;
    cdsInsumosDATA_VENDA: TDateField;
    cdsInsumosNOME_COMPRADOR: TStringField;
    cdsInsumosSITUACAO: TStringField;
    cdsInsumosARQUIVO: TStringField;
    cdsInsumosDATA_ARQUIVO: TDateField;
    dbGridProdutos: TDBGrid;
    dspProdutos: TSQLDataSet;
    dspItensVenda: TDataSetProvider;
    cdsItensVenda: TClientDataSet;
    dsItens: TDataSource;
    cdsItensVendaID_VENDA: TIntegerField;
    cdsItensVendaREGISTRO_MS: TStringField;
    cdsItensVendaPRO_MEDICAMENTO: TStringField;
    cdsItensVendaNUMERO_LOTE: TStringField;
    cdsItensVendaQUANT_MEDICAMENTO: TBCDField;
    dstConsultaID_VENDA: TIntegerField;
    dstConsultaDATA_VENDA: TDateField;
    dstConsultaSITUACAO: TStringField;
    dstConsultaARQUIVO: TStringField;
    dstConsultaDATA_ARQUIVO: TDateField;
    dstConsultaNR_NOT_MEDICAMENTO: TStringField;
    dstConsultaNOME_COMPRADOR: TStringField;
    cdsMedicamentosID_VENDA: TIntegerField;
    cdsMedicamentosDATA_VENDA: TDateField;
    cdsMedicamentosSITUACAO: TStringField;
    cdsMedicamentosARQUIVO: TStringField;
    cdsMedicamentosDATA_ARQUIVO: TDateField;
    cdsMedicamentosNR_NOT_MEDICAMENTO: TStringField;
    cdsMedicamentosNOME_COMPRADOR: TStringField;
    cdsInsumosNR_NOT_MEDICAMENTO: TStringField;
    dstConsultar2: TSQLDataSet;
    dspConsulta2: TDataSetProvider;
    cdsMedicamentosID_LOJA: TIntegerField;
    cdsMedicamentosPAC_NOME: TStringField;
    cdsMedicamentosPAC_DATA_NASC: TDateField;
    cdsMedicamentosPAC_IDADE: TIntegerField;
    cdsMedicamentosPAC_SEXO: TStringField;
    cdsItensVendaUSO_PROLONGADO: TStringField;
    procedure btnConsulta1Click(Sender: TObject);
    procedure btnConsultar2Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsMedicamentosDataChange(Sender: TObject; Field: TField);
    procedure TabSheet2Show(Sender: TObject);
    procedure edtDTINCIALEnter(Sender: TObject);
  private
    { Private declarations }
    procedure Consulta;
    procedure Consulta_Insumos;
    procedure ItensVenda(aVenda : integer);
  public
    { Public declarations }
  end;

var
  frmConsultaVendas: TfrmConsultaVendas;

implementation

uses udmDados, DateUtils;

{$R *.dfm}

{ TfrmConsultaVendas }

procedure TfrmConsultaVendas.Consulta;
begin
     With cdsMedicamentos do
      begin
           Close;
           Params.ParamByName('pINICIAL').AsDate := edtDTINCIAL.Date;
           Params.ParamByName('pFIM').AsDate     := edtDTFINAL.Date;
           //Params.ParamByName('SITUACAO').AsString := 'F';
           Open;
           //
           If (IsEmpty) Then
            begin 
                raise Exception.Create('Não há movimento no período indicado.');
            End;
      End;
end;

procedure TfrmConsultaVendas.btnConsulta1Click(Sender: TObject);
begin
  inherited;
         btnCancelar.Enabled := False;
         Consulta;
end;

procedure TfrmConsultaVendas.Consulta_Insumos;
begin
    
end;

procedure TfrmConsultaVendas.btnConsultar2Click(Sender: TObject);
begin
  inherited;
      Consulta_Insumos;
end;

procedure TfrmConsultaVendas.btnCancelarClick(Sender: TObject);
Var
   M_NRVEND, iLoja : integer;
begin
  inherited;
  if (PageControl1.ActivePageIndex = 0) Then
  begin
    if not (cdsMedicamentos.IsEmpty) and
       (cdsMedicamentos.RecordCount > 0) then
     begin
         If Application.MessageBox('Deseja cancelar venda?' , 'Cancelamento',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
         Begin
              iLoja := cdsMedicamentosID_LOJA.AsInteger;
              M_NRVEND := cdsMedicamentosID_VENDA.AsInteger;
              if not (dmdados.Cancela_Venda(M_NRVEND, iLoja)) Then
                  raise Exception.Create('Erro no cancelamento de venda.');
              Consulta;
         end;
     End;
  End;
  //
end;

procedure TfrmConsultaVendas.FormShow(Sender: TObject);
begin
  inherited;
       btnCancelar.Enabled := False;
end;

procedure TfrmConsultaVendas.dsMedicamentosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
      btnCancelar.Enabled := (cdsMedicamentosSITUACAO.AsString = 'F');
      //
      ItensVenda(cdsMedicamentosID_VENDA.AsInteger);
end;

procedure TfrmConsultaVendas.ItensVenda(aVenda: integer);
begin
     With cdsItensVenda do
      begin
           DisableControls;
           Close;
           Params[0].AsInteger := aVenda;
           Open;
           EnableControls;
      End;
end;

procedure TfrmConsultaVendas.TabSheet2Show(Sender: TObject);
begin
  inherited;
      if (cdsItensVenda.Active) Then
         cdsItensVenda.Close;
end;

procedure TfrmConsultaVendas.edtDTINCIALEnter(Sender: TObject);
begin
  inherited;
        If (dsItens.DataSet.Active) Then
           dsItens.DataSet.close;
end;

end.
