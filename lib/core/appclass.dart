import 'package:codeedex_test/core/appcolors.dart';
import 'package:codeedex_test/core/apptextstyles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppClass {
  //==========================sharedpref==================================
  Future<void> setPreferences(String token) async {
    var sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString('token', token);
  }

  Future<void> dltPreferences() async {
    var sharedPref = await SharedPreferences.getInstance();
    await sharedPref.clear();
  }

  Future<String?> getToken() async {
    var sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString('token');
  }

  //===================mediaquery===============================

  double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
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
