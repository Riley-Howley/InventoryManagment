import 'package:flutter/material.dart';
import 'package:inventory_management_app/Http/requests.dart';

import '../Dashboard/dashboard_screen.dart';

class AddSupplierScreen extends StatefulWidget {
  const AddSupplierScreen({super.key});

  @override
  State<AddSupplierScreen> createState() => _AddSupplierScreenState();
}

class _AddSupplierScreenState extends State<AddSupplierScreen> {
  @override
  TextEditingController supplierName = TextEditingController();
  TextEditingController supplierContact = TextEditingController();
  TextEditingController supplierAddress = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Supplier"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => DashboardScreen(),
                ),
                ModalRoute.withName("/dashboard"));
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Container(
              child: Text(
                "Supplier Name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              maxLength: 20,
              controller: supplierName,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            Container(
              child: Text(
                "Supplier Contact",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              maxLength: 10,
              controller: supplierContact,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            Container(
              child: Text(
                "Supplier Address",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              maxLength: 20,
              controller: supplierAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await getAllSuppliers();
                int supplierID = listAllSuppliers.length + 1;
                await postSupplier(
                  supplierID,
                  supplierName.text,
                  int.parse(supplierContact.text),
                  supplierAddress.text,
                );
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => DashboardScreen(),
                    ),
                    ModalRoute.withName("/dashboard"));
              },
              child: Text("Add Supplier"),
            ),
          ],
        ),
      ),
    );
  }
}
