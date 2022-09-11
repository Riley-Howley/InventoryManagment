import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventory_management_app/Http/requests.dart';
import 'package:inventory_management_app/Models/IncomingShipment.dart';

class SingleIncomeScreen extends StatelessWidget {
  IncomingShipment income;
  SingleIncomeScreen(this.income);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${income.OrderNumber} - ${income.ShipmentDate}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: Text(
                    "Product Name",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "${listAllProducts.firstWhere((prod) => prod.ProductID == income.ISProduct.ProductID).ProductName}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Text(
                    "Quantity",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "${income.Quantity}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Text(
                    "Total Cost",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "${income.TotalCost}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Text(
                    "Supplier Name",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "${listAllSuppliers.firstWhere((prod) => prod.SupplierID == income.SupplierID).SupplierName}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
