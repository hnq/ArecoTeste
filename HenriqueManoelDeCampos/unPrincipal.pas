unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, unFrmConsultaProdutos;

type
  TfrmPrincipal = class(TForm)
    btnProdutos: TSpeedButton;
    procedure btnProdutosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnProdutosClick(Sender: TObject);
var
  oFrmProdutosConsulta: TFrmProdutosConsulta;
begin
  try
    Application.CreateForm(TFrmProdutosConsulta, oFrmProdutosConsulta);
    oFrmProdutosConsulta.ShowModal;
  finally
    FreeAndNil(oFrmProdutosConsulta);
  end;
end;

end.
