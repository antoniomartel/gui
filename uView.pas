unit uView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uObserver,

  StdCtrls,
  uModel;

type

  TViewClass = class of TView;

  TView = class(TObserver)
  private
    { Private declarations }
    FModel: CModel;
    FModified: Boolean;
    FClassRef: CModelClass;
    FOwnerView: TView;

    function GetModel: CModel;
    procedure SetModel(const Value: CModel);
    function GetModified: Boolean;
    procedure SetModified(const Value: Boolean);
  protected
    { Protected declarations }
    procedure OnModelAssigned; virtual;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure UpdateView; override;
    procedure UpdateModel; virtual;

    property Model: CModel read GetModel write SetModel;
    property Modified: Boolean read GetModified write SetModified default False;

    property ClassRef: CModelClass read FClassRef write FClassRef;

    property OwnerView: TView read FOwnerView write FOwnerView;
  end;

var
  View: TView;

implementation

uses
  TypInfo, uGUIEdit;

{$R *.DFM}

//------------------------------------------------------------------------------
//                              Constructor Create
//------------------------------------------------------------------------------

constructor TView.Create(AOwner: TComponent);
begin
  inherited;
  FModified := False;
end;

//------------------------------------------------------------------------------
//                            Procedure UpdateView
//------------------------------------------------------------------------------

procedure TView.UpdateView;
var
  i: Integer;
  PropList: TPropList;

begin
  if Assigned(Model) then
  begin
    GetPropList(Model.ClassInfo, tkProperties, @PropList);

    // Get property value and set it in controls
    for i := 0 to ComponentCount - 1 do
      if Components[i] is TGUIEdit then
        TGUIEdit(Components[i]).Text := GetPropValue(Model, TGUIEdit(Components[i]).PropertyName);

    // Update views included in this one
    for i := 0 to ControlCount - 1 do
      if Controls[i] is TView then
        TView(Controls[i]).UpdateView;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TEdit then
        TEdit(Components[i]).Modified := False;
  end;
end;


//------------------------------------------------------------------------------
//                             Procedure UpdateModel
//------------------------------------------------------------------------------

procedure TView.UpdateModel;
var
  i: Integer;

begin
  // Update model of views included in this one
  for i := 0 to ControlCount - 1 do
    if Controls[i] is TView then
      TView(Controls[i]).UpdateModel;

  // Set model property values from controls
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TGUIEdit then
      SetPropValue(Model, TGUIEdit(Components[i]).PropertyName, TGUIEdit(Components[i]).Text);
end;

//------------------------------------------------------------------------------
//                            Function GetModel
//------------------------------------------------------------------------------

function TView.GetModel: CModel;
begin
  Result := FModel;
end;

//------------------------------------------------------------------------------
//                            Procedure SetModel
//------------------------------------------------------------------------------

procedure TView.SetModel(const Value: CModel);
begin
  if Value <> FModel then
  begin
    if FModel <> nil then
      FModel.UnRegisterObserver(Self);
    FModel := Value;
    OnModelAssigned;
    FModel.RegisterObserver(Self);
    FClassRef := CModelClass(FModel.ClassType);
    UpdateView;
  end;
end;

//------------------------------------------------------------------------------
//                             Function GetModified
//------------------------------------------------------------------------------

function TView.GetModified: Boolean;
var
  i: Integer;

begin
  Result := False;
  i := 0;
  while (i < ComponentCount) and (Result = False) do
  begin
    if (Components[i] is TEdit) then
      Result := TEdit(Components[i]).Modified
    else
    if (Components[i] is TView) then
      Result := TView(Components[i]).Modified;

    i := i + 1;
  end;
end;

//------------------------------------------------------------------------------
//                            Procedure SetModified
//------------------------------------------------------------------------------

procedure TView.SetModified(const Value: Boolean);
begin
  if Value <> FModified then
    FModified := Value;
end;

//------------------------------------------------------------------------------
//                          Procedure OnModelAssigned
//------------------------------------------------------------------------------

procedure TView.OnModelAssigned;
begin
  // Do nothing
end;


end.
