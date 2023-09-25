import 'package:calculator_app/Screens/homescreen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  navToNextPage() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offAll(
        () => CalculatorScreen(),
      );
    });
    update();
  }
}
