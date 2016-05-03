inherited FrmCadTransferencia: TFrmCadTransferencia
  Left = 208
  Top = 135
  Caption = 'Cadastro de Transfer'#234'ncias'
  ClientHeight = 474
  ClientWidth = 807
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 807
    Height = 453
    inherited TabSheet1: TTabSheet
      inherited Panel1: TPanel
        Top = 384
        Width = 799
        inherited BtEditar: TBitBtn
          Visible = False
        end
        inherited BtExcluir: TBitBtn
          OnExit = BtExcluirExit
        end
        inherited BtPesquisar: TBitBtn
          Visible = False
        end
        inherited BtCancelar: TBitBtn
          Left = 479
        end
        inherited BtGravar: TBitBtn
          Left = 559
        end
        inherited BtSair: TBitBtn
          Left = 696
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 799
        Height = 108
        Align = alTop
        TabOrder = 1
        object Label1: TLabel
          Left = 14
          Top = 14
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbeCodigo
        end
        object Label2: TLabel
          Left = 153
          Top = 14
          Width = 63
          Height = 13
          Caption = 'CNPJ Origem'
        end
        object Label3: TLabel
          Left = 14
          Top = 56
          Width = 78
          Height = 13
          Caption = 'N'#250'mero da Nota'
          FocusControl = dbeNumeroNota
          Transparent = True
        end
        object Label6: TLabel
          Left = 153
          Top = 56
          Width = 64
          Height = 13
          Caption = 'Data da Nota'
          Transparent = True
        end
        object Label8: TLabel
          Left = 278
          Top = 56
          Width = 106
          Height = 13
          Caption = 'Data da Transfer'#234'ncia'
          Transparent = True
        end
        object Label7: TLabel
          Left = 403
          Top = 56
          Width = 113
          Height = 13
          Caption = 'CNPJ da loja de destino'
          Transparent = True
        end
        object dbeCodigo: TDBEdit
          Left = 14
          Top = 30
          Width = 134
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'ID_TRANSFERENCIA'
          DataSource = dsCadastro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object dbeCNPJOrigem: TDBEdit
          Left = 153
          Top = 30
          Width = 186
          Height = 21
          Color = clSilver
          DataField = 'CNPJ_ORIGEM'
          DataSource = dsCadastro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object dbeNumeroNota: TDBEdit
          Left = 14
          Top = 72
          Width = 134
          Height = 21
          DataField = 'NR_NOTAFISCAL'
          DataSource = dsCadastro
          MaxLength = 9
          TabOrder = 2
        end
        object dbeDataNota: TDBDateEdit
          Left = 153
          Top = 72
          Width = 121
          Height = 21
          DataField = 'DATA_NOTA'
          DataSource = dsCadastro
          NumGlyphs = 2
          TabOrder = 3
          OnExit = dbeDataNotaExit
        end
        object dbeDataTransferencia: TDBDateEdit
          Left = 278
          Top = 72
          Width = 121
          Height = 21
          TabStop = False
          DataField = 'DATA_TRANSFERENCIA'
          DataSource = dsCadastro
          ReadOnly = True
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 4
        end
        object dbeCNPJDestino: TDBEdit
          Left = 403
          Top = 72
          Width = 186
          Height = 21
          DataField = 'CNPJ_DESTINO'
          DataSource = dsCadastro
          TabOrder = 5
          OnExit = dbeCNPJDestinoExit
        end
        object edtNomeLoja: TEdit
          Left = 344
          Top = 30
          Width = 417
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 108
        Width = 799
        Height = 196
        Align = alClient
        TabOrder = 2
        object grdProdutos: TDBGrid
          Left = 1
          Top = 1
          Width = 797
          Height = 194
          TabStop = False
          Align = alClient
          Ctl3D = False
          DataSource = dsProdutos
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
              FieldName = 'PRO_NRVEND'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              Title.Alignment = taRightJustify
              Title.Caption = 'VALOR'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PRO_CODIGO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'C'#211'DIGO MS'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 104
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRO_NMPROD'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              Title.Caption = 'DESCRI'#199#195'O'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 315
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRO_VLVEND'
              Title.Alignment = taRightJustify
              Title.Caption = 'VL.VENDA'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PRO_QTPROD'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              Title.Caption = 'QUANTIDADE'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 93
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'PRO_NRLOTE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              Title.Alignment = taRightJustify
              Title.Caption = 'LOTE'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 95
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PRO_USO_PROLOGADO'
              Title.Alignment = taCenter
              Title.Caption = 'USO PROL.'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PRO_SUBTOTAL'
              Title.Alignment = taRightJustify
              Title.Caption = 'SUBTOTAL'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Visible = False
            end>
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 304
        Width = 799
        Height = 80
        Align = alBottom
        TabOrder = 3
        object Label16: TLabel
          Left = 13
          Top = 5
          Width = 40
          Height = 13
          Caption = '&Produto:'
          FocusControl = edtCDPROD
          Transparent = True
        end
        object spLocalizar: TSpeedButton
          Left = 152
          Top = 20
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
          Top = 5
          Width = 39
          Height = 13
          Caption = 'N'#186'. Lote'
        end
        object Label19: TLabel
          Left = 438
          Top = 5
          Width = 58
          Height = 13
          Caption = '&Quantidade:'
          FocusControl = edtQuantidade
          Transparent = True
        end
        object edtCDPROD: TEdit
          Left = 13
          Top = 20
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
          Top = 49
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
          Top = 20
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
          Top = 20
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
        Width = 799
      end
      inherited grdConsultar: TDBGrid
        Width = 765
        Height = 366
      end
      inherited Panel3: TPanel
        Left = 765
        Height = 366
      end
    end
  end
  inherited Panel4: TPanel
    Width = 807
    inherited Image1: TImage
      Width = 803
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsTransferencia
    Left = 460
    Top = 173
  end
  object dsProdutos: TDataSource
    AutoEdit = False
    DataSet = dmDados.cdsDados
    OnDataChange = dsProdutosDataChange
    Left = 540
    Top = 217
  end
end
