import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/onboard_controller.dart';
import '../../services/app_texts.dart';
import '../../services/theme.dart';
import '../../widgets/buttons.dart';

class OnboardScreen extends GetView<OnboardingController> {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.selectedPageIndex,
                itemCount: controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          controller.onboardingPages[index].imageAsset,
                          height: 250,
                        ),
                        spaceHeight20,
                        Text(
                          controller.onboardingPages[index].title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        spaceHeight20,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 64.0),
                          child: Text(
                            controller.onboardingPages[index].description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                }),

            // large start button
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Obx(() => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          controller.onboardingPages.length,
                          (index) => Obx(() => Container(
                                margin: const EdgeInsets.all(4),
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                    color: controller.selectedPageIndex.value ==
                                            index
                                        ? appColor
                                        : Colors.grey[300],
                                    shape: BoxShape.circle),
                              )),
                        ),
                      ),
                      spaceHeight20,
                      // inkwell button
                      InkWell(
                        onTap: controller.forwardAction,
                        child: ButtonContainer(
                          text: controller.isLastPage ? startText : nextText,
                          paddingHorizontal: 0,
                          paddingVertical: 15,
                          sizeText: 16,
                          linearGradient: LinearGradient(
                            colors: [
                              appColor,
                              appColor.withOpacity(.95),
                            ],
                          ),
                        ),
                      ),

                      // ButtonContainer(
                      //   text: controller.isLastPage ? startText : nextText,
                      //   callback: controller.forwardAction,
                      // ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
