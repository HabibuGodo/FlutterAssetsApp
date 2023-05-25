import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../services/base_service.dart';
import 'package:http/http.dart' as http;

class ResetPasswordController extends GetxController {
  var forgotKey = GlobalKey<FormState>().obs;

  late TextEditingController emailController;
  var email = ''.obs;

  var isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
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

  // forgot password
  void forgotPassword() async {
    EasyLoading.show(
      status: 'Inarudisha password...',
      maskType: EasyLoadingMaskType.black,
    );

    try {
      final response = await http.post(
        Uri.parse('$baseURL/reset_password'),
        body: {
          'email': email.value,
        },
      ).timeout(const Duration(seconds: 30));

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
