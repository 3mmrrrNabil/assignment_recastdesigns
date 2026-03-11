import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(SignInState());

  void toggle() {
    if (state is SignInState) {
      showRegister();
    } else {
      showSignIn();
    }
  }

  void showRegister() {
    emit(RegisterState(
      showPassword: state.showPassword,
      showConfirm: state.showConfirm,
      autoValidate: state.autoValidate,
    ));
  }

  void showSignIn() {
    emit(SignInState(
      showPassword: state.showPassword,
      showConfirm: state.showConfirm,
      autoValidate: state.autoValidate,
    ));
  }

  void togglePassword() {
    emit(_copyWith(showPassword: !state.showPassword));
  }

  void toggleConfirm() {
    emit(_copyWith(showConfirm: !state.showConfirm));
  }

  void enableAutoValidate() {
    emit(_copyWith(autoValidate: true));
  }

  AuthState _copyWith({
    bool? showPassword,
    bool? showConfirm,
    bool? autoValidate,
  }) {
    if (state is SignInState) {
      return SignInState(
        showPassword: showPassword ?? state.showPassword,
        showConfirm: showConfirm ?? state.showConfirm,
        autoValidate: autoValidate ?? state.autoValidate,
      );
    } else {
      return RegisterState(
        showPassword: showPassword ?? state.showPassword,
        showConfirm: showConfirm ?? state.showConfirm,
        autoValidate: autoValidate ?? state.autoValidate,
      );
    }
  }
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) return 'Email required';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) return 'Enter a valid email';
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) return 'Password required';
    if (password.length < 8) return 'Password must be at least 8 chars';
    return null;
  }

  String? validateConfirm(String? confirm, String? password) {
    if (confirm == null || confirm.isEmpty) return 'Confirm password';
    if (confirm != password) return 'Passwords do not match';
    return null;
  }
}