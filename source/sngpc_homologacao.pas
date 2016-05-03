// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://homologacao.anvisa.gov.br/sngpc/webservice/sngpc.asmx?WSDL
// Encoding : utf-8
// Version  : 1.0
// (17/04/2013 11:40:07 - 1.33.2.5)
// ************************************************************************ //

unit sngpc_homologacao;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:base64Binary    - "http://www.w3.org/2001/XMLSchema"



  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // binding   : sngpcSoap
  // service   : sngpc
  // port      : sngpcSoap
  // URL       : http://homologacao.anvisa.gov.br/sngpc/webservice/sngpc.asmx
  // ************************************************************************ //
  sngpcSoap = interface(IInvokable)
  ['{7B0BED3D-F163-6734-5EF6-E4C4D60D2270}']
    function  ValidarUsuario(const Email: WideString; const Senha: WideString): WideString; stdcall;
    function  EnviaArquivoSNGPC(const Email: WideString; const Senha: WideString; const Arq: TByteDynArray; const HashIdentificacao: WideString): WideString; stdcall;
    function  ConsultaDadosArquivoSNGPC(const Email: WideString; const Senha: WideString; const CNPJ: WideString; const Hash: WideString): WideString; stdcall;
  end;

function GetsngpcSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): sngpcSoap;


implementation

function GetsngpcSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): sngpcSoap;
const
  defWSDL = 'http://homologacao.anvisa.gov.br/sngpc/webservice/sngpc.asmx?WSDL';
  defURL  = 'http://homologacao.anvisa.gov.br/sngpc/webservice/sngpc.asmx';
  defSvc  = 'sngpc';
  defPrt  = 'sngpcSoap';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as sngpcSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(sngpcSoap), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(sngpcSoap), 'http://tempuri.org/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(sngpcSoap), ioDocument);

end.