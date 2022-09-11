import 'dart:convert';
import 'dart:io';

import 'package:inventory_management_app/Models/IncomingShipment.dart';
import 'package:inventory_management_app/Models/Inventory.dart';
import 'package:inventory_management_app/Models/OutGoingShipment.dart';
import 'package:inventory_management_app/Models/Product.dart';
import 'package:inventory_management_app/Models/Supplier.dart';

HttpClient client = HttpClient();

var ip = "https://10.0.2.2:7138/api";

//==============================================================================
//                          Products
//==============================================================================

List<Product> listAllProducts = [];

Future getAllProducts() async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request = await client.getUrl(Uri.parse("$ip/Products"));
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listAllProducts.isNotEmpty) {
      listAllProducts.clear();
    }
    for (var i in jsonData) {
      listAllProducts.add(
        new Product(
          i['productID'],
          i['productName'],
          i['sku'],
          i['cost'],
          i['description'],
        ),
      );
    }
  }
}

List<String> menuList = [];

Future getMenuProducts() async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request = await client.getUrl(Uri.parse("$ip/Products"));
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    menuList.add("Select Product");
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (menuList.isNotEmpty) {
      menuList.clear();
      menuList.add("Select Product");
    }
    for (var i in jsonData) {
      menuList.add(
        i['productName'],
      );
    }
  }
  print(menuList);
}

List<Product> listSpecificProduct = [];

Future getSpecificProduct(int id) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request =
      await client.getUrl(Uri.parse("$ip/Products/$id"));
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    Map<String, dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listSpecificProduct.isNotEmpty) {
      listSpecificProduct.clear();
    }
    listSpecificProduct.add(
      new Product(
        jsonData['productID'],
        jsonData['productName'],
        jsonData['sku'],
        jsonData['cost'],
        jsonData['description'],
      ),
    );
  }
}

Future postProduct(int productID, String productName, String sku, double cost,
    String description) async {
  Map<String, dynamic> map = {
    "productID": "${productID}",
    "productName": "${productName}",
    "sku": "${sku}",
    "cost": "${cost}",
    "description": "${description}",
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request = await client.postUrl(Uri.parse("$ip/Products"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
}

Future updateProduct(int productID, String productName, String sku, double cost,
    String description) async {
  Map<String, dynamic> map = {
    "productID": "${productID}",
    "productName": "${productName}",
    "sku": "${sku}",
    "cost": "${cost}",
    "description": "${description}",
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request =
      await client.putUrl(Uri.parse("$ip/Products/$productID"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
}

Future deleteProduct(int productID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.deleteUrl(Uri.parse("$ip/Products/$productID"));
  HttpClientResponse result = await request.close();
}

//==============================================================================
//                          Suppliers
//==============================================================================

List<Supplier> listAllSuppliers = [];

Future getAllSuppliers() async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request = await client.getUrl(Uri.parse("$ip/Suppliers"));
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listAllSuppliers.isNotEmpty) {
      listAllSuppliers.clear();
    }
    for (var i in jsonData) {
      listAllSuppliers.add(
        new Supplier(
          i['supplierID'],
          i['supplierName'],
          i['supplierContact'],
          i['supplierAddress'],
        ),
      );
    }
  }
  print(listAllSuppliers);
}

List<String> suppList = [];

Future getMenuSuppliers() async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request = await client.getUrl(Uri.parse("$ip/Suppliers"));
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    suppList.add("Select Supplier");
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (suppList.isNotEmpty) {
      suppList.clear();
      suppList.add("Select Supplier");
    }
    for (var i in jsonData) {
      suppList.add(
        i['supplierName'],
      );
    }
  }
  print(suppList);
}

List<Supplier> listSpecificSupplier = [];

Future getSpecificSuppliers(int supplierID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request =
      await client.getUrl(Uri.parse("$ip/Suppliers/$supplierID"));
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    Map<String, dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listSpecificSupplier.isNotEmpty) {
      listSpecificSupplier.clear();
    }
    listSpecificSupplier.add(
      new Supplier(
        jsonData['supplierID'],
        jsonData['supplierName'],
        jsonData['supplierContact'],
        jsonData['supplierAddress'],
      ),
    );
  }
  print(listSpecificSupplier);
}

