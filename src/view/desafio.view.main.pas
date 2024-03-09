unit desafio.view.main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBNavOrders: TDBNavigator;
    Panel5: TPanel;
    Label4: TLabel;
    dbeQuantity: TDBEdit;
    Panel4: TPanel;
    DBGOrders: TDBGrid;
    Panel6: TPanel;
    Panel7: TPanel;
    Label2: TLabel;
    Panel8: TPanel;
    lbProductValue: TLabel;
    btAddProduct: TButton;
    dbcbProducts: TComboBox;
    cbTypeMaintenance: TComboBox;
    Panel9: TPanel;
    lbTotalOrder: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btAddProductClick(Sender: TObject);
    procedure DBNavOrdersClick(Sender: TObject; Button: TNavigateBtn);
    procedure dbcbProductsChange(Sender: TObject);
    procedure dbeQuantityExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    function userValidation(aEmail, aPassword: String): Boolean;
    procedure fillComboProducts;
    procedure setRowComboProduct(idProduct: Integer);

    function priceSetProduct(idProduct : integer) : Currency;
    procedure updateValuesInScreen();
  end;

var
  frmMain: TfrmMain;

implementation

uses desafio.view.login, desafio.model.interfaces.user, desafio.model.implements.user,
     desafio.model.interfaces.orders, desafio.model.implements.orders,
     desafio.model.interfaces.products, desafio.model.implements.products,
     desafio.view.register.product;

var
  lUser : iUser;
  lOrders : iOrders;
  lProducts : iProducts;


{$R *.dfm}

procedure TfrmMain.btAddProductClick(Sender: TObject);
  var
    lRegisterProduct: TfrmRegisterProduct;
begin
  lRegisterProduct := TfrmRegisterProduct.create(nil);

  try

    lRegisterProduct.ShowModal;

    DBcbProducts.Items.Clear;
    DBcbProducts.Items.Delimiter := ';';
    DBcbProducts.Items.StrictDelimiter := true;
    DBcbProducts.Items.DelimitedText := lProducts.strlistAllProducts;

  finally
    lRegisterProduct.Free;
  end;

end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  lLogin: TfrmLogin;
  loginProcess : boolean;
begin
  lLogin := TfrmLogin.create(nil);
  try

    loginProcess := true;

    while loginProcess do
    begin

      lLogin.ShowModal;

      try
        if not (lLogin.ModalResult = mrOk) then
        begin
          loginProcess := false;
          Application.Terminate;
        end
        else if userValidation(lLogin.edEmail.Text, lLogin.edPassword.Text) then
        begin
          loginProcess := false;
        end
        else
          showmessage('Usuario não autenticado');
      except
        showmessage('Houve um erro, verifique os arquivos de configuração.');
        Application.Terminate;
      end;
    end;

    if Assigned(lUser) then
    begin
      if lUser.getId>0 then
      begin

        lOrders := TOrders.new;
        lProducts := TProducts.new;

        lProducts.listAllProducts;

        lOrders.listAllOrders;

        DBNavOrders.DataSource := lOrders.dataSource;

        cbTypeMaintenance.items.clear;
        cbTypeMaintenance.items.Delimiter:= ';';
        cbTypeMaintenance.items.StrictDelimiter := true;
        cbTypeMaintenance.Items.DelimitedText := 'Entrada;Saída';

        fillComboProducts;

        DBGOrders.DataSource := lOrders.viewShowData;

        DBGOrders.Columns[0].FieldName := 'id';
        DBGOrders.Columns[1].FieldName := 'description';
        DBGOrders.Columns[2].FieldName := 'sale_price';
        DBGOrders.Columns[3].FieldName := 'quantity';
        DBGOrders.Columns[4].FieldName := 'total_value';
        DBGOrders.Columns[5].FieldName := 'type_maintenance';

        DBGOrders.ReadOnly := true;

        dbeQuantity.DataField := 'quantity';
        dbeQuantity.DataSource := lOrders.dataSource;

        cbTypeMaintenance.ItemIndex := lOrders.getTypeMainTenance;

        setRowComboProduct(lOrders.getProduct);

        updateValuesInScreen();

      end;
    end;

  finally
    lLogin.Free;
  end;

