import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../services/base_service.dart';

class LoginController extends GetxController {
  var loginKey = GlobalKey<FormState>().obs;

  late TextEditingController 
      emailController,
      passwordController;

  var email = ''.obs;
  var password = ''.obs;

  final isSecured = true.obs;
  final isSecuredRe = true.obs;

  var isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
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
    
    return null;
  }

  
  // loginuser
  void loginUser() async {
    EasyLoading.show(
      status: 'Area D Inakagua...',
      maskType: EasyLoadingMaskType.black,
    );

    try {
      final response = await http.post(
        Uri.parse('$baseURL/login'),
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
    } finally {
      EasyLoading.dismiss();
    }
  }

}
