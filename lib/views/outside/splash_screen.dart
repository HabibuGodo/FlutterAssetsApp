import 'package:aread/services/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/splash_controller.dart';

// ################ SPLASH SCREEN ###############################
// Hii ndio screen ya kwanza kabisa katika app inavyo run
// Ina logo katikati ya screen

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  centered logo
    return SafeArea(
      child: Scaffold(
        // backgroundColor: appColor,
        body: GetBuilder<SplashController>(
          init: SplashController(),
          builder: (controller) {
            return Center(
              child: Image.asset(
                logoImage,
                // color: whietColor,
                height: 200,
                width: 200,
              ),
            );
          },
        ),
      ),
    );
  }
}
