unit uViewCustomerBrief;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uView, StdCtrls, ExtCtrls, uGUIEdit;

type
  TvCustomerPreview = class(TView)
    Panel3: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    eName: TGUIEdit;
    eSurname: TGUIEdit;
    eCode: TGUIEdit;
    Panel4: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  vCustomerPreview: TvCustomerPreview;

implementation

{$R *.DFM}


end.
