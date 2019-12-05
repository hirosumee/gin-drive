import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/LoginBloc.dart';
import 'package:flutter_app/blocs/AuthenticationBloc.dart';
import 'package:flutter_app/blocs/events/AuthenticationEvent.dart';
import 'package:flutter_app/blocs/events/LoginEvent.dart';
import 'package:flutter_app/blocs/states/LoginState.dart';
import 'package:flutter_app/components/CustomInput.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();


  _LoginFormState() {
    _usernameController.text = 'a';
    _passwordController.text = 'a';
  }


  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        OnLoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    _onRegisterButtonPress() {
      BlocProvider.of<AuthenticationBloc>(context).add(OnRegister());
    }

    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LoginFailure) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('${state.error}'),
            backgroundColor: Colors.red,
          ),
        );
      } else if (state is LoginInitial) {
        print('meo');
      }
    }, child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'LOGIN SCREEN',
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
              controller: _usernameController,
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
              controller: _passwordController,
              obscure: true,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter your password.';
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
                    _onLoginButtonPressed();
                  }
                },
                child: Text(
                  'Login',
                  style: Theme
                      .of(context)
                      .textTheme
                      .button,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            InkWell(
              child: Text(
                'Is it your first time?',
                style: Theme
                    .of(context)
                    .textTheme
                    .display1,
              ),
              onTap: _onRegisterButtonPress,
            )
          ],
        ),
      );
    }));
  }
}
