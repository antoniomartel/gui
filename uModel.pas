unit uModel;

interface

uses
  uObservable, uObserver, db;

{$M+}

type

  CModelClass = class of CModel;

  CModel = class(CObservable)
  private
    { Private declarations }
    FId: String;
    FCode: String;

  public
    { Public declarations }
    procedure UpdateModel(DataSet: TDataSet); virtual; abstract;

  published
    { Published declarations }
    property Id: String read FId write FId;
    property Code: String read FCode write FCode;
  end;

implementation

end.
 