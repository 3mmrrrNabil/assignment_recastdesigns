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

  final ScrollController _scrollController = ScrollController();

  void _submitForm(AuthCubit cubit) {
    if (_formKey.currentState!.validate()) {
      cubit.showSignIn();
    } else {
      cubit.enableAutoValidate();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final cubit = context.read<AuthCubit>();

          WidgetsBinding.instance.addPostFrameCallback((_) {
            _scrollToBottom();
          });

          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                InfiniteMovingImages(),
                const AuthHeader(),
                SizedBox(height: context.hp(4)),

                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) {
                    final offsetAnimation = Tween<Offset>(
                      begin: const Offset(0, 0.2),
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

                SizedBox(height: context.hp(5)),
              ],
            ),
          );
        },
      ),
    );
  }
}