import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/CustomInput.dart';
import 'package:flutter_app/screens/RegisterScreen.dart';

import 'SizeRoute.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'LOGIN SCREEN',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 1.0),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          CustomInput(
            labelText: 'Username',
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
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text(
                'Login',
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          InkWell(
            child: Text(
              'Is it your first time?',
              style: Theme.of(context).textTheme.display1,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(SizeRoute(page: RegisterScreen()));
            },
          )
        ],
      ),
    );
  }
}
