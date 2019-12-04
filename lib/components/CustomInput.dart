import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  String labelText;
  Function validator;
  bool obscure;
  Function onChanged;
  TextEditingController controller;

  CustomInput({this.labelText, this.validator, this.obscure = false, this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // The validator receives the text that the user has entered.
      controller: this.controller,
      validator: this.validator,
      obscureText: this.obscure,
      onChanged: this.onChanged,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 17.0),
          hasFloatingPlaceholder: true),
    );
  }

  static requiredValidator(String value) {
    if (value.isEmpty) {
      return 'Please enter somethings !';
    }
    return null;
  }
}
