import 'package:aread/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../controllers/onboard_controller.dart';

class OutsideBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(
      () => OnboardingController(),
    );
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );

    Get.lazyPut<LoginController>(
      () => LoginController(),
    );

    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
  }
}
