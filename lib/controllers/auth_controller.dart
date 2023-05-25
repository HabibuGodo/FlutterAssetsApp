import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../services/base_service.dart';

class RegisterController extends GetxController {
  var registerKey = GlobalKey<FormState>().obs;

  late TextEditingController 
      fullnameController,
      phoneController,
      emailController,
      passwordController,
      confirmPasswordController;
  var phoneNumber = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var fullname = ''.obs;

  final isSecured = true.obs;
  final isSecuredRe = true.obs;

  var isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    fullnameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    fullnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  // validate fullname
  String? validateFullname(String value) {
    if (value.isEmpty) {
      return 'Jina kamili linahitajika';
    }
    return null;
  }

  // validate phone number
  String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Namba ya simu inahitajika';
    }
    if (value.length < 10) {
      return 'Tarakimu 10 zinahitajika';
    }
    // start with 0
    if (!value.startsWith('0')) {
      return 'Namba ya simu ianze na 0';
    }
    return null;
  }

  // validate email
  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Barua pepe inahitajika';
    }
    if (!value.isEmail) {
      return 'Barua pepe sio sahihi';
    }
    return null;
  }

  // validate password
  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password inahitajika';
    }
    if (value.length < 6) {
      return 'Password inahitaji tarakimu 6 au zaidi';
    }
    return null;
  }

  // validate confirm password
  String? validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return 'Password inahitajika';
    }
    if (value.length < 6) {
      return 'Password inahitaji tarakimu 6 au zaidi';
    }
    if (value != passwordController.text) {
      return 'Password hazifanani';
    }
    return null;
  }

  // Submit Form
  void checkValidation() async {
    final isValid = registerKey.value.currentState!.validate();
    if (!isValid) {
      Get.snackbar(
        'Shida ya Usajili',
        'Tafadhali angalia makosa yaliyopo na ujaribu tena.',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    } else {
      registerKey.value.currentState!.save();

      Get.snackbar(
        'Usajili Umeanza',
        'Tafadhali subiri...',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.green,
      );

      registerUser();
    }
  }

  Future<void> registerUser() async {
    EasyLoading.show(
      status: 'Usajili Unafanyika...',
      maskType: EasyLoadingMaskType.black,
    );

    // get location

    try {
      final response = await http.post(
        Uri.parse(baseURL + '/register'),
        body: {
          'fullName': phoneNumber.value,
          'email': phoneNumber.value,
          'password': phoneNumber.value,
          'phone': phoneNumber.value,
          'latitude': phoneNumber.value,
          'location': phoneNumber.value,
        },
      ).timeout(Duration(seconds: 30));

      // check response if has errorr
      if (response.body.contains('')) {
      } else if (response.body.contains('')) {
      } else {}
    } catch (e) {
      print(e);
    } on SocketException {
      EasyLoading.showError('No internet connection');
    } finally {
      EasyLoading.dismiss();
    }
  }

  // loginuser
  void loginUser() async {
    EasyLoading.show(
      status: 'Area D Inakagua...',
      maskType: EasyLoadingMaskType.black,
    );

    try {
      final response = await http.post(
        Uri.parse(baseURL + '/login'),
        body: {
          'email': email.value,
          'password': password.value,
        },
      ).timeout(Duration(seconds: 30));

      // check response if has errorr
      if (response.body.contains('phone')) {
      } else if (response.body.contains('')) {
      } else {}
    } catch (e) {
      print(e);
    } on SocketException {
      EasyLoading.showError('No internet connection');
    } finally {
      EasyLoading.dismiss();
    }
  }

  // forgot password
  void forgotPassword() async {
    EasyLoading.show(
      status: 'Inarudisha password...',
      maskType: EasyLoadingMaskType.black,
    );

    try {
      final response = await http.post(
        Uri.parse(baseURL + '/reset_password'),
        body: {
          'email': email.value,
        },
      ).timeout(Duration(seconds: 30));

      // check response if has errorr
      if (response.body.contains('phone')) {
      } else if (response.body.contains('')) {
      } else {}
    } catch (e) {
      print(e);
    } on SocketException {
      EasyLoading.showError('No internet connection');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
