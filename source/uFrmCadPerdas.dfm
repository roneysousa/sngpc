inherited frmCadPerdas: TfrmCadPerdas
  Left = 219
  Top = 141
  Caption = 'Cadastro de Perdas'
  ClientHeight = 444
  ClientWidth = 655
  OldCreateOrder = True
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 655
    Height = 423
    inherited TabSheet1: TTabSheet
      inherited Panel1: TPanel
        Top = 354
        Width = 647
        inherited BtAdicionar: TBitBtn
          Left = 15
        end
        inherited BtEditar: TBitBtn
          Left = 288
          Top = 16
          Visible = False
        end
        inherited BtExcluir: TBitBtn
          Left = 103
          Enabled = False
        end
        inherited BtPesquisar: TBitBtn
          Visible = False
        end
        inherited BtCancelar: TBitBtn
          Left = 364
        end
        inherited BtGravar: TBitBtn
          Left = 444
        end
        inherited BtSair: TBitBtn
          Left = 552
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 647
        Height = 95
        Align = alTop
        TabOrder = 1
        object Label1: TLabel
          Left = 16
          Top = 7
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = DBEdit1
        end
        object Label3: TLabel
          Left = 16
          Top = 47
          Width = 54
          Height = 13
          Caption = 'Data Perda'
        end
        object Label4: TLabel
          Left = 143
          Top = 47
          Width = 78
          Height = 13
          Caption = 'Motivo da Perda'
          FocusControl = cmbMotivoPerda
        end
        object Label2: TLabel
          Left = 143
          Top = 7
          Width = 20
          Height = 13
          Caption = 'Loja'
          FocusControl = cmbLoja
        end
        object DBEdit1: TDBEdit
          Left = 16
          Top = 23
          Width = 123
          Height = 21
          Color = clSilver
          DataField = 'ID_PERDA'
          DataSource = dsCadastro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dbeDataPerda: TDBDateEdit
          Left = 16
          Top = 62
          Width = 123
          Height = 21
          DataField = 'DATA_PERDA'
          DataSource = dsCadastro
          NumGlyphs = 2
          TabOrder = 1
          OnExit = dbeDataPerdaExit
        end
        object cmbMotivoPerda: TDBLookupComboBox
          Left = 143
          Top = 63
          Width = 300
          Height = 21
          DataField = 'DESCRICAO_MOTIVO_PERDA'
          DataSource = dsCadastro
          TabOrder = 2
        end
        object cmbLoja: TDBLookupComboBox
          Left = 143
          Top = 23
          Width = 300
          Height = 21
          DataField = 'NOME_LOJA'
          DataSource = dsCadastro
          TabOrder = 3
        end
      end
      object pnlGrid: TPanel
        Left = 0
        Top = 95
        Width = 647
        Height = 190
        Align = alClient
        TabOrder = 2
        object grdConsultar2: TDBGrid
          Left = 1
          Top = 1
          Width = 645
          Height = 188
          Align = alClient
          Ctl3D = False
          DataSource = dsItens
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'PRO_CODIGO'
              Title.Alignment = taCenter
              Title.Caption = 'C'#211'DIGO MS'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 115
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRO_NMPROD'
              Title.Caption = 'DESCRI'#199#195'O'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRO_QTPROD'
              Title.Alignment = taCenter
              Title.Caption = 'QUANTIDADE'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 95
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'PRO_NRLOTE'
              Title.Alignment = taRightJustify
              Title.Caption = 'LOTE'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 90
              Visible = True
            end>
        end
      end
      object pnlProduto: TPanel
        Left = 0
        Top = 285
        Width = 647
        Height = 69
        Align = alBottom
        TabOrder = 3
        object Label16: TLabel
          Left = 13
          Top = 2
          Width = 40
          Height = 13
          Caption = '&Produto:'
          FocusControl = edtCDPROD
          Transparent = True
        end
        object spLocalizar: TSpeedButton
          Left = 152
          Top = 17
          Width = 23
          Height = 22
          Hint = 'Localizar produto'
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00840000008400
            0000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF008400000084000000840000008400000084000000FF00FF008400000000FF
            FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF008400000000FFFF00840000008400000084000000FF00FF008400000000FF
            FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF008400000000FFFF00840000008400000084000000FF00FF00840000008400
            00008400000084000000840000008400000084000000FF00FF00840000008400
            00008400000084000000840000008400000084000000FF00FF00840000008400
            000000FFFF0084000000840000008400000084000000840000008400000000FF
            FF008400000084000000840000008400000084000000FF00FF00840000008400
            000000FFFF00840000008400000084000000FF00FF00840000008400000000FF
            FF008400000084000000840000008400000084000000FF00FF00840000008400
            000000FFFF00840000008400000084000000FF00FF00840000008400000000FF
            FF008400000084000000840000008400000084000000FF00FF00FF00FF008400
            0000840000008400000084000000840000008400000084000000840000008400
            000084000000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00
            FF008400000000FFFF00840000008400000084000000FF00FF008400000000FF
            FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF008400000084000000840000008400000084000000FF00FF00840000008400
            0000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00840000008400000084000000FF00FF00FF00FF00FF00FF008400
            00008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF008400000000FFFF0084000000FF00FF00FF00FF00FF00FF008400
            000000FFFF0084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00840000008400000084000000FF00FF00FF00FF00FF00FF008400
            00008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          OnClick = spLocalizarClick
        end
        object Label17: TLabel
          Left = 310
          Top = 2
          Width = 39
          Height = 13
          Caption = 'N'#186'. Lote'
        end
        object Label19: TLabel
          Left = 438
          Top = 2
          Width = 58
          Height = 13
          Caption = '&Quantidade:'
          FocusControl = edtQuantidade
          Transparent = True
        end
        object edtCDPROD: TEdit
          Left = 13
          Top = 17
          Width = 137
          Height = 21
          Hint = 'N'#250'mero do MS do medicamento.'
          MaxLength = 13
          TabOrder = 0
          OnEnter = edtCDPRODEnter
          OnExit = edtCDPRODExit
          OnKeyPress = edtCDPRODKeyPress
        end
        object edtNMDESC: TEdit
          Left = 13
          Top = 41
          Width = 498
          Height = 21
          Hint = 'Descri'#231#227'o do produto'
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 40
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object edtNRLOTE: TEdit
          Left = 310
          Top = 17
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 10
          TabOrder = 2
          OnExit = edtNRLOTEExit
          OnKeyPress = edtNRLOTEKeyPress
        end
        object edtQuantidade: TCurrencyEdit
          Left = 437
          Top = 17
          Width = 74
          Height = 21
          Hint = 'Quantidade de Insumo Por Unidade Farmacotecnica.'
          AutoSize = False
          DisplayFormat = ',0.00;'
          MinValue = 1.000000000000000000
          TabOrder = 3
          Value = 1.000000000000000000
          OnEnter = edtQuantidadeEnter
          OnExit = edtQuantidadeExit
          OnKeyPress = edtQuantidadeKeyPress
        end
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        Width = 647
      end
      inherited grdConsultar: TDBGrid
        Width = 613
        Height = 336
      end
      inherited Panel3: TPanel
        Left = 613
        Height = 336
      end
    end
  end
  inherited Panel4: TPanel
    Width = 655
    inherited Image1: TImage
      Width = 651
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsPerda
    Left = 476
  end
  object dsItens: TDataSource
    AutoEdit = False
    DataSet = dmDados.cdsDados
    OnDataChange = dsItensDataChange
    Left = 524
    Top = 101
  end
end
