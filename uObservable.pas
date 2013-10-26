unit uObservable;

interface

uses
  classes,
  uObserver, uInterfaces;

type

  CObservableClass = class of CObservable;

  CObservable = class(TObject, IObservable)
  private
    { Private declarations }
    FObserverList: TList;
  protected
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  public
    { Public declarations }
    constructor Create; virtual;
    destructor Destroy; override;
    procedure RegisterObserver(Observer: TObserver);
    procedure UnRegisterObserver(Observer: TObserver);
    procedure Notify;
  end;

implementation

uses
  uView;

{ CObservable }

function CObservable._AddRef: Integer;
begin
  Result := -1;
end;

function CObservable._Release: Integer;
begin
  Result := -1;
end;

function CObservable.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := -1;
end;

constructor CObservable.Create;
begin
  inherited;
  FObserverList := TList.Create;
end;

destructor CObservable.Destroy;
begin
  FObserverList.Free;
  inherited;
end;

procedure CObservable.Notify;
var
  i: Integer;
begin
  for i := 0 to FObserverList.Count - 1 do
    TView(FObserverList[i]).UpdateView;
end;

procedure CObservable.RegisterObserver(Observer: TObserver);
begin
  if FObserverList.IndexOf(Observer) = -1 then
    FObserverList.Add(Observer);
end;

procedure CObservable.UnRegisterObserver(Observer: TObserver);
begin
  FObserverList.Remove(Observer);
end;

end.
 