import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suhana_test/model/audit_list_model.dart';

import '../model/audit_bar_model.dart';

class AuditController extends GetxController {
  RxList<AuditData> auditBarData = <AuditData>[].obs;

  RxList<AuditList> auditListData = <AuditList>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAuditData();
    fetchAuditListData();
  }

  Future<void> fetchAuditData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var authToken = preferences.getString('token');
    var userId = preferences.getInt('id');
    try {
      final apiUrl = Uri.parse(
          'https://www.petroinfotech.com/PetroHSE/api/Audit/GetDashboardAuditList?UserCompanyCode=1x`&loggedInUserID=$userId');

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
        final List<dynamic> rawData = json.decode(response.body);
        auditBarData.assignAll(rawData.map((data) => AuditData.fromJson(data)));
      } else {
      throw UnimplementedError();
      }
    } catch (error) {
      throw UnimplementedError();
    }
  }

  Future<void> fetchAuditListData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var authToken = preferences.getString('token');
    var userId = preferences.getInt('id');
    try {
      final apiUrl = Uri.parse(
          'https://www.petroinfotech.com/PetroHSE/api/Audit/GetAuditList?mode=ALL&status=ALL');

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
        final List<dynamic> rawData = json.decode(response.body);
        auditListData
            .assignAll(rawData.map((data) => AuditList.fromJson(data)));
      } else {
        throw UnimplementedError();
      }
    } catch (error) {
      throw UnimplementedError();
    }
  }
}
