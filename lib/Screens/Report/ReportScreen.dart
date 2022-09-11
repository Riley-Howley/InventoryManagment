import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management_app/Http/requests.dart';

import '../IncomingShipment/SingleIncomeScreen.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${DateFormat.yMMMd().format(DateTime.now())}"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    child: Text(
                      "Total Incoming Shipments:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "${listAllIncomingShipments.length}",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Text(
                      "Total OutGoing Shipments:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "${listAllOutGoingShipments.length}",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Text(
                      "Total Products For Sale:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "${listAllProducts.length}",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Text(
                      "Total Suppliers:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "${listAllSuppliers.length}",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Text(
                  "Current Inventory:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Center(
                child: DataTable(
                  columns: [
                    DataColumn(
                      label: Text(
                        "Product Name",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Quantity",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
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
                          DataCell(
                              Text(listAllInventory[i].Quantity.toString()),
                              onTap: () {}),
                        ],
                      ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Text(
                  "Increase Price in 6 Months",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
