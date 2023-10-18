import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:suhana_test/controller/sharedprefs/user_pref.dart';

import '../model/login_model.dart';
import '../pages/dashboard.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> login(String username, String password) async {
    try {
      isLoading.value = true;

      final apiUrl = Uri.parse(
          'https://www.petroinfotech.com/PetroHSE/api/Admin/ValidateLogin');
      final requestBody = jsonEncode({
        'userName': username,
        'password': password,
        'authType': 'FORMS',
        'ipAddress': '',
      });

      final response = await http.post(apiUrl,
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json'
          },
          body: requestBody);
      final data = loginModelFromJson(response.body);
      if (response.statusCode == 200 && data.message == "SUCCESS") {
        UserPrefs.saveToken(data.token);
        UserPrefs.saveUserId(data.id);
        Get.to(() => DashboardScreen());
      } else {
        Get.snackbar(
          "Login Failed",
          "Please check your username and password",
          backgroundColor: Colors.amberAccent,
          colorText: Colors.white,
        );
      }
    } finally {
      isLoading.value = false;
    }
  }
}
