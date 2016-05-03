inherited frmCadEntradaProdutos: TfrmCadEntradaProdutos
  Caption = 'Entrada de Produtos'
  ClientHeight = 483
  ClientWidth = 816
  OldCreateOrder = True
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 816
    Height = 462
    inherited TabSheet1: TTabSheet
      inherited Panel1: TPanel
        Top = 393
        Width = 808
        inherited BtEditar: TBitBtn
          Visible = False
        end
        inherited BtExcluir: TBitBtn
          Left = 284
          Enabled = False
        end
        inherited BtPesquisar: TBitBtn
          Left = 369
          Visible = False
        end
        inherited BtCancelar: TBitBtn
          Left = 478
        end
        inherited BtGravar: TBitBtn
          Left = 558
        end
        inherited BtSair: TBitBtn
          Left = 687
        end
        object btnCadProduto: TBitBtn
          Left = 176
          Top = 8
          Width = 87
          Height = 25
          Hint = 'Cadastro de Produto'
          Caption = 'Cad.&Produto'
          TabOrder = 7
          OnClick = btnCadProdutoClick
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 808
        Height = 91
        Align = alTop
        TabOrder = 1
        object Label1: TLabel
          Left = 9
          Top = 4
          Width = 51
          Height = 13
          Caption = 'Sequ'#234'ncia'
          FocusControl = DBEdit1
          Transparent = True
        end
        object Label2: TLabel
          Left = 150
          Top = 4
          Width = 20
          Height = 13
          Caption = 'Loja'
          FocusControl = cmbLoja
          Transparent = True
        end
        object Label3: TLabel
          Left = 9
          Top = 43
          Width = 78
          Height = 13
          Caption = 'N'#250'mero da Nota'
          FocusControl = dbeNumeroNota
          Transparent = True
        end
        object Label4: TLabel
          Left = 150
          Top = 43
          Width = 65
          Height = 13
          Caption = 'Data Emiss'#227'o'
          Transparent = True
        end
        object Label5: TLabel
          Left = 276
          Top = 43
          Width = 89
          Height = 13
          Caption = 'Data Recebimento'
          Transparent = True
        end
        object Label6: TLabel
          Left = 402
          Top = 43
          Width = 99
          Height = 13
          Caption = 'CNPJ do Fornecedor'
          FocusControl = dbeCNPJOrigem
          Transparent = True
        end
        object DBEdit1: TDBEdit
          Left = 9
          Top = 20
          Width = 134
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'ID_ENTRADA'
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
        object cmbLoja: TDBLookupComboBox
          Left = 150
          Top = 20
          Width = 438
          Height = 21
          DataField = 'NOME_LOJA'
          DataSource = dsCadastro
          TabOrder = 1
        end
        object dbeNumeroNota: TDBEdit
          Left = 9
          Top = 59
          Width = 134
          Height = 21
          DataField = 'NR_NOTAFISCAL'
          DataSource = dsCadastro
          MaxLength = 10
          TabOrder = 2
          OnKeyPress = dbeNumeroNotaKeyPress
        end
        object dbeDataEmissao: TDBDateEdit
          Left = 150
          Top = 59
          Width = 121
          Height = 21
          DataField = 'DATA_NOTA'
          DataSource = dsCadastro
          NumGlyphs = 2
          TabOrder = 3
          OnExit = dbeDataEmissaoExit
        end
        object dbeDtRecebimento: TDBDateEdit
          Left = 276
          Top = 59
          Width = 121
          Height = 21
          TabStop = False
          DataField = 'DATA_RECEBIMENTO'
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
        object dbeCNPJOrigem: TDBEdit
          Left = 402
          Top = 59
          Width = 186
          Height = 21
          DataField = 'CNPJ_ORIGEM'
          DataSource = dsCadastro
          TabOrder = 5
          OnExit = dbeCNPJOrigemExit
        end
        object rgTipoEntrada: TDBRadioGroup
          Left = 598
          Top = 15
          Width = 185
          Height = 66
          Caption = '[ Tipo Opera'#231#227'o Nota Fiscal ]'
          DataField = 'TIPO_OPERACAO_NF'
          DataSource = dsCadastro
          Items.Strings = (
            'Compra'
            'Transfer'#234'ncia')
          TabOrder = 6
          TabStop = True
          Values.Strings = (
            '1'
            '2')
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 91
        Width = 808
        Height = 213
        Align = alClient
        TabOrder = 2
        object DBGrid1: TDBGrid
          Left = 1
          Top = 1
          Width = 806
          Height = 211
          Align = alClient
          Ctl3D = False
          DataSource = dsItensEntrada
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = [fsBold]
          OnDblClick = grdConsultarDblClick
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PRO_CODIGO'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo MS'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRO_NMPROD'
              Title.Alignment = taCenter
              Title.Caption = 'Descri'#231#227'o'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 445
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'PRO_NRLOTE'
              Title.Alignment = taCenter
              Title.Caption = 'Lote'
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
              FieldName = 'PRO_QTPROD'
              Title.Alignment = taRightJustify
              Title.Caption = 'Quantidade'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 101
              Visible = True
            end>
        end
      end
      object pnlProduto: TPanel
        Left = 0
        Top = 304
        Width = 808
        Height = 89
        Align = alBottom
        BorderStyle = bsSingle
        TabOrder = 3
        object Label16: TLabel
          Left = 13
          Top = 6
          Width = 40
          Height = 13
          Caption = '&Produto:'
          FocusControl = edtCDPROD
          Transparent = True
        end
        object spLocalizar: TSpeedButton
          Left = 152
          Top = 21
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
          Left = 521
          Top = 6
          Width = 39
          Height = 13
          Caption = 'N'#186'. Lote'
        end
        object Label19: TLabel
          Left = 649
          Top = 6
          Width = 58
          Height = 13
          Caption = '&Quantidade:'
          FocusControl = edtQuantidade
          Transparent = True
        end
        object edtCDPROD: TEdit
          Left = 13
          Top = 21
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
          Left = 12
          Top = 50
          Width = 709
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
          TabOrder = 5
        end
        object edtNRLOTE: TEdit
          Left = 521
          Top = 21
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 10
          TabOrder = 3
          OnExit = edtNRLOTEExit
          OnKeyPress = edtNRLOTEKeyPress
        end
        object edtQuantidade: TCurrencyEdit
          Left = 648
          Top = 21
          Width = 74
          Height = 21
          Hint = 'Quantidade de Insumo Por Unidade Farmacotecnica.'
          AutoSize = False
          DisplayFormat = ',0.00;'
          MinValue = 1.000000000000000000
          TabOrder = 4
          Value = 1.000000000000000000
          OnEnter = edtQuantidadeEnter
          OnExit = edtQuantidadeExit
          OnKeyPress = edtQuantidadeKeyPress
        end
        object rgClasse: TRadioGroup
          Left = 179
          Top = 0
          Width = 174
          Height = 48
          Hint = 'Selecione a classe terap'#234'utica'
          Caption = '[ Classe Terap'#234'utica ]'
          Items.Strings = (
            '&1 - Antimicrobiano'
            '&2 - Sujeito a controle Especial')
          TabOrder = 1
          TabStop = True
        end
        object rgUnidade: TRadioGroup
          Left = 357
          Top = 0
          Width = 159
          Height = 48
          Hint = 'Seleciona a unidade de medida do medicamento'
          Caption = '[ Und. Medida Medicamento ]'
          Items.Strings = (
            'Caixas'
            'Frascos')
          TabOrder = 2
          TabStop = True
        end
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        Width = 808
      end
      inherited grdConsultar: TDBGrid
        Width = 774
        Height = 375
      end
      inherited Panel3: TPanel
        Left = 774
        Height = 375
      end
    end
  end
  inherited Panel4: TPanel
    Width = 816
    inherited Image1: TImage
      Width = 812
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsEntradaProdutos
    Left = 508
    Top = 181
  end
  object dsItensEntrada: TDataSource
    AutoEdit = False
    DataSet = dmDados.cdsDados
    OnDataChange = dsItensEntradaDataChange
    Left = 420
    Top = 264
  end
end
