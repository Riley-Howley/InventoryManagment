import 'package:flutter/material.dart';
import 'package:inventory_management_app/Http/requests.dart';

import '../Dashboard/dashboard_screen.dart';

class AllInventoryScreen extends StatelessWidget {
  const AllInventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => DashboardScreen(),
            ));
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: DataTable(
              columns: [
                DataColumn(
                  label: Text(
                    "Product Name",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Quantity",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
              rows: [
                for (int i = 0; i < listAllInventory.length; i++)
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
                                  listAllInventory[i]
                                      .InventoryProduct
                                      .ProductID)
                              .ProductName),
                          onTap: () {}),
                      DataCell(Text(listAllInventory[i].Quantity.toString()),
                          onTap: () {}),
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
