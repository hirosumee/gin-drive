import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/builders/RegisterBuilder.dart';
import 'package:flutter_app/components/RegisterForm.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return registerCreator(Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: RegisterForm(),
        ),
      ),
    ));
  }
}