end;

procedure TfrmMain.setRowComboProduct(idProduct: Integer);
  var
    lProductInCombo : iProducts;
    idToFind : String;
    idFound : Integer;
begin
  lProductInCombo := TProducts.New;
  lProductInCombo.searchProducts(idProduct) ;

  if lProductInCombo.getId > 0 then
  begin
    idToFind := formatFloat('00000',lProductInCombo.getId);

    idToFind := idToFind + '=' +lProductInCombo.getDescription;
    idFound := DBcbProducts.Items.IndexOf(idToFind);
    DBcbProducts.ItemIndex := idFound ;
    lbProductValue.Caption := 'R$ '+formatfloat('#,###0.00',lProductInCombo.getPriceSell);
  end;

end;

procedure TfrmMain.dbcbProductsChange(Sender: TObject);
begin
  updateValuesInScreen();
end;

procedure TfrmMain.dbeQuantityExit(Sender: TObject);
begin
  updateValuesInScreen();
end;

procedure TfrmMain.updateValuesInScreen();
  var
    iIdProduct : Integer;
    lQuantity : Double;
    lpriceSetProduct : Currency;
begin

  lQuantity := 0;

  iIdProduct := strToIntDef(copy(dbcbProducts.Text,0,5),0);

  lpriceSetProduct := priceSetProduct(iIdProduct) ;

  lQuantity := strToFloatDef(trim(dbeQuantity.Text),0) ;

  if lQuantity>0 then
    lbTotalOrder.caption := 'Total: R$ '+ formatFloat('#,###,##0.00',lpriceSetProduct * lQuantity);

  lbProductValue.Caption := 'R$ '+formatFloat('#,###,##0.00',lpriceSetProduct);
end;

function TfrmMain.priceSetProduct(idProduct : integer) : Currency;
  var
    lProductRefreshPrice : iProducts;
begin
  lProductRefreshPrice := TProducts.New;

  lProductRefreshPrice.searchProducts(idProduct);

  result := lProductRefreshPrice.getPriceSell;
end;


procedure TfrmMain.DBNavOrdersClick(Sender: TObject; Button: TNavigateBtn);
begin
  if Button in [nbInsert] then
  begin
    cbTypeMaintenance.ItemIndex := -1;
    dbcbProducts.ItemIndex := -1;
    lbProductValue.Caption := 'R$ 0,00';
    lbTotalOrder.Caption := 'Total: R$ 0,00';
  end
  else if Button in [nbCancel] then
  begin
    setRowComboProduct(lOrders.getProduct);
    updateValuesInScreen;
  end
  else if Button in [nbFirst, nbPrior, nbNext, nbLast] then
  begin
    lOrders.fillObject;
    cbTypeMaintenance.ItemIndex := lOrders.getTypeMainTenance-1;
    setRowComboProduct(lOrders.getProduct);
    updateValuesInScreen;
  end
  else if Button in [nbPost] then
  begin
    lOrders.result.Edit;
    lOrders.result.FieldByName('type_maintenance').AsInteger := cbTypeMaintenance.ItemIndex+1;
    lOrders.result.FieldByName('product').AsInteger := StrToIntDef(copy(dbcbProducts.Text, 0, 5),0);
    lOrders.result.FieldByName('total_value').AsCurrency := priceSetProduct(StrToIntDef(copy(dbcbProducts.Text, 0, 5),0))*strtointdef(DBEQUANTITY.Text,0);
    lOrders.result.Post;
    lOrders.fillObject;
    DBGOrders.DataSource := lOrders.viewShowData;
  end;

end;

procedure TfrmMain.fillComboProducts;
begin
  DBcbProducts.Items.Clear;
  DBcbProducts.Items.Delimiter := ';';
  DBcbProducts.Items.StrictDelimiter := true;
  DBcbProducts.Items.DelimitedText := lProducts.strlistAllProducts;
end;

function TfrmMain.userValidation(aEmail, aPassword: String): Boolean;
begin
  lUser := TUser.new;

  lUser := lUser.LoginUser(aEmail, aPassword);

  if not Assigned(lUser) then
    Result := False
  else
    Result := not lUser.getId.ToString.IsEmpty;
end;

end.
