inherited vCustomerPreview: TvCustomerPreview
  Width = 169
  Height = 180
  AutoSize = True
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 169
    Height = 180
    TabOrder = 0
    object Label9: TLabel
      Left = 24
      Top = 74
      Width = 97
      Height = 13
      Caption = 'Customer First Name'
    end
    object Label10: TLabel
      Left = 24
      Top = 122
      Width = 98
      Height = 13
      Caption = 'Customer Last Name'
    end
    object Label11: TLabel
      Left = 24
      Top = 34
      Width = 72
      Height = 13
      Caption = 'Customer Code'
    end
    object eName: TGUIEdit
      Left = 24
      Top = 90
      Width = 121
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 0
      Text = 'FirstName'
      PropertyName = 'FirstName'
    end
    object eSurname: TGUIEdit
      Left = 24
      Top = 138
      Width = 121
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      Text = 'LastName'
      PropertyName = 'LastName'
    end
    object eCode: TGUIEdit
      Left = 24
      Top = 50
      Width = 121
      Height = 21
      BiDiMode = bdLeftToRight
      Enabled = False
      ParentBiDiMode = False
      ReadOnly = True
      TabOrder = 2
      Text = 'Code'
      PropertyName = 'Code'
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 167
      Height = 15
      Align = alTop
      Caption = 'Sale Order Customer'
      TabOrder = 3
    end
  end
end
