abstract class AuthState {
  final bool showPassword;
  final bool showConfirm;
  final bool autoValidate;

  AuthState({
    this.showPassword = false,
    this.showConfirm = false,
    this.autoValidate = false,
  });
}

class SignInState extends AuthState {
  SignInState({
    bool showPassword = false,
    bool showConfirm = false,
    bool autoValidate = false,
  }) : super(showPassword: showPassword, showConfirm: showConfirm, autoValidate: autoValidate);
}

class RegisterState extends AuthState {
  RegisterState({
    bool showPassword = false,
    bool showConfirm = false,
    bool autoValidate = false,
  }) : super(showPassword: showPassword, showConfirm: showConfirm, autoValidate: autoValidate);
}