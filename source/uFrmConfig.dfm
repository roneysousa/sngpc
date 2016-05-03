inherited frmConfig: TfrmConfig
  Left = 230
  Top = 142
  Caption = 'Dados do SNGPC'
  ClientHeight = 486
  ClientWidth = 599
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 599
    Height = 465
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 11
        Width = 91
        Height = 13
        Caption = 'CNPJ da Farm'#225'rcia'
        FocusControl = dbeCNPJ
        Transparent = True
      end
      object Label5: TLabel [1]
        Left = 16
        Top = 181
        Width = 80
        Height = 13
        Caption = 'Pasta de arquivo'
        FocusControl = dbeNMPAST
        Transparent = True
      end
      object Label6: TLabel [2]
        Left = 16
        Top = 221
        Width = 50
        Height = 13
        Caption = 'UF padr'#227'o'
        Transparent = True
      end
      object Label7: TLabel [3]
        Left = 327
        Top = 216
        Width = 135
        Height = 13
        Caption = 'Data do Fechamento Anvisa'
        Visible = False
      end
      object Label4: TLabel [4]
        Left = 154
        Top = 267
        Width = 94
        Height = 13
        Caption = 'Dt.Fechamento Inv.'
        Transparent = True
      end
      object Label8: TLabel [5]
        Left = 282
        Top = 267
        Width = 110
        Height = 13
        Caption = 'Dt.'#218'lt.Arquivo V'#225'lidado'
        Transparent = True
      end
      inherited Panel1: TPanel
        Top = 396
        Width = 591
        inherited BtAdicionar: TBitBtn
          Visible = False
        end
        inherited BtExcluir: TBitBtn
          Visible = False
        end
        inherited BtPesquisar: TBitBtn
          Visible = False
        end
      end
      object dbeCNPJ: TDBEdit
        Left = 16
        Top = 27
        Width = 147
        Height = 21
        DataField = 'CFG_CNPJ'
        DataSource = dsCadastro
        MaxLength = 18
        TabOrder = 1
        OnExit = dbeCNPJExit
      end
      object GroupBox1: TGroupBox
        Left = 15
        Top = 57
        Width = 537
        Height = 121
        Caption = 
          '[ Dados do farmac'#234'utico respons'#225'vel pelo envio das movimenta'#231#245'es' +
          ' ]'
        TabOrder = 2
        object Label2: TLabel
          Left = 16
          Top = 18
          Width = 20
          Height = 13
          Caption = 'CPF'
          FocusControl = dbeCPF
          Transparent = True
        end
        object Label3: TLabel
          Left = 16
          Top = 57
          Width = 25
          Height = 13
          Caption = 'Email'
          FocusControl = dbeEmail
          Transparent = True
        end
        object dbeCPF: TDBEdit
          Left = 16
          Top = 34
          Width = 139
          Height = 21
          DataField = 'CFG_CPF'
          DataSource = dsCadastro
          MaxLength = 14
          TabOrder = 0
          OnExit = dbeCPFExit
        end
        object dbeEmail: TDBEdit
          Left = 16
          Top = 73
          Width = 500
          Height = 21
          DataField = 'CFG_EMAIL'
          DataSource = dsCadastro
          TabOrder = 1
        end
      end
      object dbeNMPAST: TDBEdit
        Left = 16
        Top = 197
        Width = 536
        Height = 21
        DataField = 'CFG_NOME_PASTA'
        DataSource = dsCadastro
        TabOrder = 3
      end
      object cmbUF: TDBComboBox
        Left = 16
        Top = 237
        Width = 76
        Height = 22
        Style = csOwnerDrawFixed
        DataField = 'CFG_UF_PADRAO'
        DataSource = dsCadastro
        ItemHeight = 16
        Items.Strings = (
          'AC'
          'AL'
          'AM'
          'AP'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MG'
          'MS'
          'MT'
          'PA'
          'PE'
          'PR'
          'PI'
          'RJ'
          'RN'
          'RO'
          'RR'
          'RS'
          'SC'
          'SE'
          'SP'
          'TO')
        TabOrder = 4
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 16
        Top = 267
        Width = 122
        Height = 38
        Caption = '[ Zeros a Esquerda ]'
        Columns = 2
        DataField = 'CFG_FLZEROS'
        DataSource = dsCadastro
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 5
        Values.Strings = (
          'S'
          'N')
      end
      object btnFecharInventario: TBitBtn
        Left = 467
        Top = 226
        Width = 99
        Height = 25
        Caption = 'Fechar Invent'#225'rio'
        TabOrder = 6
        Visible = False
        OnClick = btnFecharInventarioClick
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 144
        Top = 219
        Width = 174
        Height = 38
        Caption = '[ Invent'#225'rio Aberto na Anvisa ]'
        Columns = 2
        DataField = 'CFG_FLINVENTARIO'
        DataSource = dsCadastro
        Items.Strings = (
          'Sim'
          'N'#227'o')
        ReadOnly = True
        TabOrder = 7
        TabStop = True
        Values.Strings = (
          'S'
          'N')
        Visible = False
      end
      object dbeDtInvertario: TDBDateEdit
        Left = 327
        Top = 232
        Width = 121
        Height = 21
        DataField = 'CFG_DTINVENTARIO'
        DataSource = dsCadastro
        ReadOnly = True
        NumGlyphs = 2
        TabOrder = 8
        Visible = False
        OnExit = dbeDtInvertarioExit
      end
      object DBDateEdit1: TDBDateEdit
        Left = 280
        Top = 282
        Width = 121
        Height = 21
        Hint = 'Data do '#250'ltimo arquivo v'#225'lidado'
        TabStop = False
        DataField = 'CFG_DTULTIMO_ARQUIVO_VALIDADO'
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
        TabOrder = 9
      end
      object DBDateEdit2: TDBDateEdit
        Left = 152
        Top = 282
        Width = 121
        Height = 21
        Hint = 'Data do fechamento do invent'#225'rio'
        TabStop = False
        DataField = 'CFG_DT_FECHAMENTO_INV_SISTEMA'
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
        TabOrder = 10
      end
      object GroupBox2: TGroupBox
        Left = 16
        Top = 312
        Width = 308
        Height = 62
        Caption = '[ Tela de Venda ] '
        TabOrder = 11
        object Label9: TLabel
          Left = 10
          Top = 15
          Width = 75
          Height = 13
          Caption = 'Largura da Tela'
          FocusControl = DBEdit1
          Transparent = True
        end
        object Label10: TLabel
          Left = 162
          Top = 15
          Width = 66
          Height = 13
          Caption = 'Altura da Tela'
          FocusControl = DBEdit2
        end
        object DBEdit1: TDBEdit
          Left = 10
          Top = 30
          Width = 134
          Height = 21
          DataField = 'CFG_SCREEN_WIDTH'
          DataSource = dsCadastro
          MaxLength = 4
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 162
          Top = 30
          Width = 134
          Height = 21
          DataField = 'CFG_SCREEN_HEIGTH'
          DataSource = dsCadastro
          MaxLength = 4
          TabOrder = 1
        end
      end
      object DBRadioGroup3: TDBRadioGroup
        Left = 328
        Top = 312
        Width = 185
        Height = 62
        Caption = '[ Hambiente Envio de Arquivo ]'
        DataField = 'CFG_FLPRODUCAO'
        DataSource = dsCadastro
        Items.Strings = (
          '&Homologa'#231#227'o'
          '&Produ'#231#227'o')
        TabOrder = 12
        TabStop = True
        Values.Strings = (
          '0'
          '1')
      end
    end
    inherited TabSheet2: TTabSheet
      TabVisible = False
      inherited Panel2: TPanel
        Width = 591
      end
      inherited grdConsultar: TDBGrid
        Width = 557
        Height = 378
      end
      inherited Panel3: TPanel
        Left = 557
        Height = 378
      end
    end
  end
  inherited Panel4: TPanel
    Width = 599
    inherited Image1: TImage
      Width = 595
    end
  end
  inherited dsConsultar: TDataSource
    Left = 364
    Top = 66
  end
  inherited datasetConsultar: TSQLDataSet
    Left = 324
    Top = 74
  end
  inherited dspConsultar: TDataSetProvider
    Left = 404
    Top = 74
  end
  inherited cdsConsultar: TClientDataSet
    Left = 476
    Top = 74
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsConfig
    Left = 452
    Top = 133
  end
end
