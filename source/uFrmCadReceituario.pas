unit uFrmCadReceituario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, DBClient, Provider, DB, SqlExpr, Buttons,
  Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, jpeg;

type
  TfrmCadReceituario = class(TfrmCadastro)
    cdsConsultarID_TIPORECEITUARIO: TIntegerField;
    cdsConsultarDESCRICAO: TStringField;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
    procedure REGISTRO;
    Procedure BUSCAR;
  public
    { Public declarations }
  end;

var
  frmCadReceituario: TfrmCadReceituario;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

{ TfrmCadReceituario }

procedure TfrmCadReceituario.BUSCAR;
begin
     With dmDados.cdsReceituario do
     begin
         Close;
         Params.ParamByName('pID_TIPORECEITUARIO').AsInteger  :=
           cdsConsultar.FieldByName('ID_TIPORECEITUARIO').AsInteger;
         Open;
     End;
end;

procedure TfrmCadReceituario.REGISTRO;
begin
     dmDados.parametros;
     With dmDados.cdsReceituario do
         begin
              close;
              Params.ParamByName('pID_TIPORECEITUARIO').AsInteger :=
                 uFuncoes.mvcodigo('ID_TIPORECEITUARIO','TIPOUSORECEITUARIO');
              Open;
         End;
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadReceituario.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  dmDados.Parametros;
  //
  With dmDados.cdsReceituario do
  begin
       Append;
       FieldByName('ID_TIPORECEITUARIO').AsInteger :=
           dmDados.cdsConfigCFG_TIPORECEITUARIO.AsInteger+ 1;
  End;
  dbeDescricao.SetFocus;
end;

procedure TfrmCadReceituario.BtEditarClick(Sender: TObject);
begin
  if  not (dmDados.cdsReceituario.IsEmpty)
    and (dmDados.cdsReceituario.RecordCount > 0) then
  Begin
       dmDados.cdsReceituario.Edit;
       dbeDescricao.SetFocus;
  End;
  inherited;
end;

procedure TfrmCadReceituario.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if not (dmDados.cdsReceituario.IsEmpty) and
     (dmDados.cdsReceituario.RecordCount > 0) then
   begin
       If Application.MessageBox('Deseja excluir este registro?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            dmDados.cdsReceituario.Delete;
            dmDados.cdsReceituario.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadReceituario.BtCancelarClick(Sender: TObject);
begin
  inherited;
      dmDados.cdsReceituario.Cancel;
     //
     If (dmDados.cdsReceituario.IsEmpty) Then
       Close;
end;

procedure TfrmCadReceituario.BtGravarClick(Sender: TObject);
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
          if (dmDados.cdsReceituario.State in [dsinsert]) then
            begin
                 dmDados.parametros;
                 dmDados.CdsConfig.Edit;
                 dmDados.cdsConfig.FieldByName('CFG_TIPORECEITUARIO').AsInteger :=
                      dmDados.cdsConfig.FieldByName('CFG_TIPORECEITUARIO').AsInteger + 1;
                 dmDados.cdsReceituario.FieldByName('ID_TIPORECEITUARIO').AsInteger :=
                      dmDados.cdsConfig.FieldByName('CFG_TIPORECEITUARIO').AsInteger;
                 dmDados.CdsConfig.ApplyUpdates(0);
             end;
          //
          dmDados.cdsReceituario.ApplyUpdates(0);
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

procedure TfrmCadReceituario.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := 'select ID_TIPORECEITUARIO, DESCRICAO from TIPOUSORECEITUARIO ';
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (ID_TIPORECEITUARIO = :pID_TIPORECEITUARIO)';
                1: CommandText := CommandText + ' Where (UPPER(DESCRICAO) like :pDESCRICAO)';
            end;
            CommandText := CommandText + ' order by DESCRICAO';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pID_TIPORECEITUARIO').AsInteger := StrtoInt(edtConsultar.Text);
                1: datasetConsultar.Params.ParamByName('pDESCRICAO').AsString   := edtConsultar.Text + '%';
            end;
            Active := True;
        end;
        cdsConsultar.FetchParams;
        cdsConsultar.Open;
   End;
end;

procedure TfrmCadReceituario.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
         btnConsultarClick(Sender);
end;

procedure TfrmCadReceituario.FormShow(Sender: TObject);
begin
  inherited;
     REGISTRO;
     If ( dmDados.cdsConfigCFG_TIPORECEITUARIO.AsInteger = 0) Then
          BtAdicionarClick(Sender);
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadReceituario.btnConsultarClick(Sender: TObject);
begin
  inherited;
       buscar;
       PageControl1.ActivePageIndex := 0;
end;

end.
