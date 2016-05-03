unit uFrmCadMedicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, DBClient, Provider, DB, SqlExpr, Buttons,
  Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, jpeg;

type
  TfrmCadMedico = class(TfrmCadastro)
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    Label3: TLabel;
    dbeNumRG: TDBEdit;
    Label4: TLabel;
    cmbConselho: TDBLookupComboBox;
    Label6: TLabel;
    cmbUF: TDBComboBox;
    cdsConsultarID_MEDICO: TIntegerField;
    cdsConsultarNOME_MEDICO: TStringField;
    Label5: TLabel;
    dbeSigla: TDBEdit;
    DBEdit1: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure dbeSiglaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeSiglaChange(Sender: TObject);
  private
    { Private declarations }
    procedure REGISTRO;
    Procedure BUSCAR;
    procedure nome_conselho;
    procedure Validar_Sigla;
  public
    { Public declarations }
  end;

var
  frmCadMedico: TfrmCadMedico;

implementation

uses udmDados, uFuncoes, udmPesquisa;

{$R *.dfm}

{ TfrmCadMedico }

procedure TfrmCadMedico.BUSCAR;
begin
     With dmDados.cdsMedico do
     begin
         Close;
         Params.ParamByName('pID_MEDICO').AsInteger  :=
           cdsConsultar.FieldByName('ID_MEDICO').AsInteger;
         Open;
         //
         nome_conselho; 
     End;
end;

procedure TfrmCadMedico.REGISTRO;
begin
     dmDados.parametros;
     With dmDados.cdsMedico  do
         begin
              close;
              Params.ParamByName('pID_MEDICO').AsInteger :=
                 uFuncoes.mvcodigo('ID_MEDICO','MEDICO');
              Open;
              //
              nome_conselho;
         End;
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadMedico.FormShow(Sender: TObject);
begin
  inherited;
     REGISTRO;
     //
     If ( dmDados.cdsConfigCFG_MEDICO.AsInteger = 0) Then
          BtAdicionarClick(Sender);
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadMedico.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  dmDados.Parametros;
  //
  With dmDados.cdsMedico do
  begin
       Append;
       FieldByName('ID_MEDICO').AsInteger :=
           dmDados.cdsConfigCFG_MEDICO.AsInteger+ 1;
       FieldByName('UF_CONSELHO').AsString :=
          dmDados.cdsConfigCFG_UF_PADRAO.AsString;
       FieldByName('SIGLA_CONSELHO').AsString := 'CRM';
  End;
  dbeDescricao.SetFocus;
end;

procedure TfrmCadMedico.BtCancelarClick(Sender: TObject);
begin
  inherited;
      dmDados.cdsMedico.Cancel;
     //
     If (dmDados.cdsMedico.IsEmpty) Then
       Close;
     //
     nome_conselho;  
end;

procedure TfrmCadMedico.BtEditarClick(Sender: TObject);
begin
  if  not (dmDados.cdsMedico.IsEmpty)
    and (dmDados.cdsMedico.RecordCount > 0) then
  Begin
       dmDados.cdsMedico.Edit;
       dbeDescricao.SetFocus;
  End;
  inherited;  
end;

procedure TfrmCadMedico.BtExcluirClick(Sender: TObject);
Var
  iCod : Integer;
