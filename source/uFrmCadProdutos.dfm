inherited frmCadProdutos: TfrmCadProdutos
  Left = 211
  Top = 169
  Caption = 'Cadastro de Produtos'
  ClientHeight = 345
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 324
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 24
        Width = 179
        Height = 13
        Caption = 'N'#250'mero do Registro do Medicamento:'
        FocusControl = dbeCodigo
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 64
        Width = 113
        Height = 13
        Caption = 'Nome do Medicamento:'
        FocusControl = dbeDescricao
      end
      object Label4: TLabel [2]
        Left = 400
        Top = 104
        Width = 76
        Height = 13
        Caption = 'Valor de Venda:'
        FocusControl = dbeQuant
        Visible = False
      end
      object Label3: TLabel [3]
        Left = 16
        Top = 104
        Width = 81
        Height = 13
        Caption = 'C'#243'digo de Barras'
        FocusControl = dbeBarras
        Transparent = True
      end
      inherited Panel1: TPanel
        Top = 255
        TabOrder = 3
      end
      object dbeCodigo: TDBEdit
        Left = 16
        Top = 40
        Width = 137
        Height = 21
        DataField = 'PRO_RG_MS_MEDICAMENTO'
        DataSource = dsCadastro
        TabOrder = 0
        OnExit = dbeCodigoExit
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 80
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PRO_MEDICAMENTO'
        DataSource = dsCadastro
        TabOrder = 1
      end
      object dbeQuant: TDBEdit
        Left = 400
        Top = 120
        Width = 120
        Height = 21
        DataField = 'PRO_VALORVENDA'
        TabOrder = 4
        Visible = False
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 16
        Top = 145
        Width = 185
        Height = 53
        Caption = '[ Tipo de Medicamento ]'
        DataField = 'PRO_ANTIMICROBIANOS'
        DataSource = dsCadastro
        Items.Strings = (
          '&1 - Antimicrobiano'
          '&2 - Sujeito a controle Especial')
        TabOrder = 5
        Values.Strings = (
          'S'
          'N')
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 16
        Top = 201
        Width = 185
        Height = 41
        Caption = '[ Unidade Medida ]'
        Columns = 2
        DataField = 'PRO_UNIDADE_MEDIDA'
        DataSource = dsCadastro
        Items.Strings = (
          'Cai&xas'
          '&Frascos')
        TabOrder = 6
        Values.Strings = (
          '1'
          '2')
      end
      object dbeBarras: TDBEdit
        Left = 16
        Top = 120
        Width = 186
        Height = 21
        DataField = 'PRO_BARRAS'
        DataSource = dsCadastro
        TabOrder = 2
        OnKeyPress = dbeBarrasKeyPress
      end
    end
    inherited TabSheet2: TTabSheet
      inherited grdConsultar: TDBGrid
        Height = 237
        DataSource = dsConsultar
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PRO_RG_MS_MEDICAMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'REGISTRO MS'
            Width = 121
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRO_MEDICAMENTO'
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 364
            Visible = True
          end>
      end
      inherited Panel3: TPanel
        Height = 237
      end
    end
  end
  inherited dsConsultar: TDataSource
    Left = 244
    Top = 154
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select PRO_RG_MS_MEDICAMENTO, PRO_MEDICAMENTO from PRODUTOS'
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarPRO_RG_MS_MEDICAMENTO: TStringField
      Alignment = taRightJustify
      FieldName = 'PRO_RG_MS_MEDICAMENTO'
      Required = True
      EditMask = '9.9999.9999.999-9;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsConsultarPRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      Required = True
      Size = 50
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsProdutos
    Left = 508
    Top = 53
  end
end
