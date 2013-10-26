unit uObserver;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type

  TObserverClass = class of TObserver;

  TObserver = class(TFrame)
  private
    { Private declarations }
  public
    { Public declarations }

    procedure UpdateView; virtual; abstract;
  end;

implementation

{$R *.DFM}

end.
 