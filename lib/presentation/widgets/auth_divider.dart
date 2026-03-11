import 'package:flutter/material.dart';
import '../../core/constants/app_values.dart';
import '../../core/extension/media_query_extension.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wp(4),vertical: context.hp(2)),
            child: const Divider(color: Colors.grey, thickness: 1),
          ),
        ),
         Text(
          AppValues.or,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wp(4)),
            child: const Divider(color: Colors.grey, thickness: 1),
          ),
        ),
      ],
    );
  }
}