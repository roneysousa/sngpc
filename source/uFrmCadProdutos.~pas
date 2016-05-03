unit uFrmCadProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, DBClient, Provider, DB, SqlExpr, jpeg,
  ExtCtrls, Buttons, Grids, DBGrids, StdCtrls, ComCtrls, Mask, DBCtrls;

type
  TfrmCadProdutos = class(TfrmCadastro)
    Label1: TLabel;
    dbeCodigo: TDBEdit;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    Label4: TLabel;
    dbeQuant: TDBEdit;
    cdsConsultarPRO_RG_MS_MEDICAMENTO: TStringField;
    cdsConsultarPRO_MEDICAMENTO: TStringField;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    Label3: TLabel;
    dbeBarras: TDBEdit;
    procedure edtConsultarChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure dsProdutosStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsProdutosDataChange(Sender: TObject; Field: TField);
    procedure dbeCodigoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeBarrasKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure REGISTRO;
    Procedure BUSCAR;
    Procedure ValidarCodigoMS();
  public
    { Public declarations }
  end;

var
  frmCadProdutos: TfrmCadProdutos;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

{ TfrmCadProdutos }

procedure TfrmCadProdutos.BUSCAR;
begin
     With dmDados.cdsProdutos do
     begin
         Close;
         Params[0].AsString  :=
           cdsConsultar.FieldByName('PRO_RG_MS_MEDICAMENTO').AsString;
         Open;
     End;
end;

procedure TfrmCadProdutos.REGISTRO;
begin
     dmDados.parametros;
     With dmDados.cdsProdutos do
         begin
              close;
              Params[0].AsString :=
                 uFuncoes.mscodigo('PRO_RG_MS_MEDICAMENTO','PRODUTOS');
              Open;
         End;
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadProdutos.edtConsultarChange(Sender: TObject);
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
                0: datasetConsultar.Params.ParamByName('pCODIGO').AsString := edtConsultar.Text;
                1: datasetConsultar.Params.ParamByName('pNOME').AsString   := edtConsultar.Text + '%';
            end;
            Active := True;
        end;
        cdsConsultar.FetchParams;
        cdsConsultar.Open;
   End;
end;

procedure TfrmCadProdutos.btnConsultarClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
     begin
       buscar;
       PageControl1.ActivePageIndex := 0;
     End;
end;

procedure TfrmCadProdutos.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  //
  With dmDados.cdsProdutos  do
  begin
       Append;
       FieldByName('PRO_QUANTIDADE').AsFloat       := 0;
       FieldByName('PRO_ANTIMICROBIANOS').AsString := 'N';
       FieldByName('PRO_UNIDADE_MEDIDA').AsString  := '1';
  End;
  dbeCodigo.SetFocus;
end;

procedure TfrmCadProdutos.BtEditarClick(Sender: TObject);
begin
  if  not (dmDados.cdsProdutos.IsEmpty)
    and (dmDados.cdsProdutos.RecordCount > 0) then
  Begin
       dmDados.cdsProdutos.Edit;
       dbeDescricao.SetFocus;
  End;
  inherited;
end;

procedure TfrmCadProdutos.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if not (dmDados.cdsProdutos.IsEmpty) and
     (dmDados.cdsProdutos.RecordCount > 0) then
   begin
       If Application.MessageBox('Deseja excluir este registro?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            dmDados.cdsProdutos.Delete;
            dmDados.cdsProdutos.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadProdutos.BtCancelarClick(Sender: TObject);
begin
  inherited;
     dmDados.cdsProdutos.Cancel;
     //
     If (dmDados.cdsProdutos.IsEmpty) Then
       Close;
end;

procedure TfrmCadProdutos.BtGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbeCodigo.Text) Then
       Begin
           Application.MessageBox('Digite o número do registro do Medicamento.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeCodigo.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(dbeDescricao.Text) Then
       Begin
           Application.MessageBox('Digite o nome do Medicamento','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeDescricao.SetFocus;
           Exit;
       End;
     //
     ValidarCodigoMS;
     //
      try
          //
          dmDados.cdsProdutos.ApplyUpdates(0);
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

procedure TfrmCadProdutos.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
         btnConsultarClick(Sender);
end;

procedure TfrmCadProdutos.dsProdutosStateChange(Sender: TObject);
begin
  inherited;
   // dbeCodigo.Enabled := dsProdutos.State in [dsInsert]; 
end;

procedure TfrmCadProdutos.FormShow(Sender: TObject);
begin
  inherited;
     REGISTRO;
     If (dmDados.cdsProdutos.IsEmpty) Then
          BtAdicionarClick(Sender);
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
      Action := caFree; 
end;

procedure TfrmCadProdutos.dsProdutosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
      dbeCodigo.Enabled := dsCadastro.DataSet.State in [dsInsert];
end;

procedure TfrmCadProdutos.dbeCodigoExit(Sender: TObject);
begin
       ValidarCodigoMS;
     inherited;
end;

procedure TfrmCadProdutos.FormCreate(Sender: TObject);
begin
  inherited;
     dsCadastro.DataSet := dmDados.cdsProdutos;
end;

procedure TfrmCadProdutos.ValidarCodigoMS;
begin
     if (dsCadastro.DataSet.State in [dsInsert])
        and not uFuncoes.Empty(dbeCodigo.Text) Then
      begin
           if (dmDados.ProcurarValor(dbeCodigo.Text, 'PRO_RG_MS_MEDICAMENTO','PRODUTOS')) Then
           begin
                dbeCodigo.SetFocus;
                raise Exception.Create('Código de produto já cadastrado!!!');
           End;
      End;
end;

procedure TfrmCadProdutos.dbeBarrasKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

end.
