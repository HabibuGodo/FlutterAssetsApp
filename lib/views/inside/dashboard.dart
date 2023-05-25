import 'package:aread/controllers/dashboard_controller.dart';
import 'package:aread/views/inside/home.dart';
import 'package:aread/views/inside/listings.dart';
import 'package:aread/views/inside/map_search.dart';
import 'package:aread/views/inside/my_properties.dart';
import 'package:aread/views/inside/profile.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../services/size_config.dart';
import '../../services/theme.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  final DashboardController x = DashboardController.to;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        //padding: EdgeInsets.only(top: Get.mediaQuery.padding.top),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              mainBackgroundcolor,
              mainBackgroundcolor2,
              mainBackgroundcolor3,
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Obx(() => switchWidget(x.indexBar.value)),
          extendBody: true,
          bottomNavigationBar: Obx(
            () => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: DotNavigationBar(
                boxShadow: const [
                  BoxShadow(
                    color: colorBoxShadowGrey,
                    blurRadius: 1.0,
                    offset: Offset(1, 1),
                  )
                ],
                backgroundColor: Get.theme.primaryColor,
                marginR:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 0),
                paddingR: const EdgeInsets.only(bottom: 8, top: 5),
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 0),
                currentIndex: x.indexBar.value,
                dotIndicatorColor: Get.theme.disabledColor,
                selectedItemColor: Get.theme.canvasColor,
                unselectedItemColor: Get.theme.colorScheme.background,
                duration: const Duration(milliseconds: 300),
                //enableFloatingNavBar: false,
                onTap: (int index) {
                  x.setIndexBar(index);
                },
                items: [
                  /// Home
                  DotNavigationBarItem(
                    icon: const Icon(FontAwesome.home),
                    //selectedColor: Color(0xff73544C),
                  ),

                  /// History
                  DotNavigationBarItem(
                    icon: const Icon(Icons.apartment),
                    //selectedColor: Color(0xff73544C),
                  ),

                  /// Likes
                  DotNavigationBarItem(
                    icon: const Icon(FontAwesome.map_marker),
                    //selectedColor: Color(0xff73544C),
                  ),

                  /// Profile
                  DotNavigationBarItem(
                    icon: const Icon(Icons.person),
                    //selectedColor: Color(0xff73544C),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  switchWidget(final int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return AllPropertiesScreen();
      case 2:
        return MapSearchScreen();
      case 3:
        return ProfileScreen();
      case 4:
        return MyPropertiesScreen();
      default:
        return HomeScreen();
    }
  }
}
