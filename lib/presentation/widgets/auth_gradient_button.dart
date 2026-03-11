import 'package:assignment_recastdesigns/core/constants/app_colors.dart';
import 'package:assignment_recastdesigns/core/constants/app_values.dart';
import 'package:flutter/material.dart';
import '../../core/extension/media_query_extension.dart';

class AuthGradientButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const AuthGradientButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: context.hp(1.8)),
        decoration: BoxDecoration(
          gradient:  LinearGradient(
            colors: [AppColor.firstGradient,AppColor.secondGradient],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: AppValues.satoshiFont,
              fontSize: context.sp(16),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}