import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../controllers/dashboard_controller.dart';
import '../../services/size_config.dart';
import '../../services/theme.dart';
import 'package:badges/badges.dart' as badges;

import '../../widgets/components.dart';

class HomeScreen extends StatelessWidget {
  final DashboardController x = DashboardController.to;
  // final myPref = MyPref.to;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      padding: EdgeInsets.only(top: Get.mediaQuery.padding.top),
      width: Get.width,
      height: Get.height,
      child: RefreshIndicator(
        color: appColor,
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
              SizedBox(height: getProportionateScreenHeight(25)),
              listCategories(),
              SizedBox(height: getProportionateScreenHeight(10)),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Pendekezwa",
                          style: Get.theme.textTheme.titleLarge!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Zaidi",
                          style: Get.theme.textTheme.titleLarge!.copyWith(
                            fontSize: 12,
                            color: colorGrey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              listRecommends(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Karibu Yako",
                          style: Get.theme.textTheme.titleLarge!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Zaidi",
                          style: Get.theme.textTheme.titleLarge!.copyWith(
                            fontSize: 12,
                            color: colorGrey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              listNearby(),
              SizedBox(height: getProportionateScreenHeight(15)),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hivi Karibuni",
                          style: Get.theme.textTheme.titleLarge!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Zaidi",
                          style: Get.theme.textTheme.titleLarge!.copyWith(
                            fontSize: 12,
                            color: colorGrey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              listLatest(),
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
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 3),
            child: Text("Karibu Area D",
                style: TextStyle(color: colorGrey, fontSize: 11)),
          ),
          Row(
            children: [
              // Icon(FontAwesome.user, size: 18, color: Get.theme.primaryColor),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Text("Alpha Jozee",
                    style: Get.theme.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ],
          ),
        ],
      ),
      Row(
        children: [
          // InkWell(
          //   onTap: () {
          //     // debugPrint("click chat icon");
          //     // Get.to(ChatScreen(), transition: Transition.fadeIn);
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 3),
          //     child: Container(
          //       decoration: BoxDecoration(
          //         border: Border.all(
          //           color: colorGrey2,
          //           style: BorderStyle.solid,
          //           width: 0.8,
          //         ),
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(12.0),
          //       ),
          //       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          //       child: Icon(
          //         FontAwesome.comment,
          //         size: 16,
          //         color: Get.theme.disabledColor,
          //       ),
          //     ),
          //   ),
          // ),
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
                child: badges.Badge(
                  badgeContent: const Text(''),
                  position: badges.BadgePosition.topEnd(top: -12, end: -1),
                  child: Icon(
                    FontAwesome.bell,
                    size: 16,
                    color: Get.theme.disabledColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget listCategories() {
  return SizedBox(
    height: Get.height / 6.9,
    child: ListView(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: colorBoxShadowGrey,
                            blurRadius: 1.0,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                      child: ExtendedImage.network(
                        "https://www.freepnglogos.com/uploads/building-png/download-building-png-transparent-image-and-clipart-15.png",
                        width: 24,
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("Ghorofa",
                        style: const TextStyle(fontSize: 13, color: colorGrey)),
                  ),
                ],
              ),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: colorBoxShadowGrey,
                            blurRadius: 1.0,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                      child: ExtendedImage.network(
                        "https://i.pinimg.com/originals/10/6a/8b/106a8bdbace0bdc5f17da04932387da8.png",
                        width: 24,
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("Vyumba",
                        style: const TextStyle(fontSize: 13, color: colorGrey)),
                  ),
                ],
              ),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: colorBoxShadowGrey,
                            blurRadius: 1.0,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                      child: ExtendedImage.network(
                        "https://www.freepnglogos.com/uploads/hotel-logo-png/download-building-hotel-clipart-png-33.png",
                        width: 24,
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("Hoteli",
                        style: const TextStyle(fontSize: 13, color: colorGrey)),
                  ),
                ],
              ),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: colorBoxShadowGrey,
                            blurRadius: 1.0,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                      child: ExtendedImage.network(
                        "https://www.pngfind.com/pngs/m/284-2847722_cute-house-clipart-png-house-cartoon-images-png.png",
                        width: 24,
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("Self",
                        style: const TextStyle(fontSize: 13, color: colorGrey)),
                  ),
                ],
              ),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: colorBoxShadowGrey,
                            blurRadius: 1.0,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                      child: ExtendedImage.network(
                        "https://www.pngkey.com/png/detail/18-181618_house-png-transparent-background-house-clipart.png",
                        width: 24,
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("Gheto",
                        style: const TextStyle(fontSize: 13, color: colorGrey)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget listRecommends() {
  final double thisWidth = Get.width / 1.2;
  return SizedBox(
    height: (GetPlatform.isAndroid) ? Get.height / 2.3 : Get.height / 2.5,
    child: ListView(
      padding: const EdgeInsets.all(0),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Get.toNamed("/single_property");
            },
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
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                          ),
                          child: ExtendedImage.network(
                            "https://www.mikuminationalpark.net/wp-content/uploads/2020/02/dar-es-salaam-city.jpg",
                            width: thisWidth,
                            height: Get.height / 3.9,
                            fit: BoxFit.cover,
                            cache: true,
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 20, left: 18, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: Get.width / 3,
                                    child: const Text(
                                      "Posta Postani",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15,
                                          height: 1.1,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  const Text(
                                    "Tsh 300K",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Icon(MaterialIcons.location_pin,
                                      color: Colors.black45, size: 18),
                                  SizedBox(width: 5),
                                  Text(
                                    "Posta Dar",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black45),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: const InfoSquare(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: colorTrans2.withOpacity(.7),
                      ),
                      child: Row(
                        children: const [
                          Icon(MaterialIcons.star,
                              color: Colors.amber, size: 18),
                          SizedBox(width: 5),
                          Text(
                            "5",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
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
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                          ),
                          child: ExtendedImage.network(
                            "https://media.istockphoto.com/id/492842106/photo/bank-of-tanzanias-twin-towers-dar-es-salaam.jpg?s=612x612&w=0&k=20&c=1fCRslzNwyHCsjhWFFw0f-oMxjWfvESHBAWcKUBmcyQ=",
                            width: thisWidth,
                            height: Get.height / 3.9,
                            fit: BoxFit.cover,
                            cache: true,
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 20, left: 18, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: Get.width / 3,
                                    child: const Text(
                                      "Kigamboni",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15,
                                          height: 1.1,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  const Text(
                                    "Tsh 500K",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Icon(MaterialIcons.location_pin,
                                      color: Colors.black45, size: 18),
                                  SizedBox(width: 5),
                                  Text(
                                    "Ferry Kigamboni",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black45),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: const InfoSquare(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: colorTrans2.withOpacity(.7),
                      ),
                      child: Row(
                        children: const [
                          Icon(MaterialIcons.star,
                              color: Colors.amber, size: 18),
                          SizedBox(width: 5),
                          Text(
                            "10",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ),
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
        )
      ],
    ),
  );
}

Widget listLatest() {
  final double thisWidth = Get.width / 1.45;
  final double thisHeight =
      (GetPlatform.isAndroid) ? Get.height / 2.9 : Get.height / 3.5;
  return SizedBox(
    height: thisHeight,
    child: ListView(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
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
              margin: const EdgeInsets.only(
                top: 20,
                left: 18,
                right: 20,
                bottom: 3,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                          ),
                          child: ExtendedImage.network(
                            "https://www.mikuminationalpark.net/wp-content/uploads/2020/02/dar-es-salaam-city.jpg",
                            width: thisWidth,
                            height: thisHeight / 1.8,
                            fit: BoxFit.cover,
                            cache: true,
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 20, left: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: Get.width / 2.5,
                                    child: const Text(
                                      "Kigamboi Mikadi",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          height: 1.1,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  const Text(
                                    "Tsh 200K",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Icon(MaterialIcons.location_pin,
                                      color: Colors.black45, size: 14),
                                  SizedBox(width: 5),
                                  Text(
                                    "Kigamboin Ferry",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black45),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: const InfoSquare(
                                  // iconSize: 14,
                                  // spaceWidth: 5,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    right: 15,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: colorTrans2.withOpacity(.7),
                      ),
                      child: Row(
                        children: const [
                          Icon(MaterialIcons.star,
                              color: Colors.amber, size: 18),
                          SizedBox(width: 5),
                          Text(
                            "7",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
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
              margin: const EdgeInsets.only(
                top: 20,
                left: 18,
                right: 20,
                bottom: 3,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                          ),
                          child: ExtendedImage.network(
                            "https://www.mikuminationalpark.net/wp-content/uploads/2020/02/dar-es-salaam-city.jpg",
                            width: thisWidth,
                            height: thisHeight / 1.8,
                            fit: BoxFit.cover,
                            cache: true,
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 20, left: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: Get.width / 2.5,
                                    child: const Text(
                                      "Kigamboi Mikadi",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          height: 1.1,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  const Text(
                                    "Tsh 200K",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Icon(MaterialIcons.location_pin,
                                      color: Colors.black45, size: 14),
                                  SizedBox(width: 5),
                                  Text(
                                    "Kigamboin Ferry",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black45),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: const InfoSquare(
                                  // iconSize: 14,
                                  // spaceWidth: 5,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    right: 15,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: colorTrans2.withOpacity(.7),
                      ),
                      child: Row(
                        children: const [
                          Icon(MaterialIcons.star,
                              color: Colors.amber, size: 18),
                          SizedBox(width: 5),
                          Text(
                            "7",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}
