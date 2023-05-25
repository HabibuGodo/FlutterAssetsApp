import 'package:aread/services/images.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';
import '../../main.dart';
import '../../services/app_texts.dart';
import '../../services/theme.dart';
import '../../widgets/buttons.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

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
                    key: controller.loginKey.value,
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
                            loginWelcome,
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
                            loginWelcomeText,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        spaceHeight20,
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
                            child: Obx(
                              () => TextFormField(
                                controller: controller.passwordController,
                                validator: (value) =>
                                    controller.validatePassword(value!),
                                onSaved: (value) =>
                                    controller.password.value = value!,
                                obscureText: controller.isSecured.value,
                                style: const TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    FontAwesome.key,
                                    size: 18,
                                    color: Get.theme.colorScheme.background,
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      controller.isSecured.value =
                                          !controller.isSecured.value;
                                    },
                                    child: Icon(
                                      controller.isSecured.value
                                          ? FontAwesome.eye
                                          : FontAwesome.eye_slash,
                                      size: 18,
                                      color: Get.theme.colorScheme.background,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        spaceHeight10,
                        Container(
                          alignment: Alignment.centerRight,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Get.toNamed('/forgot_password');
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                margin: const EdgeInsets.only(
                                    left: 0, right: 0, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      forgotPasswordText,
                                      style: textBold.copyWith(
                                        fontSize: 13,
                                        decoration: TextDecoration.underline,
                                        color: Get.theme.colorScheme.background,
                                      ),
                                    )
                                  ],
                                ),
                              ),
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
                                Get.toNamed('/home');
                                // if (controller.loginKey.value.currentState!
                                //     .validate()) {
                                //   controller.loginKey.value.currentState!
                                //       .save();
                                //   controller.loginUser();
                                // }
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                child: const ButtonContainer(
                                  text: loginText,
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
