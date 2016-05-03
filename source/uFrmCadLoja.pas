unit uFrmCadLoja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, DBClient, Provider, DB, SqlExpr, Buttons,
  Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, DBCtrls, Mask, jpeg,
  ToolEdit, RXDBCtrl;

type
  TfrmCadLojas = class(TfrmCadastro)
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    dbeCNPJ: TDBEdit;
    Label3: TLabel;
    dbeFantasia: TDBEdit;
    Label4: TLabel;
    dbeRazao: TDBEdit;
    Label5: TLabel;
    dbeEndereco: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    dbeCidade: TDBEdit;
    Label8: TLabel;
    dbeBairro: TDBEdit;
    Label9: TLabel;
    cmbUF: TDBComboBox;
    cdsConsultarEMP_CODIGO: TIntegerField;
    cdsConsultarEMP_FANTASIA: TStringField;
    Label10: TLabel;
    dbeLicenca: TDBEdit;
    procedure edtConsultarChange(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure dbeCNPJExit(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure REGISTRO;
    Procedure BUSCAR;
  public
    { Public declarations }
  end;

var
  frmCadLojas: TfrmCadLojas;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

procedure TfrmCadLojas.BUSCAR;
begin
     With dmDados.cdsLojas do
     begin
         Close;
         Params.ParamByName('pCODIGO').AsInteger  :=
           cdsConsultar.FieldByName('EMP_CODIGO').AsInteger;
         Open;
     End;
end;

procedure TfrmCadLojas.edtConsultarChange(Sender: TObject);
begin
  inherited;
   If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := 'select EMP_CODIGO, EMP_FANTASIA from EMPRESAS ';
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (EMP_CODIGO = :pCODIGO)';
                1: CommandText := CommandText + ' Where (UPPER(EMP_FANTASIA) like :pNOME)';
            end;
            CommandText := CommandText + ' order by EMP_FANTASIA';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtConsultar.Text);
                1: datasetConsultar.Params.ParamByName('pNOME').AsString   := edtConsultar.Text + '%';
            end;
            Active := True;
        end;
        cdsConsultar.FetchParams;
        cdsConsultar.Open;
   End;
end;

procedure TfrmCadLojas.REGISTRO;
begin
     dmDados.parametros;
     With dmDados.cdsLojas  do
         begin
              close;
              Params.ParamByName('pCODIGO').AsInteger :=
                 uFuncoes.mvcodigo('EMP_CODIGO','EMPRESAS');
              Open;
         End;
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadLojas.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  dmDados.RefreshCDS(dmDados.cdsConfig);
  //
  With dmDados.cdsLojas  do
  begin
       Append;
       FieldByName('EMP_CODIGO').AsInteger := dmDados.cdsConfigCFG_EMPRESAS.AsInteger+ 1;
  End;
  dbeCNPJ.SetFocus;
end;

procedure TfrmCadLojas.dbeCNPJExit(Sender: TObject);
begin
  inherited;
    if (dmDados.cdsLojas.State in [dsInsert, dsEdit])
    and not uFuncoes.Empty(uFuncoes.RemoveChar(dbeCNPJ.Text)) Then
      begin
        try
         If not uFuncoes.Empty(dbeCNPJ.Text) Then
          If not (uFuncoes.CGC(uFuncoes.StrZero(dbeCNPJ.Text,14))) Then
          Begin
              MessageDlg('CNPJ inválido!!!', mtInformation, [mbOk], 0);
              dbeCNPJ.Clear;
              dbeCNPJ.SetFocus;
              Exit;
          End;
        Except
              dbeCNPJ.Clear;
              dbeCNPJ.SetFocus;
        End;
      End;
end;

procedure TfrmCadLojas.BtEditarClick(Sender: TObject);
begin
  if  not (dmDados.cdsLojas.IsEmpty)
    and (dmDados.cdsLojas.RecordCount > 0) then
  Begin
       dmDados.cdsLojas.Edit;
       dbeCNPJ.SetFocus;
  End;
  inherited;
end;

procedure TfrmCadLojas.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if not (dmDados.cdsLojas.IsEmpty) and
     (dmDados.cdsLojas.RecordCount > 0)
     and (dmDados.cdsLojasEMP_CODIGO.AsInteger > 1) then
   begin
       If Application.MessageBox('Deseja excluir este registro?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            dmDados.cdsLojas.Delete;
            dmDados.cdsLojas.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadLojas.BtCancelarClick(Sender: TObject);
begin
  inherited;
      dmDados.cdsLojas.Cancel;
     //
     If (dmDados.cdsLojas.IsEmpty) Then
       Close;
end;

procedure TfrmCadLojas.BtGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbeCNPJ.Text) Then
       Begin
           Application.MessageBox('Digite o CNPJ da loja.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeCNPJ.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(dbeFantasia.Text) Then
       Begin
           Application.MessageBox('Digite o nome fantasia.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeFantasia.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(dbeRazao.Text) Then
       Begin
           Application.MessageBox('Digite a Razão social.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeRazao.SetFocus;
           Exit;
       End;
     //
      try
          //
          if (dmDados.cdsLojas.State in [dsinsert]) then
            begin
                 dmDados.parametros;
                 dmDados.CdsConfig.Edit;
                 dmDados.cdsConfig.FieldByName('CFG_EMPRESAS').AsInteger :=
                      dmDados.cdsConfig.FieldByName('CFG_EMPRESAS').AsInteger + 1;
                 dmDados.cdsLojas.FieldByName('EMP_CODIGO').AsInteger :=
                      dmDados.cdsConfig.FieldByName('CFG_EMPRESAS').AsInteger;
                 dmDados.CdsConfig.ApplyUpdates(0);
             end;
          //
          dmDados.cdsLojas.ApplyUpdates(0);
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

procedure TfrmCadLojas.btnConsultarClick(Sender: TObject);
begin
  inherited;
       buscar;
       PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadLojas.FormShow(Sender: TObject);
begin
  inherited;
     REGISTRO;
     If ( dmDados.cdsConfigCFG_EMPRESAS.AsInteger = 0) Then
          BtAdicionarClick(Sender);
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadLojas.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
         btnConsultarClick(Sender);
end;

end.
