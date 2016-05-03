unit uFrmLocOrgaoExpedidor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmLocPadrao, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls;

type
  TfrmLocOrgaoExpedidor = class(TfrmLocalizaPadrao)
    cdsConsultarID_ORGAO: TIntegerField;
    cdsConsultarSIGLA_ORGAO: TStringField;
    cdsConsultarDESCRICAO: TStringField;
    procedure edtConsultarChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocOrgaoExpedidor: TfrmLocOrgaoExpedidor;

implementation

uses uFuncoes;

{$R *.dfm}

procedure TfrmLocOrgaoExpedidor.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := 'select ID_ORGAO, SIGLA_ORGAO, DESCRICAO from ORGAO_EXPEDIDOR ';
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (ID_ORGAO = :pCODIGO)';
                1: CommandText := CommandText + ' Where (UPPER(SIGLA_ORGAO) like :pNOME)';
            end;
            CommandText := CommandText + ' order by DESCRICAO';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtConsultar.Text);
                1: datasetConsultar.Params.ParamByName('pNOME').AsString   := Copy(edtConsultar.Text,1,9) + '%';
            end;
            Active := True;
        end;
        cdsConsultar.FetchParams;
        cdsConsultar.Open;
   End;
end;

procedure TfrmLocOrgaoExpedidor.btnConsultarClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
       Close;
end;

end.
