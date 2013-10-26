unit uMML;

interface

uses
  Classes,
  uModel;

type

  // Model Management List.- MML
  CMML = class(TObject)
  private
    { Private declarations }
    FIndexList: TStringList;
    FModelList: TList;
  public
    constructor Create;
    destructor Destroy; override;
    function IndexOf(ModelClassName: String; Id: String): Integer;
    // Returns object with given id if it is already in memory
    function GetObject(ModelClassName: String; Id: String): CModel;
    function AddObject(AObject: CModel): Integer;
  end;

const
  chEqual = '=';

implementation

{ CMML }

//------------------------------------------------------------------------------
//                            Constructor Create
//------------------------------------------------------------------------------

constructor CMML.Create;
begin
  FIndexList := TStringList.Create;
  FModelList := TList.Create;
end;

//------------------------------------------------------------------------------
//                            Destructor Destroy
//------------------------------------------------------------------------------

destructor CMML.Destroy;
begin
  FIndexList.Free;
  FModelList.Free;
  inherited;
end;

//------------------------------------------------------------------------------
//                             Function AddObject
//------------------------------------------------------------------------------

function CMML.AddObject(AObject: CModel): Integer;
begin
  FIndexList.Add(AObject.ClassName + chEqual + AObject.Id);
  Result := FModelList.Add(AObject);
end;

//------------------------------------------------------------------------------
//                            Function GetObject
//------------------------------------------------------------------------------

function CMML.GetObject(ModelClassName: String; Id: String): CModel;
var
  Index: Integer;

begin
  Index := FIndexList.IndexOf(ModelClassName + chEqual + Id);
  if Index <> -1 then
    Result := CModel(FModelList[Index])
  else
    Result := nil;
end;

//------------------------------------------------------------------------------
//                           Function IndexOf
//------------------------------------------------------------------------------

function CMML.IndexOf(ModelClassName: String; Id: String): Integer;
begin
  Result := FIndexList.IndexOf(ModelClassName + chEqual + Id);
end;

end.
 