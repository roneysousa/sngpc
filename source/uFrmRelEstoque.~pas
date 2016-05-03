unit uFrmRelEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmRelPadrao, ExtCtrls, StdCtrls, Buttons, FMTBcd, DB,
  DBClient, Provider, SqlExpr, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppCtrls, ppPrnabl, ppBands, ppCache, ppVar;

type
  TfrmRelEstoque = class(TfrmRelPadrao)
    Label21: TLabel;
    cmbLojas3: TComboBox;
    RadioGroup1: TRadioGroup;
    dstConsulta: TSQLDataSet;
    dspConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    dsConsulta: TDataSource;
    cdsConsultaPRO_RG_MS_MEDICAMENTO: TStringField;
    cdsConsultaPRO_MEDICAMENTO: TStringField;
    cdsConsultaEST_NRLOTE: TStringField;
    cdsConsultaEST_QUANTIDADE: TFMTBCDField;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    blLoja: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppLabel2: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    cdsConsultaRMS_PRODUTO: TStringField;
    ppDBText5: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    cbkEstoque: TCheckBox;
    txtEstoque: TppLabel;
    cdsConsultaPRO_ANTIMICROBIANOS: TStringField;
    cdsConsultaPRO_UNIDADE_MEDIDA: TStringField;
    ppDBText1: TppDBText;
    ppLabel9: TppLabel;
    procedure FormShow(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsConsultaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEstoque: TfrmRelEstoque;

implementation

uses udmDados, uFuncoes, DateUtils;

{$R *.dfm}



procedure TfrmRelEstoque.FormShow(Sender: TObject);
begin
  inherited;
       dmDados.CarregarLojas(cmbLojas3);
end;

procedure TfrmRelEstoque.btnVisualizarClick(Sender: TObject);
Var
   aTexto : String;
   M_CDLOJA : Integer;
begin
  inherited;
       If uFuncoes.Empty(cmbLojas3.Text) Then
        begin
             MessageDlg('Selecione a loja.', mtInformation, [mbOk], 0);
             cmbLojas3.SetFocus;
             Exit;
        End;
       //
       aTexto := 'Select P.pro_rg_ms_medicamento, P.pro_medicamento, P.PRO_ANTIMICROBIANOS, P.PRO_UNIDADE_MEDIDA, E.est_nrlote, E.est_quantidade from PRODUTOS P ';
       aTexto := aTexto + ' Left Join ESTOQUE E ON P.pro_rg_ms_medicamento = E.est_cdprod';
       aTexto := aTexto + ' Where (E.est_cdloja = :pLOJA) ';
       if (cbkEstoque.Checked) then
          aTexto := aTexto + ' and (E.est_quantidade > 0) ' ;
       If (RadioGroup1.ItemIndex = 0) Then
           aTexto := aTexto + ' order by P.pro_rg_ms_medicamento '
       Else
           aTexto := aTexto + ' order by P.pro_medicamento ';
       //
       M_CDLOJA := dmDados.GetCodigoLoja(cmbLojas3.Text);
       //
       btnVisualizar.Enabled := False;
       try
             With cdsConsulta do
              begin
                  Close;
                  CommandText := aTexto;
                  Params[0].AsInteger := M_CDLOJA;
                  Open;
                  //
                  If (IsEmpty) Then
                    begin
                         MessageDlg('Não há produtos no estoque '+#13 + 'da loja selecionada.', mtInformation, [mbOk], 0);
                         Close;
                         Exit;
                    End
                    Else
                    begin
                         With ppReport1 do
                          begin
                               blLoja.Caption := 'LOJA : ' + cmbLojas3.Text;
                               if (cbkEstoque.Checked) then
                                  txtEstoque.Caption := 'SOMENTE COM ESTOQUE';
                               //
                               PrintReport;
                          End;
                    End;
              End;
       Finally
           btnVisualizar.Enabled := True;
       End;
       Application.ProcessMessages;
end;

procedure TfrmRelEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
      If (cdsConsulta.Active) Then
        cdsConsulta.Close;
end;

procedure TfrmRelEstoque.cdsConsultaCalcFields(DataSet: TDataSet);
begin
  inherited;
     If not uFuncoes.Empty(cdsConsultaPRO_RG_MS_MEDICAMENTO.AsString) Then
        cdsConsultaRMS_PRODUTO.AsString :=
           Copy(cdsConsultaPRO_RG_MS_MEDICAMENTO.AsString,1,1)+'.'+
           Copy(cdsConsultaPRO_RG_MS_MEDICAMENTO.AsString,2,4)+'.'+
           Copy(cdsConsultaPRO_RG_MS_MEDICAMENTO.AsString,6,4)+'.'+
           Copy(cdsConsultaPRO_RG_MS_MEDICAMENTO.AsString,10,3)+'-'+
           Copy(cdsConsultaPRO_RG_MS_MEDICAMENTO.AsString,13,1);
           //9.9999.9999.999-9
end;

End.