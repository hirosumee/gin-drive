import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/AuthenticationBloc.dart';
import 'package:flutter_app/blocs/RegisterBloc.dart';
import 'package:flutter_app/blocs/builders/RegisterBuilder.dart';
import 'package:flutter_app/blocs/events/AuthenticationEvent.dart';
import 'package:flutter_app/blocs/events/RegisterEvent.dart';
import 'package:flutter_app/blocs/states/RegisterState.dart';
import 'package:flutter_app/components/LoadingIndicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CustomInput.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<AuthenticationBloc>(context).add(OnLoginPage());
    }

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) async {
        if (state is OnRegisterFailureState) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${state.message}',
                style: Theme.of(context).textTheme.button,
              ),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is OnRegisterSuccessfulState) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'You have register a new account successful',
                style: Theme.of(context).textTheme.button,
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
          );
          await Future.delayed(Duration(seconds: 2));
          BlocProvider.of<AuthenticationBloc>(context).add(OnLoginPage());
        }
      },
      child: registerBuilder((context, state) {
        if (state is OnRegisteringState) {
          return LoadingIndicator();
        }
        _onRegisterButtonPressed() {
          BlocProvider.of<RegisterBloc>(context).add(OnRegister(
              username: _userController.text,
              password: _passwordController.text));
        }

        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'REGISTER SCREEN',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              CustomInput(
                labelText: 'Username',
                controller: _userController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter your username.';
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              CustomInput(
                labelText: 'Password',
                obscure: true,
                controller: _passwordController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter your password.';
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              CustomInput(
                labelText: 'Confirm Password',
                obscure: true,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter your password.';
                  }
                  if (value != _passwordController.text) {
                    return 'Confirm password must be match password';
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              ButtonTheme(
                minWidth: 240,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _onRegisterButtonPressed();
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              InkWell(
                child: Text(
                  'Do you have a account ?',
                  style: Theme.of(context).textTheme.display1,
                ),
                onTap: _onLoginButtonPressed,
              )
            ],
          ),
        );
      }),
    );
//    });
  }
}
