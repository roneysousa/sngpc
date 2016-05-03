unit ufrmLocProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmLocPadrao, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls;

type
  TfrmLocProduto = class(TfrmLocalizaPadrao)
    cdsConsultarPRO_RG_MS_MEDICAMENTO: TStringField;
    cdsConsultarPRO_MEDICAMENTO: TStringField;
    procedure edtConsultarChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocProduto: TfrmLocProduto;

implementation

uses uFuncoes;

{$R *.dfm}

procedure TfrmLocProduto.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := 'select PRO_RG_MS_MEDICAMENTO, PRO_MEDICAMENTO from PRODUTOS ';
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (PRO_RG_MS_MEDICAMENTO = :pCODIGO)';
                1: CommandText := CommandText + ' Where (UPPER(PRO_MEDICAMENTO) like :pNOME)';
            end;
            CommandText := CommandText + ' order by PRO_MEDICAMENTO';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pCODIGO').AsString := Copy(edtConsultar.Text,1,13);
                1: datasetConsultar.Params.ParamByName('pNOME').AsString   := edtConsultar.Text + '%';
            end;
            Active := True;
        end;
        cdsConsultar.FetchParams;
        cdsConsultar.Open;
   End;
end;

procedure TfrmLocProduto.btnConsultarClick(Sender: TObject);
begin
  inherited;
    If not (cdsConsultar.IsEmpty) Then
          close;
end;

end.
