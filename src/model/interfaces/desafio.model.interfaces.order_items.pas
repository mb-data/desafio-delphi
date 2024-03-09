unit desafio.model.interfaces.order_items;

interface

uses
  Data.DB, FireDAC.Comp.Client;

type

  iOrder_items = interface

    function dataSource: TDataSource;

    function searchOrder_items(aValue: Integer): iOrder_items;

    function listOrderDetails(dsMaster: TDataSource;
      masterFields, indexFieldNames: String): iOrder_items;

    function query: TFDQuery;

    function getId: Integer;
    function getIdOrder: Integer;
    function getIdProduct: Integer;
    function getPriceSell: Currency;
    function getQuantity: Integer;

    procedure setId(const Value: Integer);
    procedure setIdOrder(const Value: Integer);
    procedure setIdProduct(const Value: Integer);
    procedure setPriceSell(const Value: Currency);
    procedure setQuantity(const Value: Integer);

  end;


implementation

end.
