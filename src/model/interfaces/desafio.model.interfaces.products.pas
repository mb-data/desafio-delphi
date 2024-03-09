unit desafio.model.interfaces.products;

interface

uses
  Data.DB, System.Classes;

type
  iProducts = interface

    function dataSource : TDataSource;
    function result : TDataSet;

    function searchProducts(aValue : integer) : iProducts;
    function listAllProducts: iProducts;
    function fillObject : iProducts;

    function getId   : Integer;
    function getDescription : String;
    function getStorage : Double;
    function getPriceSell : Currency;
    function getPurchasePrice : Currency;
    function getCategory : Integer;

    procedure setId(aValue : Integer) ;
    procedure setDescription(aValue : String) ;
    procedure setStorage(aValue : Integer);
    procedure setPriceSell(aValue : Currency) ;
    procedure setPurchasePrice(aValue : Currency);
    procedure setCategory(aValue : Integer);

    function existProductById(aValue: integer): boolean;
    function strlistAllProducts : string;


  end;


implementation

end.
n

uses
  System.Classes;
