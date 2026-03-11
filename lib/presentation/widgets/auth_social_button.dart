import 'package:assignment_recastdesigns/core/constants/app_values.dart';
import 'package:flutter/material.dart';
import '../../core/extension/media_query_extension.dart';

class AuthSocialButton extends StatelessWidget {
  final String title;
  final Widget icon;

  const AuthSocialButton({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.wp(5)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.wp(3),
          vertical: context.hp(1.9),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.white38, width: 1.5),
        ),
        child: Row(
          children: [
            Container(

              height: context.hp(3),

              child: icon,
            ),

            SizedBox(width: context.wp(2)),

            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: AppValues.satoshiFont,
                    fontSize: context.sp(16),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(width: context.wp(6) + context.wp(2)),
          ],
        ),
      ),
    );
  }
}