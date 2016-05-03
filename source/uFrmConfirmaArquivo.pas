unit uFrmConfirmaArquivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit;

type
  TFrmConfirmaArquivo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnConfirma: TBitBtn;
    BitBtn2: TBitBtn;
    edtData: TDateEdit;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfirmaArquivo: TFrmConfirmaArquivo;
  aDataMov : String;
  idRegistro : integer;

implementation

uses uFuncoes, udmDados;

{$R *.dfm}

procedure TFrmConfirmaArquivo.FormShow(Sender: TObject);
begin
     if not uFuncoes.Empty(aDataMov) Then
        edtData.Text := aDataMov
end;

procedure TFrmConfirmaArquivo.btnConfirmaClick(Sender: TObject);
begin
     dmDados.RefreshCDS(dmDados.cdsConfig);
     dmDados.Start;
     try
         dmDados.SetStatusArquivo(idRegistro, 'V');
         //
         if (edtData.Date > dmDados.cdsConfigCFG_DTULTIMO_ARQUIVO_VALIDADO.AsDateTime) then
         begin
            dmDados.cdsConfig.Edit;
            dmDados.cdsConfigCFG_DTULTIMO_ARQUIVO_VALIDADO.AsDateTime := edtData.Date;
            dmDados.cdsConfig.ApplyUpdates(0);
         End;
         //
         dmDados.Comit(dmDados.Transc);
         //
         Application.MessageBox(PChar(MSG_OK), 'Concluído', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         //
         ModalResult :=  mrOk;
     Except
         dmDados.Rollback;
     End;
end;

end.
