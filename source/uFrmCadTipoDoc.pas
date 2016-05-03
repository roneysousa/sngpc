unit uFrmCadTipoDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, DBClient, Provider, DB, SqlExpr, Buttons,
  Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, DBCtrls, Mask, jpeg;

type
  TfrmCadTipoDocumento = class(TfrmCadastro)
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    Label1: TLabel;
    DBText1: TDBText;
    cdsConsultarID_DOCUMENTO: TIntegerField;
    cdsConsultarDESCRICAO: TStringField;
    procedure btnConsultarClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeDescricaoExit(Sender: TObject);
  private
    { Private declarations }
    procedure REGISTRO;
    Procedure BUSCAR;
  public
    { Public declarations }
  end;

var
  frmCadTipoDocumento: TfrmCadTipoDocumento;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

{ TfrmCadTipoDocumento }

procedure TfrmCadTipoDocumento.BUSCAR;
begin
     With dmDados.cdsTipoDocumento do
     begin
         Close;
         Params.ParamByName('pID_DOCUMENTO').AsInteger  :=
           cdsConsultar.FieldByName('ID_DOCUMENTO').AsInteger;
         Open;
     End;
end;

procedure TfrmCadTipoDocumento.REGISTRO;
begin
     dmDados.parametros;
     With dmDados.cdsTipoDocumento  do
         begin
              close;
              Params.ParamByName('pID_DOCUMENTO').AsInteger :=
                 uFuncoes.mvcodigo('ID_DOCUMENTO','TIPO_DOCUMENTO');
              Open;
         End;
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadTipoDocumento.btnConsultarClick(Sender: TObject);
begin
  inherited;
       buscar;
       PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadTipoDocumento.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  dmDados.Parametros;
  //
  With dmDados.cdsTipoDocumento do
  begin
       Append;
       FieldByName('ID_DOCUMENTO').AsInteger :=
           dmDados.cdsConfigCFG_TIPO_DOCUMENTO.AsInteger+ 1;
  End;
  dbeDescricao.SetFocus;
end;

procedure TfrmCadTipoDocumento.BtEditarClick(Sender: TObject);
begin   
  if  not (dmDados.cdsTipoDocumento.IsEmpty)
    and (dmDados.cdsTipoDocumento.RecordCount > 0) then
  Begin
       dmDados.cdsTipoDocumento.Edit;
       dbeDescricao.SetFocus;
  End;
  inherited;
end;

procedure TfrmCadTipoDocumento.BtExcluirClick(Sender: TObject);
begin
  inherited;
 if not (dmDados.cdsTipoDocumento.IsEmpty) and
     (dmDados.cdsTipoDocumento.RecordCount > 0) then
   begin
       If Application.MessageBox('Deseja excluir este registro?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            dmDados.cdsTipoDocumento.Delete;
            dmDados.cdsTipoDocumento.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadTipoDocumento.BtCancelarClick(Sender: TObject);
begin
  inherited;
     dmDados.cdsTipoDocumento.Cancel;
     //
     If (dmDados.cdsTipoDocumento.IsEmpty) Then
       Close;
end;

procedure TfrmCadTipoDocumento.BtGravarClick(Sender: TObject);
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
          if (dmDados.cdsTipoDocumento.State in [dsinsert]) then
            begin
                 dmDados.parametros;
                 dmDados.CdsConfig.Edit;
                 dmDados.cdsConfig.FieldByName('CFG_TIPO_DOCUMENTO').AsInteger :=
                      dmDados.cdsConfig.FieldByName('CFG_TIPO_DOCUMENTO').AsInteger + 1;
                 dmDados.cdsTipoDocumento.FieldByName('ID_DOCUMENTO').AsInteger :=
                      dmDados.cdsConfig.FieldByName('CFG_TIPO_DOCUMENTO').AsInteger;
                 dmDados.CdsConfig.ApplyUpdates(0);
             end;
          //
          dmDados.cdsTipoDocumento.ApplyUpdates(0);
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

procedure TfrmCadTipoDocumento.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := 'select ID_DOCUMENTO, DESCRICAO from TIPO_DOCUMENTO ';
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (ID_DOCUMENTO = :pID_DOCUMENTO)';
                1: CommandText := CommandText + ' Where (UPPER(DESCRICAO) like :pDESCRICAO)';
            end;
            CommandText := CommandText + ' order by DESCRICAO';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pID_DOCUMENTO').AsInteger := StrtoInt(edtConsultar.Text);
                1: datasetConsultar.Params.ParamByName('pDESCRICAO').AsString   := edtConsultar.Text + '%';
            end;
            Active := True;
        end;
        cdsConsultar.FetchParams;
        cdsConsultar.Open;
   End;
end;

procedure TfrmCadTipoDocumento.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
         btnConsultarClick(Sender);
end;

procedure TfrmCadTipoDocumento.FormShow(Sender: TObject);
begin
  inherited;
     REGISTRO;
     If (dsCadastro.DataSet.IsEmpty) Then  //  dmDados.cdsConfigCFG_TIPO_DOCUMENTO.AsInteger = 0
          BtAdicionarClick(Sender);
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadTipoDocumento.dbeDescricaoExit(Sender: TObject);
begin
  inherited;
      If (dmDados.cdsTipoDocumento.State in [dsInsert])
      and not uFuncoes.Empty(dbeDescricao.Text) Then
         If (uFuncoes.Buscar_Dados_Str('DESCRICAO', dbeDescricao.Text, 'TIPO_DOCUMENTO')) Then
           begin
               Application.MessageBox('Descrição já cadastro.','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               dbeDescricao.Clear;
               dbeDescricao.SetFocus;
               Exit;
           End;
end;

end.
