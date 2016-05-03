unit uFrmCadUsoMedicamneto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, DBClient, Provider, DB, SqlExpr, Buttons,
  Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, jpeg;

type
  TfrmCadUsoMedicamento = class(TfrmCadastro)
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    cdsConsultarID_TIPOMEDICAMENTO: TIntegerField;
    cdsConsultarDESCRICAO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure REGISTRO;
    Procedure BUSCAR;
  public
    { Public declarations }
  end;

var
  frmCadUsoMedicamento: TfrmCadUsoMedicamento;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

{ TfrmCadUsoMedicamento }

procedure TfrmCadUsoMedicamento.BUSCAR;
begin
     With dmDados.cdsUsoMedicamento do
     begin
         Close;
         Params.ParamByName('pID_TIPOMEDICAMENTO').AsInteger  :=
           cdsConsultar.FieldByName('ID_TIPOMEDICAMENTO').AsInteger;
         Open;
     End;
end;

procedure TfrmCadUsoMedicamento.REGISTRO;
begin
     dmDados.parametros;
     With dmDados.cdsUsoMedicamento  do
         begin
              close;
              Params.ParamByName('pID_TIPOMEDICAMENTO').AsInteger :=
                 uFuncoes.mvcodigo('ID_TIPOMEDICAMENTO','TIPOUSOMEDICAMENTO');
              Open;
         End;
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadUsoMedicamento.FormShow(Sender: TObject);
begin
  inherited;
     REGISTRO;
     If ( dsCadastro.DataSet.IsEmpty ) Then // dmDados.cdsConfigCFG_TIPO_USO_MEDICAMENTO.AsInteger = 0
          BtAdicionarClick(Sender);
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadUsoMedicamento.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  dmDados.Parametros;
  //
  With dmDados.cdsUsoMedicamento do
  begin
       Append;
       FieldByName('ID_TIPOMEDICAMENTO').AsInteger :=
           dmDados.cdsConfigCFG_TIPO_USO_MEDICAMENTO.AsInteger+ 1;
  End;
  dbeDescricao.SetFocus;
end;

procedure TfrmCadUsoMedicamento.BtEditarClick(Sender: TObject);
begin

  if  not (dmDados.cdsUsoMedicamento.IsEmpty)
    and (dmDados.cdsUsoMedicamento.RecordCount > 0) then
  Begin
       dmDados.cdsUsoMedicamento.Edit;
       dbeDescricao.SetFocus;
  End;
  inherited;
end;

procedure TfrmCadUsoMedicamento.BtExcluirClick(Sender: TObject);
begin
  inherited;
 if not (dmDados.cdsUsoMedicamento.IsEmpty) and
     (dmDados.cdsUsoMedicamento.RecordCount > 0) then
   begin
       If Application.MessageBox('Deseja excluir este registro?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            dmDados.cdsUsoMedicamento.Delete;
            dmDados.cdsUsoMedicamento.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadUsoMedicamento.BtCancelarClick(Sender: TObject);
begin
  inherited;
     dmDados.cdsUsoMedicamento.Cancel;
     //
     If (dmDados.cdsUsoMedicamento.IsEmpty) Then
       Close;
end;

procedure TfrmCadUsoMedicamento.BtGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbeDescricao.Text) Then
       Begin
           Application.MessageBox('Digite a descrição.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeDescricao.SetFocus;
           Exit;
       End;
     //
      try
          //
          if (dmDados.cdsUsoMedicamento.State in [dsinsert]) then
            begin
                 dmDados.parametros;
                 dmDados.CdsConfig.Edit;
                 dmDados.cdsConfig.FieldByName('CFG_TIPO_USO_MEDICAMENTO').AsInteger :=
                      dmDados.cdsConfig.FieldByName('CFG_TIPO_USO_MEDICAMENTO').AsInteger + 1;
                 dmDados.cdsUsoMedicamento.FieldByName('ID_TIPOMEDICAMENTO').AsInteger :=
                      dmDados.cdsConfig.FieldByName('CFG_TIPO_USO_MEDICAMENTO').AsInteger;
                 dmDados.CdsConfig.ApplyUpdates(0);
             end;
          //
          dmDados.cdsUsoMedicamento.ApplyUpdates(0);
          //
     Except
          on Exc:Exception do
            begin
               Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               BtCancelarClick(Sender);
            End;
     End;
     //
  inherited;
end;

procedure TfrmCadUsoMedicamento.btnConsultarClick(Sender: TObject);
begin
  inherited;
       buscar;
       PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadUsoMedicamento.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := 'select ID_TIPOMEDICAMENTO, DESCRICAO from TIPOUSOMEDICAMENTO ';
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (ID_TIPOMEDICAMENTO = :pID_TIPOMEDICAMENTO)';
                1: CommandText := CommandText + ' Where (UPPER(DESCRICAO) like :pDESCRICAO)';
            end;
            CommandText := CommandText + ' order by DESCRICAO';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pID_TIPOMEDICAMENTO').AsInteger := StrtoInt(edtConsultar.Text);
                1: datasetConsultar.Params.ParamByName('pDESCRICAO').AsString   := edtConsultar.Text + '%';
            end;
            Active := True;
        end;
        cdsConsultar.FetchParams;
        cdsConsultar.Open;
   End;
end;

procedure TfrmCadUsoMedicamento.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
         btnConsultarClick(Sender);
end;

end.
