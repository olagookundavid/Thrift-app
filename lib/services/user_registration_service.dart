import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:thrift_project/local_storage/shared_preferences.dart';
import 'package:thrift_project/services/http_service.dart';

class Registration {
  HttpService httpService = HttpService();
  Future<bool> registerUser(
      String firstname,
      String lastname,
      String middlename,
      String email,
      String phoneNo,
      String homeAddress,
      String businessAddress,
      String state,
      String bvn,
      String nin,
      String status,
      String balance,
      String plan,
      String existingcardnumber

      // {
      //         "firstname": firstname,
      //         "lastname": lastname,
      //         "middlename": middlename,
      //         "personal_email": email,
      //         "phone_no": phoneNo,
      //         "home_address": homeAddress,
      //         "business_address": businessAddress,
      //         "state": state,
      //         "bvn": bvn,
      //         "nin": nin,
      //         "status": status,
      //         "balance": balance,
      //         "contribution_plan": plan,
      //         "existing_card_number": existingcardnumber
      //       },

      ) async {
    String? token = LoginSharedPreferences.getUserToken();
    try {
      Response response = await httpService.post(
          header: {'Authorization': 'Bearer $token'},
          '/register/customer',
          {
            "firstname": "Walter",
            "lastname": "O'Brien",
            "middlename": "M",
            "personal_email": "wb@mail.com",
            "phone_no": "+1234567890293",
            "home_address": "2A Boulevard, Hollywood",
            "business_address": "2A Boulevard, Hollywood",
            "state": "Kogi",
            "bvn": "58945859458955",
            "nin": "58945859458955",
            "status": "Verified",
            "balance": "0.00",
            "contribution_plan": "weekly",
            "existing_card_number": ""
          });
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
