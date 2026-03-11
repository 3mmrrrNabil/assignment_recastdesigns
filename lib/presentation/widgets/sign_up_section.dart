import 'package:assignment_recastdesigns/core/constants/app_values.dart';
import 'package:flutter/material.dart';
import '../../core/extension/media_query_extension.dart';
import '../view_model/auth_cubit.dart';
import '../view_model/auth_state.dart';
import 'auth_text_field.dart';
import 'auth_gradient_button.dart';

class SignUpSection extends StatelessWidget {
  final AuthCubit cubit;
  final AuthState state;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmController;
  final void Function(AuthCubit) submitForm;

  const SignUpSection({
    super.key,
    required this.cubit,
    required this.state,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.confirmController,
    required this.submitForm,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: state.autoValidate
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.wp(5),
          vertical: context.hp(2),
        ),
        child: Column(
          children: [
            AuthTextField(
              controller: emailController,
              hint: AppValues.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) => cubit.validateEmail(value),
            ),
            SizedBox(height: context.hp(2)),

            AuthTextField(
              controller: passwordController,
              hint: AppValues.password,
              obscureText: !state.showPassword,
              suffixIcon: IconButton(
                icon: Container(
                  width: context.wp(9),
                  height: context.hp(4.7),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Icon(
                    state.showPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.white54,
                    size: context.sp(20),
                  ),
                ),
                onPressed: cubit.togglePassword,
              ),
              validator: (value) => cubit.validatePassword(value),
            ),
            SizedBox(height: context.hp(2)),

            AuthTextField(
              controller: confirmController,
              hint:   AppValues.confirmPassword,
              obscureText: !state.showConfirm,
              suffixIcon: IconButton(
                icon: Container(
                  width: context.wp(9),
                  height: context.hp(4.7),
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Icon(
                    state.showConfirm
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.grey,
                    size: context.sp(20),
                  ),
                ),
                onPressed: cubit.toggleConfirm,
              ),
              validator: (value) =>
                  cubit.validateConfirm(value, passwordController.text),
            ),
            SizedBox(height: context.hp(3)),

            AuthGradientButton(
              title: AppValues.signUp,
              onTap: () => submitForm(cubit),
            ),
          ],
        ),
      ),
    );
  }
}