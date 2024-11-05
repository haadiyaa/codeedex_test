import 'package:codeedex_test/core/appcolors.dart';
import 'package:codeedex_test/core/apptextstyles.dart';
import 'package:flutter/material.dart';

class AppClass {
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
