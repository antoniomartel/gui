inherited vEditCustomers: TvEditCustomers
  Width = 486
  Height = 305
  inherited pButtons: TPanel
    Top = 264
    Width = 486
    BevelInner = bvRaised
    inherited Panel1: TPanel
      Left = 114
      Top = 2
      Height = 37
    end
  end
  inherited Panel2: TPanel
    Width = 486
    Height = 264
    BevelInner = bvRaised
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
      Width = 50
      Height = 13
      Caption = 'First Name'
    end
    object Label3: TLabel
      Left = 256
      Top = 64
      Width = 51
      Height = 13
      Caption = 'Last Name'
    end
    object Label4: TLabel
      Left = 24
      Top = 104
      Width = 38
      Height = 13
      Caption = 'Address'
    end
    object Label5: TLabel
      Left = 24
      Top = 144
      Width = 57
      Height = 13
      Caption = 'Postal Code'
    end
    object Label6: TLabel
      Left = 256
      Top = 144
      Width = 36
      Height = 13
      Caption = 'Country'
    end
    object Label7: TLabel
      Left = 24
      Top = 184
      Width = 31
      Height = 13
      Caption = 'Phone'
    end
    object Label9: TLabel
      Left = 256
      Top = 184
      Width = 17
      Height = 13
      Caption = 'Fax'
    end
    object Label10: TLabel
      Left = 256
      Top = 224
      Width = 63
      Height = 13
      Caption = 'Date Created'
    end
    object Label11: TLabel
      Left = 24
      Top = 224
      Width = 42
      Height = 13
      Caption = 'Discount'
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
    object eName: TGUIEdit
      Left = 96
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'FirstName'
      PropertyName = 'FirstName'
    end
    object eSurname: TGUIEdit
      Left = 336
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'LastName'
      PropertyName = 'LastName'
    end
    object eAddress: TGUIEdit
      Left = 96
      Top = 96
      Width = 361
      Height = 21
      TabOrder = 3
      Text = 'Address'
      PropertyName = 'Address'
    end
    object ePostalCode: TGUIEdit
      Left = 96
      Top = 136
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'PostalCode'
      PropertyName = 'PostalCode'
    end
    object eCountry: TGUIEdit
      Left = 336
      Top = 136
      Width = 121
      Height = 21
      TabOrder = 5
      Text = 'Country'
      PropertyName = 'Country'
    end
    object ePhone: TGUIEdit
      Left = 96
      Top = 176
      Width = 121
      Height = 21
      TabOrder = 6
      Text = 'Phone'
      PropertyName = 'Phone'
    end
    object eDiscount: TGUIEdit
      Left = 96
      Top = 216
      Width = 121
      Height = 21
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 7
      Text = '0'
      PropertyName = 'Discount'
    end
    object eDateCreated: TGUIEdit
      Left = 336
      Top = 216
      Width = 121
      Height = 21
      TabOrder = 8
      Text = 'DateCreated'
      PropertyName = 'DateCreated'
    end
    object eFax: TGUIEdit
      Left = 336
      Top = 176
      Width = 121
      Height = 21
      TabOrder = 9
      Text = 'Fax'
      PropertyName = 'Fax'
    end
  end
  inherited ImageList: TImageList
    Left = 80
    Top = 244
  end
  inherited ActionList1: TActionList
    Left = 32
    Top = 240
  end
end
