unit uViewEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uObserver, StdCtrls, ExtCtrls, Db, DBTables, uView, ImgList,
  ActnList, uActions, Buttons;

type
  TvEdit = class(TView)
    pButtons: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    ImageList: TImageList;
    bAccept: TBitBtn;
    bApply: TBitBtn;
    bUndo: TBitBtn;
    bCancel: TBitBtn;
    ActionList1: TActionList;
    CAcceptAction1: CAcceptAction;
    CApplyAction1: CApplyAction;
    CCancelAction1: CCancelAction;
    CUndoAction1: CUndoAction;
  private
    { Private declarations }

  protected
  
  public
    { Public declarations }
  end;

var
  vEdit: TvEdit;

implementation

{$R *.DFM}


{ TvEdit }

end.
