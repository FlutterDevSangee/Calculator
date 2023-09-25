import 'package:calculator_app/Controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final splashCntlr = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    splashCntlr.navToNextPage();
    return Scaffold(
        backgroundColor: Colors.black,
        //   backgroundColor: const Color(0xFF282828),
        body: GetBuilder<SplashController>(
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/calcu.png",
                      height: 150,
                      width: 150,
                    ),
                    const Text(
                      "Calculator",
                      style: TextStyle(
                          color: Color(0xffc9e0ff),
                          // color: Color(0xff090F32),
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Comfortaa',
                          letterSpacing: 6),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
