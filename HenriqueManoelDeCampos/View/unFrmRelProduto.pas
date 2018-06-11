unit unFrmRelProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, QRCtrls,
  QuickRpt, Vcl.ExtCtrls, Data.Win.ADODB;

type
  TfrmRelProdutos = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    qryProdutos: TADOQuery;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProdutos: TfrmRelProdutos;

implementation

{$R *.dfm}

end.
