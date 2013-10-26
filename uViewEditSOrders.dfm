inherited vEditSOrders: TvEditSOrders
  Width = 445
  Height = 300
  inherited pButtons: TPanel
    Top = 259
    Width = 445
    inherited Panel1: TPanel
      Left = 74
    end
  end
  inherited Panel2: TPanel
    Width = 445
    Height = 259
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 25
      Height = 13
      Caption = 'Code'
    end
    object Label2: TLabel
      Left = 24
      Top = 64
      Width = 23
      Height = 13
      Caption = 'Date'
    end
    object Label3: TLabel
      Left = 24
      Top = 224
      Width = 64
      Height = 13
      Caption = 'Delivery Date'
    end
    object Label4: TLabel
      Left = 24
      Top = 104
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object Label5: TLabel
      Left = 24
      Top = 144
      Width = 65
      Height = 13
      Caption = 'Payment Mtd.'
    end
    object Label7: TLabel
      Left = 24
      Top = 184
      Width = 45
      Height = 13
      Caption = 'Items No.'
    end
    object eCode: TGUIEdit
      Left = 96
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Code'
      PropertyName = 'Code'
    end
    object eDate: TGUIEdit
      Left = 96
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Date'
      PropertyName = 'Date'
    end
    object eDeliveryDate: TGUIEdit
      Left = 96
      Top = 216
      Width = 113
      Height = 21
      TabOrder = 2
      Text = 'DeliveryDate'
      PropertyName = 'DeliveryDate'
    end
    object eTotal: TGUIEdit
      Left = 96
      Top = 96
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'Total'
      PropertyName = 'Total'
    end
    object ePayment: TGUIEdit
      Left = 96
      Top = 136
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'PaymentMethod'
      PropertyName = 'PaymentMethod'
    end
    object eItemsNo: TGUIEdit
      Left = 96
      Top = 176
      Width = 121
      Height = 21
      TabOrder = 5
      Text = 'ItemsNo'
      PropertyName = 'ItemsNo'
    end
    inline vCustomerPreview: TvCustomerPreview
      Left = 248
      Top = 17
      TabOrder = 6
    end
  end
end
