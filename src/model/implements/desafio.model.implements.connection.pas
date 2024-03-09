unit desafio.model.implements.connection;

interface

uses
  desafio.model.interfaces.connection, desafio.model.dao.connection,
  FireDAC.Comp.Client, Data.DB, inifiles;

type
  TConnection = class(TInterfacedObject, iConnection)
    private
      dm : TDMConnection;
      FQuery : TFDQuery;
      FDataSource : TDataSource;
    public

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

      constructor Create;
      destructor Destroy; override;
      class function New : iConnection;
  end;

implementation

uses
  System.SysUtils, Vcl.Forms;

{ TConnection }

function TConnection.cancel: iConnection;
begin
  FQuery.Cancel;
  Result := Self;
end;

function TConnection.close: iConnection;
begin
  FQuery.Close;
  Result := Self;
end;

constructor TConnection.Create;
  var
    iniConf : TIniFile;
    vServer, vPath: String;
begin

  iniConf := TIniFile.Create(ExtractFilePath(Application.exeName)+'config.ini');
  try
    vPath := iniConf.ReadString('base', 'path', '');
  finally
    iniConf.Free;
  end;

  dm := TDMConnection.Create(nil);

  dm.FDConnection1.Params.Add('Database='+vPath) ;

  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := dm.FDConnection1;

  FDataSource := TDataSource.Create(nil);
  FDataSource.DataSet :=  FQuery;


end;

function TConnection.datasource: TDataSource;
begin
  Result := FDataSource;
end;

destructor TConnection.Destroy;
begin
  FDataSource.Free;
  FQuery.Free;
  dm.Free;

  inherited;
end;

function TConnection.exec: iConnection;
begin
  FQuery.ExecSQL;
  Result := Self;
end;

function TConnection.insert: iConnection;
begin
  FQuery.Insert;
end;

class function TConnection.New: iConnection;
begin
  Result := self.Create;
end;

function TConnection.open: iConnection;
begin
  FQuery.Open;
  Result := Self;
end;

function TConnection.params(aParams: String; aValue: Integer): iConnection;
begin
  FQuery.ParamByName(aParams).AsInteger := aValue;
  Result := self;
end;

function TConnection.params(aParams: String; aValue: String): iConnection;
begin
  FQuery.ParamByName(aParams).AsString := aValue;
  Result := self;
end;


function TConnection.params(aParams: String; aValue: Currency): iConnection;
begin
  FQuery.ParamByName(aParams).AsCurrency := aValue;
  Result := self;
end;

function TConnection.post: iConnection;
begin
  FQuery.Post;
  Result := Self;
end;

function TConnection.query: TFDQuery;
begin
 result := FQuery;
end;

function TConnection.result: TDataSet;
begin
  Result := FQuery;
end;

function TConnection.sql(aValue: String): iConnection;
begin
  Fquery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Text := aValue;

  Result := Self;
end;


end.
