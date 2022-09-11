import 'package:flutter/material.dart';
import 'package:inventory_management_app/Http/requests.dart';
import 'package:inventory_management_app/Screens/IncomingShipment/AddIncomingShipment.dart';
import 'package:inventory_management_app/Screens/IncomingShipment/SingleIncomeScreen.dart';

import '../Dashboard/dashboard_screen.dart';

class AllIncomingShipmentScreen extends StatelessWidget {
  const AllIncomingShipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Incoming Shipments"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => DashboardScreen(),
            ));
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddIncomingShipment(),
              ));
            },
            icon: Icon(Icons.local_shipping),
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
                for (int i = 0; i < listAllIncomingShipments.length; i++)
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
                                  listAllIncomingShipments[i]
                                      .ISProduct
                                      .ProductID)
                              .ProductName), onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SingleIncomeScreen(listAllIncomingShipments[i]),
                        ));
                      }),
                      DataCell(
                          Text(listAllIncomingShipments[i].Quantity.toString()),
                          onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SingleIncomeScreen(listAllIncomingShipments[i]),
                        ));
                      }),
                      DataCell(
                          Text(
                              listAllIncomingShipments[i].TotalCost.toString()),
                          onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SingleIncomeScreen(listAllIncomingShipments[i]),
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
