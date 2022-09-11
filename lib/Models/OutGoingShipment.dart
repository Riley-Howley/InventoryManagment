import 'Product.dart';

class OutGoingShipment {
  int OutGoingShipmentID;
  Product OGSProduct;
  int Quantity;
  double TotalCost;
  String ShipmentDate;

  OutGoingShipment(
    this.OutGoingShipmentID,
    this.OGSProduct,
    this.Quantity,
    this.TotalCost,
    this.ShipmentDate,
  );
}
