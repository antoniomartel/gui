unit uViewSOrders;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, Grids, DBGrids, uViewList;

type
  TvSOrders = class(TvList)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  vSOrders: TvSOrders;

implementation

{$R *.DFM}

end.
