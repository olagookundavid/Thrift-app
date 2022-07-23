import 'dart:io';

import 'package:dio/dio.dart';
import 'package:thrift_project/local_storage/shared_preferences.dart';
import 'package:thrift_project/services/http_service.dart';

class TransferService {
  HttpService httpService = HttpService();
  Future<bool> transfer(String accountno, String cardno, String receivername,
      String receiveraccno, String amountno, String bank) async {
    String? token = LoginSharedPreferences.getUserToken() ?? '';
    try {
      Response response = await httpService.post(
        header: {'Authorization': 'Bearer $token'},
        '/transaction/transfer',
        // {
        //   "account_number": accountno,
        //   "receiver_account_number":receiveraccno,
        //   "receiver_account_name":  receivername,
        //   "amount":amountno,
        //   "card_number": cardno,
        //   "bank": bank
        // }

        //this is for testing
        {
          "account_number": "3321706635",
          "receiver_account_number": "944027572",
          "receiver_account_name": "Dailey Bloomberg",
          "amount": "2000",
          "card_number": "1234567890",
          "bank": "gtb"
        },
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on SocketException {
      rethrow;
    }
    // catch (e) {
    //   return false;
    // }
  }
}
