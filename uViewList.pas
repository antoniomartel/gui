unit uViewList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uView, Grids, DBGrids, ExtCtrls, Db, DBTables;

type
  TvList = class(TView)
    DataSource: TDataSource;
    Table: TTable;
    Panel1: TPanel;
    grList: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }

    procedure UpdateView; override;
  end;

var
  vList: TvList;

implementation

{$R *.DFM}


//------------------------------------------------------------------------------
//                            Procedure UpdateView
//------------------------------------------------------------------------------

procedure TvList.UpdateView;
begin
  inherited;

  Table.Refresh;
end;


end.
