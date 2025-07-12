import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'app/views/splash_screen.dart';
import 'app/views/webview_screen.dart';


void main() {
  runApp(InfoLandApp());
}

class InfoLandApp extends StatelessWidget {
  const InfoLandApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'InfoLand',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Color(0xFF4CAF50),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/webview', page: () => WebViewScreen()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}