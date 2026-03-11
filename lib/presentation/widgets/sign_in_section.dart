import 'package:assignment_recastdesigns/core/constants/app_colors.dart';
import 'package:assignment_recastdesigns/core/constants/app_values.dart';
import 'package:assignment_recastdesigns/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import '../../core/extension/media_query_extension.dart';
import '../view_model/auth_cubit.dart';
import 'auth_social_button.dart';
import 'auth_divider.dart';

class SignInSection extends StatelessWidget {
  final AuthCubit cubit;

  const SignInSection({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey(AppValues.signInButtons),
      children: [
        AuthSocialButton(
          title: AppValues.continueWithApple,
          icon: Icon(
            Icons.apple,
            color: Colors.white,
            size: context.sp(30),
          ),
        ),
        SizedBox(height: context.hp(2)),
        AuthSocialButton(
          title: AppValues.continueWithGoogle,
          icon: Image.asset(
            fit: BoxFit.cover,
            ImageAsset.google,

          ),
        ),
        const AuthDivider(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.wp(5),
            vertical: context.hp(1),
          ),
          child: GestureDetector(
            onTap: cubit.showRegister,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.wp(4.5),
                vertical: context.hp(2),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.borderColor,
              ),
              child: Center(
                child: Text(
                  AppValues.continueWithOasis,
                  style: TextStyle(
                    fontFamily: AppValues.satoshiFont,
                    fontSize: context.sp(16),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppValues.alreadyHaveAccount,
                style: TextStyle(
                  fontFamily:AppValues.satoshiFont,
                  fontSize: context.sp(13),
                  fontWeight: FontWeight.bold,
                  color: AppColor.grey200,
                ),
              ),
              GestureDetector(
                onTap: cubit.showSignIn,
                child: Text(
                  AppValues.login,
                  style: TextStyle(
                    fontFamily: AppValues.satoshiFont,
                    fontSize: context.sp(13),
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader =  LinearGradient(
                        colors: [AppColor.firstGradient, AppColor.secondGradient],
                      ).createShader(
                        const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}