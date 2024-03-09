unit desafio.model.implements.products;

interface

uses
  desafio.model.interfaces.products, desafio.model.interfaces.connection,
  desafio.model.implements.connection, Data.DB, System.Classes;

type
  TProducts = class(TInterfacedObject, iProducts)
    private
      conn : iConnection;

      FId : integer;
      FDescription : String;
      FPriceSell : Currency;
      FStorage : Integer;
      FCategory: integer;
      FPurchasePrice: Currency;

      function dataSource : TDataSource;
      function result : TDataSet;

      function searchProducts(aValue : integer) : iProducts;

      function getId : Integer;
      function getDescription : String;
      function getPriceSell : Currency;
      function getPurchasePrice : Currency;

      function getStorage : Double;
      function getCategory : Integer;

      procedure setId(aValue : Integer);
      procedure setDescription(aValue : String);
      procedure setPriceSell(aValue : Currency);
      procedure setPurchasePrice(aValue : Currency);
      procedure setStorage(aValue : integer);
      procedure setCategory(aValue : Integer);

      function listAllProducts: iProducts;

      function fillObject : iProducts;

      function edit(product : iProducts) : iProducts;

      function existProductById(aValue: integer): boolean;

      function strlistAllProducts: string;

    public

      constructor Create;
      destructor Destroy; override;
      class function New : iProducts;

  end;

implementation

uses
  System.SysUtils;

{ TProducts }

constructor TProducts.Create;
begin
  conn := TConnection.New;
end;

function TProducts.dataSource: TDataSource;
begin
  Result := conn.datasource;
end;

destructor TProducts.Destroy;
begin
  //pass
  inherited;
end;

function TProducts.edit(product: iProducts): iProducts;
begin
  if existProductById(product.getId) then
  begin
    conn.sql('update  users set '+
             'description=:description, purchase_price=:purchase_price, '+
              'sale_price=:sale_price, quantity_stock=:quantity_stock '+
              'where id=:id '
               )
        .params('id', product.getId)
        .params('description', product.getDescription)
        .params('purchase_price', product.getPurchasePrice)
        .params('sale_price', product.getPriceSell)
        .params('quantity_stock', product.getStorage)
        .exec;

    searchProducts(product.getId);
  end;

  result := self;
end;

function TProducts.getCategory: Integer;
begin
  Result := FCategory;
end;

function TProducts.getDescription: String;
begin
  Result := FDescription;
end;

function TProducts.getId: Integer;
begin
  Result := FId;
end;

function TProducts.getPriceSell: Currency;
begin
  Result := FPriceSell;
end;

function TProducts.getPurchasePrice: Currency;
begin
  Result := FPurchasePrice;
end;

function TProducts.getStorage: Double;
begin
  Result := FStorage;
end;

class function TProducts.New: iProducts;
begin
  result := self.Create;
end;

function TProducts.result: TDataSet;
begin
  result := conn.result;
end;

function TProducts.searchProducts(aValue: integer): iProducts;
begin
  conn.sql('select id, description, purchase_price, sale_price, quantity_stock, category from products where id=:id')
      .params('id', aValue)
      .open;

  if conn.result.RecordCount > 0 then
  begin
    fillObject;
  end;
end;

function TProducts.existProductById(aValue: integer): boolean;
begin
  conn.sql('select id, description, purchase_price, sale_price, quantity_stock, category from products where id=:id')
      .params('id', aValue)
      .open;

  result := (conn.result.RecordCount > 0) ;
end;

function TProducts.fillObject : iProducts;
begin
    FId          := conn.result.FieldByName('id').AsInteger;
    FDescription := conn.result.FieldByName('description').AsString;
    FPriceSell   := conn.result.FieldByName('sale_price').AsCurrency;
    FStorage     := conn.result.FieldByName('quantity_stock').AsInteger;
    FCategory    := conn.result.FieldByName('category').AsInteger;
end;

procedure TProducts.setCategory(aValue: Integer);
begin
  FCategory := aValue;
end;

procedure TProducts.setDescription(aValue: String);
begin
  FDescription := aValue;
end;

procedure TProducts.setId(aValue: Integer);
begin
  FId := aValue;
end;

procedure TProducts.setPriceSell(aValue: Currency);
begin
  FPriceSell := aValue;
end;

procedure TProducts.setPurchasePrice(aValue: Currency);
begin
  FPurchasePrice := aValue;
end;

procedure TProducts.setStorage(aValue: integer);
begin
  FStorage := aValue;
end;

function TProducts.strlistAllProducts: String;
  var
    lConn  : IConnection;
    sProducts : String;
begin
  lConn := TConnection.New;


  lConn.sql('select id, description, purchase_price, sale_price, quantity_stock, category ' +
           'from products')
      .open;


  if lConn.result.RecordCount>0 then
  begin
    sProducts := '';
    lConn.result.First;
    while not lConn.result.Eof do
    begin
      if trim(sProducts) <> '' then
        sProducts := sProducts + ';';

      sProducts := sProducts + formatFloat('00000',lConn.result.fieldByName('id').AsInteger)+
                          '='+ lConn.result.fieldByName('description').AsString;
      lConn.result.Next;
    end;

    result :=  sProducts;
  end;
end;

function TProducts.listAllProducts: iProducts;
begin
  conn.sql('select id, description, purchase_price, sale_price, quantity_stock, category ' +
           'from products')
      .open;

  if conn.result.RecordCount>0 then
    fillObject;

  result := self;
end;

end.

