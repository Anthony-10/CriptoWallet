import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/auth/view/auth_view.dart';
import 'package:new_crypto_wallet/onboarding/model/onboarding_model.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();
  forwardAction() {
    if (isLastPage) {
      Get.to(AuthView());
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardingModel> onboardingPages = [
    OnboardingModel("assets/slide1.jpg", "Trade"),
    OnboardingModel("assets/slide2.jpg", "Buy"),
    OnboardingModel("assets/slide3.jpg", "Sell")
  ];
}
