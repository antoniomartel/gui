unit uBoardMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdActns, ActnList, Menus, uViewSOrders,
  ExtCtrls, uViewCustomers, uViewList, StdCtrls, uView, uObserver, ImgList,
  uBoard;

type
  TMainBoard = class(TBoard)
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    EditCopy1: TEditCopy;
    EditCut1: TEditCut;
    EditDelete1: TEditDelete;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    Edit1: TMenuItem;
    Window1: TMenuItem;
    Close1: TMenuItem;
    About1: TMenuItem;
    About2: TMenuItem;
    Arrange1: TMenuItem;
    Cascade1: TMenuItem;
    Minimize1: TMenuItem;
    TileHorizontal1: TMenuItem;
    TileVertical1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    Delete1: TMenuItem;
    Paste1: TMenuItem;
    SelectAll1: TMenuItem;
    Undo1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    vCustomers: TvCustomers;
    Splitter1: TSplitter;
    ImageList: TImageList;
    WindowArrange1: TWindowArrange;
    WindowCascade1: TWindowCascade;
    WindowClose1: TWindowClose;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    vSOrders: TvSOrders;
    procedure vCustomersgrCustomersDblClick(Sender: TObject);
    procedure vSOrdersgrCustomersDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainBoard: TMainBoard;

implementation

{$R *.DFM}

uses
  uCustomer, uSOrder,
  uViewEditCustomers, uViewEditSOrders,
  uProvider;


//------------------------------------------------------------------------------
//                    Procedure vCustomersgrCustomersDblClick
//------------------------------------------------------------------------------

procedure TMainBoard.vCustomersgrCustomersDblClick(Sender: TObject);
begin
  inherited;
  Provider.OpenView(CCustomer, vCustomers.Table.FieldByName('Id').AsString,
    TvEditCustomers, vCustomers);
end;

//------------------------------------------------------------------------------
//                    Procedure vSOrdersgrCustomersDblClick
//------------------------------------------------------------------------------

procedure TMainBoard.vSOrdersgrCustomersDblClick(Sender: TObject);
begin
  inherited;
  Provider.OpenView(CSOrder, vSOrders.Table.FieldByName('Id').AsString,
    TvEditSOrders, vSOrders);
end;


end.
