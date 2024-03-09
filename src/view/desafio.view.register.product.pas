unit desafio.view.register.product;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Mask;

type
  TfrmRegisterProduct = class(TForm)
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel1: TPanel;
    Label2: TLabel;
    Panel7: TPanel;
    Label4: TLabel;
    Panel8: TPanel;
    Label3: TLabel;
    Panel9: TPanel;
    Label5: TLabel;
    pNavProducts: TPanel;
    dbNavProducts: TDBNavigator;
    dbedPurchasePrice: TDBEdit;
    dbedSalePrice: TDBEdit;
    dbedQuantity: TDBEdit;
    dbedCategory: TDBEdit;
    edDescription: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure dbNavProductsClick(Sender: TObject; Button: TNavigateBtn);
    procedure dbedDescriptionExit(Sender: TObject);
    procedure edDescriptionChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegisterProduct: TfrmRegisterProduct;

implementation

uses
  desafio.model.interfaces.products, desafio.model.implements.products,
  Data.DB;

var
  lProducts : iProducts;

{$R *.dfm}

procedure TfrmRegisterProduct.dbedDescriptionExit(Sender: TObject);
begin
  if dbNavProducts.DataSource.State in [DsBrowse] then
  begin
    edDescription.Text := lProducts.getDescription;
  end
end;

procedure TfrmRegisterProduct.dbNavProductsClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button in [nbInsert] then
  begin
    edDescription.Text := '';
  end
  else if Button in [nbCancel] then
  begin
    edDescription.Text := lProducts.getDescription;
  end
  else if Button in [nbFirst, nbPrior, nbNext, nbLast] then
  begin
    lProducts.fillObject;
    edDescription.Text := lProducts.getDescription;
  end
  else if Button in [nbPost] then
  begin

    lProducts.result.Edit;
    lProducts.result.FieldByName('description').AsString := edDescription.Text;
    lProducts.result.Post;
    lProducts.fillObject;
  end;


end;

procedure TfrmRegisterProduct.edDescriptionChange(Sender: TObject);
begin
  lProducts.dataSource.Edit;
end;

procedure TfrmRegisterProduct.FormCreate(Sender: TObject);
begin

  lProducts := TProducts.New  ;

  lProducts.listAllProducts ;

  dbNavProducts.DataSource := lProducts.dataSource;
  dbedPurchasePrice.DataSource :=  lProducts.dataSource;
  dbedSalePrice.DataSource := lProducts.dataSource;
  dbedQuantity.DataSource := lProducts.dataSource;
  dbedCategory.DataSource := lProducts.dataSource;

  dbedPurchasePrice.DataField :=  'purchase_price';
  dbedSalePrice.DataField := 'sale_price';
  dbedQuantity.DataField := 'quantity_stock';
  dbedCategory.DataField := 'category';

  edDescription.Text := lProducts.getDescription;
end;

end.
