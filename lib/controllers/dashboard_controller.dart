import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find<DashboardController>();

  final indexBar = 0.obs;

  setIndexBar(final int index) {
    if (index == 3) {
      // getUserById();
    }

    indexBar.value = index;
    update();
  }
}
