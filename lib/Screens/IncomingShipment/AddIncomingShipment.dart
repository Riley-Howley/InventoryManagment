import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inventory_management_app/Http/requests.dart';
import 'package:quantity_input/quantity_input.dart';

import '../Dashboard/dashboard_screen.dart';

class AddIncomingShipment extends StatefulWidget {
  const AddIncomingShipment({super.key});

  @override
  State<AddIncomingShipment> createState() => _AddIncomingShipmentState();
}

class _AddIncomingShipmentState extends State<AddIncomingShipment> {
  String dropDownValue = "Select Product";

  String dropDownValue2 = "Select Supplier";

  int simpleIntInput = 0;

  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Product"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Product Name",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 60),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                width: MediaQuery.of(context).size.width,
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonHideUnderline(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24.0,
                      ),
                      child: DropdownButton(
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        value: dropDownValue,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: 40,
                          color: Colors.black,
                        ),
                        items: menuList.map((String items) {
                          return DropdownMenuItem(
                            child: Text(items),
                            value: items,
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            dropDownValue = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "Quantity",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    QuantityInput(
                      value: simpleIntInput,
                      onChanged: (value) => setState(
                        () => simpleIntInput = int.parse(
                          value.replaceAll(',', ''),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      "Product Supplier",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 60),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                width: MediaQuery.of(context).size.width,
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonHideUnderline(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24.0,
                      ),
                      child: DropdownButton(
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        value: dropDownValue2,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: 40,
                          color: Colors.black,
                        ),
                        items: suppList.map((String items) {
                          return DropdownMenuItem(
                            child: Text(items),
                            value: items,
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            dropDownValue2 = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      "Date Recieved",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              TextFormField(
                maxLength: 11,
                decoration: InputDecoration(
                  hintText: "00-Mar-22",
                  border: OutlineInputBorder(),
                ),
                controller: dateController,
              ),
              ElevatedButton(
                onPressed: () async {
                  await getAllIncomingShipments();
                  int id = listAllIncomingShipments.length + 1;
                  Random random = Random();
                  int serial1 = random.nextInt(9);
                  int serial2 = random.nextInt(9);
                  int serial3 = random.nextInt(9);
                  int serial4 = random.nextInt(9);
                  int serial5 = random.nextInt(9);
                  String orderNum =
                      "ZFT${serial1}${serial2}${serial3}${serial4}${serial5}";
                  await postIncomingShipment(
                    id,
                    listAllProducts
                        .firstWhere((prod) => prod.ProductName == dropDownValue)
                        .ProductID,
                    simpleIntInput,
                    listAllProducts
                            .firstWhere(
                                (prod) => prod.ProductName == dropDownValue)
                            .Cost *
                        simpleIntInput,
                    listAllSuppliers
                        .firstWhere((sup) => sup.SupplierName == dropDownValue2)
                        .SupplierID,
                    dateController.text,
                    orderNum,
                  );
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                      ),
                      ModalRoute.withName("/dashboard"));
                },
                child: Text("Order"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
