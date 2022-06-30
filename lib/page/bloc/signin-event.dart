abstract class SignInEvent {}

class SignInEmailChangeEvent extends SignInEvent {
  final String email;
  SignInEmailChangeEvent(this.email);
}

class SignInPasswordChangeEvent extends SignInEvent {
  final String password;
  SignInPasswordChangeEvent(this.password);
}

class SignInButtonPressEvent extends SignInEvent {}
