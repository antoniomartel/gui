unit uBoard;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,

  uInterfaces, uModel, uObserver, uView;

type

  // Form to contain view(Frame) and wrap class of this view
  TBoard = class(TForm, IObserver)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FView: TView;

    function GetModel: CModel;
    procedure SetModel(const Value: CModel);
    function GetModified: Boolean;
    procedure SetModified(const Value: Boolean);
    procedure SetView(const Value: TView);
    function GetOwnerView: TView;
    procedure SetOwnerView(const Value: TView);

  public
    { Public declarations }
    procedure UpdateView;
    function CloseQuery: Boolean; override;

    property Model: CModel read GetModel write SetModel;
    property Modified: Boolean read GetModified write SetModified;
    property View: TView read FView write SetView;
    property OwnerView: TView read GetOwnerView write SetOwnerView;
  end;


const
  emViewNotAssigned = 'A view has not been assigned to this board';
  emCancelQuestion = 'Do you want to cancel changes?';
  emCancel = 'Cancel';
var
  Board: TBoard;

implementation

{$R *.DFM}


//------------------------------------------------------------------------------
//                            Procedure UpdateView
//------------------------------------------------------------------------------

procedure TBoard.UpdateView;
begin
  if Assigned(View) then
    View.UpdateView;
end;


//------------------------------------------------------------------------------
//                             Function CloseQuery
//------------------------------------------------------------------------------

function TBoard.CloseQuery: Boolean;
begin
  Result := inherited CloseQuery;

  // It won't ask this question when accept is pressed as the model has been updated
  if not Assigned(View) or not Modified or
    (Application.MessageBox(emCancelQuestion, emCancel, MB_YESNO) = IDYES) then
    Result := True
  else
    Result := False;
end;


//------------------------------------------------------------------------------
//                             Function GetModel
//------------------------------------------------------------------------------

function TBoard.GetModel: CModel;
begin
  if Assigned(View) then
    Result := View.Model
  else
    Result := nil;
end;

//------------------------------------------------------------------------------
//                           Procedure SetModel
//------------------------------------------------------------------------------

procedure TBoard.SetModel(const Value: CModel);
begin
  if Assigned(View) then
    View.Model := Value
  else
    raise Exception.Create(emViewNotAssigned);
end;


//------------------------------------------------------------------------------
//                          Function GetModified
//------------------------------------------------------------------------------

function TBoard.GetModified: Boolean;
begin
  if Assigned(View) then
    Result := View.Modified
  else
    raise Exception.Create(emViewNotAssigned);
end;


//------------------------------------------------------------------------------
//                           Procedure SetModified
//------------------------------------------------------------------------------

procedure TBoard.SetModified(const Value: Boolean);
begin
   if Assigned(View) then
     View.Modified := Value
   else
     raise Exception.Create(emViewNotAssigned);
end;


//------------------------------------------------------------------------------
//                            Procedure FormClose
//------------------------------------------------------------------------------

procedure TBoard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//------------------------------------------------------------------------------
//                              Constructor Create
//------------------------------------------------------------------------------

procedure TBoard.SetView(const Value: TView);
begin
  if Value <> FView then
  begin
    FView := Value;
    ClientHeight := View.Height;
    ClientWidth := View.Width;
    FView.Align := alClient;
    FView.Parent := Self;
  end;
end;

function TBoard.GetOwnerView: TView;
begin
  if Assigned(View) then
    Result := View.OwnerView
  else
    Result := nil;
end;

procedure TBoard.SetOwnerView(const Value: TView);
begin
  if Assigned(View) then
    View.OwnerView := Value
  else
    raise Exception.Create(emViewNotAssigned);
end;

end.
