import 'dart:collection';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventory_management_app/Http/requests.dart';
import 'package:inventory_management_app/Screens/Auth/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                child: Text(
                  "Zwift Manager",
                  style: TextStyle(
                      fontSize: 44,
                      color: Colors.white,
                      shadows: outlinedText(strokeColor: Colors.red)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2),
                height: 60,
                width: MediaQuery.of(context).size.width - 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () async {
                    await getAllProducts();
                    await getAllIncomingShipments();
                    await getAllOutGoingShipments();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                  },
                  child: Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Shadow> outlinedText(
    {double strokeWidth = 2,
    Color strokeColor = Colors.red,
    int precision = 5}) {
  Set<Shadow> result = HashSet();
  for (int x = 1; x < strokeWidth + precision; x++) {
    for (int y = 1; y < strokeWidth + precision; y++) {
      double offsetX = x.toDouble();
      double offsetY = y.toDouble();
      result.add(Shadow(
          offset: Offset(-strokeWidth / offsetX, -strokeWidth / offsetY),
          color: strokeColor));
      result.add(Shadow(
          offset: Offset(-strokeWidth / offsetX, strokeWidth / offsetY),
          color: strokeColor));
      result.add(Shadow(
          offset: Offset(strokeWidth / offsetX, -strokeWidth / offsetY),
          color: strokeColor));
      result.add(Shadow(
          offset: Offset(strokeWidth / offsetX, strokeWidth / offsetY),
          color: strokeColor));
    }
  }
  return result.toList();
}
