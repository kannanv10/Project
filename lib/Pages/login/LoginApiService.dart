import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trail2/Pages/firstpage.dart';

import '../common/ApiUtils.dart';
import '../const/ApiConstants.dart';
import 'User.dart';

class LoginApiService {
  static var userId = '';

  Future<LoginResponse> doLogin(String email, String password) async {
    try {
      LoginRequest req = LoginRequest(email: email, password: password);
      http.Response response = await ApiUtils.instance
          .post(ApiConstants.loginEndpoint, req.toJson(), false);

      if (response.statusCode == 200 && response.body.isNotEmpty) {
        var result = LoginResponse.fromJson(json.decode(response.body));

        return LoginResponse.fromJson(json.decode(response.body));
      } else {
        print(response.statusCode);
        return Future.error("Error response from api");
      }
    } catch (e) {
      return Future.error("Error occurred while performing login api $e");
    }
  }


  navigateDashboardPage(BuildContext context) async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => CropDetailsPage()));
  }

}