begin
  inherited;
  if not (dmDados.cdsMedico.IsEmpty) and
     (dmDados.cdsMedico.RecordCount > 0) then
   begin
        iCod := dmDados.cdsMedicoID_MEDICO.AsInteger;
       //
       If (dmDados.GetVefificaVendaMedico(iCod)) Then
       begin
            Application.MessageBox('Registro não pode ser excluido!!!'+#13'Há venda(s) para este médico.','ATENÇÃO',
              MB_OK+MB_ICONSTOP+MB_APPLMODAL);
            Exit;
       End;
       //

       If Application.MessageBox('Deseja excluir este registro?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            dmDados.cdsMedico.Delete;
            dmDados.cdsMedico.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadMedico.btnConsultarClick(Sender: TObject);
begin
  inherited;
       buscar;
       PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadMedico.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := 'select ID_MEDICO, NOME_MEDICO from MEDICO ';
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (ID_MEDICO = :pID_MEDICO)';
                1: CommandText := CommandText + ' Where (UPPER(NOME_MEDICO) like :pNOME_MEDICO)';
            end;
            CommandText := CommandText + ' order by NOME_MEDICO';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pID_MEDICO').AsInteger := StrtoInt(edtConsultar.Text);
                1: datasetConsultar.Params.ParamByName('pNOME_MEDICO').AsString   := edtConsultar.Text + '%';
            end;
            Active := True;
        end;
        cdsConsultar.FetchParams;
        cdsConsultar.Open;
   End;
end;

procedure TfrmCadMedico.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
         btnConsultarClick(Sender);
end;

procedure TfrmCadMedico.BtGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbeDescricao.Text) Then
       Begin
           Application.MessageBox('Digite o nome do médico.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeDescricao.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(dbeNumRG.Text) Then
       Begin
           Application.MessageBox('Digite o número do registro profissional.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeNumRG.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(cmbUF.Text) Then
       Begin
           Application.MessageBox('Selecione a UF emissão do documento.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbUF.SetFocus;
           Exit;
       End;
       //
       If Empty(dbeSigla.Text) Then
       Begin
           Application.MessageBox('Digite a sigla do conselho.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbUF.SetFocus;
           Exit;
       End;
       //
       If not Empty(dbeSigla.Text) Then
         If not (dmPesquisa.GetSiglaConselho(dbeSigla.Text)) Then
         begin
            Application.MessageBox('Sigla de conselho não cadastrado.','ATENÇÃO',
                MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            dbeSigla.SetFocus;
            dbeSigla.Clear;
            Exit;
         End;
     //
     Validar_Sigla;
     //
     if (dmDados.cdsMedico.State in [dsinsert]) then
         if dmDados.Validar_medico(dbeDescricao.Text, dbeSigla.Text, cmbUF.Text, StrtoInt(dbeNumRG.Text)) Then
          begin
              Application.MessageBox('Médico já cadastrado.','ATENÇÃO',
                  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              dbeDescricao.SetFocus;
              dbeDescricao.Clear;
              Exit;
          End;
     //
      try
          //
          if (dmDados.cdsMedico.State in [dsinsert]) then
            begin
                 dmDados.parametros;
                 dmDados.CdsConfig.Edit;
                 dmDados.cdsConfig.FieldByName('CFG_MEDICO').AsInteger :=
                      dmDados.cdsConfig.FieldByName('CFG_MEDICO').AsInteger + 1;
                 dmDados.cdsMedico.FieldByName('ID_MEDICO').AsInteger :=
                      dmDados.cdsConfig.FieldByName('CFG_MEDICO').AsInteger;
                 dmDados.CdsConfig.ApplyUpdates(0);
             end;
          //
          dmDados.cdsMedico.ApplyUpdates(0);
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

procedure TfrmCadMedico.dbeSiglaExit(Sender: TObject);
begin
  inherited;
     Validar_Sigla;
end;

procedure TfrmCadMedico.nome_conselho;
begin
   {  If not Empty(dmDados.cdsMedicoSIGLA_CONSELHO.AsString) Then
       If (dmPesquisa.GetSiglaConselho(dmDados.cdsMedicoSIGLA_CONSELHO.AsString)) Then
         lblNmConselho.Caption := udmPesquisa.W_NMCONS; }
end;

procedure TfrmCadMedico.FormCreate(Sender: TObject);
begin
  inherited;
     // lblNmConselho.Caption := '';
     dsCadastro.DataSet := dmDados.cdsMedico;
end;

procedure TfrmCadMedico.dbeSiglaChange(Sender: TObject);
begin
  inherited;
    {  if Empty(dbeSigla.Text) Then
         lblNmConselho.Caption := ''; }
end;

procedure TfrmCadMedico.Validar_Sigla;
begin
     If (dmDados.cdsMedico.State in [dsInsert, dsEdit])
       and not Empty(dbeSigla.Text) Then
         If not (dmPesquisa.GetSiglaConselho(dbeSigla.Text)) Then
         begin
            dbeSigla.SetFocus;
            raise Exception.Create('Sigla de conselho não cadastrado.');
         End
         else
         begin
              nome_conselho;
              dmDados.cdsMedicoCONSELHO_PROFISSIONAL.AsInteger :=
                 dmPesquisa.cdsPesquisa.FieldbyName('ID_CONSELHO').AsInteger;
         End;
end;

end.
