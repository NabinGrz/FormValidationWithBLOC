import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidationbybloc/page/bloc/signin-bloc.dart';
import 'package:formvalidationbybloc/page/signinpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
      create: (context) => SignInBloc(),
      child: const SignInPage(),
    ));
  }
}
