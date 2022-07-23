import 'dart:io';

import 'package:dio/dio.dart';
import 'package:thrift_project/local_storage/shared_preferences.dart';
import 'package:thrift_project/services/http_service.dart';

class WithdrawalService {
  HttpService httpService = HttpService();
  Future<bool> withdraw(
      String cardno, String accountno, String amountno) async {
    String? token = LoginSharedPreferences.getUserToken() ?? '';
    try {
      Response response = await httpService.post(
          header: {'Authorization': 'Bearer $token'},
          '/transaction/withdraw',
          {
            "card_number": "7729039592",
            "account_number": "7732015500",
            "amount": "5000"
          });
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on SocketException {
      rethrow;
    } catch (e) {
      return false;
    }
  }
}
