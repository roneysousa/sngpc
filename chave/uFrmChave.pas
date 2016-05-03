unit uFrmChave;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  Math, IdHashMessageDigest, Wcrypt2, ExtCtrls, StdCtrls, Buttons,
  Mask;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    edtCNPJ: TMaskEdit;
    edtChave: TEdit;
    Label2: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtCNPJExit(Sender: TObject);
  private
    { Private declarations }
    function MD5(const Input: string): string;
    function CalculaCnpjCpf(Numero : String) : String;
    Function CGC(num: string): boolean;
    Function StrZero(Zeros:string;Quant:integer):String;
    function Empty(inString:String): Boolean;
    function RemoveChar(Const Texto:String):String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  M_CNPJ_INFOG2 : String;

implementation

{$R *.dfm}

{ TForm1 }

function TForm1.MD5(const Input: string): string;
var
  hCryptProvider: HCRYPTPROV;
  hHash: HCRYPTHASH;
  bHash: array[0..$7f] of Byte;
  dwHashLen: DWORD;
  pbContent: PByte;
  i: Integer;
begin
  dwHashLen := 16;
  pbContent := Pointer(PChar(Input));
  Result := '';

  if CryptAcquireContext(@hCryptProvider, nil, nil, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT or CRYPT_MACHINE_KEYSET) then
  begin
    if CryptCreateHash(hCryptProvider, CALG_MD5, 0, 0, @hHash) then
    begin
      if CryptHashData(hHash, pbContent, Length(Input), 0) then
      begin
        if CryptGetHashParam(hHash, HP_HASHVAL, @bHash[0], @dwHashLen, 0) then
        begin
          for i := 0 to dwHashLen - 1 do
          begin
            Result := Result + Format('%.2x', [bHash[i]]);
          end;
        end;
      end;
      CryptDestroyHash(hHash);
    end;
    CryptReleaseContext(hCryptProvider, 0);
  end;
  Result := AnsiLowerCase(Result);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
     Application.Terminate;
end;

function TForm1.CalculaCnpjCpf(Numero: String): String;
var
  i,j,k, Soma, Digito : Integer;
  CNPJ : Boolean;
begin
  Result := Numero;
  case Length(Numero) of
  9:
  CNPJ := False;
  12:
  CNPJ := True;
  else
  Exit;
  end;
  for j := 1 to 2 do
  begin
  k := 2;
  Soma := 0;
  for i := Length(Result) downto 1 do
  begin
  Soma := Soma + (Ord(Result[i])-Ord('0'))*k;
  Inc(k);
  if (k > 9) and CNPJ then
  k := 2;
  end;
  Digito := 11 - Soma mod 11;
  if Digito >= 10 then
  Digito := 0;
  Result := Result + Chr(Digito + Ord('0'));
  end;
end;

function TForm1.CGC(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12: integer;
d1,d2: integer;
digitado, calculado: string;
begin
n1:=StrToInt(num[1]);
n2:=StrToInt(num[2]);
n3:=StrToInt(num[3]);
n4:=StrToInt(num[4]);
n5:=StrToInt(num[5]);
n6:=StrToInt(num[6]);
n7:=StrToInt(num[7]);
n8:=StrToInt(num[8]);
n9:=StrToInt(num[9]);
n10:=StrToInt(num[10]);
n11:=StrToInt(num[11]);
n12:=StrToInt(num[12]);
d1:=n12*2+n11*3+n10*4+n9*5+n8*6+n7*7+n6*8+n5*9+n4*2+n3*3+n2*4+n1*5;
d1:=11-(d1 mod 11);
if d1>=10 then d1:=0;
d2:=d1*2+n12*3+n11*4+n10*5+n9*6+n8*7+n7*8+n6*9+n5*2+n4*3+n3*4+n2*5+n1*6;
d2:=11-(d2 mod 11);
if d2>=10 then d2:=0;
calculado:=inttostr(d1)+inttostr(d2);
digitado:=num[13]+num[14];
if calculado=digitado then
  cgc:=true
  else
  cgc:=false;
end;

function TForm1.StrZero(Zeros: string; Quant: integer): String;
{Insere Zeros à frente de uma string}
var
I,Tamanho:integer;
aux: string;
begin
  aux := zeros;
  Tamanho := length(ZEROS);
  ZEROS:='';
  for I:=1 to quant-tamanho do
  ZEROS:=ZEROS + '0';
  aux := zeros + aux;
  StrZero := aux;
end;

function TForm1.Empty(inString: String): Boolean;
Var
  index : Byte;
Begin
  index := 1;
  Empty := True;
  while (index <= Length(inString))and (index <> 0) do
  begin
  if inString[index] = ' ' Then
  begin
inc(index)
  end
  else
Begin
  Empty := False;
  index := 0
end;
  end;
end;

procedure TForm1.btnOKClick(Sender: TObject);
  Var
   aMD5, aCNPJ_Empresa : String;
begin
     if Empty(RemoveChar( edtCNPJ.Text) ) Then
     begin
          MessageDlg('Digite o CNPJ da empresa!!!', mtInformation, [mbOk], 0);
          edtCNPJ.SetFocus;
          Exit;
     End;
     //
     if not Empty(RemoveChar( edtCNPJ.Text) ) Then
     begin
          if (RemoveChar( edtCNPJ.Text)  = '00000000000000') Then
          begin
              MessageDlg('CNPJ inválido!!!', mtInformation, [mbOk], 0);
              edtCNPJ.SetFocus;
              Exit;
          End;
          //
         If not (CGC(edtCNPJ.Text)) Then
          Begin
              MessageDlg('CNPJ inválido!!!', mtInformation, [mbOk], 0);
              edtCNPJ.SetFocus;
              Exit;
          End;
      End;
      //
      M_CNPJ_INFOG2 := '07042296000152';
      aCNPJ_Empresa := RemoveChar( edtCNPJ.Text );
      aMD5 := MD5(aCNPJ_Empresa + M_CNPJ_INFOG2);
      //
      edtChave.text := aMD5;
end;

function TForm1.RemoveChar(const Texto: String): String;
//
// Remove caracteres de uma string deixando apenas numeros
//
var
I: integer;
S: string;
begin
S := '';
for I := 1 To Length(Texto) Do
   begin
   if (Texto[I] in ['0'..'9']) then
       begin
       S := S + Copy(Texto, I, 1);
       end;
   end;
   result := S;
end;

procedure TForm1.edtCNPJExit(Sender: TObject);
begin
     if not Empty(RemoveChar( edtCNPJ.Text) ) Then
     begin
         If not (CGC(edtCNPJ.Text)) Then
          Begin
              MessageDlg('CNPJ inválido!!!', mtInformation, [mbOk], 0);
              edtCNPJ.SetFocus;
              Exit;
          End;
     End;
end;

end.
