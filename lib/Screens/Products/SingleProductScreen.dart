import 'package:flutter/material.dart';
import 'package:inventory_management_app/Http/requests.dart';
import 'package:inventory_management_app/Models/Product.dart';
import 'package:inventory_management_app/Screens/Dashboard/dashboard_screen.dart';
import 'package:inventory_management_app/Screens/Products/AllProductsScreen.dart';

class SingleProductScreen extends StatelessWidget {
  Product product;
  SingleProductScreen(this.product);

  @override
  TextEditingController nameController = TextEditingController();
  TextEditingController costController = TextEditingController();
  Widget build(BuildContext context) {
    nameController.text = product.ProductName;
    costController.text = product.Cost.toString();
    return Scaffold(
      appBar: AppBar(
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
                "Product Name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              maxLength: 14,
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            Container(
              child: Text(
                "Product Cost",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              controller: costController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            TextButton(
              onPressed: () async {
                await updateProduct(
                  product.ProductID,
                  nameController.text,
                  product.SKU,
                  double.parse(costController.text),
                  product.Description,
                );
                await getAllProducts();
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
