unit uFrmCadUndInsumo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, DBClient, Provider, DB, SqlExpr, Buttons,
  Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, jpeg;

type
  TfrmCadUndInsumo = class(TfrmCadastro)
    Label3: TLabel;
    DBText1: TDBText;
    Label1: TLabel;
    dbeDescricao: TDBEdit;
    cdsConsultarID_UNDINSUMO: TIntegerField;
    cdsConsultarDESCRICAO: TStringField;
    procedure BtAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  frmCadUndInsumo: TfrmCadUndInsumo;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

procedure TfrmCadUndInsumo.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  dmDados.Parametros;
  //
  With dmDados.cdsUnidadeInsumo do
  begin
       Append;
       FieldByName('ID_UNDINSUMO').AsInteger :=
           dmDados.cdsConfigCFG_UND_INSUMO.AsInteger+ 1;
  End;
  dbeDescricao.SetFocus;
end;

procedure TfrmCadUndInsumo.BUSCAR;
begin
     With dmDados.cdsUnidadeInsumo do
     begin
         Close;
         Params.ParamByName('pID_UNDINSUMO').AsInteger  :=
           cdsConsultar.FieldByName('ID_UNDINSUMO').AsInteger;
         Open;
     End;
end;

procedure TfrmCadUndInsumo.REGISTRO;
begin
     dmDados.parametros;
     With dmDados.cdsUnidadeInsumo  do
         begin
              close;
              Params.ParamByName('pID_UNDINSUMO').AsInteger :=
                 uFuncoes.mvcodigo('ID_UNDINSUMO','TIPOUNIDADEINSUMO');
              Open;
         End;
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadUndInsumo.FormShow(Sender: TObject);
begin
  inherited;
     REGISTRO;
     If ( dsCadastro.DataSet.IsEmpty  ) Then  // dmDados.cdsConfigCFG_UND_INSUMO.AsInteger = 0
          BtAdicionarClick(Sender);
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadUndInsumo.BtEditarClick(Sender: TObject);
begin
  if  not (dmDados.cdsUnidadeInsumo.IsEmpty)
    and (dmDados.cdsUnidadeInsumo.RecordCount > 0) then
  Begin
       dmDados.cdsUnidadeInsumo.Edit;
       dbeDescricao.SetFocus;
  End;
  inherited;
end;

procedure TfrmCadUndInsumo.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if not (dmDados.cdsUnidadeInsumo.IsEmpty) and
     (dmDados.cdsUnidadeInsumo.RecordCount > 0) then
   begin
       If Application.MessageBox('Deseja excluir este registro?' , 'Exclus�o de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            dmDados.cdsUnidadeInsumo.Delete;
            dmDados.cdsUnidadeInsumo.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('N�o ha registro a ser excluido','ATEN��O',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadUndInsumo.BtCancelarClick(Sender: TObject);
begin
  inherited;
      dmDados.cdsUnidadeInsumo.Cancel;
     //
     If (dmDados.cdsUnidadeInsumo.IsEmpty) Then
       Close;
end;

procedure TfrmCadUndInsumo.BtGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbeDescricao.Text) Then
       Begin
           Application.MessageBox('Digite a descri��o.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeDescricao.SetFocus;
           Exit;
       End;
     //
      try
          //
          if (dmDados.cdsUnidadeInsumo.State in [dsinsert]) then
            begin
                 dmDados.parametros;
                 dmDados.CdsConfig.Edit;
                 dmDados.cdsConfig.FieldByName('CFG_UND_INSUMO').AsInteger :=
                      dmDados.cdsConfig.FieldByName('CFG_UND_INSUMO').AsInteger + 1;
                 dmDados.cdsUnidadeInsumo.FieldByName('ID_UNDINSUMO').AsInteger :=
                      dmDados.cdsConfig.FieldByName('CFG_UND_INSUMO').AsInteger;
                 dmDados.CdsConfig.ApplyUpdates(0);
             end;
          //
          dmDados.cdsUnidadeInsumo.ApplyUpdates(0);
          //
     Except
          on Exc:Exception do
            begin
               Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               BtCancelarClick(Sender);
            End;
     End;
     //
  inherited;
end;

procedure TfrmCadUndInsumo.btnConsultarClick(Sender: TObject);
begin
  inherited;
       buscar;
       PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadUndInsumo.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := 'select ID_UNDINSUMO, DESCRICAO from TIPOUNIDADEINSUMO ';
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (ID_UNDINSUMO = :pID_UNDINSUMO)';
                1: CommandText := CommandText + ' Where (UPPER(DESCRICAO) like :pDESCRICAO)';
            end;
            CommandText := CommandText + ' order by DESCRICAO';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pID_UNDINSUMO').AsInteger := StrtoInt(edtConsultar.Text);
                1: datasetConsultar.Params.ParamByName('pDESCRICAO').AsString   := edtConsultar.Text + '%';
            end;
            Active := True;
        end;
        cdsConsultar.FetchParams;
        cdsConsultar.Open;
   End;
end;



procedure TfrmCadUndInsumo.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
         If not (cdsConsultar.IsEmpty) Then
         btnConsultarClick(Sender);
end;

End.
