import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/LoginBloc.dart';
import 'package:flutter_app/blocs/AuthenticationBloc.dart';
import 'package:flutter_app/components/LoginForm.dart';
import 'package:flutter_app/resources/UserRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              userRepository: userRepository,
            );
          },
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: LoginForm(),
          ))),
    );
  }
}
