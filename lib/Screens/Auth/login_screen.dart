import 'package:flutter/material.dart';
import 'package:inventory_management_app/Screens/Dashboard/dashboard_screen.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hasError = false;
  TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => DashboardScreen(),
                ));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 48,
                  ),
                ),
              ),
            ),
            Center(
              child: PinCodeTextField(
                autofocus: true,
                controller: pinController,
                hideCharacter: true,
                highlight: true,
                highlightColor: Colors.black,
                defaultBorderColor: Colors.black,
                highlightPinBoxColor: Colors.red,
                maxLength: 4,
                hasError: hasError,
                maskCharacter: "#",
                onTextChanged: (text) {
                  setState(() {
                    hasError = false;
                  });
                },
                onDone: (text) {
                  if (pinController.text != "1234") {
                    setState(() {
                      hasError = true;
                      pinController.clear();
                    });
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DashboardScreen(),
                    ));
                  }
                },
                pinBoxWidth: 50,
                pinBoxHeight: 64,
                hasUnderline: true,
                wrapAlignment: WrapAlignment.spaceAround,
                pinBoxDecoration:
                    ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                pinTextStyle: TextStyle(fontSize: 22.0),
                pinTextAnimatedSwitcherTransition:
                    ProvidedPinBoxTextAnimation.scalingTransition,
//                    pinBoxColor: Colors.green[100],
                pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
//                    highlightAnimation: true,
                highlightAnimationBeginColor: Colors.black,
                highlightAnimationEndColor: Colors.white12,
                keyboardType: TextInputType.number,
              ),
            ),
            Visibility(
              child: Text(
                "Wrong PIN!",
              ),
              visible: hasError,
            ),
          ],
        ),
      ),
    );
  }
}
