unit uFrmConsultaEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmListaEstoque, DB, DBCtrls, StdCtrls, Buttons, Grids,
  DBGrids, Mask, jpeg, ExtCtrls, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppPrnabl, ppCtrls, ppBands, ppCache, ppVar, ToolEdit,
  ZipMstr;

type
  TfrmConsultaEstoque = class(TfrmListaEstoque)
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine1: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppLabel1: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    Label1: TLabel;
    edtDtInventario: TDateEdit;
    ZipMaster1: TZipMaster;
    procedure btnGeraArquivoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure edtDtInventarioExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaEstoque: TfrmConsultaEstoque;

implementation

uses udmDados, uFuncoes, uFormMainSngpc;

{$R *.dfm}

procedure TfrmConsultaEstoque.btnGeraArquivoClick(Sender: TObject);
Var
   aNomeArquivo : String;
   Dir: string;
   aDtInvertario, aNomeArquivoZip, HashIdentificacao  : String;
begin
inherited;
   if uFuncoes.Empty(uFuncoes.RemoveChar(edtDtInventario.text)) Then
   begin
       Application.MessageBox(PChar('Digite a data do inventário.'), 'ATENÇÃO',
           MB_OK+MB_ICONSTOP+MB_APPLMODAL);
       edtDtInventario.SetFocus;
       Exit;
   End;
   //
   dmDados.RefreshCDS(dmDados.cdsConfig);
   {if (dmDados.cdsConfigCFG_FLINVENTARIO.AsString = 'S') Then
   begin    }
     if not (dsListaProdutos.DataSet.IsEmpty) then
      begin
         If Application.MessageBox('Confirma a geração do arquivo de inventário?',
           'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
          begin
           try

                 If uFuncoes.Empty(dmDados.cdsConfigCFG_NOME_PASTA.AsString) Then
                 begin
                      Dir := 'C:\INFOG2\XML';
                      dmDados.cdsConfig.Edit;
                      dmDados.cdsConfigCFG_NOME_PASTA.AsString := Dir;
                      dmDados.cdsConfig.ApplyUpdates(0);
                 End;
                 //
                 Dir := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
                 if not DirectoryExists(Dir) then
                    ForceDirectories(Dir);
                 //
                 aNomeArquivo := dmDados.cdsConfigCFG_NOME_PASTA.AsString+'\inventario.xml';
                 
                 If (dmDados.GerarXMLInvertario(M_CDLOJA, dmDados.cdsListaEstoque, aNomeArquivo, edtDtInventario.Date)) Then
                  begin
                       if FileExists(aNomeArquivo) Then
                       begin
                            dmDados.RefreshCDS(dmDados.cdsConfig);
                            try
                                 {aDataMov := uFuncoes.RemoveChar(DatetoStr(Date));
                                 aHoraMov := uFuncoes.RemoveChar(TimetoStr(Time));}
                                 //
                                 aNomeArquivoZip := '\inventario.zip';
                                { ZipMaster1.ZipFileName := dmDados.cdsConfigCFG_NOME_PASTA.AsString + aNomeArquivoZip;
                                 ZipMaster1.FspecArgs.Clear;
                                 ZipMaster1.FspecArgs.Add(aNomeArquivo);
                                 ZipMaster1.Add;}
                                 //
                                 HashIdentificacao := frmMain.GeraMD5Arquivo(aNomeArquivo);  // aNomeArquivoZip
                                 //lblMD5.Caption := HashIdentificacao;
                                 //
                                 If (dmDados.AddRegistroHastArquivo(aNomeArquivo,  HashIdentificacao, Strtoint(uFormMainSngpc.M_CDUSUA))) Then
                                 begin
                                     Application.MessageBox(PChar('Arquivo '+ ZipMaster1.ZipFileName +' gerado com sucesso.'),'ATENÇÃO',
                                         MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                                     Close;
                                 End;   //
                            Except
                               on e: exception do
                               begin
                                   Application.MessageBox(PChar('Erro ao tentar compactar arquivo! Erro:'+#13
                                           + E.Message),
                                           'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
                               End;
                            End;
                       End;      // if FileExists(aNomeArquivo) Then
                  End;
                    {  Application.MessageBox(PChar('Arquivo gerado com sucesso.'+#13+
                                                   'Localização arquivo : '+aNomeArquivo ),
                              'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);}
           Except
                on e: exception do
                 begin
                      Application.MessageBox(PChar('Erro ao tentar gera arquivo para anvisa!!!'+#13
                         + E.Message), 'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
                 End;
           End;
         End;  
      End;
  { End
   Else
         Application.MessageBox('Inventário já fechado na anvisa!!!',
                   'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);   }
end;

procedure TfrmConsultaEstoque.btnImprimirClick(Sender: TObject);
begin
  inherited;
      if not (dsListaProdutos.DataSet.IsEmpty) Then
      begin
           With ppReport1 do
           begin
                PrintReport;
           End;
      End;
end;

procedure TfrmConsultaEstoque.grdConsultarDblClick(Sender: TObject);
begin
// inherited;

end;

procedure TfrmConsultaEstoque.edtDtInventarioExit(Sender: TObject);
begin
  inherited;
      if not uFuncoes.Empty(Ufuncoes.RemoveChar(edtDtInventario.Text)) Then
        begin
            try
                edtDtInventario.Date := StrToDate(edtDtInventario.Text);
                //
                if (edtDtInventario.Date > Date()) Then
                begin
                     Application.MessageBox('Data não pode ser maior que a data atual!','ATENÇÃO',
                        MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                     edtDtInventario.SetFocus;
                     Exit;
                End;
               //
            except
              on EConvertError do
              begin
                   Application.MessageBox('Data Inválida!','ATENÇÃO',
                        MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                   edtDtInventario.SetFocus;
              End;
            end;
        End;
end;

procedure TfrmConsultaEstoque.FormShow(Sender: TObject);
begin
  inherited;
     btnGeraArquivo.Enabled := false;
end;

end.
