import 'dart:async';

import 'package:blink_it_app/pages/user/home.dart';
import "package:flutter/material.dart";
import 'package:blink_it_app/constants/color_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'blink',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 60,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TextSpan(
                    text: 'it',
                    style: TextStyle(
                      color: ColorConstants.secondaryColor,
                      fontSize: 60,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),

            Text(
              "India's Last Minute App",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                width: 80, // Adjust width as needed
                child: Divider(color: Colors.red, thickness: 1),
              ),
            ),
            Text(
              "A Zomato Company",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
