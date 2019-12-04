import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/LoginForm.dart';
import 'package:flutter_app/constants/Constant.dart';

class LoginScreen  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }

}
class _LoginState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TITLE),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: LoginForm(),
        ),
      ),
    );
  }

}