import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../services/size_config.dart';
import '../../services/theme.dart';
import '../../widgets/buttons.dart';
import '../../widgets/components.dart';

class SinglePropertyScreen extends StatelessWidget {
  const SinglePropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(  
      padding: const EdgeInsets.only(top: 0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            mainBackgroundcolor,
            mainBackgroundcolor2,
            Colors.white,
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
        ),
      ),
      child: SizedBox(
        width: Get.width,
        height: Get.height,
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: mainBackgroundcolor,
              title: topIcon(),
              elevation: 0.1,
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
            floatingActionButton: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () async {
                    
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                    child: ButtonContainer(
                      text: "Piga Simu",
                      boxShadow: BoxShadow(
                        color: Get.theme.primaryColor.withOpacity(.5),
                        blurRadius: 10.0,
                        offset: const Offset(1, 3),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: createBody(),
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
              InkWell(
                onTap: () {},
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Icon(
                      FontAwesome.chevron_left,
                      size: 16,
                      color: Get.theme.disabledColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text("Taarifa Zaidi..",
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
                  FontAwesome.star,
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

Widget createBody() {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.only(top: 5),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: getProportionateScreenHeight(15)),
          InkWell(
            onTap: () {
              // debugPrint("clicked image");
              // Get.dialog(MyTheme.photoView(rental.image));
            },
            child: createImage(),
          ),
          SizedBox(height: getProportionateScreenHeight(15)),
          Container(
            margin: const EdgeInsets.only(left: 15),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: const Text(
              "Maelezo ya Nyumba",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            padding:
                const EdgeInsets.only(left: 20, right: 25, top: 5, bottom: 5),
            child: const Text(
              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using",
              style: TextStyle(
                color: colorTrans1,
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(15)),
          Container(
            margin: const EdgeInsets.only(left: 15),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: const Text(
              "Sifa za Nyumba",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700),
            ),
          ),
          // ina bafu
          Container(
            margin: const EdgeInsets.only(left: 15),
            padding:
                const EdgeInsets.only(left: 20, right: 25, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Ina Bafu",
                  style: TextStyle(
                    color: colorTrans1,
                  ),
                ),
                Icon(
                  FontAwesome.check,
                  color: Colors.green,
                  size: 18,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            padding:
                const EdgeInsets.only(left: 20, right: 25, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Ina Umeme",
                  style: TextStyle(
                    color: colorTrans1,
                  ),
                ),
                Icon(
                  FontAwesome.check,
                  color: Colors.green,
                  size: 18,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            padding:
                const EdgeInsets.only(left: 20, right: 25, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Ina Maji",
                  style: TextStyle(
                    color: colorTrans1,
                  ),
                ),
                Icon(
                  FontAwesome.check,
                  color: Colors.green,
                  size: 18,
                ),
              ],
            ),
          ),

          // picha za nyumba
          SizedBox(height: getProportionateScreenHeight(15)),

          Container(
            margin: const EdgeInsets.only(left: 15),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: const Text(
              "Picha za Nyumba",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700),
            ),
          ),

          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                        right: 8,
                      ),
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ExtendedImage.network(
                          "https://www.mikuminationalpark.net/wp-content/uploads/2020/02/dar-es-salaam-city.jpg",
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          cache: true,
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ExtendedImage.network(
                          "https://www.mikuminationalpark.net/wp-content/uploads/2020/02/dar-es-salaam-city.jpg",
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          cache: true,
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ExtendedImage.network(
                          "https://www.mikuminationalpark.net/wp-content/uploads/2020/02/dar-es-salaam-city.jpg",
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          cache: true,
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ExtendedImage.network(
                          "https://www.mikuminationalpark.net/wp-content/uploads/2020/02/dar-es-salaam-city.jpg",
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          cache: true,
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ExtendedImage.network(
                          "https://www.mikuminationalpark.net/wp-content/uploads/2020/02/dar-es-salaam-city.jpg",
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          cache: true,
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ExtendedImage.network(
                          "https://www.mikuminationalpark.net/wp-content/uploads/2020/02/dar-es-salaam-city.jpg",
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          cache: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: getProportionateScreenHeight(15)),
          Container(
            margin: const EdgeInsets.only(left: 15),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: const Text(
              "Mawasiliano",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(left: 15),
            padding:
                const EdgeInsets.only(left: 20, right: 25, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Simu",
                  style: TextStyle(
                    color: colorTrans1,
                  ),
                ),
                Text(
                  "0743196599",
                  style: TextStyle(
                    color: colorTrans1,
                  ),
                ),
              ],
            ),
          ),

          // urge

          SizedBox(height: getProportionateScreenHeight(100)),
        ],
      ),
    ),
  );
}

Widget createImage() {
  final double thisWidth = Get.width; //  / 1.2;
  // String unitPrice = "${e.unitPrice}".tr;
  return Container(
    padding: const EdgeInsets.only(left: 15),
    child: Container(
      width: thisWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
      ),
      margin: const EdgeInsets.only(
        bottom: 3,
        right: 12,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ExtendedImage.network(
                    "https://www.mikuminationalpark.net/wp-content/uploads/2020/02/dar-es-salaam-city.jpg",
                    width: thisWidth - 1,
                    height: Get.height / 3.9,
                    fit: BoxFit.cover,
                    cache: true,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 18, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: Get.width / 2.1,
                            child: const Text(
                              "Kigamboni City",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 15,
                                  height: 1.1,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w700),
                              softWrap: false,
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              "10,000,000 Tshs",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.w700),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(MaterialIcons.location_pin,
                                    color: Colors.black45, size: 18),
                                SizedBox(width: 5),
                                Text(
                                  "Posta Ferry",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black45),
                                ),
                              ],
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(FontAwesome.phone,
                                      size: 15, color: Get.theme.primaryColor),
                                  spaceWidth5,
                                  const Text("0743196599",
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.black45))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: const InfoSquare(
                        iconSize: 17,
                        spaceWidth: 6,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 18,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: colorTrans2.withOpacity(.8),
              ),
              child: Row(
                children: const [
                  Icon(MaterialIcons.star, color: Colors.amber, size: 18),
                  SizedBox(width: 5),
                  Text(
                    "4",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
