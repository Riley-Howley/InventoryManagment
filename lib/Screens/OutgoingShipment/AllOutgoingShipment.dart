import 'package:flutter/material.dart';
import 'package:inventory_management_app/Http/requests.dart';
import 'package:inventory_management_app/Screens/OutgoingShipment/AddOutgoingShipment.dart';

import '../Dashboard/dashboard_screen.dart';
import 'SingleOutgoingScreen.dart';

class OutgoingShipmentScreen extends StatelessWidget {
  const OutgoingShipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Outgoing Shipments"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => DashboardScreen(),
            ));
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await getMenuProducts();
              await getAllProducts();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddOutgoingShipmentScreen(),
              ));
            },
            icon: Icon(Icons.directions_boat),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: DataTable(
              columns: [
                DataColumn(
                  label: Text(
                    "Product",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Quantity",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Total",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
              rows: [
                for (int i = 0; i < listAllOutGoingShipments.length; i++)
                  DataRow(
                    color: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (i % 2 == 0) {
                          return Color(0xffFBCD8E); // use whatever color
                        }
                        return Colors.transparent; //
                      },
                    ),
                    cells: [
                      DataCell(
                          Text(listAllProducts
                              .firstWhere((prod) =>
                                  prod.ProductID ==
                                  listAllOutGoingShipments[i]
                                      .OGSProduct
                                      .ProductID)
                              .ProductName), onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SingleOutgoingScreen(listAllOutGoingShipments[i]),
                        ));
                      }),
                      DataCell(
                          Text(listAllOutGoingShipments[i].Quantity.toString()),
                          onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SingleOutgoingScreen(listAllOutGoingShipments[i]),
                        ));
                      }),
                      DataCell(
                          Text(
                              listAllOutGoingShipments[i].TotalCost.toString()),
                          onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SingleOutgoingScreen(listAllOutGoingShipments[i]),
                        ));
                      }),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
