unit uViewCustomers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, Grids, DBGrids, uViewList;

type
  TvCustomers = class(TvList)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  vCustomers: TvCustomers;

implementation

{$R *.DFM}

end.
