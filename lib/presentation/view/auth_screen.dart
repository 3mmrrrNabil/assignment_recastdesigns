import 'package:assignment_recastdesigns/core/constants/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/extension/media_query_extension.dart';
import '../view_model/auth_cubit.dart';
import '../view_model/auth_state.dart';
import '../widgets/moving_images.dart';
import '../widgets/auth_header.dart';
import '../widgets/sign_in_section.dart';
import '../widgets/sign_up_section.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  void _submitForm(AuthCubit cubit) {
    if (_formKey.currentState!.validate()) {
      cubit.showSignIn();
    } else {
      cubit.enableAutoValidate();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,

      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {

          final cubit = context.read<AuthCubit>();

          return SingleChildScrollView(
            child: Column(
              children: [

                 InfiniteMovingImages(),

                const AuthHeader(),

                SizedBox(height: context.hp(4)),

                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) {

                    final offsetAnimation = Tween<Offset>(
                      begin: const Offset(0, .2),
                      end: Offset.zero,
                    ).animate(animation);

                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      ),
                    );
                  },

                  child: state is SignInState

                      ? SignInSection(
                    key: const ValueKey(AppValues.signIn),

                    cubit: cubit,
                  )

                      : SignUpSection(
                    key: const ValueKey(AppValues.signUp),

                    cubit: cubit,
                    state: state,

                    formKey: _formKey,

                    emailController: _emailController,
                    passwordController: _passwordController,
                    confirmController: _confirmController,

                    submitForm: _submitForm,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}