import 'package:flutter/material.dart';
import 'package:inventory_management_app/Http/requests.dart';

import '../Dashboard/dashboard_screen.dart';

class AddProductScreen extends StatelessWidget {
  @override
  TextEditingController nameController = TextEditingController();
  TextEditingController costController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Container(
              child: Text(
                "Product Name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              maxLength: 14,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              controller: nameController,
            ),
            Container(
              child: Text(
                "Product Cost",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              controller: costController,
            ),
            ElevatedButton(
              onPressed: () async {
                int productID = listAllProducts.length + 1;
                String sku = "ZFT00${productID}";

                await postProduct(productID, nameController.text, sku,
                    double.parse(costController.text), "Topline Zwifty");

                await getAllProducts();

                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => DashboardScreen(),
                    ),
                    ModalRoute.withName("/dashboard"));
              },
              child: Text("Add Product"),
            ),
          ],
        ),
      ),
    );
  }
}
