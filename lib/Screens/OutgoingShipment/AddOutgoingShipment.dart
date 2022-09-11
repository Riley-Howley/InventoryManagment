import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventory_management_app/Http/requests.dart';
import 'package:quantity_input/quantity_input.dart';

import '../Dashboard/dashboard_screen.dart';

class AddOutgoingShipmentScreen extends StatefulWidget {
  const AddOutgoingShipmentScreen({super.key});

  @override
  State<AddOutgoingShipmentScreen> createState() =>
      _AddOutgoingShipmentScreenState();
}

class _AddOutgoingShipmentScreenState extends State<AddOutgoingShipmentScreen> {
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
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      "Date Sent",
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
                  await getAllOutGoingShipments();
                  await getAllProducts();
                  int id = listAllOutGoingShipments.length + 1;
                  await postOutgoingShipment(
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
                    dateController.text,
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
