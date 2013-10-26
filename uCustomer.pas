unit uCustomer;

interface

uses
  uObservable, uModel,
  Db;

{$M+}

type

  CCustomer = class(CModel)
  private
    { Private declarations }
    FId: String;
    FCode: String;
    FFirstName: String;
    FLastName: String;
    FAddress: String;
    FPostalCode: String;
    FCountry: String;
    FDateCreated: String;
    FDiscount: Integer;
    FPhone: String;
    FFax: String;
  public
    { Public declarations }
    // Fill model attributes with data from DB
    procedure UpdateModel(DataSet: TDataSet); override;

  published
    { Published declarations }
    property Id: String read FId write FId;
    property Code: String read FCode write FCode;
    property FirstName: String read FFirstName write FFirstName;
    property LastName: String read FLastName write FLastName;
    property Address: String read FAddress write FAddress;
    property PostalCode: String read FPostalCode write FPostalCode;
    property Country: String read FCountry write FCountry;
    property DateCreated: String read FDateCreated write FDateCreated;
    property Discount: Integer read FDiscount write FDiscount;
    property Phone: String read FPhone write FPhone;
    property Fax: String read FFax write FFax;
  end;

implementation

{ CCustomer }

//------------------------------------------------------------------------------
//                        Procedure UpdateModel
//------------------------------------------------------------------------------

procedure CCustomer.UpdateModel(DataSet: TDataSet);
begin
  Id := DataSet.FieldByName('Id').AsString;
  Code := DataSet.FieldByName('Code').AsString;
  FirstName := DataSet.FieldByName('FirstName').AsString;
  LastName := DataSet.FieldByName('LastName').AsString;
  Address := DataSet.FieldByName('Address').AsString;
  PostalCode := DataSet.FieldByName('PostalCode').AsString;
  Country := DataSet.FieldByName('Country').AsString;
  DateCreated := DataSet.FieldByName('DateCreated').AsString;
  Discount := DataSet.FieldByName('Discount').AsInteger;
  Phone := DataSet.FieldByName('Phone').AsString;
  Fax := DataSet.FieldByName('Fax').AsString;
end;

end.
 