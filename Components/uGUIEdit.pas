unit uGUIEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TGUIEdit = class(TEdit)
  private
    { Private declarations }

    FPropertyName: string;
    procedure SetPropertyName(const Value: string);
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }

    property PropertyName: string read FPropertyName write SetPropertyName;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('New components', [TGUIEdit]);
end;

{ TGUIEdit }

procedure TGUIEdit.SetPropertyName(const Value: string);
begin
  if Text = FPropertyName then
    Text := Value;
  FPropertyName := Value;
end;

end.
