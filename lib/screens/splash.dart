import 'dart:async';
import 'package:face_detection_app/custom_widgets/animated_text.dart';
import 'package:face_detection_app/screens/capture.dart';
import 'package:face_detection_app/screens/get_started.dart';
import 'package:face_detection_app/screens/register.dart';
import 'package:face_detection_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigationTimer(seconds: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.21, -0.98),
            end: Alignment(0.21, 0.98),
            colors: [Color(0xFF1D4FFF), Color(0xFF067FD0)],
          ),
        ),
        child: Column(
          children: const [
            Spacer(),
            AninmatedText(),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Future<Timer> _navigationTimer({required int seconds}) async {
    return Timer(Duration(seconds: seconds), _checkUserSession);
  }

  Future<void> _checkUserSession() async {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => GetStartedScreen())));

  }


}