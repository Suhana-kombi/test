import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/home_model.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  HomeModel? homeModel;
  @override
  void onInit() {
    super.onInit();
    fetchHomePageData();
  }

  Future<void> fetchHomePageData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var authToken = preferences.getString('token');
    var userId = preferences.getInt('id');
    try {
      isLoading.value = true;

      final apiUrl = Uri.parse(
          'https://www.petroinfotech.com/PetroHSE/api/Dashboard/GetHomePage?companyCode=1&userId=$userId');
      final response = await http.get(
        apiUrl,
        headers: {
          'Authorization': 'Bearer $authToken',
          'CompanyCode': '1',
          'UserId': userId.toString(),
          'appType': 'MOB',
          'content-type': 'application/json',
          'accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        homeModel = homeModelFromJson(jsonDecode(response.body));
      } else {
        homeModel = null;
        isLoading.value = false;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
