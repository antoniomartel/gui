program GUI;

uses
  Forms,
  uBoard in 'uBoard.pas' {Board},
  uInterfaces in 'uInterfaces.pas',
  uObservable in 'uObservable.pas',
  uBoardMain in 'uBoardMain.pas' {MainBoard},
  uViewEdit in 'uViewEdit.pas' {vEdit: TFrame},
  uViewSOrders in 'uViewSOrders.pas' {vSOrders: TFrame},
  uCustomer in 'uCustomer.pas',
  uSOrder in 'uSOrder.pas',
  uModel in 'uModel.pas',
  uViewEditSOrders in 'uViewEditSOrders.pas' {vEditSOrders: TFrame},
  uViewEditCustomers in 'uViewEditCustomers.pas' {vEditCustomers: TFrame},
  uViewList in 'uViewList.pas' {vList: TFrame},
  uView in 'uView.pas' {View: TFrame},
  uObserver in 'uObserver.pas' {Observer: TFrame},
  uMML in 'uMML.pas',
  uProvider in 'uProvider.pas',
  uViewCustomerBrief in 'uViewCustomerBrief.pas' {vCustomerPreview: TFrame},
  uViewCustomers in 'uViewCustomers.pas' {vCustomers: TFrame};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainBoard, MainBoard);
  Application.Run;
end.
