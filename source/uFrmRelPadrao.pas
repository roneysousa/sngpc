unit uFrmRelPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfrmRelPadrao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnVisualizar: TBitBtn;
    btnFechar: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelPadrao: TfrmRelPadrao;

implementation

{$R *.dfm}

procedure TfrmRelPadrao.btnFecharClick(Sender: TObject);
begin
       Close;
end;

end.
