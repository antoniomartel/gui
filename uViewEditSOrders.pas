unit uViewEditSOrders;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBTables, uObserver, uView,
  uViewCustomerBrief, uActions, ActnList, ImgList, Buttons,
  uViewEdit, uGUIEdit;

type
  TvEditSOrders = class(TvEdit)
    eCode: TGUIEdit;
    eDate: TGUIEdit;
    eDeliveryDate: TGUIEdit;
    eTotal: TGUIEdit;
    ePayment: TGUIEdit;
    eItemsNo: TGUIEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    vCustomerPreview: TvCustomerPreview;
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure OnModelAssigned; override;
  public
    { Public declarations }
  end;

var
  vEditSOrders: TvEditSOrders;

implementation

{$R *.DFM}

uses
  uSOrder;

{ TvEditSOrders }


//------------------------------------------------------------------------------
//                           Procedure OnModelAssigned
//------------------------------------------------------------------------------

procedure TvEditSOrders.OnModelAssigned;
begin
  inherited;
  // Assigned model to self-contained view
  vCustomerPreview.Model := CSOrder(Model).Customer;
end;

end.
