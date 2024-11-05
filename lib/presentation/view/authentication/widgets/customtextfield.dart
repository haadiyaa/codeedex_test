import 'package:codeedex_test/core/appcolors.dart';
import 'package:codeedex_test/presentation/providers/functionsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    this.validator,
    required this.controller,
    this.keyboardType,
    this.onTap,
    this.obscureText = false,
  });

  final String text;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Consumer<FunctionsProvider>(
        builder: (context, functionsProvider, child) {
          return TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            onTap: onTap,
            keyboardType: keyboardType,
            controller: controller,
            obscureText: obscureText && !functionsProvider.isPasswordvisible,
            validator: validator,
            decoration: InputDecoration(
              suffixIcon: obscureText
                  ? IconButton(
                      onPressed: () {
                        functionsProvider.togglePassword();
                      },
                      icon: Icon(
                        functionsProvider.isPasswordvisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.green1,
                      ),
                    )
                  : null,
              labelText: text,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.green1,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.green1,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.green1,
                  width: 1,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
