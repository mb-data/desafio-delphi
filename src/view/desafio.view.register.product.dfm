object frmRegisterProduct: TfrmRegisterProduct
  Left = 0
  Top = 0
  Caption = 'Desafio Delphi - Khipo'
  ClientHeight = 442
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel3: TPanel
    Left = 0
    Top = 65
    Width = 784
    Height = 377
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 778
    ExplicitHeight = 368
    object Panel4: TPanel
      Left = 10
      Top = 10
      Width = 764
      Height = 87
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 10
        Width = 744
        Height = 23
        Align = alTop
        Caption = 'Descri'#231#227'o'
        ExplicitWidth = 73
      end
      object edDescription: TEdit
        Left = 10
        Top = 46
        Width = 744
        Height = 31
        Align = alBottom
        TabOrder = 0
        Text = 'edDescription'
        OnChange = edDescriptionChange
        ExplicitTop = 71
        ExplicitWidth = 738
      end
    end
    object Panel5: TPanel
      AlignWithMargins = True
      Left = 10
      Top = 100
      Width = 764
      Height = 89
      Margins.Left = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      TabOrder = 1
      ExplicitTop = 156
      ExplicitWidth = 758
      object Panel1: TPanel
        Left = 10
        Top = 10
        Width = 279
        Height = 69
        Align = alLeft
        BevelOuter = bvNone
        Padding.Right = 10
        TabOrder = 0
        object Label2: TLabel
          Left = 0
          Top = 0
          Width = 269
          Height = 23
          Align = alTop
          Caption = 'Pre'#231'o de compra'
          ExplicitWidth = 130
        end
        object dbedPurchasePrice: TDBEdit
          Left = 0
          Top = 38
          Width = 269
          Height = 31
          Align = alBottom
          ImeName = 'Japanese'
          TabOrder = 0
        end
      end
      object Panel7: TPanel
        Left = 289
        Top = 10
        Width = 307
        Height = 69
        Align = alLeft
        BevelOuter = bvNone
        Padding.Right = 10
        TabOrder = 1
        object Label4: TLabel
          Left = 0
          Top = 0
          Width = 297
          Height = 23
          Align = alTop
          Caption = 'Pre'#231'o de venda'
          ExplicitWidth = 118
        end
        object dbedSalePrice: TDBEdit
          Left = 0
          Top = 38
          Width = 297
          Height = 31
          Align = alBottom
          ImeName = 'Japanese'
          TabOrder = 0
        end
      end
    end
    object Panel6: TPanel
      AlignWithMargins = True
      Left = 10
      Top = 192
      Width = 764
      Height = 75
      Margins.Left = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      TabOrder = 2
      ExplicitTop = 248
      ExplicitWidth = 758
      object Panel8: TPanel
        Left = 289
        Top = 10
        Width = 307
        Height = 55
        Align = alLeft
        BevelOuter = bvNone
        Padding.Right = 10
        TabOrder = 0
        object Label3: TLabel
          Left = 0
          Top = 0
          Width = 297
          Height = 23
          Align = alTop
          Caption = 'Categoria'
          ExplicitWidth = 74
        end
        object dbedCategory: TDBEdit
          Left = 0
          Top = 24
          Width = 297
          Height = 31
          Align = alBottom
          ImeName = 'Japanese'
          TabOrder = 0
        end
      end
      object Panel9: TPanel
        Left = 10
        Top = 10
        Width = 279
        Height = 55
        Align = alLeft
        BevelOuter = bvNone
        Padding.Right = 10
        TabOrder = 1
        object Label5: TLabel
          Left = 0
          Top = 0
          Width = 269
          Height = 23
          Align = alTop
          Caption = 'Quantidade'
          ExplicitWidth = 90
        end
        object dbedQuantity: TDBEdit
          Left = 0
          Top = 24
          Width = 269
          Height = 31
          Align = alBottom
          ImeName = 'Japanese'
          TabOrder = 0
        end
      end
    end
  end
  object pNavProducts: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 65
    Align = alTop
    Caption = 'pNavProducts'
    Padding.Left = 10
    Padding.Top = 20
    Padding.Right = 10
    Padding.Bottom = 10
    TabOrder = 1
    ExplicitWidth = 778
    object dbNavProducts: TDBNavigator
      Left = 11
      Top = 21
      Width = 762
      Height = 33
      Align = alClient
      TabOrder = 0
      OnClick = dbNavProductsClick
      ExplicitWidth = 756
    end
  end
end
