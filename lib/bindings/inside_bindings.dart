import 'package:aread/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

import '../controllers/map_controller.dart';

class Insidebindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    // EstateSearchController
    Get.lazyPut(() => EstateSearchController());
  }
  // EstateSearchController
}
