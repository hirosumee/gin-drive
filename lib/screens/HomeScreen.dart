import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/builders/AuthenticationBuilder.dart';
import 'package:flutter_app/blocs/builders/UserBuilder.dart';
import 'package:flutter_app/components/GinDrawer.dart';
import 'package:flutter_app/constants/Constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return userCreator(child: authenticationBuilder(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(TITLE),
            ),
            drawer: GinDrawer());
      },
    ));
  }
}
