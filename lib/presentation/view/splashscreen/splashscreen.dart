import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:codeedex_test/core/appcolors.dart';
import 'package:codeedex_test/core/apptextstyles.dart';
import 'package:codeedex_test/presentation/view/authentication/view/loginpage.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
        backgroundColor: AppColors.white,
        childWidget: const Center(
          child: Text(
            'MotoMart.',
            style: AppTextStyles.head1,
          ),
        ),
        onAnimationEnd: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => LoginPage()),
          );
        },
      ),
    );
  }
}
