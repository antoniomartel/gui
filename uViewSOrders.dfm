inherited vSOrders: TvSOrders
  Width = 421
  Height = 292
  inherited Panel1: TPanel
    Width = 421
    Caption = 'Sales Orders'
  end
  inherited grList: TDBGrid
    Width = 421
    Height = 267
    Columns = <
      item
        Expanded = False
        FieldName = 'Code'
        PickList.Strings = ()
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PaymentMethod'
        PickList.Strings = ()
        Title.Caption = 'Payment'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ItemsNo'
        PickList.Strings = ()
        Title.Caption = 'Items No.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DeliveryDate'
        PickList.Strings = ()
        Title.Caption = 'Delivery Date'
        Visible = True
      end>
  end
  inherited Table: TTable
    Active = True
    TableName = 'SOrder.DB'
  end
end
