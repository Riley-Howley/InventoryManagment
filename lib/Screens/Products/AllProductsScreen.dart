import 'package:flutter/material.dart';
import 'package:inventory_management_app/Http/requests.dart';
import 'package:inventory_management_app/Screens/Dashboard/dashboard_screen.dart';
import 'package:inventory_management_app/Screens/Products/AddProductScreen.dart';
import 'package:inventory_management_app/Screens/Products/SingleProductScreen.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddProductScreen(),
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
                    "Product ID",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Product Name",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Cost",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
              rows: [
                for (int i = 0; i < listAllProducts.length; i++)
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
                      DataCell(Text(listAllProducts[i].SKU), onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SingleProductScreen(listAllProducts[i]),
                        ));
                      }),
                      DataCell(Text(listAllProducts[i].ProductName), onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SingleProductScreen(listAllProducts[i]),
                        ));
                      }),
                      DataCell(
                          Text(
                            listAllProducts[i].Cost.toString(),
                          ), onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SingleProductScreen(listAllProducts[i]),
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
