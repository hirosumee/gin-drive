import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/CustomInput.dart';

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
          Text('Login'),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          CustomInput(
            labelText: 'Username',
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          CustomInput(
            labelText: 'Password',
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ButtonTheme(
            minWidth: 200,
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
                style: TextStyle(fontSize: 17),
              ),
            ),
          )
        ],
      ),
    );
  }
}
