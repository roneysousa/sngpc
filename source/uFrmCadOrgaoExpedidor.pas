unit uFrmCadOrgaoExpedidor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, DB, DBClient, Provider, SqlExpr, Buttons,
  Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, jpeg;

type
  TfrmCadOrgaoExpedidor = class(TfrmCadastro)
    cdsConsultarID_ORGAO: TIntegerField;
    cdsConsultarDESCRICAO: TStringField;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    dbeSigla: TDBEdit;
    Label3: TLabel;
    dbeDescricao: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure dbeDescricaoExit(Sender: TObject);
  private
    { Private declarations }
    procedure REGISTRO;
    Procedure BUSCAR;
  public
    { Public declarations }
  end;

var
  frmCadOrgaoExpedidor: TfrmCadOrgaoExpedidor;

implementation

uses uFuncoes, udmDados;

{$R *.dfm}

{ TfrmCadOrgaoExpedidor }

procedure TfrmCadOrgaoExpedidor.BUSCAR;
begin
     With dmDados.cdsOrgaoExpedidor do
     begin
         Close;
         Params.ParamByName('pID_ORGAO').AsInteger  :=
           cdsConsultar.FieldByName('ID_ORGAO').AsInteger;
         Open;
     End;
end;

procedure TfrmCadOrgaoExpedidor.REGISTRO;
begin
     dmDados.parametros;
     With dmDados.cdsOrgaoExpedidor  do
         begin
              close;
              Params.ParamByName('pID_ORGAO').AsInteger :=
                 uFuncoes.mvcodigo('ID_ORGAO','ORGAO_EXPEDIDOR');
              Open;
         End;
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadOrgaoExpedidor.FormShow(Sender: TObject);
begin
  inherited;
     REGISTRO;
     If ( dsCadastro.DataSet.IsEmpty ) Then  // dmDados.cdsConfigCFG_ORGAO_EXPEDIDOR.AsInteger = 0
          BtAdicionarClick(Sender);
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadOrgaoExpedidor.BtEditarClick(Sender: TObject);
begin
  inherited;
  if  not (dmDados.cdsOrgaoExpedidor.IsEmpty)
    and (dmDados.cdsOrgaoExpedidor.RecordCount > 0) then
  Begin
       dmDados.cdsOrgaoExpedidor.Edit;
       dbeDescricao.SetFocus;
  End;
end;

procedure TfrmCadOrgaoExpedidor.BtExcluirClick(Sender: TObject);
begin
  inherited;
 if not (dmDados.cdsOrgaoExpedidor.IsEmpty) and
     (dmDados.cdsOrgaoExpedidor.RecordCount > 0) then
   begin
       If Application.MessageBox('Deseja excluir este registro?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            dmDados.cdsOrgaoExpedidor.Delete;
            dmDados.cdsOrgaoExpedidor.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadOrgaoExpedidor.BtCancelarClick(Sender: TObject);
begin
  inherited;
     dmDados.cdsOrgaoExpedidor.Cancel;
     //
     If (dmDados.cdsOrgaoExpedidor.IsEmpty) Then
       Close;
end;

procedure TfrmCadOrgaoExpedidor.BtGravarClick(Sender: TObject);
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
          if (dmDados.cdsOrgaoExpedidor.State in [dsinsert]) then
            begin
                 dmDados.parametros;
                 dmDados.CdsConfig.Edit;
                 dmDados.cdsConfig.FieldByName('CFG_ORGAO_EXPEDIDOR').AsInteger :=
                      dmDados.cdsConfig.FieldByName('CFG_ORGAO_EXPEDIDOR').AsInteger + 1;
                 dmDados.cdsOrgaoExpedidor.FieldByName('ID_ORGAO').AsInteger :=
                      dmDados.cdsConfig.FieldByName('CFG_ORGAO_EXPEDIDOR').AsInteger;
                 dmDados.CdsConfig.ApplyUpdates(0);
             end;
          //
          dmDados.cdsOrgaoExpedidor.ApplyUpdates(0);
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

procedure TfrmCadOrgaoExpedidor.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  dmDados.Parametros;
  //
  With dmDados.cdsOrgaoExpedidor do
  begin
       Append;
       FieldByName('ID_ORGAO').AsInteger :=
           dmDados.cdsConfigCFG_ORGAO_EXPEDIDOR.AsInteger+ 1;
  End;
  dbeDescricao.SetFocus;
end;

procedure TfrmCadOrgaoExpedidor.btnConsultarClick(Sender: TObject);
begin
  inherited;
       buscar;
       PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadOrgaoExpedidor.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := 'select ID_ORGAO, DESCRICAO from ORGAO_EXPEDIDOR ';
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (ID_ORGAO = :pID_ORGAO)';
                1: CommandText := CommandText + ' Where (UPPER(DESCRICAO) like :pDESCRICAO)';
            end;
            CommandText := CommandText + ' order by DESCRICAO';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pID_ORGAO').AsInteger := StrtoInt(edtConsultar.Text);
                1: datasetConsultar.Params.ParamByName('pDESCRICAO').AsString   := edtConsultar.Text + '%';
            end;
            Active := True;
        end;
        cdsConsultar.FetchParams;
        cdsConsultar.Open;
   End;
end;

procedure TfrmCadOrgaoExpedidor.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
         btnConsultarClick(Sender);
end;

procedure TfrmCadOrgaoExpedidor.dbeDescricaoExit(Sender: TObject);
begin
  inherited;
      If (dmDados.cdsOrgaoExpedidor.State in [dsInsert])
      and not uFuncoes.Empty(dbeDescricao.Text) Then
         If (uFuncoes.Buscar_Dados_Str('DESCRICAO', dbeDescricao.Text, 'ORGAO_EXPEDIDOR')) Then
           begin
               Application.MessageBox('Descrição já cadastro.','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               dbeDescricao.Clear;
               dbeDescricao.SetFocus;
               Exit;
           End;
end;

end.
