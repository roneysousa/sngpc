unit uFrmConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, DBClient, Provider, DB, SqlExpr, Buttons,
  Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, jpeg,
  ToolEdit, RXDBCtrl;

type
  TfrmConfig = class(TfrmCadastro)
    Label1: TLabel;
    dbeCNPJ: TDBEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dbeCPF: TDBEdit;
    Label3: TLabel;
    dbeEmail: TDBEdit;
    Label5: TLabel;
    dbeNMPAST: TDBEdit;
    Label6: TLabel;
    cmbUF: TDBComboBox;
    DBRadioGroup1: TDBRadioGroup;
    btnFecharInventario: TBitBtn;
    DBRadioGroup2: TDBRadioGroup;
    dbeDtInvertario: TDBDateEdit;
    Label7: TLabel;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    Label4: TLabel;
    Label8: TLabel;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    DBRadioGroup3: TDBRadioGroup;
    procedure BtEditarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure dbeCNPJExit(Sender: TObject);
    procedure dbeCPFExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnFecharInventarioClick(Sender: TObject);
    procedure dbeDtInvertarioExit(Sender: TObject);
    procedure dsConfigDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

procedure TfrmConfig.BtEditarClick(Sender: TObject);
begin
  if  not (dmDados.cdsConfig.IsEmpty)
    and (dmDados.cdsConfig.RecordCount > 0) then
  Begin
       dmDados.cdsConfig.Edit;
       dbeCNPJ.SetFocus;
  End;
 inherited;   
end;

procedure TfrmConfig.BtCancelarClick(Sender: TObject);
begin
     dmDados.cdsConfig.Cancel;
  inherited;
end;

procedure TfrmConfig.BtGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbeCNPJ.Text) Then
       Begin
           Application.MessageBox('Digite o CNPJ da farmácia.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeCNPJ.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(dbeCPF.Text) Then
       Begin
           Application.MessageBox('Digite o CPF do responsável.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeCPF.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(dbeEmail.Text) Then
       Begin
           Application.MessageBox('Digite o email do responsável.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeEmail.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(dbeNMPAST.Text) Then
       Begin
           Application.MessageBox('Digite o caminho para procura dos arquivo.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeNMPAST.SetFocus;
           Exit;
       End;
       //
       If (dmDados.cdsConfigCFG_FLINVENTARIO.AsString = 'N')
         and uFuncoes.Empty(dmDados.cdsConfigCFG_DTINVENTARIO.AsString) Then
       begin
           Application.MessageBox('Digite a data de fechamento do invertario.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeDtInvertario.Enabled := true;
           dbeDtInvertario.ReadOnly := false;    
           dbeDtInvertario.SetFocus;
           Exit;
       End;
       //
       if (DBRadioGroup3.ItemIndex = -1) Then
         Begin
           Application.MessageBox('Selecione um hambiente para envio de arquivo.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           DBRadioGroup3.SetFocus;
           Exit;
       End;
     //
      dmDados.Start;
      try
          dmDados.cdsConfig.ApplyUpdates(0);
          //
          dmDados.Comit(dmDados.Transc);
          //
     Except
          on Exc:Exception do
            begin
               Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               dmDados.Rollback;
               BtCancelarClick(Sender);
            End;
     End;
     //
  inherited;
end;

procedure TfrmConfig.dbeCNPJExit(Sender: TObject);
begin
  inherited;
    if (dmDados.cdsConfig.State in [dsEdit])
    and (dbeCNPJ.Text <> '  .   .   /    -  ') Then
      begin
        try
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

procedure TfrmConfig.dbeCPFExit(Sender: TObject);
begin
  inherited;
  If (dmDados.cdsConfig.State in [dsEdit])
   and not uFuncoes.Empty(dbeCPF.Text) Then
  Begin
        If not (uFuncoes.CPF(dbeCPF.Text)) Then
        Begin
            MessageDlg('CPF inválido!!!', mtInformation, [mbOk], 0);
            dbeCPF.Clear;
            dbeCPF.SetFocus;
            Exit;
        End;
  End;
end;

procedure TfrmConfig.BitBtn1Click(Sender: TObject);
begin
  //
  inherited;
end;

procedure TfrmConfig.btnFecharInventarioClick(Sender: TObject);
begin
  inherited;
   If (dmDados.cdsConfig.State in [dsEdit]) then
   begin
      If (dmDados.cdsConfigCFG_FLINVENTARIO.AsString = 'S') Then
       begin
          If Application.MessageBox('Confirma fechamento de inventário?',
             'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
           begin
                //dmDados.cdsConfigCFG_DTINVENTARIO.AsDateTime := Date();
                dmDados.cdsConfigCFG_FLINVENTARIO.AsString   := 'N';
                If not (dbeDtInvertario.Enabled) Then
                     dbeDtInvertario.Enabled := true;
                dbeDtInvertario.ReadOnly := false;
                //
                dbeDtInvertario.SetFocus;
           End;
       End;
   End;
end;

procedure TfrmConfig.dbeDtInvertarioExit(Sender: TObject);
begin
  inherited;
    If not uFuncoes.Empty(uFuncoes.RemoveChar(dbeDtInvertario.Text)) Then
      try
          dbeDtInvertario.Date := StrToDate(dbeDtInvertario.Text);
      except
            on EConvertError do
            begin
                ShowMessage ('Data Inválida!');
                dbeDtInvertario.SetFocus;
            End;
      end;
end;

procedure TfrmConfig.dsConfigDataChange(Sender: TObject; Field: TField);
begin
  inherited;
      btnFecharInventario.Enabled := dsCadastro.DataSet.State in [dsEdit];
end;

end.
