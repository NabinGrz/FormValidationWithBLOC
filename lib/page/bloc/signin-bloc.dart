import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidationbybloc/page/bloc/signin-event.dart';
import 'package:formvalidationbybloc/page/bloc/signin-state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInEmailChangeEvent>((event, emit) => {
          if (event.email.isEmpty)
            {emit(SignInEmailErrorState("Email field cannot be empty"))}
          else
            {
              if (EmailValidator.validate(event.email))
                {emit(SignInValidState())}
              else
                {
                  emit(
                      SignInEmailErrorState("Please enter valid email address"))
                }
            }
        });
    on<SignInPasswordChangeEvent>((event, emit) => {
          if (event.password.isEmpty)
            {emit(SignInPasswordErrorState("Password cannot be empty"))}
          else
            {
              if (event.password.length < 8)
                {
                  emit(SignInPasswordErrorState(
                      "Password cannot be less than 8 Character"))
                }
              else
                {emit(SignInValidState())}
            }
        });
    on<SignInButtonPressEvent>((event, emit) => {emit(SignInLoadingState())});
  }
}
