unit uFrmTransmitiArquivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, Buttons, ZipMstr, ComCtrls, Types,
  InvokeRegistry, Rio, SOAPHTTPClient, Math, JvComponentBase, JvCipher;

type
  TFrmTransmitirArquivo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    btnEnviar: TBitBtn;
    OpenDialog1: TOpenDialog;
    ZipMaster1: TZipMaster;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    edtEmail: TEdit;
    Label2: TLabel;
    edtSenha: TEdit;
    Label3: TLabel;
    edtNomeArquivo: TEdit;
    lblMD5: TLabel;
    Label4: TLabel;
    edtEmail2: TEdit;
    Label5: TLabel;
    edtSenha2: TEdit;
    Label6: TLabel;
    edtHast: TEdit;
    btnProcurar: TBitBtn;
    Label8: TLabel;
    edtCNPJ: TEdit;
    TabSheet3: TTabSheet;
    Label9: TLabel;
    edtEmail3: TEdit;
    Label10: TLabel;
    edtSenha3: TEdit;
    Label11: TLabel;
    edtNomeArquivo3: TEdit;
    btnProcuraFile: TBitBtn;
    procedure btnEnviarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure btnProcuraFileClick(Sender: TObject);
  private
    { Private declarations }
     procedure ByteArrayToFIle(    const ByteArray : TByteDynArray;
       const FileName : string );
     function FIleToByteArray( const FileName : string ) : TByteDynArray;
     function Encode64(S: string): string;
     function Decode64(S: string): string;
  public
    { Public declarations }
  end;

const
  Codes64 = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz+/';

var
  FrmTransmitirArquivo: TFrmTransmitirArquivo;
  iOpcao : Integer;

implementation

uses uFuncoes, udmDados, DB, sngpc_homologacao, uFormMainSngpc;

{$R *.dfm}

procedure TFrmTransmitirArquivo.btnEnviarClick(Sender: TObject);
Var
   aNomeArquivo, aNomeArquivoZip, aNomeArquivoXML : String;
   aDataMov, aHoraMov : String;
   ws: sngpcSoap;
   comp, HashIdentificacao, aCNPJ : string;
   FileData : TByteDynArray;
   Arquivo: TFileStream;
   TheMStream : TMemoryStream;
   MyFile : TFileStream;
   aStr1, aStr2 : String;
   aStrRetorno : TStrings;
   //
   lConteudo, AConteudo : String;
   lSsAux : TStringStream;
   lStreamOrg : TFileStream;
   //
   lStreamDst : TFileStream;
   Buffer : PChar;
   //
   //Service : ISolucoes;
