unit desafio.model.interfaces.connection;

interface


uses Data.DB, FireDAC.Comp.Client;

type
  iConnection = interface
      function sql(aValue : String) : iConnection;
      function result : TDataSet;
      function datasource : TDataSource;
      function query : TFDQuery;

      function open : iConnection;
      function close : iConnection;
      function exec : iConnection;
      function params(aParams : String; aValue : Integer) : iConnection; overload;
      function params(aParams : String; aValue : String) : iConnection; overload;
      function params(aParams : String; aValue : Currency) : iConnection; overload;
      function insert : iConnection;
      function cancel : iConnection;
      function post : iConnection;
  end;


implementation

end.
