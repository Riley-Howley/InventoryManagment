import 'package:flutter/material.dart';
import 'package:inventory_management_app/Http/requests.dart';
import 'package:inventory_management_app/Screens/IncomingShipment/AllIncomingShipments.dart';
import 'package:inventory_management_app/Screens/Inventory/AllInventoryScreen.dart';
import 'package:inventory_management_app/Screens/Products/AllProductsScreen.dart';
import 'package:inventory_management_app/Screens/Report/ReportScreen.dart';
import 'package:inventory_management_app/Screens/Supplier/AllSuppliersScreen.dart';
import 'package:inventory_management_app/Screens/splash_screen.dart';

import '../OutgoingShipment/AllOutgoingShipment.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.red,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              margin: EdgeInsets.only(top: 200),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => SplashScreen(),
                      ),
                      ModalRoute.withName("/splashScreen"));
                },
                child: Text("Sign Out"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset("assets/images/delivery.png"),
                  Image.asset("assets/images/plane-shipping.png"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Incoming Shipments: ${listAllIncomingShipments.length}",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text("|",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                        "Outgoing Shipments: ${listAllOutGoingShipments.length}",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                    margin: EdgeInsets.only(top: 40),
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 150,
                    child: Center(
                      child: Text(
                        "Products",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-60, 25),
                    child: IconButton(
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.green,
                        backgroundColor: Colors.green,
                      ),
                      iconSize: 70,
                      onPressed: () async {
                        await getAllProducts();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AllProductsScreen(),
                        ));
                      },
                      icon: Icon(
                        Icons.arrow_circle_right,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                    margin: EdgeInsets.only(top: 40),
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 150,
                    child: Center(
                      child: Text(
                        "Inventory",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-60, 25),
                    child: IconButton(
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.green,
                        backgroundColor: Colors.green,
                      ),
                      iconSize: 70,
                      onPressed: () async {
                        await getAllInventory();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AllInventoryScreen(),
                        ));
                      },
                      icon: Icon(
                        Icons.arrow_circle_right,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                    margin: EdgeInsets.only(top: 40),
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 150,
                    child: Center(
                      child: Text(
                        "Incoming\nShipments",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-60, 25),
                    child: IconButton(
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.green,
                        backgroundColor: Colors.green,
                      ),
                      iconSize: 70,
                      onPressed: () async {
                        await getAllIncomingShipments();
                        await getAllSuppliers();
                        await getAllProducts();
                        await getMenuProducts();
                        await getMenuSuppliers();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AllIncomingShipmentScreen(),
                        ));
                      },
                      icon: Icon(
                        Icons.arrow_circle_right,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                    margin: EdgeInsets.only(top: 40),
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 150,
                    child: Center(
                      child: Text(
                        "Outgoing\nShipments",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-60, 25),
                    child: IconButton(
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.green,
                        backgroundColor: Colors.green,
                      ),
                      iconSize: 70,
                      onPressed: () async {
                        await getAllProducts();
                        await getAllProducts();
                        await getAllOutGoingShipments();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OutgoingShipmentScreen(),
                        ));
                      },
                      icon: Icon(
                        Icons.arrow_circle_right,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                    margin: EdgeInsets.only(top: 40),
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 150,
                    child: Center(
                      child: Text(
                        "Reports",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-60, 25),
                    child: IconButton(
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.green,
                        backgroundColor: Colors.green,
                      ),
                      iconSize: 70,
                      onPressed: () async {
                        await getAllIncomingShipments();
                        await getAllOutGoingShipments();
                        await getAllInventory();
                        await getAllProducts();
                        await getAllSuppliers();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ReportScreen(),
                        ));
                      },
                      icon: Icon(
                        Icons.arrow_circle_right,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                    margin: EdgeInsets.only(top: 40),
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 150,
                    child: Center(
                      child: Text(
                        "Suppliers",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-60, 25),
                    child: IconButton(
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.green,
                        backgroundColor: Colors.green,
                      ),
                      iconSize: 70,
                      onPressed: () async {
                        await getAllSuppliers();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AllSuppliersScreen(),
                        ));
                      },
                      icon: Icon(
                        Icons.arrow_circle_right,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
