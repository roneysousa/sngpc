unit uFormMainSngpc;

interface

uses                 
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ToolWin, ComCtrls, ImgList, ExtCtrls, ActnList, jpeg,
  RXShell, StdCtrls, Math, IdHashMessageDigest, Wcrypt2, Shellapi, DB,
  Mask, DBCtrls;   // , frxpngimage;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    mnuCadastro: TMenuItem;
    mnuMovimento: TMenuItem;
    mnuCompradorItem: TMenuItem;
    mnuMedicoItem: TMenuItem;
    N1: TMenuItem;
    mnuTipoReceituarioItem: TMenuItem;
    mnuTipoUsoMedicamentoItem: TMenuItem;
    mnuTpOpNotaFiscalItem: TMenuItem;
    mnuConselhoProfissionalItem: TMenuItem;
    mnuMotivodaPerdaItem: TMenuItem;
    mnuUndInsumoItem: TMenuItem;
    mnuUndFarmacotecnicaItem: TMenuItem;
    mnuDocumentoItem: TMenuItem;
    mnuExpedidorItem: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    Info: TStatusBar;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    imgLogon: TImage;
    ActionList1: TActionList;
    actSair: TAction;
    actMedico: TAction;
    actComprador: TAction;
    actReceituario: TAction;
    mnuVendasItem: TMenuItem;
    btnVenda: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    actVenda: TAction;
    ToolButton1: TToolButton;
    Timer1: TTimer;
    mnuUtilitarios: TMenuItem;
    mnuUsuariosItem: TMenuItem;
    actUsuarios: TAction;
    mnuConfiguracoesItem: TMenuItem;
    mnuLojaItem: TMenuItem;
    actLoja: TAction;
    mnuAjuda: TMenuItem;
    mnuSobreItem: TMenuItem;
    actSobre: TAction;
    N3: TMenuItem;
    actEntradas: TAction;
    actPerdas: TAction;
    actTransferencias: TAction;
    mnuGerarArquivoItem: TMenuItem;
    actGerar: TAction;
    Image1: TImage;
    actConfig: TAction;
    mnuProdutosItem: TMenuItem;
    actProdutos: TAction;
    N5: TMenuItem;
    mnuMedicamentosItem: TMenuItem;
    mnuMovEntradasProd: TMenuItem;
    mnuPerdasSubItem: TMenuItem;
    mnuTransfernciasSubItem: TMenuItem;
    mnuInsumosItem: TMenuItem;
    mnuInsEntradasSubItem: TMenuItem;
    mnuInsPerdaSubItem: TMenuItem;
    mnuInsTransfSubItem: TMenuItem;
    VendaInsumo1: TMenuItem;
    actVendaInsumo: TAction;
    ToolButton4: TToolButton;
    RxTrayIcon1: TRxTrayIcon;
    PopupMenu1: TPopupMenu;
    mnuMaximizar: TMenuItem;
    Sobre1: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    N4: TMenuItem;
    mnuMinimizar: TMenuItem;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    mnuConsultaItem: TMenuItem;
    mnuConsVendasItem: TMenuItem;
    mnuConsEntradasItem: TMenuItem;
    mnuConsPerdasItem: TMenuItem;
    mnuConsTransfernciasItem: TMenuItem;
    actConsVendas: TAction;
    actConsEntradas: TAction;
    actConsPerdas: TAction;
    actConsTransf: TAction;
    actCancelaVenda: TAction;
    N6: TMenuItem;
    CancelaVenda1: TMenuItem;
    Timer2: TTimer;
    N7: TMenuItem;
    mnuConsProdutosItem: TMenuItem;
    actConsProdutos: TAction;
    N8: TMenuItem;
    Estoque1: TMenuItem;
    actInventarioLancamento: TAction;
    mnuRelatorios: TMenuItem;
    mnuEstoqueItem: TMenuItem;
    mnuRelProdutosSubItem: TMenuItem;
    actRelEstoque: TAction;
    N9: TMenuItem;
    ImportarDados1: TMenuItem;
    mnuBalancoSubItem: TMenuItem;
    mnuTransmitirArquivoSubItem: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    edtDataMov: TEdit;
    Consulta1: TMenuItem;
    actAberturaInv: TAction;
    actFechamentoInv: TAction;
    actEstoqueConsulta: TAction;
    mnuInvertarioSubItem: TMenuItem;
    Abertura1: TMenuItem;
    Lanamento1: TMenuItem;
    Fechamento1: TMenuItem;
    actPerda: TAction;
    actTransferencia: TAction;
    actFechamentoDia: TAction;
    N10: TMenuItem;
    Fechamento2: TMenuItem;
    actTransmitirInvertario: TAction;
    actValidarInvertario: TAction;
    N11: TMenuItem;
    mnuTransmitirInvertrioSubItem: TMenuItem;
    mnuValidarInvertrioSubItem: TMenuItem;
    actTransmitirArquivo: TAction;
    actExcluirMovimento: TAction;
    ExcluirMovimento1: TMenuItem;
    actImportaDados: TAction;
    N12: TMenuItem;
    actMovProduto: TAction;
    N13: TMenuItem;
    MovimentodeProduto1: TMenuItem;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mnuTpOpNotaFiscalItemClick(Sender: TObject);
    procedure mnuTipoUsoMedicamentoItemClick(Sender: TObject);
    procedure mnuConselhoProfissionalItemClick(Sender: TObject);
    procedure mnuMotivodaPerdaItemClick(Sender: TObject);
    procedure mnuUndInsumoItemClick(Sender: TObject);
    procedure mnuUndFarmacotecnicaItemClick(Sender: TObject);
    procedure mnuDocumentoItemClick(Sender: TObject);
    procedure mnuExpedidorItemClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actMedicoExecute(Sender: TObject);
    procedure actCompradorExecute(Sender: TObject);
    procedure actReceituarioExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actVendaExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actUsuariosExecute(Sender: TObject);
    procedure actLojaExecute(Sender: TObject);
    procedure actSobreExecute(Sender: TObject);
    procedure actGerarExecute(Sender: TObject);
    procedure actConfigExecute(Sender: TObject);
    procedure actProdutosExecute(Sender: TObject);
    procedure mnuTransfernciasSubItemClick(Sender: TObject);
    procedure mnuInsEntradasSubItemClick(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure mnuMaximizarClick(Sender: TObject);
    procedure mnuMinimizarClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actConsVendasExecute(Sender: TObject);
    procedure actConsEntradasExecute(Sender: TObject);
    procedure actConsPerdasExecute(Sender: TObject);
    procedure actConsTransfExecute(Sender: TObject);
    procedure actCancelaVendaExecute(Sender: TObject);
    procedure actEntradasExecute(Sender: TObject);
    procedure actTransferenciasExecute(Sender: TObject);
    procedure actPerdasExecute(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure actConsProdutosExecute(Sender: TObject);
    procedure actInventarioLancamentoExecute(Sender: TObject);
    procedure actRelEstoqueExecute(Sender: TObject);
    procedure ImportarDados1Click(Sender: TObject);
    procedure mnuBalancoSubItemClick(Sender: TObject);
    procedure mnuTransmitirArquivoSubItemClick(Sender: TObject);
    procedure actAberturaInvExecute(Sender: TObject);
    procedure actFechamentoInvExecute(Sender: TObject);
    procedure actEstoqueConsultaExecute(Sender: TObject);
    procedure actTransferenciaExecute(Sender: TObject);
    procedure actFechamentoDiaExecute(Sender: TObject);
    procedure actTransmitirInvertarioExecute(Sender: TObject);
    procedure actValidarInvertarioExecute(Sender: TObject);
    procedure actTransmitirArquivoExecute(Sender: TObject);
    procedure actExcluirMovimentoExecute(Sender: TObject);
    procedure actImportaDadosExecute(Sender: TObject);
    procedure actMovProdutoExecute(Sender: TObject);
  private
    { Private declarations }
    procedure IMAGEM_LOGO;
    procedure DisplayHint(Sender: TObject);
    procedure SetJustify(Menu: TMenu; MenuItem: TMenuItem; Justify: Byte);
    function ForceForegroundWindow(wnd: THandle): Boolean;
    procedure Testa_Nome_Pasta;
    Procedure HabilitarMenu();
  public
    { Public declarations }
    Procedure AbreForm(aClasseForm: TComponentClass; aForm : TForm);
    Procedure AtualizarDataMovimento();
    function GeraMD5Arquivo(aNomeArquivo : String):String;
    function MD5(const Input: string): string;
    procedure ExecutePrograma(Nome, Parametros: String);
    Function ValidarAcesso(): Boolean;
    //function GetMd5(const Value: AnsiString): string; overload;

  end;

var
  frmMain: TfrmMain;
  M_CDUSUA, M_NMUSUA, M_NMEMPR, M_FLSUPE, M_SNATUA, M_NMAQUI, M_NMPAST : String;
  M_FLARQU, M_FLLOGI : Boolean;
  SearchRec : TSearchRec;
  M_DTMOVI : TDate;
  M_CNPJ_INFOG2 : String;

implementation

uses udmDados, uFuncoes, uLogon, uSobre, uFrmCadLoja, uFrmCadComprador,
  uFrmCadMedicos, uFrmCadProdutos, uFrmCadReceituario,
  uFrmCadUsoMedicamneto, uFrmCadConsProfissional, uFrmCadOpNotaFiscal,
  uFrmCadMotivoPerda, uFrmCadUndInsumo, uFrmCadUndFarmaco, uFrmCadTipoDoc,
  uFrmCadOrgaoExpedidor, uFrmConfig, uFrmCadUsuarios, uFrmInventario,
  uFrmListaEstoque, uFrmCadEntradaProdutos, uFrmAberturaInvertario,
  uFrmFecharInvertario, uFrmConsultaEstoque, DBClient,
  uFrmTransmitiArquivo, uMD5, uFrmVendas, uFrmCadPerdas, uFrmGeraArquivo,
  uFrmConsVendas, uFrmConsEntradas, uFrmConsPerdas,
  uFrmCadFechamentoMovimento, uFrmImportaDados, uFrmCadTransferencia,
  uFrmConsTransf, uFrmRelEstoque, uFrmRelBalanco,
  uFrmCadFechamentoMovimento2, uFrmRelMovProduto;

{uses uFrmCadComprador, uFrmCadMedicos, uFrmCadReceituario,
  uFrmCadOpNotaFiscal, uFrmCadUsoMedicamneto, uFrmCadConsProfissional,
  uFrmCadMotivoPerda, uFrmCadUndInsumo, uFrmCadUndFarmaco, uFrmCadTipoDoc,
  uFrmCadOrgaoExpedidor, uVendas, udmDados, uFuncoes, uFrmCadUsuarios,
  uLogon, uFrmConfig, uFrmCadLoja, uSobre, uFrmMovimentos, uFrmGeraArquivo,
  uFrmCadProdutos, uFrmMovInsumos, uFrmVendaInsumo, uFrmConsVendas,
  uFrmConsEntradas, uFrmConsPerdas, uFrmConsTransf, uFrmCancelaVenda,
  uFrmConsProdutos, uFrmInventario, uFrmRelEstoque, frmImportaDados,
  uFrmRelBalanco, uFrmEnviarArquivo;}

const
     ScreenWidth: LongInt = 800; {I designed my form in 800x600 mode.}
     ScreenHeight: LongInt = 600;
     M_USERMASTER = '000';
     M_SNMASTER   = 'ADMG2';
     

{$R *.dfm}

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     CanClose := False;
     If Application.MessageBox('Sair do Programa InfoG2 SNGPC?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
     begin
          CanClose := True;
          Application.Terminate;
     End;
end;

procedure TfrmMain.mnuTpOpNotaFiscalItemClick(Sender: TObject);
begin
    AbreForm(TfrmCadOpNotaFiscal, frmCadOpNotaFiscal);
end;

procedure TfrmMain.mnuTipoUsoMedicamentoItemClick(Sender: TObject);
begin
     AbreForm(TfrmCadUsoMedicamento, frmCadUsoMedicamento);
end;

procedure TfrmMain.mnuConselhoProfissionalItemClick(Sender: TObject);
begin
    AbreForm(TfrmCadConsProfissional, frmCadConsProfissional);
end;

procedure TfrmMain.mnuMotivodaPerdaItemClick(Sender: TObject);
begin
    AbreForm(TfrmCadMotivoPerda, frmCadMotivoPerda);
end;

procedure TfrmMain.mnuUndInsumoItemClick(Sender: TObject);
begin
    AbreForm(TfrmCadUndInsumo, frmCadUndInsumo);
end;

procedure TfrmMain.mnuUndFarmacotecnicaItemClick(Sender: TObject);
begin
    AbreForm(TfrmCadUndFarmaco, frmCadUndFarmaco);
end;

procedure TfrmMain.mnuDocumentoItemClick(Sender: TObject);
begin
     AbreForm(TfrmCadTipoDocumento, frmCadTipoDocumento);
end;

procedure TfrmMain.mnuExpedidorItemClick(Sender: TObject);
begin
    AbreForm(TfrmCadOrgaoExpedidor, frmCadOrgaoExpedidor);
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
     imgLogon.Left := (frmMain.Width Div 2) - (imgLogon.Width Div 2);
     imgLogon.Top  := (frmMain.Height Div 2) - (imgLogon.Height Div 2 + Info.Height);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
      {scaled := true;
      if (screen.width <> ScreenWidth) then
      begin
            height := longint(height) * longint(screen.height) DIV ScreenHeight;
            width := longint(width) * longint(screen.width) DIV ScreenWidth;
            scaleBy(screen.width, ScreenWidth);
      end;   }
      //
      if FileExists(ExtractFilePath( Application.ExeName) +'logo.jpeg') Then
           imgLogon.Picture.LoadFromFile(ExtractFilePath( Application.ExeName +'logo.jpeg'));

      //
      dmDados.RefreshCDS(dmDados.cdsConfig) ;
      Application.OnHint := DisplayHint;
      SetJustify(MainMenu1,mnuAjuda,1);
     //
     M_CNPJ_INFOG2 := '07042296000152';

     imgLogon.Left := (frmMain.Width Div 2) - (imgLogon.Width Div 2);
     imgLogon.Top  := (frmMain.Height Div 2) - (imgLogon.Height Div 2 + Info.Height);
     //
     HabilitarMenu();
End;

procedure TfrmMain.actSairExecute(Sender: TObject);
begin
     If Application.MessageBox('Sair do Programa InfoG2 SNGPC?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
             Application.Terminate;
end;

procedure TfrmMain.actMedicoExecute(Sender: TObject);
begin
    AbreForm(TfrmCadMedico, frmCadMedico);
end;

procedure TfrmMain.actCompradorExecute(Sender: TObject);
begin
   AbreForm(TfrmCadComprador, frmCadComprador);
end;

procedure TfrmMain.actReceituarioExecute(Sender: TObject);
begin
   AbreForm(TfrmCadReceituario, frmCadReceituario);
end;

procedure TfrmMain.IMAGEM_LOGO;
begin
    If FileExists(ExtractFilePath( Application.ExeName )+'logo.jpg') Then
        imgLogon.Picture.LoadFromFile(ExtractFilePath( Application.ExeName )+'logo.jpg');
end;

procedure TfrmMain.FormShow(Sender: TObject);
Var
   Dir: string;
begin
    // Data movimento
    AtualizarDataMovimento();
    //
    if uFuncoes.Empty(M_NMPAST) Then
      begin
           dmDados.RefreshCDS(dmDados.cdsConfig);
           M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.asstring;
      End;
    //
     Dir := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
     if not ufuncoes.Empty(Dir) Then
     begin
         if not DirectoryExists(Dir) then
            ForceDirectories(Dir);
     End
     Else
     begin
         Dir := 'C:\INFOG2\XML';
         if not DirectoryExists(Dir) then
            ForceDirectories(Dir);
     End;
     //
     Application.CreateForm(TfrmLogon, frmLogon);
     try
           frmLogon.ShowModal;
     Finally
           frmLogon.Free;
     End;
    // Barra de status
    Info.Panels[0].Text := uFuncoes.StrZero(M_CDUSUA,3) + ' - '+ M_NMUSUA;
    //
    IMAGEM_LOGO;
end;

procedure TfrmMain.actVendaExecute(Sender: TObject);
Var
   iLoja : Integer;
begin
     dmDados.RefreshCDS(dmDados.cdsConfig);
     //
     iLoja := dmDados.cdsConfigCFG_LOJA_PADRAO.AsInteger;
     if not (dmDados.ValidarChave(iLoja)) Then
          Exit;
     //     
     dmDados.RefreshCDS(dmDados.cdsConfig);
     if not uFuncoes.Empty(dmDados.cdsConfigCFG_DATA_ATUAL.AsString)
       and (dmDados.cdsConfigCFG_FLINVENTARIO.AsString = 'N') Then
           AbreForm(TfrmCadVendas, frmCadVendas)
       Else
           Application.MessageBox(PChar('Inventário está aberto na anvisa.'),
                     'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     //
     Action := caFree;
end;

procedure TfrmMain.actUsuariosExecute(Sender: TObject);
begin
    AbreForm(TfrmCadUsuarios, frmCadUsuarios);
end;


procedure TfrmMain.actLojaExecute(Sender: TObject);
begin
    AbreForm(TfrmCadLojas, frmCadLojas);
end;

procedure TfrmMain.actSobreExecute(Sender: TObject);
begin
    AbreForm(TfrmSobre, frmSobre);
end;

procedure TfrmMain.actGerarExecute(Sender: TObject);
begin
     dmDados.RefreshCDS(dmDados.cdsConfig);
     if not uFuncoes.Empty(dmDados.cdsConfigCFG_DATA_ATUAL.AsString)
       and (dmDados.cdsConfigCFG_FLINVENTARIO.AsString = 'N') Then
           AbreForm(TfrmGerarArquivo, frmGerarArquivo)
       Else
           Application.MessageBox(PChar('Inventário está aberto na anvisa.'),
                     'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
end;

procedure TfrmMain.actConfigExecute(Sender: TObject);
begin
    AbreForm(TfrmConfig, frmConfig);
    Testa_Nome_Pasta;
end;

procedure TfrmMain.actProdutosExecute(Sender: TObject);
begin
     AbreForm(TfrmCadProdutos, frmCadProdutos);
end;

procedure TfrmMain.AbreForm(aClasseForm: TComponentClass; aForm: TForm);
begin
      Application.CreateForm(aClasseForm, aForm);
      try
          aForm.ShowModal;
      Finally
          aForm.Free;
      End;
end;

procedure TfrmMain.mnuTransfernciasSubItemClick(Sender: TObject);
begin
  {  dmDados.RefreshCDS(dmDados.cdsConfig);
    If (dmDados.cdsConfigCFG_FLINVENTARIO.AsString = 'S') Then
    Begin
         Application.MessageBox(PChar('Inventário ainda está aberto na anvisa.'),
                     'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
         Exit;
    End;
    // Transferencias
    frmMovimentos := TfrmMovimentos.create(application);
    try
        With frmMovimentos do
        begin
             TabSheet2.TabVisible := False;
             TabSheet1.TabVisible := False;
             uFrmMovimentos.opcao := 3;
             showmodal;
        End;
    finally
        frmMovimentos.Release;
        frmMovimentos := nil;
    end;      }
end;

procedure TfrmMain.mnuInsEntradasSubItemClick(Sender: TObject);
begin
 {   dmDados.RefreshCDS(dmDados.cdsConfig);
    If (dmDados.cdsConfigCFG_FLINVENTARIO.AsString = 'S') Then
    Begin
         Application.MessageBox(PChar('Inventário ainda está aberto na anvisa.'),
                     'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
         Exit;
    End;

    // Entradas
    frmMovInsumos := TfrmMovInsumos.create(application);
    try
        With frmMovInsumos do
        begin
             TabSheet2.TabVisible := False;
             TabSheet3.TabVisible := False;
             uFrmMovInsumos.opcao := 1;
             showmodal;
        End;
    finally
        frmMovInsumos.Release;
        frmMovInsumos := nil;
    end;   }
end;

procedure TfrmMain.ToolButton5Click(Sender: TObject);
begin
     Application.ShowMainForm := False;         // <==== aqui.
     Showwindow(application.handle,sw_hide);    // <== Este oculta da TaskBar
end;

procedure TfrmMain.MenuItem2Click(Sender: TObject);
begin
     If Application.MessageBox('Sair do Programa?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
            Application.Terminate;
end;

procedure TfrmMain.mnuMaximizarClick(Sender: TObject);
begin
     frmMain.WindowState := wsMaximized;
end;

procedure TfrmMain.mnuMinimizarClick(Sender: TObject);
begin
      frmMain.WindowState := wsMinimized;
end;


procedure TfrmMain.PopupMenu1Popup(Sender: TObject);
begin
     If (frmMain.WindowState = wsMinimized) Then
     begin
        mnuMaximizar.Visible := True;
        mnuMinimizar.Visible := False;
     End;
     //
     If (frmMain.WindowState = wsMaximized) Then
     begin
        mnuMaximizar.Visible := False;
        mnuMinimizar.Visible := True;
     End;
end;

procedure TfrmMain.DisplayHint(Sender: TObject);
begin
     info.Panels[1].Text := Application.Hint;
end;

procedure TfrmMain.SetJustify(Menu: TMenu; MenuItem: TMenuItem;
  Justify: Byte);
var
    ItemInfo: TMenuItemInfo;
    Buffer: array[0..80] of Char;
begin
     ItemInfo.cbSize := SizeOf(TMenuItemInfo);
     ItemInfo.fMask := MIIM_TYPE;
     ItemInfo.dwTypeData := Buffer;
     ItemInfo.cch := SizeOf(Buffer);
     //
     GetMenuItemInfo(Menu.Handle, MenuItem.Command, False, ItemInfo);
     if Justify = 1 then
        ItemInfo.fType := ItemInfo.fType or MFT_RIGHTJUSTIFY;
     SetMenuItemInfo(Menu.Handle, MenuItem.Command, False, ItemInfo);
end;

procedure TfrmMain.actConsVendasExecute(Sender: TObject);
begin
    AbreForm(TfrmConsultaVendas, frmConsultaVendas);
end;

procedure TfrmMain.actConsEntradasExecute(Sender: TObject);
begin
     AbreForm(TfrmConsEntradas, frmConsEntradas);
end;

procedure TfrmMain.actConsPerdasExecute(Sender: TObject);
begin
   AbreForm(TfrmConsPerdas, frmConsPerdas);
end;

procedure TfrmMain.actConsTransfExecute(Sender: TObject);
begin
     AbreForm(TfrmConsTransf, frmConsTransf);
end;

procedure TfrmMain.actCancelaVendaExecute(Sender: TObject);
begin
  //    AbreForm(TfrmCancela, frmCancela);
end;

function TfrmMain.ForceForegroundWindow(wnd: THandle): Boolean;
const
  SPI_GETFOREGROUNDLOCKTIMEOUT = $2000; 
  SPI_SETFOREGROUNDLOCKTIMEOUT = $2001;
var
  ForegroundThreadID: DWORD;
  ThisThreadID: DWORD;
  timeout: DWORD;
begin 
  if IsIconic(wnd) then
    ShowWindow(wnd, SW_RESTORE);

  if GetForegroundWindow = wnd then 
    Result := True 
  else
  begin 
    if ((Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion > 4)) or
      ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and
      ((Win32MajorVersion > 4) or ((Win32MajorVersion = 4) and 
      (Win32MinorVersion > 0)))) then 
    begin
      Result := False;
      ForegroundThreadID := GetWindowThreadProcessID(GetForegroundWindow, nil);
      ThisThreadID := GetWindowThreadPRocessId(wnd, nil);
      if AttachThreadInput(ThisThreadID, ForegroundThreadID, True) then
      begin
        BringWindowToTop(wnd);
        SetForegroundWindow(wnd);
        AttachThreadInput(ThisThreadID, ForegroundThreadID, False);
        Result := (GetForegroundWindow = wnd);
      end;
      if not Result then
      begin
        SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0, @timeout, 0);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(0),
          SPIF_SENDCHANGE);
        BringWindowToTop(wnd);
        SetForegroundWindow(Wnd); 
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0,
          TObject(timeout), SPIF_SENDCHANGE); 
      end; 
    end
    else  
    begin 
      BringWindowToTop(wnd);
      SetForegroundWindow(wnd); 
    end;

    Result := (GetForegroundWindow = wnd);
  end;
end;

procedure TfrmMain.actEntradasExecute(Sender: TObject);
Var
   iLoja : Integer;
begin
     dmDados.RefreshCDS(dmDados.cdsConfig);
     //
     iLoja := dmDados.cdsConfigCFG_LOJA_PADRAO.AsInteger;

     if not (dmDados.ValidarChave(iLoja)) Then
          Exit;
     //
    dmDados.RefreshCDS(dmDados.cdsConfig);
    If (dmDados.cdsConfigCFG_FLINVENTARIO.AsString = 'S') Then
    Begin
         Application.MessageBox(PChar('Inventário ainda está aberto na anvisa.'),
                     'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
         Exit;
    End;
    // Entradas
    AbreForm(TfrmCadEntradaProdutos, frmCadEntradaProdutos);
end;

procedure TfrmMain.actTransferenciasExecute(Sender: TObject);
Var
   iLoja : Integer;
begin
     // Transferencias
    dmDados.RefreshCDS(dmDados.cdsConfig);
     //
     iLoja := dmDados.cdsConfigCFG_LOJA_PADRAO.AsInteger;
     if not (dmDados.ValidarChave(iLoja)) Then
          Exit;
     //
     dmDados.RefreshCDS(dmDados.cdsConfig);
     if not uFuncoes.Empty(dmDados.cdsConfigCFG_DATA_ATUAL.AsString)
       and (dmDados.cdsConfigCFG_FLINVENTARIO.AsString = 'N') Then
           AbreForm(TFrmCadTransferencia, FrmCadTransferencia)
       Else
           Application.MessageBox(PChar('Inventário está aberto na anvisa.'),
                     'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
end;

procedure TfrmMain.actPerdasExecute(Sender: TObject);
begin
    // Perdas
    dmDados.RefreshCDS(dmDados.cdsConfig);
    If not uFuncoes.Empty(dmDados.cdsConfigCFG_DATA_ATUAL.AsString)
       and (dmDados.cdsConfigCFG_FLINVENTARIO.AsString = 'N') Then
       Begin
           AbreForm(TfrmCadPerdas, frmCadPerdas);
          { if (frmCadPerdas = NIL) then
           begin
              Application.CreateForm(TfrmCadPerdas, frmCadPerdas);
              try
                  frmCadPerdas.ShowModal;
              Finally
                  FreeAndNil(frmCadPerdas);
              End;
           End; }
       End
     Else
           Application.MessageBox(PChar('Inventário está aberto na anvisa.'),
                     'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
end;

procedure TfrmMain.Testa_Nome_Pasta;
begin
     dmDados.RefreshCDS(dmDados.cdsConfig);
     M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.asstring;
end;

procedure TfrmMain.Timer2Timer(Sender: TObject);
begin
     Info.Panels[3].Text := 'Data : '+DateToStr(Date) + ' - Hora : '+TimeToStr(Time); 
end;

procedure TfrmMain.actConsProdutosExecute(Sender: TObject);
begin
  //  AbreForm(TfrmConsProdutos, frmConsProdutos);
end;

procedure TfrmMain.actInventarioLancamentoExecute(Sender: TObject);
begin
     dmDados.RefreshCDS(dmDados.cdsConfig);
     If (dmDados.cdsConfigCFG_INVERTARIO_ABERTO_SISTEMA.AsString = 'S') then
      begin
         If (dmDados.cdsConfigCFG_FLINVENTARIO.AsString = 'S') Then
            AbreForm(TfrmListaEstoque, frmListaEstoque)    // frmInvertario, frmInvertario)
         Else
            Application.MessageBox(PChar('Inventário já foi fechado na anvisa.'),
                     'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
      End
      Else
           Application.MessageBox(PChar('Inventário não foi aberto.'),
                     'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
end;

procedure TfrmMain.actRelEstoqueExecute(Sender: TObject);
begin
    AbreForm(TfrmRelEstoque, frmRelEstoque);
end;

procedure TfrmMain.ImportarDados1Click(Sender: TObject);
begin
   // AbreForm(TfrmImporta, frmImporta);
end;

procedure TfrmMain.mnuBalancoSubItemClick(Sender: TObject);
begin
     AbreForm(TfrmRelBalanco, frmRelBalanco);
end;

procedure TfrmMain.mnuTransmitirArquivoSubItemClick(Sender: TObject);
begin
    //  AbreForm(TFrmEnviarArquivo, FrmEnviarArquivo); 
end;

procedure TfrmMain.AtualizarDataMovimento;
Var
  aDataMovi : TDateTime;
begin
     dmDados.RefreshCDS(dmDados.cdsConfig);
     M_DTMOVI := dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime;
     aDataMovi := dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime;
     //dmDados.GetDataMovimentoAtual(dmDados.cdsConfigCFG_LOJA_PADRAO.AsInteger);
     //
     {If (M_DTMOVI < aDataMovi) Then
     begin
          dmDados.Start;
          try
             dmDados.cdsConfig.Edit;
             dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime := aDataMovi;
             dmDados.cdsConfig.ApplyUpdates(0);
             //
             dmDados.Comit(dmDados.Transc);
          Except
              dmDados.Rollback;
          End;
          //
          M_DTMOVI := aDataMovi
     End;     }
     //
     dmDados.RefreshCDS(dmDados.cdsConfig);
     //
     if uFuncoes.Empty(dmDados.cdsConfigCFG_DATA_ATUAL.AsString) Then
         edtDataMov.Text := '1º INVENTÁRIO'
     Else
         edtDataMov.Text := dmDados.cdsConfigCFG_DATA_ATUAL.AsString;
end;

procedure TfrmMain.actAberturaInvExecute(Sender: TObject);
Var
   aDescricao, aHora, aNomeUsuario : String;
   idUsuario : Integer;
begin
   if not (ValidarAcesso()) Then
   begin
        idUsuario := StrtoInt(M_CDUSUA);
        //
        aHora := Copy(TimetoStr(Time),1,5);
        aNomeUsuario := dmDados.GetNomeUsuario(idUsuario);
        aDescricao   := 'HORA:'+aHora+ ', usuário '+aNomeUsuario +' tentou abrir inventário.';
        //
        dmDados.Start;
        try
           if not dmDados.AddLogUsuario(idUsuario, Date(), aDescricao) Then
            begin
                ShowMessage('Ocorreu um erro ao tentar grava log de usuário.' );
            End;

            dmDados.Comit(dmDados.Transc);

            Application.MessageBox(PChar('Acesso Negado!!!'+#13+'Entre em contato com Infog2 (86) 3226-4510.' ),
                     'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
            Exit;
        Except
              dmDados.Rollback;
        End;
        // Raise Exception.Create('Acesso Negado!!!'+#13+'Entre em contato com Infog2 (86) 3226-4510.' );
   End;
   //
   dmDados.RefreshCDS(dmDados.cdsConfig);
   If (dmDados.cdsConfigCFG_INVERTARIO_ABERTO_SISTEMA.AsString = 'S') then
   begin
        If Application.MessageBox('Inventário já foi aberto no sistema, tem certeza que deseja abrir novamente?',
             'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
        begin
             //
             aHora := Copy(TimetoStr(Time),1,5);
             idUsuario := StrToInt(M_CDUSUA);
             With dmDados.cdsConfig do
             begin
                dmDados.Start;
                try
                  Edit;
                  FieldByname('CFG_FLINVENTARIO').AsString := 'S';
                  FieldByname('CFG_DTINVENTARIO').Clear;
                  FieldByname('CFG_DTULTIMO_ARQUIVO_VALIDADO').Clear;
                  FieldByname('CFG_DT_FECHAMENTO_INV_SISTEMA').Clear;
                  //FieldByname('CFG_INVERTARIO_ABERTO_SISTEMA').AsString := 'N';
                  FieldByname('CFG_INVERTARIO_ABERTO_SISTEMA').AsString := 'S';
                  FieldByname('CFG_DT_INVERTARIO_ABERTO_SIS').Clear;
                  FieldByname('CFG_SEQUENCIA_MOVIMENTO').AsInteger := 0;
                  if not uFuncoes.Empty(uFuncoes.RemoveChar(FieldByname('CFG_DATA_ATUAL').AsString)) then
                    FieldByname('CFG_DATA_ATUAL').AsDateTime := Date();
                  //

                  //  limpa MOVIMENTOS
                  aNomeUsuario := dmDados.GetNomeUsuario(idUsuario);
                  aDescricao := 'HORA: '+aHora+ ', usuário '+aNomeUsuario +' abriu inventário novamente.';
                  if not dmDados.AddLogUsuario(idUsuario, Date(), aDescricao) Then
                    begin
                         dmDados.Rollback;
                         Raise Exception.Create('Ocorreu um erro ao tentar abrir inventário.' );
                    End;
                   //
                   ApplyUpdates(0);
                   //
                   dmDados.Comit(dmDados.Transc);
                Except
                     dmDados.Rollback;
                End;
             End;
        End
        Else
            Exit;
   End;
   //
   AbreForm(TfrmCadAberturaInvertario, frmCadAberturaInvertario);
   //
   AtualizarDataMovimento;
   HabilitarMenu();
end;

procedure TfrmMain.actFechamentoInvExecute(Sender: TObject);
Var
    iUsuario : Integer;
    aNomeUsuario, aDescricao, aHora : String;
begin
   if not (ValidarAcesso()) Then
   begin
        iUsuario := StrtoInt(M_CDUSUA);
        //
        aHora := Copy(TimetoStr(Time),1,5);
        aNomeUsuario := dmDados.GetNomeUsuario(iUsuario);
        aDescricao   := 'HORA:'+aHora+ ', usuário '+aNomeUsuario +' tentou fechar inventário.';
        //
        dmDados.Start;
        try
           if not dmDados.AddLogUsuario(iUsuario, Date(), aDescricao) Then
            begin
                ShowMessage('Ocorreu um erro ao tentar grava log de usuário.' );
            End;

            dmDados.Comit(dmDados.Transc);

            Application.MessageBox(PChar('Acesso Negado!!!'+#13+'Entre em contato com Infog2 (86) 3226-4510.' ),
                     'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
            Exit;
        Except
              dmDados.Rollback;
        End;
   End;
   //
   dmDados.RefreshCDS(dmDados.cdsConfig);
   If (dmDados.cdsConfigCFG_INVERTARIO_ABERTO_SISTEMA.AsString = 'S') then
   begin
     If (dmDados.cdsConfigCFG_FLINVENTARIO.AsString = 'S') Then
         AbreForm(TFrmFecharInvertario, FrmFecharInvertario)    // frmInvertario, frmInvertario)
     Else
         Application.MessageBox(PChar('Inventário já foi fechado na anvisa.'),
                     'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
     //
     HabilitarMenu();
     //
     AtualizarDataMovimento;
   End
   Else
       Application.MessageBox(PChar('Inventário não foi aberto.'),
                     'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
end;

procedure TfrmMain.actEstoqueConsultaExecute(Sender: TObject);
begin
      AbreForm(TfrmConsultaEstoque, frmConsultaEstoque);
end;

procedure TfrmMain.HabilitarMenu;
begin
     dmDados.RefreshCDS(dmDados.cdsConfig);
     //
     If (dmDados.cdsConfigCFG_FLINVENTARIO.AsString = 'S') Then
      begin
          //mnuInvertarioSubItem.Enabled := True;
          //
          mnuMedicamentosItem.Enabled := false;
          //
          actGerar.Enabled := False;
          actEntradas.Enabled := False;
          actVenda.Enabled    := False;
      End
     Else
     begin
          //mnuInvertarioSubItem.Enabled := false;
          //
          mnuMedicamentosItem.Enabled := true;
          actGerar.Enabled    := True;
          actEntradas.Enabled := True;
          actVenda.Enabled    := True;
     End;
end;

procedure TfrmMain.actTransferenciaExecute(Sender: TObject);
begin
     ShowMessage('Módulo não concluído');
end;

procedure TfrmMain.actFechamentoDiaExecute(Sender: TObject);
begin
     if (dmDados.cdsConfigCFG_FLINVENTARIO.AsString = 'S') Then
     Begin
          raise Exception.Create('Inventário está aberto.');
     End;
     //
     dmDados.RefreshCDS(dmDados.cdsConfig);
     if not uFuncoes.Empty(dmDados.cdsConfigCFG_DATA_ATUAL.AsString)
       and (dmDados.cdsConfigCFG_FLINVENTARIO.AsString = 'N') Then
        begin
            Info.Panels[1].Text := 'Aguarde carregamento de estoque...';
            //   AbreForm(TfrmCadFechamentoMovimento, frmCadFechamentoMovimento);
            AbreForm(TfrmCadFechamentoMovimento2, frmCadFechamentoMovimento2);

            //
            AtualizarDataMovimento();
        End
        Else
        begin
             if uFuncoes.Empty(uFuncoes.RemoveChar(dmDados.cdsConfigCFG_DATA_ATUAL.AsString)) Then
               ShowMessage('Inventário está aberto ou data de movimento está vazio!!!');
        End;
end;

procedure TfrmMain.actTransmitirInvertarioExecute(Sender: TObject);
begin
    {  try
          Application.CreateForm(TFrmTransmitirArquivo, FrmTransmitirArquivo);
          uFrmTransmitiArquivo.iOpcao := 1;
          FrmTransmitirArquivo.Caption := 'Transmissão de arquivos para SNGPC';
          FrmTransmitirArquivo.ShowModal;
      finally
          FrmTransmitirArquivo.Free;
      End;     }
      //AbreForm(TFrmTransmitirArquivo, FrmTransmitirArquivo);
end;

procedure TfrmMain.actValidarInvertarioExecute(Sender: TObject);
begin
    {  try
          Application.CreateForm(TFrmTransmitirArquivo, FrmTransmitirArquivo);
          uFrmTransmitiArquivo.iOpcao  := 2;
          FrmTransmitirArquivo.Caption := 'Consultar status do arquivos para SNGPC';
          FrmTransmitirArquivo.ShowModal;
      Finally
          FrmTransmitirArquivo.Free;
      End;   }
end;

function TfrmMain.GeraMD5Arquivo(aNomeArquivo : String) : String;
var Arquivo : TextFile;
    NomeArq, ArqTexto, aMD5 : String;
    F: TSearchRec;
    Ret: Integer;
begin
  Result := '';
  try
    // Apaga arquivo anterior
    ArqTexto := ExtractFilePath(Application.ExeName)+'ArqMD5.txt';
    if FileExists(ArqTexto) then
       DeleteFile(ArqTexto);
    // cria o arquivo TXT na mesma pasta do sistema
    AssignFile(Arquivo,ArqTexto);
    ReWrite(Arquivo);
    // lista todos os arquivo exe da pasta do aplicativo e gera o MF5
    //Ret := FindFirst(ExtractFilePath(Application.ExeName)+'\*.zip', faAnyFile, F);
    // Ret := aNomeArquivo;
    //Ret := FindFirst(ExtractFilePath(Application.ExeName)+'\*.exe', faAnyFile, F);
    try
      {while Ret = 0 do
      begin
        if F.Attr and faDirectory <> faDirectory then
        begin   }
          NomeArq := aNomeArquivo;
          //ExtractFilePath(Application.ExeName)+'\'+F.Name;
          aMD5    := MD5Print(MD5File(NomeArq));
          WriteLn(Arquivo,NomeArq+' - '+aMD5);
         { ListBox1.Items.Add(NomeArq+' - '+aMD5);
        end;
        Ret := FindNext(F);
      end; }
    finally
      FindClose(F);
    end;
    Closefile(Arquivo);
    // gera MD5 do arquivo texto
  finally
    Result := MD5Print(MD5File(ArqTexto));
  end;
end;

function TfrmMain.MD5(const Input: string): string;
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


procedure TfrmMain.actTransmitirArquivoExecute(Sender: TObject);
Var
   aPasta : String;
begin
      aPasta := ExtractFilePath( Application.ExeName )+'enviar\';

      if not FileExists(aPasta+'EnviarSNGPC.exe') Then
      begin
            Application.MessageBox(PChar('Módulo de transmissão de arquivo não foi encontrado.'),
                     'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
            Exit;
      End;
      //
      ExecutePrograma(aPasta+'EnviarSNGPC.exe', '');
      {try
          Application.CreateForm(TFrmTransmitirArquivo, FrmTransmitirArquivo);
          uFrmTransmitiArquivo.iOpcao := 3;
          FrmTransmitirArquivo.Caption := 'Transmissão de arquivos para SNGPC';
          FrmTransmitirArquivo.ShowModal;
      Finally
          FrmTransmitirArquivo.Free;
      End;}
end;

procedure TfrmMain.actExcluirMovimentoExecute(Sender: TObject);
Var
   iLoja : Integer;
   aDataMovi : TDatetime;
begin
     if not uFuncoes.Empty(dmDados.cdsConfigCFG_DATA_ATUAL.AsString)
       and (dmDados.cdsConfigCFG_FLINVENTARIO.AsString = 'N') Then
       begin
            dmDados.RefreshCDS(dmDados.cdsConfig);
            iLoja     := dmDados.cdsConfigCFG_LOJA_PADRAO.AsInteger;
            aDataMovi := dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime;
            //
            if (aDataMovi - 1 = dmDados.cdsConfigCFG_DTINVENTARIO.AsDateTime) Then
                raise Exception.Create('Movimento dessa data NÃO pode ser excluído!!!'+
                                   #13+'Porque é o primeiro dia após confirmação do inventário na anvisa.');
            //
            If Application.MessageBox(PChar('Você tem certeza que deseja excluir '+#13
                                    +'movimento da data '+dmDados.cdsConfigCFG_DATA_ATUAL.AsString+'?'),
                'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
            begin
                 if (aDataMovi = dmDados.cdsConfigCFG_DTINVENTARIO.AsDateTime) Then
                      raise Exception.Create('Movimento dessa data NÃO pode ser excluído!!!'+#13+
                                             'Porque é a data do fechamento do inventário.');
                 //
                 if (aDataMovi <= dmDados.cdsConfigCFG_DTULTIMO_ARQUIVO_VALIDADO.AsDateTime) Then
                      raise Exception.Create('Movimento dessa data NÃO pode ser excluído!!!'+#13+
                                             'Porque é a data do último arquivo válidado.' );
                 //
                 if (dmDados.ExcluirMovimento(iLoja, aDataMovi)) Then
                  begin
                       AtualizarDataMovimento;
                       Application.MessageBox(PChar('Exclusão de movimento realizada com sucesso.'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                  End
                 Else
                     raise Exception.Create('Erro ao tentar excluir movimento da data: '+DatetoStr(aDataMovi));
            End;
       End
       Else
          Application.MessageBox(PChar('Inventário está aberto.'),
                     'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
end;

procedure TfrmMain.actImportaDadosExecute(Sender: TObject);
begin
      AbreForm(TFrmImportaDados, FrmImportaDados);
end;

procedure TfrmMain.ExecutePrograma(Nome, Parametros: String);
Var
 Comando: Array[0..1024] of Char;
 Parms: Array[0..1024] of Char;
begin
  StrPCopy (Comando, Nome);
  StrPCopy (Parms, Parametros);
  ShellExecute (0, Nil, Comando, Parms, Nil, SW_SHOWNORMAL);
end;

procedure TfrmMain.actMovProdutoExecute(Sender: TObject);
begin
      AbreForm(TFrmRelMovProduto, FrmRelMovProduto);
end;

function TfrmMain.ValidarAcesso: Boolean;
Var
    aSenha, aSenhaDigitada : String;
    aDia, aMes, aDiaMes : String;
    AuxData : TDateTime;
    Ano, Mes, Dia, DoubloDiaMes : word;
begin
    Result := False;
    AuxData := Date();
    DecodeDate (Auxdata, Ano, Mes, Dia);
    aDia := uFuncoes.StrZero( InttoStr(Dia*2),2);
    aMes := uFuncoes.StrZero( InttoStr(Mes*2),2);
    DoubloDiaMes := (Dia*2)+(Mes*2);
    aDiaMes := uFuncoes.StrZero( InttoStr(DoubloDiaMes),2);
    //
    aSenha := aDia+aMes+aDiaMes;
    aSenhaDigitada := PasswordInputBox('Senha para Acesso','Digite sua senha:');

    if not uFuncoes.Empty(aSenhaDigitada) Then
     begin
        if (aSenhaDigitada = aSenha) then
            Result := True;
     End;
end;

End.
