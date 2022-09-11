import 'package:flutter/material.dart';
import 'package:inventory_management_app/Http/requests.dart';
import 'package:inventory_management_app/Screens/Supplier/AddSupplierScreen.dart';
import 'package:inventory_management_app/Screens/Supplier/SingleSupplierScreen.dart';

import '../Dashboard/dashboard_screen.dart';

class AllSuppliersScreen extends StatelessWidget {
  const AllSuppliersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suppliers"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddSupplierScreen(),
              ));
            },
            icon: Icon(Icons.add),
          ),
        ],
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
                    "Name",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Contact",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Address",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
              rows: [
                for (int i = 0; i < listAllSuppliers.length; i++)
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
                      DataCell(Text(listAllSuppliers[i].SupplierName),
                          onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SingleSupplierScreen(listAllSuppliers[i]),
                        ));
                      }),
                      DataCell(
                          Text(listAllSuppliers[i].SupplierContact.toString()),
                          onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SingleSupplierScreen(listAllSuppliers[i]),
                        ));
                      }),
                      DataCell(
                          Text(
                            listAllSuppliers[i].SupplierAddress,
                          ), onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SingleSupplierScreen(listAllSuppliers[i]),
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
