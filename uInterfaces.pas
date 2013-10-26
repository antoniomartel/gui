unit uInterfaces;

interface

uses
  uObserver;

type

  IObserver = interface(IUnknown)
    procedure UpdateView;
  end;

  IObservable = interface(IUnknown)
    procedure RegisterObserver(Observer: TObserver);
    procedure UnregisterObserver(Observer: TObserver);
    procedure Notify;
  end;

implementation

end.
 