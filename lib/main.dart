import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Test by Petro Infotech',
     debugShowCheckedModeBanner: false,
      home:  LoginPage(),
    );
  }
}

