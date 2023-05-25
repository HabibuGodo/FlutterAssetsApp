import 'package:aread/services/images.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/reset_password_controller.dart';
import '../../main.dart';
import '../../services/app_texts.dart';
import '../../services/theme.dart';
import '../../widgets/buttons.dart';

class ForgotPasswordScreen extends GetView<ResetPasswordController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            mainBackgroundcolor,
            mainBackgroundcolor2,
            mainBackgroundcolor3,
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
            body: Container(
              width: Get.width,
              height: Get.height,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.forgotKey.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // centered logo
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            logoImage,
                            width: 100,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: const Text(
                            forgotPasswordTitle,
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: const Text(
                            forgotPasswordDesc,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        spaceHeight20,
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            gradient: LinearGradient(
                              colors: [
                                Get.theme.canvasColor,
                                Get.theme.canvasColor.withOpacity(.98)
                              ],
                            ),
                          ),
                          child: SizedBox(
                            width: Get.width,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(fontSize: 15),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  FontAwesome.envelope,
                                  size: 18,
                                  color: Get.theme.colorScheme.background,
                                ),
                                border: InputBorder.none,
                                hintText: "Email yako",
                              ),
                              controller: controller.emailController,
                              validator: (value) =>
                                  controller.validateEmail(value!),
                              onSaved: (value) =>
                                  controller.email.value = value!,
                            ),
                          ),
                        ),
                        spaceHeight20,
                        Container(
                          margin: const EdgeInsets.only(bottom: 0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () async {
                                if (controller.forgotKey.value.currentState!
                                    .validate()) {
                                  controller.forgotKey.value.currentState!
                                      .save();
                                  controller.forgotPassword();
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                child: const ButtonContainer(
                                  text: forgotBtnText,
                                ),
                              ),
                            ),
                          ),
                        ),
                        spaceHeight20,
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                  text: noAccount,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: fontFamily,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: registerText,
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          fontFamily: fontFamily,
                                          fontSize: 16,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // navigate to desired screen
                                            Get.back();
                                            Get.toNamed('/register');
                                          })
                                  ]),
                            ),
                          ),
                        ),
                        spaceHeight50,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
