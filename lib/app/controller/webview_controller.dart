import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InfoLandWebViewController extends GetxController {
  late WebViewController webViewController;
  var isLoading = true.obs;
  var canGoBack = false.obs;
  var canGoForward = false.obs;
  var currentUrl = ''.obs;

  final String initialUrl = 'https://infoland.ng';

  @override
  void onInit() {
    super.onInit();
    initializeWebView();
  }

  void initializeWebView() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (progress == 100) {
              isLoading.value = false;
            }
          },
          onPageStarted: (String url) {
            isLoading.value = true;
            currentUrl.value = url;
          },
          onPageFinished: (String url) {
            isLoading.value = false;
            _updateNavigationState();
          },
          onWebResourceError: (WebResourceError error) {
            Get.snackbar(
              'Error',
              'Failed to load page: ${error.description}',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          },
        ),
      )
      ..loadRequest(Uri.parse(initialUrl));
  }

  void _updateNavigationState() async {
    canGoBack.value = await webViewController.canGoBack();
    canGoForward.value = await webViewController.canGoForward();
  }

  void goBack() async {
    if (await webViewController.canGoBack()) {
      webViewController.goBack();
    }
  }

  void goForward() async {
    if (await webViewController.canGoForward()) {
      webViewController.goForward();
    }
  }

  void reload() {
    webViewController.reload();
  }

  void goHome() {
    webViewController.loadRequest(Uri.parse(initialUrl));
  }
}