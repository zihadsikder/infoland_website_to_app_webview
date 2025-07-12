import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';


import '../controller/webview_controller.dart';

class WebViewScreen extends StatelessWidget {
  final InfoLandWebViewController controller = Get.put(InfoLandWebViewController());

   WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.png'),
            backgroundColor: Colors.transparent,
          ),
        ),
        title: Text(
          'InfoLand',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF4CAF50),
        elevation: 0,
      ),

      body: Column(
        children: [
          // Loading indicator
          Obx(() => controller.isLoading.value
              ? LinearProgressIndicator(
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4CAF50)),
          )
              : SizedBox.shrink()),

          // WebView
          Expanded(
            child: WebViewWidget(controller: controller.webViewController),
          ),
        ],
      ),

      // Bottom navigation bar
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xFF4CAF50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(() => IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: controller.canGoBack.value
                    ? Colors.white
                    : Colors.white54,
              ),
              onPressed: controller.canGoBack.value
                  ? () => controller.goBack()
                  : null,
            )),

            Obx(() => IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: controller.canGoForward.value
                    ? Colors.white
                    : Colors.white54,
              ),
              onPressed: controller.canGoForward.value
                  ? () => controller.goForward()
                  : null,
            )),

            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () => controller.goHome(),
            ),

            IconButton(
              icon: Icon(Icons.refresh, color: Colors.white),
              onPressed: () => controller.reload(),
            ),
          ],
        ),
      ),
    );
  }
}