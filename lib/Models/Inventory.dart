import 'package:inventory_management_app/Models/Product.dart';

class Inventory {
  int InventoryID;
  Product InventoryProduct;
  int Quantity;

  Inventory(
    this.InventoryID,
    this.InventoryProduct,
    this.Quantity,
  );
}
