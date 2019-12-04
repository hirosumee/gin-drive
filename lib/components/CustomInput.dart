import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  String labelText;
  CustomInput({ this.labelText });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor)),
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 17.0),
          hasFloatingPlaceholder: true),
    );
  }
}
