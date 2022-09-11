import 'package:flutter/material.dart';
import 'package:inventory_management_app/Screens/Dashboard/dashboard_screen.dart';
import 'package:inventory_management_app/Screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        "/dashboard": (context) => DashboardScreen(),
        "/splashScreen": (context) => SplashScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
