unit desafio.model.interfaces.orders;

interface

uses
  Data.DB;

type
  iOrders = interface

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

    function viewShowData: TDataSource;

  end;

implementation

end.
