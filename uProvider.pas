unit uProvider;

interface

uses
  Classes, SysUtils, DBTables,
  uModel, uMML, uObserver, uView;

type

  // Singleton class. Only one instance of this class. Automatically created in initialization
  TProvider = class(TObject)
  private
    FMML: CMML;
  public
    constructor Create;
    destructor Destroy; override;

    // Creates an object and fill it with data from db if it doesn't alreay exist in memory
    function Open(ModelRef: CModelClass; Id: String): CModel;
    // Returns a view of given class observing object of given id (If it doesn't alredy exit, it creates a new one)
    procedure OpenView(ModelRef: CModelClass; Id: String; AViewClass: TViewClass; OwnerView: TView = nil);
  end;

const
  tnCustomer = 'Customer';
  tnSOrder = 'SOrder';
  strSingletonCreationError = 'It has been tried to create more than one instance of provider';

var

  Provider: TProvider;

implementation

uses
  Forms,
  uCustomer, uSOrder,
  uBoard;

{ TProvider }


//------------------------------------------------------------------------------
//                              Constructor Create
//------------------------------------------------------------------------------

constructor TProvider.Create;
begin
  if Provider = nil then
  begin
    Provider := inherited Create;
    FMML := CMML.Create;
  end
  else
    raise Exception.Create(strSingletonCreationError);
end;



//------------------------------------------------------------------------------
//                              Destructor Create
//------------------------------------------------------------------------------

destructor TProvider.Destroy;
begin
  FMML.Free;
  Provider := nil;
  inherited;
end;


//------------------------------------------------------------------------------
//                             Function Open
//------------------------------------------------------------------------------

function TProvider.Open(ModelRef: CModelClass; Id: String): CModel;
var
  Query: TQuery;
  TableName: String;
  NewObject: CModel;

begin
  if FMML.IndexOf(ModelRef.ClassName, Id) <> -1 then  // Object already exists in memory
    Result := FMML.GetObject(ModelRef.ClassName, Id)
  else  // Object it is not in memory, we have to read it from db
  begin
    if ModelRef = CCustomer then
      TableName := tnCustomer
    else
      if ModelRef = CSOrder then
        TableName := tnSOrder;

    Query := TQuery.Create(nil);
    try
      Query.SQL.Add('select * from ' + TableName);
      Query.SQL.Add('where Id = ''' + Id + '''');
      Query.Open;
      NewObject := ModelRef.Create;
      NewObject.UpdateModel(Query);
    finally
      Query.Free;
    end;
    NewObject.Id := Id;
    FMML.AddObject(NewObject);
    Result := NewObject;
  end;
end;


//------------------------------------------------------------------------------
//                           Procedure OpenView
//------------------------------------------------------------------------------

procedure TProvider.OpenView(ModelRef: CModelClass; Id: String; AViewClass: TViewClass; OwnerView: TView = nil);
var
  i: Integer;
  AModel: CModel;
  ABoard: TBoard;
  AView: TView;

begin
  ABoard := nil;
  // Checks if it already exits the view observing this model
  with Application do
  begin
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TBoard then
      begin
        if (Assigned(TBoard(Components[i]).Model)) and (TBoard(Components[i]).Model.Id = Id)
          and (TBoard(Components[i]).View is AViewClass) then
          ABoard := TBoard(Components[i]);
      end;
    end;
  end;

  if ABoard = nil then
  begin
    // Uses createForm function cause that way it can keep track of existing forms with Application.Components
    Application.CreateForm(TBoard, ABoard);
    AView := AViewClass.Create(ABoard);
    ABoard.View := AView;
    ABoard.OwnerView := OwnerView;
    AModel := Provider.Open(ModelRef, Id);
    ABoard.Model := AModel;
  end;

  ABoard.Show;
end;

//------------------------------------------------------------------------------
//                  Initialization and Finalization Sections
//------------------------------------------------------------------------------

initialization
  Provider := TProvider.Create;


finalization
  Provider.Free;

end.
