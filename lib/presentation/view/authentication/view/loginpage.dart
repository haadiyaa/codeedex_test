import 'package:codeedex_test/core/appclass.dart';
import 'package:codeedex_test/core/appcolors.dart';
import 'package:codeedex_test/core/constants.dart';
import 'package:codeedex_test/presentation/providers/functionsprovider.dart';
import 'package:codeedex_test/presentation/view/authentication/widgets/customtextfield.dart';
import 'package:codeedex_test/presentation/view/home/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                highlightColor: AppColors.green1,
                baseColor: AppColors.green0,
                child: Text(
                  'Login.',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: AppColors.green0,
                  ),
                ),
              ),
              Constants.height20,
              CustomTextField(
                obscureText: false,
                text: 'Email',
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Enter your Email';
                  }
                  return null;
                },
                controller: email,
              ),
              CustomTextField(
                obscureText: true,
                text: 'Password',
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Enter your Password';
                  }
                  return null;
                },
                controller: password,
              ),
              Constants.height10,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: AppColors.green0,
                    foregroundColor: AppColors.white,
                  ),
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      AppClass().successSnackbar(context, "Login Success");
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => HomePage()));
                    }
                  },
                  child: const Text('LOGIN'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}