import 'dart:convert';

import 'package:codeedex_test/core/appclass.dart';
import 'package:codeedex_test/data/models/loginmodel.dart';
import 'package:codeedex_test/data/repositories/apirepositories.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  LoginModel? loginModel;
  String msg = '';
  String useremail = '';
  Future<void> login({required String email, required String password}) async {
    try {
      await ApiRepository().login(email: email, password: password).then(
        (response) async {
          final data = jsonDecode(response.body);
          print('login $data');
          if (response.statusCode == 201) {
            loginModel = LoginModel.fromJson(data);
            useremail = email;
            await AppClass().setPreferences(loginModel!.accessToken);
            msg = 'Login Success';
          } else {
            msg = 'Login Failed! Please try again.';
          }
        },
      );
    } catch (e) {
      msg = 'Login Failed! ${e.toString()}';
      print(e.toString());
    } finally {
      notifyListeners();
    }
  }
}
