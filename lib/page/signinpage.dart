import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidationbybloc/page/bloc/signin-bloc.dart';
import 'package:formvalidationbybloc/page/bloc/signin-event.dart';
import 'package:formvalidationbybloc/page/bloc/signin-state.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    const primaryColor = Color(0xff4338CA);
    const secondaryColor = Color(0xff6D28D9);
    const primaryInVColor = Color.fromARGB(255, 153, 150, 180);
    const secondaryInVColor = Color.fromARGB(255, 67, 65, 69);
    const accentColor = Color(0xffffffff);
    const backgroundColor = Color(0xffffffff);
    const errorColor = Color(0xffEF4444);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Form Valid With BLOC"),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    offset: const Offset(12, 26),
                    blurRadius: 50,
                    spreadRadius: 0,
                    color: Colors.grey.withOpacity(.1)),
              ]),
              child: TextField(
                controller: emailController,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context)
                      .add(SignInEmailChangeEvent(emailController.text));
                },
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                decoration: InputDecoration(
                  // prefixIcon: Icon(Icons.email),
                  filled: true,
                  //fillColor: Colors.grey,
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 20.0),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: secondaryColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: errorColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInEmailErrorState) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      state.error,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: const Color.fromARGB(255, 247, 2, 2)
                              .withOpacity(.9)),
                    ),
                  );
                } else {
                  return const Text("");
                }
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    offset: const Offset(12, 26),
                    blurRadius: 50,
                    spreadRadius: 0,
                    color: Colors.grey.withOpacity(.1)),
              ]),
              child: TextField(
                controller: passwordController,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context)
                      .add(SignInPasswordChangeEvent(passwordController.text));
                },
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                decoration: InputDecoration(
                  // prefixIcon: Icon(Icons.email),
                  filled: true,
                  //fillColor: Colors.grey,
                  hintText: 'Enter your Password',
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 20.0),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: secondaryColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: errorColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if ((state is SignInPasswordErrorState)) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      state.error,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: const Color.fromARGB(255, 247, 2, 2)
                              .withOpacity(.9)),
                    ),
                  );
                } else {
                  return const Text("");
                }
              },
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                return DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: (state is SignInValidState)
                            ? const LinearGradient(
                                colors: [primaryColor, secondaryColor])
                            : const LinearGradient(
                                colors: [secondaryInVColor, primaryInVColor])),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          alignment: Alignment.center,
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.only(
                                  right: 75, left: 75, top: 15, bottom: 15)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          )),
                      onPressed: () {
                        if (state is SignInValidState) {
                          BlocProvider.of<SignInBloc>(context)
                              .add(SignInButtonPressEvent());
                        }
                      },
                      child: (state is SignInLoadingState)
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              "Sign In",
                              style:
                                  TextStyle(color: accentColor, fontSize: 16),
                            ),
                    ));
              },
            )
          ],
        ));
  }
}
