import 'package:flutter/material.dart';
import 'package:inventory_management_app/Http/requests.dart';
import 'package:inventory_management_app/Models/Supplier.dart';

import '../Dashboard/dashboard_screen.dart';

class SingleSupplierScreen extends StatelessWidget {
  Supplier supplier;
  SingleSupplierScreen(this.supplier);
  @override
  TextEditingController supplierNameController = TextEditingController();
  TextEditingController supplierContactController = TextEditingController();
  TextEditingController supplierAddressController = TextEditingController();
  Widget build(BuildContext context) {
    supplierNameController.text = supplier.SupplierName;
    supplierContactController.text = supplier.SupplierContact.toString();
    supplierAddressController.text = supplier.SupplierAddress;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            await getAllSuppliers();
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
              controller: supplierNameController,
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
              controller: supplierContactController,
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
              controller: supplierAddressController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            TextButton(
              onPressed: () async {
                await updateSupplier(
                    supplier.SupplierID,
                    supplierNameController.text,
                    int.parse(supplierContactController.text),
                    supplierAddressController.text);
                await getAllSuppliers();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => DashboardScreen(),
                    ),
                    ModalRoute.withName("/dashboard"));
              },
              child: Text(
                "Save",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
