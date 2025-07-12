import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToWebView();
  }

  void _navigateToWebView() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed('/webview');
    });
  }
}