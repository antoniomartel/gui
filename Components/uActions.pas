unit uActions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList;

type

  CGeneralAction = class(TAction)
  public
    { Public declarations }
    procedure UpdateTarget(Target: TObject); override;
    function HandlesTarget(Target: TObject): Boolean; override;
  end;

  CGeneralAcceptAction = class(CGeneralAction)
  public
    { Public declarations }
    procedure ExecuteTarget(Target: TObject); override;
  end;

  CAcceptAction = class(CGeneralAcceptAction)
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure ExecuteTarget(Target: TObject); override;
  end;

  CApplyAction = class(CGeneralAcceptAction)
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    function HandlesTarget(Target: TObject): Boolean; override;
  end;

  CUndoAction = class(CGeneralAction)
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
  end;

  CCancelAction = class(CGeneralAction)
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure ExecuteTarget(Target: TObject); override;
  end;


const
  acAccept = '&Accept';
  ahAccept = 'Press <Accept> to apply changes and close the window';
  acApply = 'A&pply';
  ahApply = 'Press <Apply> to apply changes';
  acUndo = '&Undo';
  ahUndo = 'Press <Undo> to discard changes';
  acCancel = '&Cancel';
  ahCancel = 'Cancel changes';

procedure Register;

implementation

uses
  Menus,
  uViewEdit, uBoard;


procedure Register;
begin
  RegisterActions('Edit View', [CAcceptAction, CApplyAction, CUndoAction,
    CCancelAction], nil);
end;


//------------------------------------------------------------------------------
//                             CGeneralAction
//------------------------------------------------------------------------------

procedure CGeneralAction.UpdateTarget(Target: TObject);
begin
  Enabled := True;
end;


function CGeneralAction.HandlesTarget(Target: TObject): Boolean;
begin
  Result := (Target is TvEdit) and (Target = Owner);
end;


//------------------------------------------------------------------------------
//                            CGeneralAcceptAction
//------------------------------------------------------------------------------

procedure CGeneralAcceptAction.ExecuteTarget(Target: TObject);
begin
  (Target as TvEdit).UpdateModel;
  (Target as TvEdit).Model.Notify;
  // It will notify here to owner view (f.i. refresh grid when double click open a edit window)
  (Target as TvEdit).OwnerView.UpdateView;
end;


//------------------------------------------------------------------------------
//                             CAcceptAction
//------------------------------------------------------------------------------

constructor CAcceptAction.Create(AOwner: TComponent);
begin
  inherited;
  Caption := acAccept;
  Hint := ahAccept;
  ImageIndex := 11;
end;


procedure CAcceptAction.ExecuteTarget(Target: TObject);
begin
  if (Target as TvEdit).Modified then   // Accept will apply changes if modified
    inherited;
  TBoard((Target as TvEdit).Parent).Close;
end;


//------------------------------------------------------------------------------
//                              CApplyAction
//------------------------------------------------------------------------------

constructor CApplyAction.Create(AOwner: TComponent);
begin
  inherited;
  Caption := acApply;
  Hint := ahApply;
end;


function CApplyAction.HandlesTarget(Target: TObject): Boolean;
begin
  Result := inherited HandlesTarget(Target);
  if Result then
    Result := (Target as TvEdit).Modified;
end;


//------------------------------------------------------------------------------
//                               CUndoAction
//------------------------------------------------------------------------------

constructor CUndoAction.Create(AOwner: TComponent);
begin
  inherited;
  Caption := acUndo;
  Hint := ahUndo;
  ImageIndex := 14;
  ShortCut := TextToShortCut('F5');
end;


function CUndoAction.HandlesTarget(Target: TObject): Boolean;
begin
  Result := inherited HandlesTarget(Target);
  if Result then
    Result := (Target as TvEdit).Modified;
end;


procedure CUndoAction.ExecuteTarget(Target: TObject);
begin
  inherited;
  (Target as TvEdit).UpdateView;
end;


//------------------------------------------------------------------------------
//                              CCancelAction
//------------------------------------------------------------------------------

constructor CCancelAction.Create(AOwner: TComponent);
begin
  inherited;
  Caption := acCancel;
  Hint := ahCancel;
  ImageIndex := 13;
  ShortCut := TextToShortCut('Alt+F4');
end;


procedure CCancelAction.ExecuteTarget(Target: TObject);
begin
  inherited;
  TBoard((Target as TvEdit).Parent).Close;
end;


end.
