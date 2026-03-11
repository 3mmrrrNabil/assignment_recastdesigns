import 'package:assignment_recastdesigns/core/constants/app_colors.dart';
import 'package:assignment_recastdesigns/core/constants/app_values.dart';
import 'package:flutter/material.dart';
import '../../core/extension/media_query_extension.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppValues.welcome,
          style: TextStyle(
            fontFamily: AppValues.satoshiFont,
            fontSize: context.sp(20),
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..shader =  LinearGradient(
                colors: [AppColor.firstGradient, AppColor.secondGradient],
              ).createShader(
                const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
              ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.hp(2)),
          child: Column(
            children: [
              Text(
                textAlign: TextAlign.center,
AppValues.description1,
                style: TextStyle(
                  fontFamily: AppValues.satoshiFont,
                  fontSize: context.sp(12),
                  fontWeight: FontWeight.w400,
                  color: Colors.white54,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                AppValues.description2,
                style: TextStyle(
                  fontFamily: AppValues.satoshiFont,
                  fontSize: context.sp(12),
                  fontWeight: FontWeight.w400,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}