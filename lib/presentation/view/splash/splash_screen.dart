import 'dart:async';
import 'package:digital_sleek/presentation/view/splash/starter_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  // bool isSignIn;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const StartScreen()));

      //Navigator.push(context, MaterialPageRoute(builder: (context) => const IntroPage()));
    });
  }

  final String assetName = 'assets/splash_logo.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/splash_logo.png',
            //width: double.infinity,
            //height: MediaQuery.of(context).size.height,
          ),
        ],
      ),
    );
  }
}