begin
     if (iOpcao = 1) Then
     begin
      If uFuncoes.Empty(edtEmail.Text) Then
       Begin
           Application.MessageBox('Digite o email do responsável técnico.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtEmail.SetFocus;
           Exit;
       End;
       //
        If uFuncoes.Empty(edtSenha.Text) Then
       Begin
           Application.MessageBox('Digite a senha do responsável técnico.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtSenha.SetFocus;
           Exit;
       End;
       //
        If uFuncoes.Empty(edtNomeArquivo.Text) Then
        Begin
           Application.MessageBox('Selecione o arquivo para transmitir.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           btnProcurar.SetFocus;
           Exit;
        End;
       //
       dmDados.RefreshCDS(dmDados.cdsConfig);
       try
            aDataMov := uFuncoes.RemoveChar(DatetoStr(Date));
            aHoraMov := uFuncoes.RemoveChar(TimetoStr(Time));
            //
            aNomeArquivoZip := '\sngpc_'+aDataMov+'_'+aHoraMov+'.zip';
            ZipMaster1.ZipFileName := dmDados.cdsConfigCFG_NOME_PASTA.AsString + aNomeArquivoZip;
            ZipMaster1.FspecArgs.Clear;
            ZipMaster1.FspecArgs.Add(edtNomeArquivo.Text);
            ZipMaster1.Add;
            //
            HashIdentificacao := frmMain.GeraMD5Arquivo(ZipMaster1.ZipFileName);
            lblMD5.Caption := HashIdentificacao;
            //
            If (dmDados.AddRegistroHastArquivo(aNomeArquivoZip,  HashIdentificacao, Strtoint(uFormMainSngpc.M_CDUSUA))) Then
            begin
                Application.MessageBox(PChar('Arquivo '+ ZipMaster1.ZipFileName +' gerado com sucesso.'),'ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               // Close;
            End;
            //
            {try
                // Stream auxiliar para recuperar o conteúdo binário do arquivo
                lSsAux := TStringStream.Create ('');
                lStreamOrg := TFileStream.Create (ZipMaster1.ZipFileName, fmOpenRead);

                // Copia o conteúdo do arquivo para o stream em memória
                lSsAux.CopyFrom (lStreamOrg, 0);
                lSsAux.Position := 0;

                // Prepara o conteúdo binário, codificando-o como um texto
                lConteudo := lSsAux.DataString;
                lConteudo := Encode64(lConteudo);
                //
                // Cria o novo arquivo vazio
                 lStreamDst := TFileStream.Create (ZipMaster1.ZipFileName, fmCreate);

                 // Decodifica o conteúdo
                 AConteudo := Decode64 (AConteudo);

                 // Grava o conteúdo decodificado no arquivo
                 Buffer := PChar (AConteudo);
                 lStreamDst.Write (Buffer^, Length(AConteudo));
                 //
                 Application.MessageBox(PChar('Retorno: '+ lConteudo+#13+
                                              'Decodificado: '+AConteudo),'ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            Finally
                lStreamOrg.Free();
                lSsAux.Free();
                lStreamDst.Free ();
            End;   }
         { try
            FileData := FileToByteArray( ZipMaster1.ZipFileName );
            //
            ws := GetsngpcSoap();
            comp := ws.EnviaArquivoSNGPC(edtEmail.Text, edtSenha.Text, FileData, HashIdentificacao);
            //
            Application.MessageBox(PChar(comp),'ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          Finally

          End;}

       Except
          on e: exception do
          begin
              Application.MessageBox(PChar('Erro ao tentar compactar arquivo! Erro:'+#13
                      + E.Message),
                      'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
          End;
       End;
     End;
     //
     If (iOpcao = 2) Then
     Begin
       If uFuncoes.Empty(edtEmail2.Text) Then
       Begin
           Application.MessageBox('Digite o email do responsável técnico.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtEmail2.SetFocus;
           Exit;
       End;
       //
        If uFuncoes.Empty(edtSenha2.Text) Then
       Begin
           Application.MessageBox('Digite a senha do responsável técnico.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtSenha2.SetFocus;
           Exit;
       End;
       //
        If uFuncoes.Empty(edtCNPJ.Text) Then
        Begin
           Application.MessageBox('CNPJ da empresa.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtCNPJ.SetFocus;
           Exit;
        End;
        //
        If uFuncoes.Empty(edtHast.Text) Then
        Begin
           Application.MessageBox('Hast do arquivo.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtHast.SetFocus;
           Exit;
        End;
        //
        aCNPJ := edtCNPJ.Text;
        HashIdentificacao := edtHast.Text;
        lblMD5.Caption :=  HashIdentificacao;
        //
        btnEnviar.Enabled := False;
        Application.ProcessMessages;
        Try
          try
               { Service := CoSolucoes.Create;
                //
                comp := Service.ConsultaDadosArquivoSNGPC('0', UpperCase(edtEmail2.Text),
                      uFuncoes.Alltrim(edtSenha2.Text), uFuncoes.Alltrim(aCNPJ),
                      uFuncoes.Alltrim(HashIdentificacao));  }

                Application.MessageBox(PChar(comp),'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          Except
                on e: exception do
                begin
                    Application.MessageBox(PChar('Erro ao tenta realizar consulta no arquivo! Erro:'+#13
                        + E.Message),
                         'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
                 End;
          End
          //
        Finally
             btnEnviar.Enabled := True;
        End;    
       // Application.ProcessMessages;
     End;
     //
     if (iOpcao = 3) Then
     begin
      If uFuncoes.Empty(edtEmail3.Text) Then
       Begin
           Application.MessageBox('Digite o email do responsável técnico.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtEmail3.SetFocus;
           Exit;
       End;
       //
        If uFuncoes.Empty(edtSenha3.Text) Then
       Begin
           Application.MessageBox('Digite a senha do responsável técnico.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtSenha3.SetFocus;
           Exit;
       End;
       //
        If uFuncoes.Empty(edtNomeArquivo3.Text) Then
        Begin
           Application.MessageBox('Selecione o arquivo para transmitir.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           btnProcuraFile.SetFocus;
           Exit;
        End;
       //
       dmDados.RefreshCDS(dmDados.cdsConfig);
       try
            aNomeArquivoXML := OpenDialog1.FileName;
            //
            aDataMov := uFuncoes.RemoveChar(DatetoStr(Date));
            aHoraMov := uFuncoes.RemoveChar(TimetoStr(Time));
            //
            aNomeArquivoZip := '\sngpc_'+aDataMov+'_'+aHoraMov+'.zip';
            ZipMaster1.ZipFileName := dmDados.cdsConfigCFG_NOME_PASTA.AsString + aNomeArquivoZip;
            ZipMaster1.FspecArgs.Clear;
            ZipMaster1.FspecArgs.Add(aNomeArquivoXML);
            ZipMaster1.Add;
            //
            HashIdentificacao := frmMain.GeraMD5Arquivo(aNomeArquivoXML);
            lblMD5.Caption := HashIdentificacao;
            //
            If (dmDados.AddRegistroHastArquivo(aNomeArquivoZip,  HashIdentificacao, Strtoint(uFormMainSngpc.M_CDUSUA))) Then
            begin
                Application.MessageBox(PChar('Arquivo '+ aNomeArquivoZip +' gerado com sucesso.'),'ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                Close;
            End;
            //
           { try
                FileData := FileToByteArray( aNomeArquivoZip );
                //
                ws := GetsngpcSoap();
                comp := ws.EnviaArquivoSNGPC(edtEmail3.Text, edtSenha3.Text, FileData, HashIdentificacao);
                //
                Application.MessageBox(PChar(comp),'ATENÇÃO',  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            Finally

            End;   }
       Except
          on e: exception do
          begin
              Application.MessageBox(PChar('Erro ao tentar compactar arquivo! Erro:'+#13
                      + E.Message),
                      'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
          End;
       End;
     End
end;

procedure TFrmTransmitirArquivo.FormShow(Sender: TObject);
begin
    With dmDados.cdsFarmaceutico  do
      begin
           close;
           Params[0].AsInteger := 1;
           Open;
           //
           if not (IsEmpty) Then
           begin
                edtEmail.Text := dmDados.cdsFarmaceuticoEMAIL.AsString;
                edtSenha.Text := dmDados.cdsFarmaceuticoSENHA.AsString;
                //
                edtEmail2.Text := dmDados.cdsFarmaceuticoEMAIL.AsString;
                edtSenha2.Text  := dmDados.cdsFarmaceuticoSENHA.AsString;
                //
                edtEmail3.Text := dmDados.cdsFarmaceuticoEMAIL.AsString;
                edtSenha3.Text  := dmDados.cdsFarmaceuticoSENHA.AsString;
                //
                dmDados.FilterCDS(dmDados.cdsLojas,fsInteger, dmDados.cdsFarmaceuticoFAR_EMPRESA.AsString);
                edtCNPJ.Text := dmDados.cdsLojasEMP_CNPJ.AsString;

           End;
      End;
      //
      if (iOpcao = 1) Then
      begin
           TabSheet1.TabVisible := True;
           TabSheet2.TabVisible := False;
           TabSheet3.TabVisible := False;
           //
           btnEnviar.Caption := '&Gera';
      End;
      if (iOpcao = 2) then
      begin
           TabSheet1.TabVisible := False;
           TabSheet2.TabVisible := True;
           TabSheet3.TabVisible := False;
           //
           dmDados.RefreshCDS(dmDados.cdsConfig);
           With dmDados.cdsArquivoHast do
           begin
                Close;
                Params[0].AsInteger := dmDados.cdsConfigCFG_SEQUENCIA_MOVIMENTO.AsInteger;
                Open;
                //
                if not (dmDados.cdsArquivoHast.IsEmpty) Then
                begin
                     edtHast.Text := dmDados.cdsArquivoHastHASH_MD5.AsString;
                End;
           End;
           //
           btnEnviar.Caption := '&Consultar';
      End;
      //
      if (iOpcao = 3) then
      begin
           TabSheet1.TabVisible := False;
           TabSheet2.TabVisible := False;
           TabSheet3.TabVisible := True;
           //
           btnEnviar.Caption := '&Enviar';
      End;
end;

procedure TFrmTransmitirArquivo.btnProcurarClick(Sender: TObject);
begin
    dmDados.RefreshCDS(dmDados.cdsConfig);
    OpenDialog1.InitialDir := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
    if (iOpcao = 1) Then
       OpenDialog1.Filter := '*.xml|*.xml'
    Else
       OpenDialog1.Filter := '*.zip|*.zip';
    if (OpenDialog1.Execute) Then
         edtNomeArquivo.Text := OpenDialog1.FileName;
end;

procedure TFrmTransmitirArquivo.ByteArrayToFIle(
  const ByteArray: TByteDynArray; const FileName: string);
var Count : integer;
 F : FIle of Byte;
 pTemp : Pointer;
begin
 AssignFile( F, FileName );
 Rewrite(F);
 try
  Count := Length( ByteArray );
  pTemp := @ByteArray[0];
  BlockWrite(F, pTemp^, Count );
 finally
  CloseFile( F );
 end;
end;

function TFrmTransmitirArquivo.FIleToByteArray(
  const FileName: string): TByteDynArray;
const BLOCK_SIZE=1024;
var BytesRead, BytesToWrite, Count : integer;
 F : FIle of Byte;
 pTemp : Pointer;
begin
 AssignFile( F, FileName );
 Reset(F);
try
 Count := FileSize( F );
 SetLength(Result, Count );
 pTemp := @Result[0];
 BytesRead := BLOCK_SIZE;
 while (BytesRead = BLOCK_SIZE ) do
 begin
  BytesToWrite := Min(Count, BLOCK_SIZE);
  BlockRead(F, pTemp^, BytesToWrite , BytesRead );
   pTemp := Pointer(LongInt(pTemp) + BLOCK_SIZE);
  Count := Count-BytesRead;
 end;
finally
  CloseFile( F );
 end;
end;

procedure TFrmTransmitirArquivo.btnProcuraFileClick(Sender: TObject);
begin
    dmDados.RefreshCDS(dmDados.cdsConfig);
    OpenDialog1.InitialDir := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
    //
    OpenDialog1.Filter := '*.xml|*.xml';
    if (OpenDialog1.Execute) Then
         edtNomeArquivo3.Text := OpenDialog1.FileName;
end;


function TFrmTransmitirArquivo.Decode64(S: string): string;
var
  i: Integer;
  a: Integer;
  x: Integer;
  b: Integer;
begin
  Result := '';
  a := 0;
  b := 0;
  for i := 1 to Length(s) do
  begin
    x := Ord(s[i]);
    b := b * 256 + x;
    a := a + 8;
    while a >= 6 do
    begin
      a := a - 6;
      x := b div (1 shl a);
      b := b mod (1 shl a);
      Result := Result + Codes64[x + 1];
    end;
  end;
  if a > 0 then
  begin
    x := b shl (6 - a);
    Result := Result + Codes64[x + 1];
  end;
end;

function TFrmTransmitirArquivo.Encode64(S: string): string;
Var
  i: Integer;
  a: Integer;
  x: Integer;
  b: Integer;
begin
  Result := '';
  a := 0;
  b := 0;
  for i := 1 to Length(s) do
  begin
    x := Pos(s[i], codes64) - 1;
    if x >= 0 then
    begin
      b := b * 64 + x;
      a := a + 6;
      if a >= 8 then
      begin
        a := a - 8;
        x := b shr a;
        b := b mod (1 shl a);
        x := x mod 256;
        Result := Result + chr(x);
      end;
    end
    else
      Exit;
  end;
end;

end.
