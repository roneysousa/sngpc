unit uFrmLocProdutoEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmLocPadrao, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls;

type
  TfrmLocProdutoEstoque = class(TfrmLocalizaPadrao)
    cdsConsultarPRO_RG_MS_MEDICAMENTO: TStringField;
    cdsConsultarPRO_MEDICAMENTO: TStringField;
    cdsConsultarEST_CDLOJA: TIntegerField;
    cdsConsultarQUANT: TFMTBCDField;
    procedure edtConsultarChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure rgConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocProdutoEstoque: TfrmLocProdutoEstoque;
  M_CDLOJA : Integer;

implementation

uses uFuncoes;

{$R *.dfm}

procedure TfrmLocProdutoEstoque.edtConsultarChange(Sender: TObject);
Var
   aTexto : String;
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        aTexto := 'Select P.PRO_RG_MS_MEDICAMENTO, P.PRO_MEDICAMENTO, E.est_cdloja, Sum(E.est_quantidade) as QUANT ';
        aTexto := aTexto  + ' from PRODUTOS P Inner Join ESTOQUE E on P.pro_rg_ms_medicamento = E.est_cdprod ';
        //
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            //
            case rgConsultar.ItemIndex of
                0: aTexto := aTexto + ' Where  (PRO_RG_MS_MEDICAMENTO = '+QuotedStr(Copy(edtConsultar.Text,1,13))+')';
                1: aTexto := aTexto + ' Where (UPPER(PRO_MEDICAMENTO) like '+QuotedStr(edtConsultar.Text + '%')+')';
            end;
            //
            If (M_CDLOJA > 0) Then
                aTexto := aTexto  + ' and (E.est_cdloja = '+QuotedStr(InttoStr(M_CDLOJA))+') '
            Else
                aTexto := aTexto  + ' and (E.est_cdloja = '+QuotedStr('1')+') ';
            CommandText := aTexto;
            //
            {case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pCODIGO').AsString := Copy(edtConsultar.Text,1,13);
                1: datasetConsultar.Params.ParamByName('pNOME').AsString   := edtConsultar.Text + '%';
            end;}
            //
            CommandText := CommandText + ' Group by P.PRO_RG_MS_MEDICAMENTO, P.PRO_MEDICAMENTO, E.est_cdloja Having (Sum(E.est_quantidade) > 0) order by P.PRO_MEDICAMENTO';
            //
            Active := True;
        end;
        cdsConsultar.FetchParams;
        cdsConsultar.Open;
   End;
end;

procedure TfrmLocProdutoEstoque.btnConsultarClick(Sender: TObject);
begin
  inherited;
    If not (cdsConsultar.IsEmpty) Then
          close;
end;

procedure TfrmLocProdutoEstoque.rgConsultarClick(Sender: TObject);
begin
//  inherited;
  case rgConsultar.ItemIndex of
    0:
    begin
      lblConsultar.Caption := 'Código MS:';
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

end.

