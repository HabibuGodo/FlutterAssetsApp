import 'package:aread/bindings/inside_bindings.dart';
import 'package:aread/services/theme.dart';
import 'package:aread/views/inside/dashboard.dart';
import 'package:aread/views/inside/my_properties.dart';
import 'package:aread/views/outside/forgot_password.dart';
import 'package:aread/views/outside/onboard_page.dart';
import 'package:aread/views/outside/register.dart';
import 'package:aread/views/outside/splash_screen.dart';
import 'package:aread/views/outside/terms_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bindings/outside_bindings.dart';
import 'views/inside/new_property.dart';
import 'views/inside/single_property.dart';
import 'views/outside/login.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  configLoading();
}

final fontFamily = GoogleFonts.poppins().fontFamily;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    Color statusColor = whiteColor;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: statusColor,
      statusBarColor: statusColor,
      // Android Only
      statusBarIconBrightness: Brightness.dark,

      //iOS only
      statusBarBrightness: Brightness.light,
    ));

    return GetMaterialApp(
        title: 'AreaD App',
        debugShowCheckedModeBanner: false,
        initialBinding: OutsideBindings(),
        theme: ThemeData(
          primaryColor: appColor,
          fontFamily: fontFamily,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          cardColor: backColor,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.red,
            backgroundColor: backColor.withOpacity(.95),
          ).copyWith(
            secondary: Colors.redAccent,
          ),
        ),
        builder: EasyLoading.init(),
        getPages: [
          GetPage(
              name: '/',
              page: () => const SplashScreen(),
              transition: Transition.fadeIn),
          GetPage(
              name: '/onboarding',
              page: () => const OnboardScreen(),
              binding: OutsideBindings(),
              transition: Transition.rightToLeftWithFade),
          GetPage(
              name: '/login',
              page: () => const LoginScreen(),
              binding: OutsideBindings(),
              transition: Transition.rightToLeftWithFade),
          GetPage(
              name: '/register',
              page: () => RegisterScreen(),
              binding: OutsideBindings(),
              transition: Transition.rightToLeftWithFade),
          GetPage(
              name: '/forgot_password',
              page: () => const ForgotPasswordScreen(),
              binding: OutsideBindings(),
              transition: Transition.rightToLeftWithFade),
          GetPage(
              name: '/terms',
              page: () => const TermsScreen(),
              binding: OutsideBindings(),
              transition: Transition.rightToLeftWithFade),
          GetPage(
              name: '/home',
              page: () => Dashboard(),
              binding: Insidebindings(),
              transition: Transition.rightToLeftWithFade),
          GetPage(
              name: '/my_properties',
              page: () => MyPropertiesScreen(),
              binding: Insidebindings(),
              transition: Transition.rightToLeftWithFade),
          //
          GetPage(
              name: '/new_property',
              page: () => NewPropertyScreen(),
              binding: Insidebindings(),
              transition: Transition.rightToLeftWithFade),
          GetPage(
              name: '/single_property',
              page: () => const SinglePropertyScreen(),
              binding: Insidebindings(),
              transition: Transition.zoom),
        ],
        home: const SplashScreen());
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 3)
    ..indicatorType = EasyLoadingIndicatorType.ripple
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..customAnimation = CustomAnimation();
}

//========================Class for easy loading animation
class CustomAnimation extends EasyLoadingAnimation {
  CustomAnimation();

  @override
  Widget buildWidget(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  ) {
    return Opacity(
      opacity: controller.value,
      child: RotationTransition(
        turns: controller,
        child: child,
      ),
    );
  }
}
