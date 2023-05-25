import 'package:aread/services/theme.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import '../../main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../services/size_config.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: mainBackgroundcolor,
      // appBar: AppBar(
      //   title: Text('Profile'),
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(15)),
                Container(
                  child: topIcon(),
                ),
                SizedBox(height: getProportionateScreenHeight(50)),
                //  circular ExtendedImage
                ExtendedImage.network(
                  'https://avatars.githubusercontent.com/u/85387461?v=4',
                  width: getProportionateScreenWidth(150),
                  height: getProportionateScreenHeight(150),
                  // rounded corners
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  fit: BoxFit.cover,
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Text(
                  'Alpha Jozee',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: fontFamily,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(5)),
                const Text(
                  'johndoe@example.com',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                // white background ListTile
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const ListTile(
                    leading: Icon(
                      Icons.person,
                      color: appColor,
                    ),
                    title: Text('Wasifu wangu'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.business,
                      color: appColor,
                    ),
                    title: const Text('Nyumba Zangu'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                    onTap: () {
                      Get.toNamed('/my_properties');
                    },
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.plus_one,
                      color: appColor,
                    ),
                    title: const Text('Ongeza Nyumba'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                    onTap: () {
                      Get.toNamed('/new_property');
                    },
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.security,
                      color: appColor,
                    ),
                    title: const Text('Vigezo & Mashariti'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                    onTap: () {
                      Get.toNamed('/terms');
                    },
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const ListTile(
                    leading: Icon(
                      Icons.directions_run,
                      color: appColor,
                    ),
                    title: Text('Logout'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(100)),
              ],
            ),
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
                onTap: () {
                  Get.back();
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Icon(
                      FontAwesome.user,
                      size: 16,
                      color: Get.theme.disabledColor,
                    ),
                  ),
                ),
              ),
              spaceWidth10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Text("Akaunti",
                    style: Get.theme.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
