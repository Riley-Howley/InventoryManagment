import 'package:flutter/material.dart';
import 'package:inventory_management_app/Models/OutGoingShipment.dart';

import '../../Http/requests.dart';

class SingleOutgoingScreen extends StatelessWidget {
  OutGoingShipment outgoing;
  SingleOutgoingScreen(this.outgoing);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${outgoing.ShipmentDate}"),
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
                    "${listAllProducts.firstWhere((prod) => prod.ProductID == outgoing.OGSProduct.ProductID).ProductName}",
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
                    "${outgoing.Quantity}",
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
                    "${outgoing.TotalCost}",
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
