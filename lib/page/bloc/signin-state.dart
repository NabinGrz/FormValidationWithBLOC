abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInInvalidState extends SignInState {}

class SignInValidState extends SignInState {}

class SignInEmailErrorState extends SignInState {
  final String error;
  SignInEmailErrorState(this.error);
}

class SignInPasswordErrorState extends SignInState {
  final String error;
  SignInPasswordErrorState(this.error);
}

class SignInLoadingState extends SignInState {}
