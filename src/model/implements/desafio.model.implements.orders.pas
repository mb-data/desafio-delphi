unit desafio.model.implements.orders;

interface

uses
  desafio.model.interfaces.orders, desafio.model.interfaces.connection,
  Data.DB, desafio.model.implements.connection;


type
  TOrders = class(TInterfacedObject, iOrders)
    private

       conn : iConnection;
       connView : iConnection;

       FId : Integer;
       FProduct : integer;
       FTotalValue : Currency;
       FTypeMaintenance : Integer;
       FCategory : Integer;

       FDateOrder : TDateTime;

       function insert : iOrders;
       function cancel : iOrders;
       function post(order : iOrders) : iOrders;

       function dataSource : TDataSource;

       function result : TDataSet;

       function searchOrder(aValue : integer) : iOrders;

       function listAllOrders : iOrders;

       function fillObject : iOrders;

       function getId : Integer;
       function getTotalValue : Currency;
       function getDateOrder : TDateTime;
       function getTypeMaintenance : Integer;
       function getProduct : Integer;

       procedure setId(aValue : Integer);
       procedure setTotalValue(aValue : Currency);
       procedure setDateOrder(aValue : TDateTime);

       procedure setTypeMaintenance(aValue : integer);
       procedure setProduct(aValue: Integer);

       function viewShowData() : TDataSource;

    public
      constructor create;
      destructor destroy; override;
      class function new : iOrders;

  end;

implementation

{ TOrders }

function TOrders.cancel: iOrders;
begin
  conn.result.Cancel;
end;

constructor TOrders.create;
begin
  conn := TConnection.New;
end;

function TOrders.dataSource: TDataSource;
begin
  Result := conn.datasource;
end;

destructor TOrders.destroy;
begin
  //pass
  inherited;
end;

function TOrders.fillObject : iOrders;
begin
  FId := conn.result.FieldByName('id').AsInteger;
  FProduct := conn.result.FieldByName('product').AsInteger;
  FTotalValue := conn.result.FieldByName('total_value').AsCurrency;
  FTypeMaintenance := conn.result.FieldByName('type_maintenance').AsInteger;

end;

function TOrders.getTotalValue: Currency;
begin
  Result := FTotalValue;
end;

function TOrders.getDateOrder: TDateTime;
begin
  Result := FDateOrder;
end;

function TOrders.getId: Integer;
begin
  Result := FId;
end;

function TOrders.getProduct: Integer;
begin
  Result := FProduct;
end;

function TOrders.getTypeMaintenance: Integer;
begin
  Result := FTypeMaintenance;
end;

function TOrders.insert: iOrders;
begin
  conn.result.Insert;
  Result := Self;
end;

function TOrders.listAllOrders: iOrders;
begin
  conn.sql('select id, product, quantity, total_value, date_order, type_maintenance '+
            'from orders')
            .open;

  if conn.result.RecordCount > 0 then
  begin
    fillObject;
  end;

  Result := Self;
end;

class function TOrders.new: iOrders;
begin
  Result := self.create;
end;

function TOrders.post(order : iOrders): iOrders;
begin
  conn.result.FieldByName('id').AsInteger := order.getId;
  conn.result.FieldByName('total_value').AsCurrency := order.getTotalValue;
  conn.result.FieldByName('date_order').AsDateTime := order.getDateOrder;

  conn.result.post;
  Result := Self;
end;

function TOrders.result: TDataSet;
begin
  result := conn.result;
end;

function TOrders.searchOrder(aValue: integer): iOrders;
begin
  conn.sql('select id, product, quantity, total_value, date_order '+
                 'from orders where id=:id')
            .params('id', aValue)
            .open;

  if conn.result.RecordCount > 0 then
  begin
    FId := conn.result.FieldByName('id').AsInteger;
    FTotalValue := conn.result.FieldByName('total_value').AsFloat;
    FDateOrder := conn.result.FieldByName('date_order').AsDateTime;
  end;

  Result := Self;
end;

procedure TOrders.setTotalValue(aValue: Currency);
begin
  FTotalValue := aValue;
end;

procedure TOrders.setDateOrder(aValue: TDateTime);
begin
  FDateOrder := aValue;
end;

procedure TOrders.setId(aValue: Integer);
begin
  FId := aValue;
end;

procedure TOrders.setProduct(aValue: Integer);
begin
  FProduct := aValue;
end;

procedure TOrders.setTypeMaintenance(aValue: integer);
begin
  FTypeMaintenance := aValue;
end;

function TOrders.viewShowData: TDataSource;

begin
  connView := TConnection.New;

  connView.sql('select orders.id, trim(products.description) as description, products.sale_price, '+
            'orders.quantity, orders.total_value, case type_maintenance when 1 THEN "Entrada" ELSE "Saida" END as type_maintenance '+
            'from orders inner join products on (orders.product=products.id)')
            .open;
  result := connView.datasource;
end;

end.

