import 'package:inventory_management_app/Models/Product.dart';

class IncomingShipment {
  int IncomingShipmentID;
  Product ISProduct;
  int Quantity;
  double TotalCost;
  int SupplierID;
  String ShipmentDate;
  String OrderNumber;

  IncomingShipment(
    this.IncomingShipmentID,
    this.ISProduct,
    this.Quantity,
    this.TotalCost,
    this.SupplierID,
    this.ShipmentDate,
    this.OrderNumber,
  );
}
