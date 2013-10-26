unit uViewEditCustomers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBTables, uActions, ActnList, ImgList,
  Buttons, uViewEdit, uGUIEdit;

type
  TvEditCustomers = class(TvEdit)
    eCode: TGUIEdit;
    eName: TGUIEdit;
    eSurname: TGUIEdit;
    eAddress: TGUIEdit;
    ePostalCode: TGUIEdit;
    eCountry: TGUIEdit;
    ePhone: TGUIEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    eDiscount: TGUIEdit;
    eDateCreated: TGUIEdit;
    eFax: TGUIEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  vEditCustomers: TvEditCustomers;

implementation

{$R *.DFM}

{ TvEditCustomers }

end.
