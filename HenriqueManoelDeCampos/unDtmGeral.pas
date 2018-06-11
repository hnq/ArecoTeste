unit unDtmGeral;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDTMGERAL = class(TDataModule)
    ADOQuery1: TADOQuery;
    ADOTable1: TADOTable;
    ADOGERAL: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DTMGERAL: TDTMGERAL;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