Future postSupplier(int SupplierID, String SupplierName, int SupplierContact,
    String SupplierAddress) async {
  Map<String, dynamic> map = {
    "supplierID": "${SupplierID}",
    "supplierName": "${SupplierName}",
    "supplierContact": "${SupplierContact}",
    "supplierAddress": "${SupplierAddress}",
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request = await client.postUrl(Uri.parse("$ip/Suppliers"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
}

Future updateSupplier(int SupplierID, String SupplierName, int SupplierContact,
    String SupplierAddress) async {
  Map<String, dynamic> map = {
    "supplierID": "${SupplierID}",
    "supplierName": "${SupplierName}",
    "supplierContact": "${SupplierContact}",
    "supplierAddress": "${SupplierAddress}",
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request =
      await client.putUrl(Uri.parse("$ip/Suppliers/$SupplierID"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
}

Future deleteSupplier(int supplierID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.deleteUrl(Uri.parse("$ip/Suppliers/$supplierID"));
  HttpClientResponse result = await request.close();
}

//==============================================================================
//                          Inventory
//==============================================================================

List<Inventory> listAllInventory = [];

Future getAllInventory() async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request = await client.getUrl(Uri.parse("$ip/Inventories"));
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listAllInventory.isNotEmpty) {
      listAllInventory.clear();
    }
    for (var i in jsonData) {
      listAllInventory.add(
        new Inventory(
          i['inventoryID'],
          listAllProducts
              .firstWhere((prod) => prod.ProductID == i['productID']),
          i['quantity'],
        ),
      );
    }
  }
}

List<Inventory> listSpecificInventory = [];

Future getSpecificInventory(int inventoryID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request =
      await client.getUrl(Uri.parse("$ip/Inventories/$inventoryID"));
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    Map<String, dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listSpecificInventory.isNotEmpty) {
      listSpecificInventory.clear();
    }

    listSpecificInventory.add(
      new Inventory(
        jsonData['inventoryID'],
        listAllProducts
            .firstWhere((prod) => prod.ProductID == jsonData['productID']),
        jsonData['quantity'],
      ),
    );
  }
  print(listSpecificInventory);
}

Future postInventory(
  int InventoryID,
  int ProductID,
  int Quantity,
) async {
  Map<String, dynamic> map = {
    "inventoryID": "${InventoryID}",
    "productID": "${ProductID}",
    "quantity": "${Quantity}",
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request =
      await client.postUrl(Uri.parse("$ip/Inventories"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
}

Future updateInventory(
  int InventoryID,
  int ProductID,
  int Quantity,
) async {
  Map<String, dynamic> map = {
    "inventoryID": "${InventoryID}",
    "productID": "${ProductID}",
    "quantity": "${Quantity}",
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request =
      await client.putUrl(Uri.parse("$ip/Inventories/$InventoryID"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
}

Future deleteInventory(int inventoryID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.deleteUrl(Uri.parse("$ip/Inventories/$inventoryID"));
  HttpClientResponse result = await request.close();
}

//==============================================================================
//                          IncomingShipments
//==============================================================================

List<IncomingShipment> listAllIncomingShipments = [];

Future getAllIncomingShipments() async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request =
      await client.getUrl(Uri.parse("$ip/IncomingShipments"));
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listAllIncomingShipments.isNotEmpty) {
      listAllIncomingShipments.clear();
    }
    for (var i in jsonData) {
      listAllIncomingShipments.add(
        new IncomingShipment(
          i['incomingShipmentID'],
          listAllProducts
              .firstWhere((prod) => prod.ProductID == i['productID']),
          i['quantity'],
          i['totalCost'],
          i['supplierID'],
          i['dateRecieved'],
          i['orderNumber'],
        ),
      );
    }
  }
}

List<IncomingShipment> listSpecificIncomingShipment = [];

Future getSpecificIncomingShipments(int IncomingShipmentID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request = await client
      .getUrl(Uri.parse("$ip/IncomingShipments/$IncomingShipmentID"));
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    Map<String, dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listSpecificIncomingShipment.isNotEmpty) {
      listSpecificIncomingShipment.clear();
    }
    listSpecificIncomingShipment.add(
      new IncomingShipment(
        jsonData['incomingShipmentID'],
        listAllProducts
            .firstWhere((prod) => prod.ProductID == jsonData['productID']),
        jsonData['quantity'],
        jsonData['totalCost'],
        jsonData['supplierID'],
        jsonData['shipmentDate'].toString(),
        jsonData['orderNumber'],
      ),
    );
  }
  print(listSpecificIncomingShipment);
}

Future postIncomingShipment(int IncomingShipmentID, int ProductID, int Quantity,
    double TotalCost, int SupplierID, String date, String orderNumber) async {
  Map<String, dynamic> map = {
    "incomingShipmentID": "${IncomingShipmentID}",
    "productID": "${ProductID}",
    "quantity": "${Quantity}",
    "totalCost": "${TotalCost}",
    "supplierID": "${SupplierID}",
    "dateRecieved": "${date}",
    "orderNumber": "${orderNumber}",
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request =
      await client.postUrl(Uri.parse("$ip/IncomingShipments"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future updateIncomingShipment(
    int IncomingShipmentID,
    int ProductID,
    int Quantity,
    double TotalCost,
    int SupplierID,
    DateTime date,
    String orderNumber) async {
  Map<String, dynamic> map = {
    "incomingShipmentID": "${IncomingShipmentID}",
    "productID": "${ProductID}",
    "quantity": "${Quantity}",
    "totalCost": "${TotalCost}",
    "supplierID": "${SupplierID}",
    "dateRecieved": "${date}",
    "orderNumber": "${orderNumber}",
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request = await client
      .putUrl(Uri.parse("$ip/IncomingShipments/$IncomingShipmentID"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future deleteIncomingShipment(int incomingShipmentsID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request = await client
      .deleteUrl(Uri.parse("$ip/IncomingShipments/$incomingShipmentsID"));
  HttpClientResponse result = await request.close();
}

//==============================================================================
//                          OutGoingShipments
//==============================================================================

List<OutGoingShipment> listAllOutGoingShipments = [];

Future getAllOutGoingShipments() async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request =
      await client.getUrl(Uri.parse("$ip/OutGoingShipments"));
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listAllOutGoingShipments.isNotEmpty) {
      listAllOutGoingShipments.clear();
    }
    for (var i in jsonData) {
      listAllOutGoingShipments.add(
        new OutGoingShipment(
          i['outGoingShipmentID'],
          listAllProducts
              .firstWhere((prod) => prod.ProductID == i['productID']),
          i['quantity'],
          i['totalCost'],
          i['shipmentDate'],
        ),
      );
    }
  }
  print(listAllOutGoingShipments);
}

Future postOutgoingShipment(int OutGoingShipmentID, int ProductID, int quantity,
    double totalCost, String date) async {
  Map<String, dynamic> map = {
    "outGoingShipmentID": "${OutGoingShipmentID}",
    "productID": "${ProductID}",
    "quantity": "${quantity}",
    "totalCost": "${totalCost}",
    "shipmentDate": "${date}",
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request =
      await client.postUrl(Uri.parse("$ip/OutGoingShipments"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}
