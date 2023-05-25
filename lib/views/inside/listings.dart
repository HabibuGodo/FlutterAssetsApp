import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../controllers/dashboard_controller.dart';
import '../../services/size_config.dart';
import '../../services/theme.dart';
import 'package:badges/badges.dart' as badges;

import '../../widgets/components.dart';

class AllPropertiesScreen extends StatelessWidget {
  final DashboardController x = DashboardController.to;
  // final myPref = MyPref.to;

  AllPropertiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      padding: EdgeInsets.only(top: Get.mediaQuery.padding.top),
      width: Get.width,
      height: Get.height,
      child: RefreshIndicator(
        onRefresh: () async {
          // x.asyncHome();
          // await Future.delayed(const Duration(milliseconds: 2200));
          // x.asyncLatitude();
          // return;
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 22, right: 18, top: 10, bottom: 10),
                child: topIcon(),
              ),
              inputSearch(),
              SizedBox(height: getProportionateScreenHeight(15)),
              listNearby(),
              SizedBox(height: getProportionateScreenHeight(15)),
              SizedBox(height: getProportionateScreenHeight(155)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget topIcon() {
  //debugPrint(dataInstall);

  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Icon(FontAwesome.user, size: 18, color: Get.theme.primaryColor),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Text("Nyumba Zote Area D",
                    style: Get.theme.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ],
          ),
        ],
      ),
      Row(
        children: [
          spaceWidth5,
          InkWell(
            onTap: () {
              // debugPrint("click bell notification");
              // Get.to(NotifPage(), transition: Transition.fadeIn);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: colorGrey2,
                    style: BorderStyle.solid,
                    width: 0.8,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Icon(
                  FontAwesome.map_marker,
                  size: 16,
                  color: Get.theme.disabledColor,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget listNearby() {
  final double thisWidth = Get.width;
  return SizedBox(
    width: Get.width,
    child: ListView(
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: thisWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: colorBoxShadowGrey,
                  blurRadius: 1.0,
                  offset: Offset(1, 1),
                )
              ],
            ),
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ExtendedImage.network(
                      "https://media.istockphoto.com/id/492842106/photo/bank-of-tanzanias-twin-towers-dar-es-salaam.jpg?s=612x612&w=0&k=20&c=1fCRslzNwyHCsjhWFFw0f-oMxjWfvESHBAWcKUBmcyQ=",
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                      cache: true,
                    ),
                  ),
                ),
                Container(
                  width: GetPlatform.isAndroid
                      ? thisWidth / 1.65
                      : Get.width / 1.55,
                  padding: const EdgeInsets.only(
                      top: 10, left: 3, right: 5, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: thisWidth / 2.8,
                              child: const Text(
                                "Kigamboni",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14,
                                    height: 1.1,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            const Text(
                              "500k",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        margin: const EdgeInsets.only(bottom: 1),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(MaterialIcons.location_pin,
                                    color: Colors.black45, size: 14),
                                SizedBox(width: 5),
                                Text(
                                  "Ferry Kigamboni",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black45),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(
                                children: const [
                                  Icon(MaterialIcons.star,
                                      color: Colors.amber, size: 12),
                                  SizedBox(width: 1),
                                  Text(
                                    "8",
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: thisWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: colorBoxShadowGrey,
                  blurRadius: 1.0,
                  offset: Offset(1, 1),
                )
              ],
            ),
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ExtendedImage.network(
                      "https://www.mikuminationalpark.net/wp-content/uploads/2020/02/dar-es-salaam-city.jpg",
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                      cache: true,
                    ),
                  ),
                ),
                Container(
                  width: GetPlatform.isAndroid
                      ? thisWidth / 1.65
                      : Get.width / 1.55,
                  padding: const EdgeInsets.only(
                      top: 10, left: 3, right: 5, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: thisWidth / 2.8,
                              child: const Text(
                                "Kigamboni",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14,
                                    height: 1.1,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            const Text(
                              "500k",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        margin: const EdgeInsets.only(bottom: 1),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(MaterialIcons.location_pin,
                                    color: Colors.black45, size: 14),
                                SizedBox(width: 5),
                                Text(
                                  "Ferry Kigamboni",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black45),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(
                                children: const [
                                  Icon(MaterialIcons.star,
                                      color: Colors.amber, size: 12),
                                  SizedBox(width: 1),
                                  Text(
                                    "8",
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: thisWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: colorBoxShadowGrey,
                  blurRadius: 1.0,
                  offset: Offset(1, 1),
                )
              ],
            ),
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ExtendedImage.network(
                      "https://media.istockphoto.com/id/492842106/photo/bank-of-tanzanias-twin-towers-dar-es-salaam.jpg?s=612x612&w=0&k=20&c=1fCRslzNwyHCsjhWFFw0f-oMxjWfvESHBAWcKUBmcyQ=",
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                      cache: true,
                    ),
                  ),
                ),
                Container(
                  width: GetPlatform.isAndroid
                      ? thisWidth / 1.65
                      : Get.width / 1.55,
                  padding: const EdgeInsets.only(
                      top: 10, left: 3, right: 5, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: thisWidth / 2.8,
                              child: const Text(
                                "Kigamboni",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14,
                                    height: 1.1,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            const Text(
                              "500k",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        margin: const EdgeInsets.only(bottom: 1),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(MaterialIcons.location_pin,
                                    color: Colors.black45, size: 14),
                                SizedBox(width: 5),
                                Text(
                                  "Ferry Kigamboni",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black45),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(
                                children: const [
                                  Icon(MaterialIcons.star,
                                      color: Colors.amber, size: 12),
                                  SizedBox(width: 1),
                                  Text(
                                    "8",
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: thisWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: colorBoxShadowGrey,
                  blurRadius: 1.0,
                  offset: Offset(1, 1),
                )
              ],
            ),
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ExtendedImage.network(
                      "https://www.mikuminationalpark.net/wp-content/uploads/2020/02/dar-es-salaam-city.jpg",
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                      cache: true,
                    ),
                  ),
                ),
                Container(
                  width: GetPlatform.isAndroid
                      ? thisWidth / 1.65
                      : Get.width / 1.55,
                  padding: const EdgeInsets.only(
                      top: 10, left: 3, right: 5, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: thisWidth / 2.8,
                              child: const Text(
                                "Kigamboni",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14,
                                    height: 1.1,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            const Text(
                              "500k",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        margin: const EdgeInsets.only(bottom: 1),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(MaterialIcons.location_pin,
                                    color: Colors.black45, size: 14),
                                SizedBox(width: 5),
                                Text(
                                  "Ferry Kigamboni",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black45),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(
                                children: const [
                                  Icon(MaterialIcons.star,
                                      color: Colors.amber, size: 12),
                                  SizedBox(width: 1),
                                  Text(
                                    "8",
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: thisWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: colorBoxShadowGrey,
                  blurRadius: 1.0,
                  offset: Offset(1, 1),
                )
              ],
            ),
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ExtendedImage.network(
                      "https://media.istockphoto.com/id/492842106/photo/bank-of-tanzanias-twin-towers-dar-es-salaam.jpg?s=612x612&w=0&k=20&c=1fCRslzNwyHCsjhWFFw0f-oMxjWfvESHBAWcKUBmcyQ=",
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                      cache: true,
                    ),
                  ),
                ),
                Container(
                  width: GetPlatform.isAndroid
                      ? thisWidth / 1.65
                      : Get.width / 1.55,
                  padding: const EdgeInsets.only(
                      top: 10, left: 3, right: 5, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: thisWidth / 2.8,
                              child: const Text(
                                "Kigamboni",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14,
                                    height: 1.1,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            const Text(
                              "500k",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        margin: const EdgeInsets.only(bottom: 1),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(MaterialIcons.location_pin,
                                    color: Colors.black45, size: 14),
                                SizedBox(width: 5),
                                Text(
                                  "Ferry Kigamboni",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black45),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(
                                children: const [
                                  Icon(MaterialIcons.star,
                                      color: Colors.amber, size: 12),
                                  SizedBox(width: 1),
                                  Text(
                                    "8",
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: thisWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: colorBoxShadowGrey,
                  blurRadius: 1.0,
                  offset: Offset(1, 1),
                )
              ],
            ),
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ExtendedImage.network(
                      "https://www.mikuminationalpark.net/wp-content/uploads/2020/02/dar-es-salaam-city.jpg",
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                      cache: true,
                    ),
                  ),
                ),
                Container(
                  width: GetPlatform.isAndroid
                      ? thisWidth / 1.65
                      : Get.width / 1.55,
                  padding: const EdgeInsets.only(
                      top: 10, left: 3, right: 5, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: thisWidth / 2.8,
                              child: const Text(
                                "Kigamboni",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14,
                                    height: 1.1,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            const Text(
                              "500k",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        margin: const EdgeInsets.only(bottom: 1),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(MaterialIcons.location_pin,
                                    color: Colors.black45, size: 14),
                                SizedBox(width: 5),
                                Text(
                                  "Ferry Kigamboni",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black45),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(
                                children: const [
                                  Icon(MaterialIcons.star,
                                      color: Colors.amber, size: 12),
                                  SizedBox(width: 1),
                                  Text(
                                    "8",
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget inputSearch() {
  // final List<RentalModel> latests = x.itemHome.value.latests!;
  // _query.text = '';

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      gradient: LinearGradient(
        colors: [Get.theme.canvasColor, Get.theme.canvasColor.withOpacity(.98)],
      ),
    ),
    child: SizedBox(
      width: Get.width,
      child: TextField(
        // controller: _query,
        // onChanged: (String? text) {
        //   if (text!.isNotEmpty && text.isNotEmpty) {
        //     var models = latests.where((RentalModel element) {
        //       return element.title!
        //           .toLowerCase()
        //           .contains(text.trim().toLowerCase());
        //     }).toList();

        //     if (models.isNotEmpty) {
        //       datas.value = models;
        //     }
        //   } else {
        //     datas.value = latests;
        //   }
        // },
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          prefixIcon: Icon(
            FontAwesome.search,
            size: 14,
            color: Get.theme.colorScheme.background,
          ),
          border: InputBorder.none,
          hintText: "Tafuta Hapa..",
          suffixIcon: InkWell(
            onTap: () {
              // _query.text = '';
              // datas.value = latests;
            },
            child: Icon(
              FontAwesome.remove,
              size: 14,
              color: Get.theme.colorScheme.background,
            ),
          ),
        ),
      ),
    ),
  );
}
