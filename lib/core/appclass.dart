import 'package:codeedex_test/core/appcolors.dart';
import 'package:codeedex_test/core/apptextstyles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppClass {
  //==========================sharedpref==================================
  Future<void> setPreferences(String token) async {
    var sharedPref =await  SharedPreferences.getInstance();
    await sharedPref.setString('token', token);
  }
  Future<String?> getToken() async {
    var sharedPref =await  SharedPreferences.getInstance();
    return sharedPref.getString('token');
  }

  //========================snackbars=======================================
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> successSnackbar(
      BuildContext context, String msg) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.green1,
        content: Text(
          msg,
          style: AppTextStyles.whiteText,
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> errorSnackbar(
      BuildContext context, String msg) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.red,
        content: Text(
          msg,
          style: AppTextStyles.whiteText,
        ),
      ),
    );
  }
}
