unit uSOrder;

interface

uses
  uObservable, uModel, uCustomer,
  Db;

{$M+}

type

  CSOrder = class(CModel)
  private
    { Private declarations }
    FId: String;
    FCode: String;
    FDate: String;
    FDeliveryDate: String;
    FTotal: Extended;
    FPaymentMethod: String;
    FItemsNo: Integer;
    FCustomer: CCustomer;

  public
    { Public declarations }
    // Fill object with data from db
    procedure UpdateModel(DataSet: TDataSet); override;

  published
    { Published declarations }
    property Id: String read FId write FId;
    property Code: String read FCode write FCode;
    property Date: String read FDate write FDate;
    property DeliveryDate: String read FDeliveryDate write FDeliveryDate;
    property Total: Extended read FTotal write FTotal;
    property PaymentMethod: String read FPaymentMethod write FPaymentMethod;
    property ItemsNo: Integer read FItemsNo write FItemsNo;
    property Customer: CCustomer read FCustomer write FCustomer;
  end;

implementation

{ CSOrder }

uses
  DbTables,
  uProvider;

//------------------------------------------------------------------------------
//                          Procedure UpdateModel
//------------------------------------------------------------------------------

procedure CSOrder.UpdateModel(DataSet: TDataSet);
var
  CustomerId: String;
begin
  Id := DataSet.FieldByName('Id').AsString;
  Code := DataSet.FieldByName('Code').AsString;
  Date := DataSet.FieldByName('Date').AsString;
  DeliveryDate := DataSet.FieldByName('DeliveryDate').AsString;
  Total := DataSet.FieldByName('Total').AsFloat;
  PaymentMethod := DataSet.FieldByName('PaymentMethod').AsString;
  ItemsNo := DataSet.FieldByName('ItemsNo').AsInteger;

  CustomerId := DataSet.FieldByName('CustomerId').AsString;
  Customer := CCustomer(Provider.Open(CCustomer, CustomerId));
end;

end.
