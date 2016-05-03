unit uFrmCadOpNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, DBClient, Provider, DB, SqlExpr, Buttons,
  Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, jpeg;

type
  TfrmCadOpNotaFiscal = class(TfrmCadastro)
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    cdsConsultarID_OPERACAO: TIntegerField;
    cdsConsultarDESCRICAO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure REGISTRO;
    Procedure BUSCAR;
  public
    { Public declarations }
  end;

var
  frmCadOpNotaFiscal: TfrmCadOpNotaFiscal;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

{ TfrmCadastro1 }

procedure TfrmCadOpNotaFiscal.BUSCAR;
begin
     With dmDados.cdsOpNotaFiscal do
     begin
         Close;
         Params.ParamByName('pID_OPERACAO').AsInteger  :=
           cdsConsultar.FieldByName('ID_OPERACAO').AsInteger;
         Open;
     End;
end;

procedure TfrmCadOpNotaFiscal.REGISTRO;
begin
     dmDados.parametros;
     With dmDados.cdsOpNotaFiscal  do
         begin
              close;
              Params.ParamByName('pID_OPERACAO').AsInteger :=
                 uFuncoes.mvcodigo('ID_OPERACAO','TIPOOPERACAONOTAFISCAL');
              Open;
         End;
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadOpNotaFiscal.FormShow(Sender: TObject);
begin
  inherited;
     REGISTRO;
     If ( dsCadastro.DataSet.IsEmpty ) Then            // dmDados.cdsconfigCFG_OPERACAO_NF.AsInteger = 0
          BtAdicionarClick(Sender);
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadOpNotaFiscal.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  dmDados.Parametros;
  //
  With dmDados.cdsOpNotaFiscal do
  begin
       Append;
       FieldByName('ID_OPERACAO').AsInteger :=
           dmDados.cdsConfigCFG_OPERACAO_NF.AsInteger+ 1;
  End;
  dbeDescricao.SetFocus;
end;

procedure TfrmCadOpNotaFiscal.BtEditarClick(Sender: TObject);
begin

  if  not (dmDados.cdsOpNotaFiscal.IsEmpty)
    and (dmDados.cdsOpNotaFiscal.RecordCount > 0) then
  Begin
       dmDados.cdsOpNotaFiscal.Edit;
       dbeDescricao.SetFocus;
  End;
  inherited;
end;

procedure TfrmCadOpNotaFiscal.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if not (dmDados.cdsOpNotaFiscal.IsEmpty) and
     (dmDados.cdsOpNotaFiscal.RecordCount > 0) then
   begin
       If Application.MessageBox('Deseja excluir este registro?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            dmDados.cdsOpNotaFiscal.Delete;
            dmDados.cdsOpNotaFiscal.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadOpNotaFiscal.BtCancelarClick(Sender: TObject);
begin
  inherited;
     dmDados.cdsOpNotaFiscal.Cancel;
     //
     If (dmDados.cdsOpNotaFiscal.IsEmpty) Then
       Close;
end;

procedure TfrmCadOpNotaFiscal.BtGravarClick(Sender: TObject);
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
          if (dmDados.cdsOpNotaFiscal.State in [dsinsert]) then
            begin
                 dmDados.parametros;
                 dmDados.CdsConfig.Edit;
                 dmDados.cdsConfig.FieldByName('CFG_OPERACAO_NF').AsInteger :=
                      dmDados.cdsConfig.FieldByName('CFG_OPERACAO_NF').AsInteger + 1;
                 dmDados.cdsOpNotaFiscal.FieldByName('ID_OPERACAO').AsInteger :=
                      dmDados.cdsConfig.FieldByName('CFG_OPERACAO_NF').AsInteger;
                 dmDados.CdsConfig.ApplyUpdates(0);
             end;
          //
          dmDados.cdsOpNotaFiscal.ApplyUpdates(0);
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

procedure TfrmCadOpNotaFiscal.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := 'select ID_OPERACAO, DESCRICAO from TIPOOPERACAONOTAFISCAL ';
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (ID_OPERACAO = :pID_OPERACAO)';
                1: CommandText := CommandText + ' Where (UPPER(DESCRICAO) like :pDESCRICAO)';
            end;
            CommandText := CommandText + ' order by DESCRICAO';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pID_OPERACAO').AsInteger := StrtoInt(edtConsultar.Text);
                1: datasetConsultar.Params.ParamByName('pDESCRICAO').AsString   := edtConsultar.Text + '%';
            end;
            Active := True;
        end;
        cdsConsultar.FetchParams;
        cdsConsultar.Open;
   End;
end;

procedure TfrmCadOpNotaFiscal.btnConsultarClick(Sender: TObject);
begin
  inherited;
       buscar;
       PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadOpNotaFiscal.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
         btnConsultarClick(Sender);
end;

end.
