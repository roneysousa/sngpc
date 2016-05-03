unit uFrmCadMotivoPerda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, Mask, DBCtrls, DBClient, Provider, DB,
  SqlExpr, Buttons, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, jpeg;

type
  TfrmCadMotivoPerda = class(TfrmCadastro)
    DBText1: TDBText;
    Label3: TLabel;
    Label1: TLabel;
    dbeDescricao: TDBEdit;
    cdsConsultarID_MOTIVOPERDA: TIntegerField;
    cdsConsultarDESCRICAO: TStringField;
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
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
  frmCadMotivoPerda: TfrmCadMotivoPerda;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

{ TfrmCadMotivoPerda }

procedure TfrmCadMotivoPerda.BUSCAR;
begin
     With dmDados.cdsMotivoPerda do
     begin
         Close;
         Params.ParamByName('pID_MOTIVOPERDA').AsInteger  :=
           cdsConsultar.FieldByName('ID_MOTIVOPERDA').AsInteger;
         Open;
     End;
end;

procedure TfrmCadMotivoPerda.REGISTRO;
begin
     dmDados.parametros;
     With dmDados.cdsMotivoPerda  do
         begin
              close;
              Params.ParamByName('pID_MOTIVOPERDA').AsInteger :=
                 uFuncoes.mvcodigo('ID_MOTIVOPERDA','TIPOMOTIVOPERDA');
              Open;
         End;
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadMotivoPerda.btnConsultarClick(Sender: TObject);
begin
  inherited;
       buscar;
       PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadMotivoPerda.FormShow(Sender: TObject);
begin
  inherited;
     REGISTRO;
     If (  dsCadastro.DataSet.IsEmpty ) Then  // dmDados.cdsConfigCFG_MOTIVO_PERDA.AsInteger = 0
          BtAdicionarClick(Sender);
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadMotivoPerda.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  dmDados.Parametros;
  //
  With dmDados.cdsMotivoPerda do
  begin
       Append;
       FieldByName('ID_MOTIVOPERDA').AsInteger :=
           dmDados.cdsConfigCFG_MOTIVO_PERDA.AsInteger+ 1;
  End;
  dbeDescricao.SetFocus;
end;

procedure TfrmCadMotivoPerda.BtEditarClick(Sender: TObject);
begin
  if  not (dmDados.cdsMotivoPerda.IsEmpty)
    and (dmDados.cdsMotivoPerda.RecordCount > 0) then
  Begin
       dmDados.cdsMotivoPerda.Edit;
       dbeDescricao.SetFocus;
  End;
  inherited;
end;

procedure TfrmCadMotivoPerda.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if not (dmDados.cdsMotivoPerda.IsEmpty) and
     (dmDados.cdsMotivoPerda.RecordCount > 0) then
   begin
       If Application.MessageBox('Deseja excluir este registro?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            dmDados.cdsMotivoPerda.Delete;
            dmDados.cdsMotivoPerda.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadMotivoPerda.BtCancelarClick(Sender: TObject);
begin
  inherited;
      dmDados.cdsMotivoPerda.Cancel;
     //
     If (dmDados.cdsMotivoPerda.IsEmpty) Then
       Close;
end;

procedure TfrmCadMotivoPerda.BtGravarClick(Sender: TObject);
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
          if (dmDados.cdsMotivoPerda.State in [dsinsert]) then
            begin
                 dmDados.parametros;
                 dmDados.CdsConfig.Edit;
                 dmDados.cdsConfig.FieldByName('CFG_MOTIVO_PERDA').AsInteger :=
                      dmDados.cdsConfig.FieldByName('CFG_MOTIVO_PERDA').AsInteger + 1;
                 dmDados.cdsMotivoPerda.FieldByName('ID_MOTIVOPERDA').AsInteger :=
                      dmDados.cdsConfig.FieldByName('CFG_MOTIVO_PERDA').AsInteger;
                 dmDados.CdsConfig.ApplyUpdates(0);
             end;
          //
          dmDados.cdsMotivoPerda.ApplyUpdates(0);
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

procedure TfrmCadMotivoPerda.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := 'select ID_MOTIVOPERDA, DESCRICAO from TIPOMOTIVOPERDA ';
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (ID_MOTIVOPERDA = :pID_MOTIVOPERDA)';
                1: CommandText := CommandText + ' Where (UPPER(DESCRICAO) like :pDESCRICAO)';
            end;
            CommandText := CommandText + ' order by DESCRICAO';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pID_MOTIVOPERDA').AsInteger := StrtoInt(edtConsultar.Text);
                1: datasetConsultar.Params.ParamByName('pDESCRICAO').AsString   := edtConsultar.Text + '%';
            end;
            Active := True;
        end;
        cdsConsultar.FetchParams;
        cdsConsultar.Open;
   End;
end;

procedure TfrmCadMotivoPerda.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
         btnConsultarClick(Sender);
end;

end.
