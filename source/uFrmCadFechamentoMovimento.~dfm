inherited frmCadFechamentoMovimento: TfrmCadFechamentoMovimento
  Left = 212
  Top = 127
  Caption = 'Fechar Movimento'
  ClientHeight = 519
  ClientWidth = 987
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 987
    Height = 498
    inherited TabSheet1: TTabSheet
      inherited Panel1: TPanel
        Top = 429
        Width = 979
        object lblRegistro: TLabel [0]
          Left = 16
          Top = 16
          Width = 66
          Height = 13
          Caption = 'Registro(s):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited BtAdicionar: TBitBtn
          Left = 299
          Visible = False
        end
        inherited BtEditar: TBitBtn
          Left = 379
          Visible = False
        end
        inherited BtExcluir: TBitBtn
          Left = 187
          Enabled = False
          Visible = False
        end
        inherited BtPesquisar: TBitBtn
          Left = 539
          Visible = False
        end
        inherited BtCancelar: TBitBtn
          Left = 475
          Top = 16
          Visible = False
        end
        inherited BtGravar: TBitBtn
          Left = 571
          Top = 16
          Visible = False
        end
        inherited BtSair: TBitBtn
          Left = 616
          Visible = False
        end
        object BitBtn1: TBitBtn
          Left = 797
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Cancelar'
          TabOrder = 7
          Kind = bkCancel
        end
        object btnConfirma: TBitBtn
          Left = 877
          Top = 8
          Width = 75
          Height = 25
          Caption = '&OK'
          Default = True
          TabOrder = 8
          OnClick = btnConfirmaClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 979
        Height = 73
        Align = alTop
        TabOrder = 1
        DesignSize = (
          979
          73)
        object Label1: TLabel
          Left = 6
          Top = 6
          Width = 93
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          Caption = 'Data do Movimento'
          Transparent = True
        end
        object edtDataMov: TEdit
          Left = 6
          Top = 20
          Width = 291
          Height = 43
          TabStop = False
          Anchors = [akLeft, akTop, akBottom]
          BevelEdges = [beTop, beRight]
          CharCase = ecUpperCase
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clYellow
          Font.Height = -29
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '99/99/9999'
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 73
        Width = 979
        Height = 356
        Align = alClient
        TabOrder = 2
        object PageControl2: TPageControl
          Left = 1
          Top = 1
          Width = 977
          Height = 354
          ActivePage = tsEstoque
          Align = alClient
          TabOrder = 0
          object tsEstoque: TTabSheet
            Caption = 'Estoque'
            ImageIndex = 3
            object dbGridEstoque: TDBGrid
              Left = 0
              Top = 0
              Width = 969
              Height = 326
              Align = alClient
              Ctl3D = False
              DataSource = dsMovEstoque
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
              OnDrawColumnCell = dbGridEstoqueDrawColumnCell
              OnDblClick = grdConsultarDblClick
              Columns = <
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'CDS_CDPROD'
                  Title.Alignment = taCenter
                  Title.Caption = 'C'#243'digo MS'
                  Width = 101
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CDS_DESCRICAO'
                  Title.Alignment = taCenter
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 250
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'CDS_NRLOTE'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Lote'
                  Width = 77
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CDS_QTANTE'
                  Title.Alignment = taCenter
                  Title.Caption = 'Est.Anterior'
                  Width = 85
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CDS_QTENTR'
                  Title.Alignment = taCenter
                  Title.Caption = 'Entradas'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CDS_QTVEND'
                  Title.Alignment = taCenter
                  Title.Caption = 'Vendas'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CDS_QTTRAN'
                  Title.Alignment = taCenter
                  Title.Caption = 'Transfer'#234'ncias'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CDS_QTPERD'
                  Title.Alignment = taCenter
                  Title.Caption = 'Perdas'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CDS_SALDO'
                  Title.Alignment = taCenter
                  Title.Caption = 'Saldo'
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'CDS_SITUACAO'
                  Title.Alignment = taCenter
                  Title.Caption = 'ST'
                  Visible = True
                end>
            end
          end
          object tsEntradas: TTabSheet
            Caption = 'Entradas'
            object dbGridEntradas: TDBGrid
              Left = 0
              Top = 0
              Width = 969
              Height = 186
              Align = alClient
              Ctl3D = False
              DataSource = dsEntradas
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
                  Expanded = False
                  FieldName = 'NOME_LOJA'
                  Title.Caption = 'Loja'
                  Width = 203
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'NR_NOTAFISCAL'
                  Title.Alignment = taCenter
                  Title.Caption = 'N'#186' Nota'
                  Width = 84
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'CNPJ_ORIGEM'
                  Title.Alignment = taCenter
                  Title.Caption = 'CNPJ do Fornecedor'
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'DATA_NOTA'
                  Title.Alignment = taCenter
                  Title.Caption = 'Data Emiss'#227'o'
                  Width = 94
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'DATA_RECEBIMENTO'
                  Title.Alignment = taCenter
                  Title.Caption = 'Data Recebimento'
                  Visible = True
                end>
            end
            object pnlItensEntrada: TPanel
              Left = 0
              Top = 186
              Width = 969
              Height = 140
              Align = alBottom
              TabOrder = 1
              object DBGrid1: TDBGrid
                Left = 1
                Top = 1
                Width = 967
                Height = 104
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
                    FieldName = 'REGISTRO_MS'
                    Title.Alignment = taCenter
                    Title.Font.Charset = ANSI_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Verdana'
                    Title.Font.Style = [fsBold]
                    Width = 122
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME_PRODUTO'
                    Title.Alignment = taCenter
                    Title.Font.Charset = ANSI_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Verdana'
                    Title.Font.Style = [fsBold]
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUMERO_LOTE'
                    Title.Alignment = taRightJustify
                    Width = 104
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'QUANTIDADE'
                    Title.Alignment = taCenter
                    Width = 88
                    Visible = True
                  end>
              end
              object Panel9: TPanel
                Left = 1
                Top = 105
                Width = 967
                Height = 34
                Align = alBottom
                TabOrder = 1
                object btnExcluirEntrada: TBitBtn
                  Left = 14
                  Top = 5
                  Width = 75
                  Height = 25
                  Hint = 'Excluir registro atual'
                  Caption = 'E&xcluir'
                  TabOrder = 0
                  OnClick = btnExcluirEntradaClick
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000220B0000220B000000010000000100000031DE000031
                    E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                    0404040404040404000004000004040404040404040404000004040000000404
                    0404040404040000040404000000000404040404040000040404040402000000
                    0404040400000404040404040404000000040000000404040404040404040400
                    0101010004040404040404040404040401010204040404040404040404040400
                    0201020304040404040404040404030201040403030404040404040404050203
                    0404040405030404040404040303050404040404040303040404040303030404
                    0404040404040403040403030304040404040404040404040404030304040404
                    0404040404040404040404040404040404040404040404040404}
                end
              end
            end
          end
          object tsVendas: TTabSheet
            Caption = 'Vendas'
            ImageIndex = 1
            object dbGridVendas: TDBGrid
              Left = 0
              Top = 0
              Width = 969
              Height = 186
              Align = alClient
              Ctl3D = False
              DataSource = dsVendas
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
                  FieldName = 'ID_VENDA'
                  Title.Alignment = taCenter
                  Title.Caption = 'N'#186' Venda'
                  Width = 67
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'DATA_VENDA'
                  Title.Alignment = taCenter
                  Title.Caption = 'Dt.Venda'
                  Width = 70
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'NR_NOT_MEDICAMENTO'
                  Title.Alignment = taCenter
                  Title.Caption = 'N.'#186' da Receita'
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'DATA_RECEITA'
                  Title.Alignment = taCenter
                  Title.Caption = 'Dt.Receita'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_CLIENTE'
                  Title.Caption = 'Nome Comprador'
                  Width = 305
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PAC_NOME'
                  Title.Caption = 'Nome Paciente'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_MEDICO'
                  Title.Caption = 'Nome M'#233'dico'
                  Visible = True
                end>
            end
            object pnlItensVenda: TPanel
              Left = 0
              Top = 186
              Width = 969
              Height = 140
              Align = alBottom
              TabOrder = 1
              object DBGrid2: TDBGrid
                Left = 1
                Top = 1
                Width = 967
                Height = 104
                Align = alClient
                Ctl3D = False
                DataSource = dsItensVenda
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
                    FieldName = 'REGISTRO_MS'
                    Title.Alignment = taCenter
                    Title.Font.Charset = ANSI_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Verdana'
                    Title.Font.Style = [fsBold]
                    Width = 122
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME_PRODUTO'
                    Title.Alignment = taCenter
                    Title.Font.Charset = ANSI_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Verdana'
                    Title.Font.Style = [fsBold]
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUMERO_LOTE'
                    Title.Alignment = taRightJustify
                    Width = 104
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'QUANT_MEDICAMENTO'
                    Title.Alignment = taCenter
                    Width = 88
                    Visible = True
                  end>
              end
              object Panel10: TPanel
                Left = 1
                Top = 105
                Width = 967
                Height = 34
                Align = alBottom
                TabOrder = 1
                object btnExcluirVenda: TBitBtn
                  Left = 14
                  Top = 5
                  Width = 75
                  Height = 25
                  Hint = 'Excluir registro atual'
                  Caption = 'E&xcluir'
                  TabOrder = 0
                  OnClick = btnExcluirVendaClick
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000220B0000220B000000010000000100000031DE000031
                    E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                    0404040404040404000004000004040404040404040404000004040000000404
                    0404040404040000040404000000000404040404040000040404040402000000
                    0404040400000404040404040404000000040000000404040404040404040400
                    0101010004040404040404040404040401010204040404040404040404040400
                    0201020304040404040404040404030201040403030404040404040404050203
                    0404040405030404040404040303050404040404040303040404040303030404
                    0404040404040403040403030304040404040404040404040404030304040404
                    0404040404040404040404040404040404040404040404040404}
                end
              end
            end
          end
          object tsPerdas: TTabSheet
            Caption = 'Perdas'
            ImageIndex = 2
            object dbGridPerdas: TDBGrid
              Left = 0
              Top = 0
              Width = 969
              Height = 186
              Align = alClient
              Ctl3D = False
              DataSource = dsPerdas
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
                  FieldName = 'DATA_PERDA'
                  Title.Alignment = taCenter
                  Title.Caption = 'Data da Perda'
                  Width = 102
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO_PERDA'
                  Title.Alignment = taCenter
                  Title.Caption = 'Motivo da Perda'
                  Width = 604
                  Visible = True
                end>
            end
            object Panel7: TPanel
              Left = 0
              Top = 186
              Width = 969
              Height = 140
              Align = alBottom
              TabOrder = 1
              object DBGrid3: TDBGrid
                Left = 1
                Top = 1
                Width = 967
                Height = 104
                Align = alClient
                Ctl3D = False
                DataSource = dsItensPerdas
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
                    FieldName = 'REGISTRO_MS'
                    Title.Alignment = taCenter
                    Title.Font.Charset = ANSI_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Verdana'
                    Title.Font.Style = [fsBold]
                    Width = 122
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME_PRODUTO'
                    Title.Alignment = taCenter
                    Title.Font.Charset = ANSI_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Verdana'
                    Title.Font.Style = [fsBold]
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUMERO_LOTE'
                    Title.Alignment = taRightJustify
                    Width = 104
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'QUANTIDADE'
                    Title.Alignment = taCenter
                    Width = 88
                    Visible = True
                  end>
              end
              object Panel11: TPanel
                Left = 1
                Top = 105
                Width = 967
                Height = 34
                Align = alBottom
                TabOrder = 1
                object btnExcluirPerda: TBitBtn
                  Left = 14
                  Top = 5
                  Width = 75
                  Height = 25
                  Hint = 'Excluir registro atual'
                  Caption = 'E&xcluir'
                  TabOrder = 0
                  OnClick = btnExcluirPerdaClick
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000220B0000220B000000010000000100000031DE000031
                    E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                    0404040404040404000004000004040404040404040404000004040000000404
                    0404040404040000040404000000000404040404040000040404040402000000
                    0404040400000404040404040404000000040000000404040404040404040400
                    0101010004040404040404040404040401010204040404040404040404040400
                    0201020304040404040404040404030201040403030404040404040404050203
                    0404040405030404040404040303050404040404040303040404040303030404
                    0404040404040403040403030304040404040404040404040404030304040404
                    0404040404040404040404040404040404040404040404040404}
                end
              end
            end
          end
          object tsTransferencia: TTabSheet
            Caption = 'Transfer'#234'ncias'
            ImageIndex = 4
            object dbGridTransferecias: TDBGrid
              Left = 0
              Top = 0
              Width = 969
              Height = 186
              Align = alClient
              Ctl3D = False
              DataSource = dsTransferencias
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
                  FieldName = 'DATA_TRANSFERENCIA'
                  Title.Alignment = taCenter
                  Width = 134
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LOJA_ORIGEM'
                  Title.Caption = 'Loja Origem'
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LOJA_DESTINO'
                  Title.Caption = 'Loja Destino'
                  Width = 300
                  Visible = True
                end>
            end
            object Panel8: TPanel
              Left = 0
              Top = 186
              Width = 969
              Height = 140
              Align = alBottom
              TabOrder = 1
              object DBGrid5: TDBGrid
                Left = 1
                Top = 1
                Width = 967
                Height = 104
                Align = alClient
                Ctl3D = False
                DataSource = dsItensTransferencia
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
                    FieldName = 'REGISTRO_MS'
                    Title.Alignment = taCenter
                    Title.Caption = 'C'#243'digo MS'
                    Title.Font.Charset = ANSI_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Verdana'
                    Title.Font.Style = [fsBold]
                    Width = 122
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME_PRODUTO'
                    Title.Alignment = taCenter
                    Title.Caption = 'Descri'#231#227'o'
                    Title.Font.Charset = ANSI_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Verdana'
                    Title.Font.Style = [fsBold]
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUMERO_LOTE'
                    Title.Alignment = taRightJustify
                    Title.Caption = 'Lote'
                    Width = 104
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'QUANT_MEDICAMENTO'
                    Title.Alignment = taCenter
                    Title.Caption = 'Quantidade'
                    Width = 88
                    Visible = True
                  end>
              end
              object Panel12: TPanel
                Left = 1
                Top = 105
                Width = 967
                Height = 34
                Align = alBottom
                TabOrder = 1
                object btnExcluirTransf: TBitBtn
                  Left = 14
                  Top = 5
                  Width = 75
                  Height = 25
                  Hint = 'Excluir registro atual'
                  Caption = 'E&xcluir'
                  TabOrder = 0
                  OnClick = btnExcluirTransfClick
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000220B0000220B000000010000000100000031DE000031
                    E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                    0404040404040404000004000004040404040404040404000004040000000404
                    0404040404040000040404000000000404040404040000040404040402000000
                    0404040400000404040404040404000000040000000404040404040404040400
                    0101010004040404040404040404040401010204040404040404040404040400
                    0201020304040404040404040404030201040403030404040404040404050203
                    0404040405030404040404040303050404040404040303040404040303030404
                    0404040404040403040403030304040404040404040404040404030304040404
                    0404040404040404040404040404040404040404040404040404}
                end
              end
            end
          end
        end
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        Width = 979
      end
      inherited grdConsultar: TDBGrid
        Width = 945
        Height = 411
      end
      inherited Panel3: TPanel
        Left = 945
        Height = 411
      end
    end
  end
  inherited Panel4: TPanel
    Width = 987
    inherited Image1: TImage
      Width = 983
    end
  end
  inherited dsConsultar: TDataSource
    Left = 180
    Top = 218
  end
  inherited datasetConsultar: TSQLDataSet
    Left = 220
    Top = 218
  end
  inherited dspConsultar: TDataSetProvider
    Left = 260
    Top = 218
  end
  inherited cdsConsultar: TClientDataSet
    Left = 292
    Top = 218
  end
  inherited dsCadastro: TDataSource
    Left = 468
    Top = 61
  end
  object dstListas: TSQLDataSet
    CommandText = 
      'Select T.id_transferencia, T.id_loja, T.data_nota, T.cnpj_origem' +
      ', T.cnpj_destino, T.data_transferencia, T.situacao FROM transfer' +
      'encia T WHERE (T.data_transferencia = :pDATA) AND (T.id_loja = :' +
      'pLOJA) AND (T.situacao = '#39'F'#39') order BY T.id_transferencia'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.sqlSNGPN
    Left = 249
    Top = 111
  end
  object dpsListas: TDataSetProvider
    DataSet = dstListas
    Options = [poAllowCommandText]
    Left = 297
    Top = 111
  end
  object cdsListaEntradas: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select * from entrada_medicamentos EM WHERE (EM.data_recebimento' +
      ' = :pDATA) ORDER BY ID_ENTRADA'
    Params = <
      item
        DataType = ftDate
        Name = 'pDATA'
        ParamType = ptInput
      end>
    ProviderName = 'dpsListas'
    OnCalcFields = cdsListaEntradasCalcFields
    Left = 345
    Top = 111
    object cdsListaEntradasID_ENTRADA: TIntegerField
      FieldName = 'ID_ENTRADA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsListaEntradasID_LOJA: TIntegerField
      FieldName = 'ID_LOJA'
      Required = True
      DisplayFormat = '000'
    end
    object cdsListaEntradasNR_NOTAFISCAL: TIntegerField
      FieldName = 'NR_NOTAFISCAL'
      Required = True
    end
    object cdsListaEntradasTIPO_OPERACAO_NF: TIntegerField
      FieldName = 'TIPO_OPERACAO_NF'
    end
    object cdsListaEntradasCNPJ_ORIGEM: TStringField
      FieldName = 'CNPJ_ORIGEM'
      Required = True
      EditMask = '99.999.999/9999-99;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsListaEntradasCNPJ_DESTINO: TStringField
      FieldName = 'CNPJ_DESTINO'
      Required = True
      EditMask = '99.999.999/9999-99;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsListaEntradasDATA_RECEBIMENTO: TDateField
      FieldName = 'DATA_RECEBIMENTO'
      Required = True
    end
    object cdsListaEntradasDATA_NOTA: TDateField
      FieldName = 'DATA_NOTA'
    end
    object cdsListaEntradasFLINSUMO: TStringField
      FieldName = 'FLINSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsListaEntradasSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsListaEntradasARQUIVO: TStringField
      FieldName = 'ARQUIVO'
    end
    object cdsListaEntradasDATA_ARQUIVO: TDateField
      FieldName = 'DATA_ARQUIVO'
    end
    object cdsListaEntradasHORA_RECEBIMENTO: TStringField
      FieldName = 'HORA_RECEBIMENTO'
      Size = 8
    end
    object cdsListaEntradasDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
    object cdsListaEntradasUSUARIO: TIntegerField
      FieldName = 'USUARIO'
    end
    object cdsListaEntradasNOME_LOJA: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOME_LOJA'
      Size = 50
    end
  end
  object cdsListaVendas: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select * from vendas M WHERE (M.data_venda = :pDATA) ORDER BY M.' +
      'id_venda'
    Params = <
      item
        DataType = ftDate
        Name = 'pDATA'
        ParamType = ptInput
      end>
    ProviderName = 'dpsListas'
    OnCalcFields = cdsListaVendasCalcFields
    Left = 345
    Top = 143
    object cdsListaVendasID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsListaVendasID_LOJA: TIntegerField
      FieldName = 'ID_LOJA'
      Required = True
      DisplayFormat = '000'
    end
    object cdsListaVendasDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
      Required = True
    end
    object cdsListaVendasDATA_RECEITA: TDateField
      FieldName = 'DATA_RECEITA'
      Required = True
    end
    object cdsListaVendasTIPO_RECEITUARIO: TIntegerField
      FieldName = 'TIPO_RECEITUARIO'
      Required = True
    end
    object cdsListaVendasNR_NOT_MEDICAMENTO: TStringField
      FieldName = 'NR_NOT_MEDICAMENTO'
      FixedChar = True
      Size = 10
    end
    object cdsListaVendasID_PRESCRITOR: TIntegerField
      FieldName = 'ID_PRESCRITOR'
    end
    object cdsListaVendasUSO_MEDICAMENTO: TIntegerField
      FieldName = 'USO_MEDICAMENTO'
    end
    object cdsListaVendasID_COMPRADOR: TIntegerField
      FieldName = 'ID_COMPRADOR'
      Required = True
    end
    object cdsListaVendasFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsListaVendasSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsListaVendasARQUIVO: TStringField
      FieldName = 'ARQUIVO'
    end
    object cdsListaVendasDATA_ARQUIVO: TDateField
      FieldName = 'DATA_ARQUIVO'
    end
    object cdsListaVendasPAC_CODIGO: TIntegerField
      FieldName = 'PAC_CODIGO'
    end
    object cdsListaVendasPAC_NOME: TStringField
      FieldName = 'PAC_NOME'
      Size = 80
    end
    object cdsListaVendasPAC_IDADE: TIntegerField
      FieldName = 'PAC_IDADE'
    end
    object cdsListaVendasPAC_DATA_NASC: TDateField
      FieldName = 'PAC_DATA_NASC'
    end
    object cdsListaVendasPAC_UND_IDADE: TIntegerField
      FieldName = 'PAC_UND_IDADE'
    end
    object cdsListaVendasPAC_SEXO: TStringField
      FieldName = 'PAC_SEXO'
      FixedChar = True
      Size = 1
    end
    object cdsListaVendasPAC_CID: TIntegerField
      FieldName = 'PAC_CID'
    end
    object cdsListaVendasDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
    object cdsListaVendasHORA_VENDA: TStringField
      FieldName = 'HORA_VENDA'
      FixedChar = True
      Size = 8
    end
    object cdsListaVendasUSUARIO: TIntegerField
      FieldName = 'USUARIO'
    end
    object cdsListaVendasNOME_CLIENTE: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsListaVendasNOME_MEDICO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOME_MEDICO'
      Size = 60
    end
  end
  object cdsListaPerdas: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select P.id_perda, p.id_loja, p.data_cadastro, p.data_perda, p.m' +
      'otivo_perda from perdas P WHERE (P.data_perda = :pDATA) ORDER BY' +
      ' P.id_perda'
    Params = <
      item
        DataType = ftDate
        Name = 'pDATA'
        ParamType = ptInput
      end>
    ProviderName = 'dpsListas'
    OnCalcFields = cdsListaPerdasCalcFields
    Left = 345
    Top = 175
    object cdsListaPerdasID_PERDA: TIntegerField
      FieldName = 'ID_PERDA'
      Required = True
    end
    object cdsListaPerdasID_LOJA: TIntegerField
      FieldName = 'ID_LOJA'
      Required = True
    end
    object cdsListaPerdasDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
    object cdsListaPerdasDATA_PERDA: TDateField
      FieldName = 'DATA_PERDA'
    end
    object cdsListaPerdasMOTIVO_PERDA: TIntegerField
      FieldName = 'MOTIVO_PERDA'
      Required = True
    end
    object cdsListaPerdasDESCRICAO_PERDA: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCRICAO_PERDA'
      Size = 60
      Calculated = True
    end
  end
  object dsEntradas: TDataSource
    AutoEdit = False
    DataSet = cdsListaEntradas
    OnDataChange = dsEntradasDataChange
    Left = 393
    Top = 111
  end
  object dsVendas: TDataSource
    AutoEdit = False
    DataSet = cdsListaVendas
    OnDataChange = dsVendasDataChange
    Left = 393
    Top = 151
  end
  object dsPerdas: TDataSource
    AutoEdit = False
    DataSet = cdsListaPerdas
    OnDataChange = dsPerdasDataChange
    Left = 393
    Top = 183
  end
  object dstListaItens: TSQLDataSet
    CommandText = 
      'Select * from TRANSFERENCIA_MEDICAMENTOS TM WHERE (TM.id_transfe' +
      'rencia = :pID)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pID'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.sqlSNGPN
    Left = 489
    Top = 207
  end
  object dspListaItens: TDataSetProvider
    DataSet = dstListaItens
    Options = [poAllowCommandText]
    Left = 529
    Top = 207
  end
  object cdsItensEntrada: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select ME.id_entrada, ME.registro_ms, ME.numero_lote, ME.quantid' +
      'ade, P.pro_antimicrobianos, P.pro_unidade_medida from MEDICAMENT' +
      'O_ENTRADA ME Inner Join PRODUTOS P on ME.REGISTRO_MS = P.pro_rg_' +
      'ms_medicamento Where (ME.ID_ENTRADA = :pID_ENTRADA)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_ENTRADA'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaItens'
    OnCalcFields = cdsItensEntradaCalcFields
    Left = 577
    Top = 207
    object cdsItensEntradaID_ENTRADA: TIntegerField
      FieldName = 'ID_ENTRADA'
      Required = True
    end
    object cdsItensEntradaREGISTRO_MS: TStringField
      DisplayLabel = 'C'#243'digo MS'
      FieldName = 'REGISTRO_MS'
      Required = True
      EditMask = '9.9999.9999.999-9;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsItensEntradaNUMERO_LOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'NUMERO_LOTE'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsItensEntradaQUANTIDADE: TBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      Precision = 9
      Size = 3
    end
    object cdsItensEntradaPRO_ANTIMICROBIANOS: TStringField
      FieldName = 'PRO_ANTIMICROBIANOS'
      FixedChar = True
      Size = 1
    end
    object cdsItensEntradaPRO_UNIDADE_MEDIDA: TStringField
      FieldName = 'PRO_UNIDADE_MEDIDA'
      FixedChar = True
      Size = 1
    end
    object cdsItensEntradaNOME_PRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkInternalCalc
      FieldName = 'NOME_PRODUTO'
      Size = 50
    end
  end
  object cdsListaItensVenda: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select VI.id_venda, VI.registro_ms, VI.numero_lote, VI.quant_med' +
      'icamento, P.pro_antimicrobianos, p.pro_unidade_medida, VI.uso_pr' +
      'olongado from VENDAS_medicamentos VI Inner Join PRODUTOS P on VI' +
      '.registro_ms = P.pro_rg_ms_medicamento Where (VI.id_venda = :pID' +
      'VENDA)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pIDVENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaItens'
    OnCalcFields = cdsListaItensVendaCalcFields
    Left = 577
    Top = 239
    object cdsListaItensVendaID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Required = True
    end
    object cdsListaItensVendaREGISTRO_MS: TStringField
      DisplayLabel = 'C'#243'digo MS'
      FieldName = 'REGISTRO_MS'
      Required = True
      EditMask = '9.9999.9999.999-9;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsListaItensVendaNUMERO_LOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'NUMERO_LOTE'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsListaItensVendaQUANT_MEDICAMENTO: TBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANT_MEDICAMENTO'
      Precision = 9
      Size = 3
    end
    object cdsListaItensVendaPRO_ANTIMICROBIANOS: TStringField
      FieldName = 'PRO_ANTIMICROBIANOS'
      FixedChar = True
      Size = 1
    end
    object cdsListaItensVendaPRO_UNIDADE_MEDIDA: TStringField
      FieldName = 'PRO_UNIDADE_MEDIDA'
      FixedChar = True
      Size = 1
    end
    object cdsListaItensVendaUSO_PROLONGADO: TStringField
      FieldName = 'USO_PROLONGADO'
      FixedChar = True
      Size = 1
    end
    object cdsListaItensVendaNOME_PRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkCalculated
      FieldName = 'NOME_PRODUTO'
      Size = 50
      Calculated = True
    end
  end
  object cdsListaItensPerda: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select PM.ID_PERDA, PM.REGISTRO_MS, PM.NUMERO_LOTE, PM.QUANTIDAD' +
      'E, PM.CNPJ_FORNECEDOR from PERDAS_MEDICAMENTOS PM where (PM.id_p' +
      'erda = :pID)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pID'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaItens'
    OnCalcFields = cdsListaItensPerdaCalcFields
    Left = 577
    Top = 271
    object cdsListaItensPerdaID_PERDA: TIntegerField
      FieldName = 'ID_PERDA'
      Required = True
    end
    object cdsListaItensPerdaNOME_PRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkCalculated
      FieldName = 'NOME_PRODUTO'
      Size = 60
      Calculated = True
    end
    object cdsListaItensPerdaREGISTRO_MS: TStringField
      DisplayLabel = 'C'#243'digo MS'
      FieldName = 'REGISTRO_MS'
      Required = True
      EditMask = '9.9999.9999.999-9;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsListaItensPerdaNUMERO_LOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'NUMERO_LOTE'
      FixedChar = True
      Size = 10
    end
    object cdsListaItensPerdaQUANTIDADE: TFMTBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      Precision = 18
      Size = 8
    end
  end
  object cdsListaEstoqueAnterior: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select E.EST_SEQUENCIA, E.EST_CDLOJA, E.EST_CDPROD, P.PRO_MEDICA' +
      'MENTO, E.EST_NRLOTE, E.EST_QUANTIDADE, E.EST_DTVENCIMENTO, E.EST' +
      '_DTMOVIMENTO from ESTOQUE_HISTORICO  E inner join PRODUTOS P on ' +
      'E.EST_CDPROD = P.pro_rg_ms_medicamento where (E.EST_DTMOVIMENTO ' +
      '= :pDTMOVI) and (E.EST_CDLOJA = :pLOJA) Order by P.PRO_MEDICAMEN' +
      'TO'
    Params = <
      item
        DataType = ftDate
        Name = 'pDTMOVI'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end>
    ProviderName = 'dpsListas'
    OnCalcFields = cdsListaEstoqueAnteriorCalcFields
    Left = 436
    Top = 61
    object cdsListaEstoqueAnteriorEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      Required = True
    end
    object cdsListaEstoqueAnteriorEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      Required = True
      EditMask = '9.9999.9999.999-9;0;_'
      Size = 13
    end
    object cdsListaEstoqueAnteriorPRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      Required = True
      Size = 50
    end
    object cdsListaEstoqueAnteriorNOME_PRODUTO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOME_PRODUTO'
      Size = 50
    end
    object cdsListaEstoqueAnteriorEST_NRLOTE: TStringField
      FieldName = 'EST_NRLOTE'
      Required = True
      Size = 10
    end
    object cdsListaEstoqueAnteriorEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsListaEstoqueAnteriorEST_DTVENCIMENTO: TDateField
      FieldName = 'EST_DTVENCIMENTO'
    end
    object cdsListaEstoqueAnteriorEST_DTMOVIMENTO: TDateField
      FieldName = 'EST_DTMOVIMENTO'
    end
    object cdsListaEstoqueAnteriorTOTAL_VENDAS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTAL_VENDAS'
      Calculated = True
    end
    object cdsListaEstoqueAnteriorTOTAL_ENTRADAS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTAL_ENTRADAS'
      Calculated = True
    end
    object cdsListaEstoqueAnteriorTOTAL_PERDAS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTAL_PERDAS'
      Calculated = True
    end
    object cdsListaEstoqueAnteriorTOTAL_TRANSFERENCIAS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTAL_TRANSFERENCIAS'
      Calculated = True
    end
    object cdsListaEstoqueAnteriorSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldKind = fkCalculated
      FieldName = 'SALDO'
      Calculated = True
    end
    object cdsListaEstoqueAnteriorOK: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'OK'
      Calculated = True
    end
  end
  object dsListaEstoqueAnterior: TDataSource
    DataSet = cdsListaEstoqueAnterior
    Left = 508
    Top = 61
  end
  object ImageList1: TImageList
    Left = 612
    Top = 109
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000949494008C8C8C008C8C8C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      940084848400747474006C6C6C006C6C6C008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400747474006C6C6C0064646400646464007C7C7C008C8C8C00000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006C8C
      54003C5C24002424240024341C00646464006C6C6C007C7C7C008C8C8C000000
      0000000000000000000000000000000000000000000000008000808080008080
      8000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006CD4
      04006CD40400448404001C3C0400747C74006C6C6C0074747400848484009494
      9400000000000000000000000000000000000000000000008000000080008080
      8000808080000000000000000000000000000000000000008000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000084FC
      0C0084FC14006CDC04002C5C040044543C006C6C6C006C6C6C007C7C7C008C8C
      8C00000000000000000000000000000000000000000000000000000080000000
      8000808080000000000000000000000000008080800000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B4C4A4007CFC040084FC
      140084FC140084FC14006CD404002C5C0400747474006C6C6C006C6C6C007474
      7400848484000000000000000000000000000000000000000000000080000000
      8000808080008080800000000000000080000000800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094D45C0084FC0C0094FC
      240094FC24008CFC240084FC0C00449404008C948C00747474006C6C6C006C6C
      6C00747474000000000000000000000000000000000000000000000000000000
      8000000080008080800080808000000080000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCC4B400ACFC64009CFC44009CF4
      4C00BCCCB400BCF48400A4FC4C0084FC14001C3C04007C7C7C007C7C7C007474
      74006C6C6C007C7C7C008C8C8C00000000000000000000000000000000000000
      8000000080000000800000008000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BCCCB400A4FC4C00BCC4
      B40000000000BCCCAC00B4FC6C009CFC3C004484040024341C008C8C8C007C7C
      7C00747474007474740084848400949494000000000000000000000000008080
      8000000080000000800000008000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B4F4740084FC140054AC04001C3C04006C6C
      6C008C8C8C007C7C7C00848484008C8C8C008080800080808000808080000000
      8000000080000000800000008000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BCCCAC009CFC440084FC1400449404001C34
      04008C948C008C8C8C008C8C8C00949494000000800000008000000080000000
      0000000000000000000000008000000080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCFC7C00A4FC4C0084FC14004494
      04001C3404000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BCCCB400C4FC8C00B4FC
      6C008CFC1C0054743C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BCC4B400C4F4
      9400B4FC6C0074F40400B4C4A400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BCCCAC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F8FFFFFF00000000E07FFFFF00000000
      E03FDFFF00000000E01F8FDF00000000E00F879900000000E00FC73900000000
      8007C23F000000008007E079000000000001E0F9000000008800E0F900000000
      FE00007900000000FE001C3900000000FF07FE1900000000FF83FF3F00000000
      FFC1FFFF00000000FFFBFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object dsItensEntrada: TDataSource
    DataSet = cdsItensEntrada
    Left = 617
    Top = 207
  end
  object dsItensVenda: TDataSource
    DataSet = cdsListaItensVenda
    Left = 617
    Top = 239
  end
  object dsItensPerdas: TDataSource
    DataSet = cdsListaItensPerda
    Left = 617
    Top = 271
  end
  object cdsEstoque: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsEstoqueCalcFields
    Left = 580
    Top = 61
    Data = {
      050100009619E0BD01000000180000000A00000000000300000005010A434453
      5F43444C4F4A4104000100000000000A4344535F434450524F44010049000000
      0100055749445448020002000D000D4344535F44455343524943414F01004900
      000001000557494454480200020032000A4344535F4E524C4F54450100490000
      000100055749445448020002000A00104344535F445456454E43494D454E544F
      04000600000000000A4344535F5154414E544508000400000000000A4344535F
      5154454E545208000400000000000A4344535F515456454E4408000400000000
      000A4344535F51545045524408000400000000000A4344535F51545452414E08
      000400000000000000}
    object cdsEstoqueCDS_CDLOJA: TIntegerField
      FieldName = 'CDS_CDLOJA'
    end
    object cdsEstoqueCDS_CDPROD: TStringField
      FieldName = 'CDS_CDPROD'
      EditMask = '9.9999.9999.999-9;0;_'
      Size = 13
    end
    object cdsEstoqueCDS_DESCRICAO: TStringField
      FieldName = 'CDS_DESCRICAO'
      Size = 50
    end
    object cdsEstoqueCDS_NRLOTE: TStringField
      FieldName = 'CDS_NRLOTE'
      Size = 10
    end
    object cdsEstoqueCDS_DTVENCIMENTO: TDateField
      FieldName = 'CDS_DTVENCIMENTO'
    end
    object cdsEstoqueCDS_QTANTE: TFloatField
      FieldName = 'CDS_QTANTE'
    end
    object cdsEstoqueCDS_QTENTR: TFloatField
      FieldName = 'CDS_QTENTR'
    end
    object cdsEstoqueCDS_QTVEND: TFloatField
      FieldName = 'CDS_QTVEND'
    end
    object cdsEstoqueCDS_QTPERD: TFloatField
      FieldName = 'CDS_QTPERD'
    end
    object cdsEstoqueCDS_QTTRAN: TFloatField
      FieldName = 'CDS_QTTRAN'
    end
    object cdsEstoqueCDS_SALDO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CDS_SALDO'
      Calculated = True
    end
    object cdsEstoqueCDS_SITUACAO: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'CDS_SITUACAO'
    end
  end
  object cdsMovEstoque: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select E.EST_CDLOJA, E.EST_CDPROD, P.pro_medicamento, E.EST_NRLO' +
      'TE, E.EST_QUANTIDADE, E.EST_DTVENCIMENTO from ESTOQUE E inner jo' +
      'in PRODUTOS P on E.EST_CDPROD = P.pro_rg_ms_medicamento where (E' +
      '.EST_CDLOJA = :pLOJA) Order by P.PRO_MEDICAMENTO'
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end>
    ProviderName = 'dpsListas'
    Left = 540
    Top = 61
  end
  object dsMovEstoque: TDataSource
    AutoEdit = False
    DataSet = cdsEstoque
    OnDataChange = dsMovEstoqueDataChange
    Left = 620
    Top = 61
  end
  object cdsListaTransferencias: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select T.id_transferencia, T.id_loja, T.data_nota, T.cnpj_origem' +
      ', T.cnpj_destino, T.data_transferencia, T.situacao FROM transfer' +
      'encia T WHERE (T.data_transferencia = :pDATA) AND (T.situacao = ' +
      #39'F'#39') order BY T.id_transferencia'
    Params = <
      item
        DataType = ftDate
        Name = 'pDATA'
        ParamType = ptInput
      end>
    ProviderName = 'dpsListas'
    OnCalcFields = cdsListaTransferenciasCalcFields
    Left = 353
    Top = 223
    object cdsListaTransferenciasID_TRANSFERENCIA: TIntegerField
      FieldName = 'ID_TRANSFERENCIA'
      Required = True
    end
    object cdsListaTransferenciasID_LOJA: TIntegerField
      FieldName = 'ID_LOJA'
      Required = True
    end
    object cdsListaTransferenciasDATA_NOTA: TDateField
      DisplayLabel = 'Data da Nota'
      FieldName = 'DATA_NOTA'
    end
    object cdsListaTransferenciasCNPJ_ORIGEM: TStringField
      DisplayLabel = 'CNPJ Origem'
      FieldName = 'CNPJ_ORIGEM'
      Size = 14
    end
    object cdsListaTransferenciasCNPJ_DESTINO: TStringField
      DisplayLabel = 'CNPJ Destino'
      FieldName = 'CNPJ_DESTINO'
      Size = 14
    end
    object cdsListaTransferenciasDATA_TRANSFERENCIA: TDateField
      DisplayLabel = 'Data Transfer'#234'ncia'
      FieldName = 'DATA_TRANSFERENCIA'
    end
    object cdsListaTransferenciasSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsListaTransferenciasLOJA_ORIGEM: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'LOJA_ORIGEM'
      Size = 50
    end
    object cdsListaTransferenciasLOJA_DESTINO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'LOJA_DESTINO'
      Size = 50
    end
  end
  object dsTransferencias: TDataSource
    DataSet = cdsListaTransferencias
    OnDataChange = dsTransferenciasDataChange
    Left = 401
    Top = 231
  end
  object cdsListaItensTransferencia: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select * from TRANSFERENCIA_MEDICAMENTOS TM WHERE (TM.id_transfe' +
      'rencia = :pID)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pID'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaItens'
    OnCalcFields = cdsListaItensTransferenciaCalcFields
    Left = 577
    Top = 303
    object cdsListaItensTransferenciaID_TRANSFERENCIA: TIntegerField
      FieldName = 'ID_TRANSFERENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsListaItensTransferenciaNOME_PRODUTO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOME_PRODUTO'
      Size = 60
    end
    object cdsListaItensTransferenciaREGISTRO_MS: TStringField
      FieldName = 'REGISTRO_MS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      EditMask = '9.9999.9999.999-9;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsListaItensTransferenciaNUMERO_LOTE: TStringField
      FieldName = 'NUMERO_LOTE'
      FixedChar = True
      Size = 10
    end
    object cdsListaItensTransferenciaQUANT_MEDICAMENTO: TBCDField
      FieldName = 'QUANT_MEDICAMENTO'
      Precision = 9
      Size = 3
    end
    object cdsListaItensTransferenciaFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      FixedChar = True
      Size = 1
    end
  end
  object dsItensTransferencia: TDataSource
    DataSet = cdsListaItensTransferencia
    Left = 617
    Top = 303
  end
end
