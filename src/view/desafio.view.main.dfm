object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Desafio Delphi - Khipo'
  ClientHeight = 503
  ClientWidth = 824
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 65
    Width = 824
    Height = 72
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    Padding.Left = 10
    Padding.Top = 20
    Padding.Right = 10
    Padding.Bottom = 10
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 818
    object Label1: TLabel
      Left = 11
      Top = 21
      Width = 167
      Height = 40
      Align = alLeft
      Caption = 'Tipo de manuten'#231#227'o: '
      ExplicitHeight = 23
    end
    object cbTypeMaintenance: TComboBox
      Left = 196
      Top = 21
      Width = 461
      Height = 31
      TabOrder = 0
      Text = '--Tipo de manuten'#231#227'o (Entrada/Sa'#237'da)--'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 137
    Width = 824
    Height = 63
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    Padding.Left = 10
    Padding.Top = 20
    Padding.Right = 20
    Padding.Bottom = 10
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 818
    object Panel6: TPanel
      Left = 11
      Top = 21
      Width = 185
      Height = 31
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 71
        Height = 31
        Align = alLeft
        Caption = 'Produto: '
        ExplicitHeight = 23
      end
    end
    object Panel7: TPanel
      Left = 196
      Top = 21
      Width = 461
      Height = 31
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object btAddProduct: TButton
        Left = 417
        Top = 0
        Width = 44
        Height = 31
        Align = alRight
        Caption = '+'
        TabOrder = 0
        OnClick = btAddProductClick
      end
      object dbcbProducts: TComboBox
        Left = 0
        Top = 0
        Width = 417
        Height = 31
        Align = alClient
        TabOrder = 1
        Text = '--Lista de Produtos--'
        OnChange = dbcbProductsChange
      end
    end
    object Panel8: TPanel
      Left = 657
      Top = 21
      Width = 185
      Height = 31
      Align = alLeft
      BevelOuter = bvNone
      Padding.Left = 20
      TabOrder = 2
      object lbProductValue: TLabel
        Left = 20
        Top = 0
        Width = 70
        Height = 31
        Align = alLeft
        Caption = 'R$ 0,00 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitHeight = 28
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 824
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 10
    Padding.Top = 20
    Padding.Right = 10
    Padding.Bottom = 10
    TabOrder = 2
    ExplicitWidth = 818
    object DBNavOrders: TDBNavigator
      Left = 10
      Top = 20
      Width = 804
      Height = 35
      Align = alClient
      TabOrder = 0
      OnClick = DBNavOrdersClick
      ExplicitWidth = 798
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 200
    Width = 824
    Height = 65
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    Padding.Left = 10
    Padding.Top = 20
    Padding.Right = 10
    Padding.Bottom = 10
    ParentFont = False
    TabOrder = 3
    ExplicitWidth = 818
    object Label4: TLabel
      Left = 11
      Top = 21
      Width = 94
      Height = 33
      Align = alLeft
      Caption = 'Quantidade:'
      ExplicitHeight = 23
    end
    object dbeQuantity: TDBEdit
      Left = 200
      Top = 16
      Width = 121
      Height = 31
      TabOrder = 0
      OnExit = dbeQuantityExit
    end
    object Panel9: TPanel
      Left = 613
      Top = 21
      Width = 200
      Height = 33
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 607
      object lbTotalOrder: TLabel
        Left = 0
        Top = 0
        Width = 200
        Height = 33
        Align = alClient
        Caption = 'Total: R$ '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 79
        ExplicitHeight = 28
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 264
    Width = 824
    Height = 239
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    Padding.Left = 10
    Padding.Top = 20
    Padding.Right = 10
    Padding.Bottom = 20
    ParentFont = False
    TabOrder = 4
    ExplicitTop = 255
    ExplicitWidth = 818
    object Label3: TLabel
      Left = 11
      Top = 21
      Width = 802
      Height = 23
      Align = alTop
      Caption = 'Historico de transa'#231#245'es:'
      ExplicitWidth = 181
    end
    object DBGOrders: TDBGrid
      Left = 11
      Top = 44
      Width = 802
      Height = 174
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -17
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          Width = 100
          Visible = True
        end>
    end
  end
end
