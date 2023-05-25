import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../models/onboard_model.dart';
import '../services/images.dart';
import '../services/my_pref.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  void onInit() {
    super.onInit();
    getLocationDetails();
  }

  forwardAction() {
    if (isLastPage) {
      checkLocationEnabled();
      // read country

      // read city
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  void checkLocationEnabled() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are disabled
      // You can show an alert or take appropriate action
      print('Location services are disabled');
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Tafaadhali washa Location yako'),
          content: const Text(
              'Ili uweze kutumia huduma hii, tafadhali washa location yako kwenye simu yako. 📍'),
          actions: <Widget>[
            // TextButton(
            //   child: const Text('Cancel'),
            //   onPressed: () => Navigator.of(context).pop(),
            // ),
            TextButton(
              child: const Text(
                'Washa Location',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                // Open app settings on the device
                Geolocator.openAppSettings();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    } else {
      // Location services are enabled
      // You can proceed with retrieving the location
      print('Location services are enabled');

      Future.delayed(const Duration(seconds: 3), () {
        Get.toNamed('/login');
      });
    }
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(onboardMaps, "Tafuta kwa Ramani",
        "Tumia ramani kuona nyumba zilizo karibu na wewe"),
    OnboardingInfo(
        onboardHouse, "Tafuta Nyumba", "Pata nyumba ya ndoto zako kwa urahisi"),
    OnboardingInfo(onboardApartment, "Tafuta Apartment",
        "Pata apartment ya ndoto zako kwa urahisi"),
  ];

  void requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showDialog(
          context: Get.context!,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Location Access Denied'),
            content: const Text(
                'To enable location services, please go to your device settings and allow the app to access your location.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
        return;
      }
    }
  }

  Future getLocationDetails() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Handle the scenario where location services are disabled
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Location Access Denied'),
          content: const Text(
              'To enable location services, please go to your device settings and allow the app to access your location.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
      return;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showDialog(
          context: Get.context!,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Location Access Denied'),
            content: const Text(
                'To enable location services, please go to your device settings and allow the app to access your location.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemarks != null && placemarks.isNotEmpty) {
      Placemark placemark = placemarks[0];
      String? country = placemark.country;
      String? city = placemark.locality;

      // write to storage
      authBox.write('country', country);
      authBox.write('city', city);
      authBox.write('latitude', position.latitude);
      authBox.write('longitude', position.longitude);
      print('Latitude: ${position.latitude}');
      print('Longitude: ${position.longitude}');
      print('Country: $country');
      print('City: $city');
    }
  }
}
