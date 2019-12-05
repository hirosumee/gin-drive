import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/AuthenticationBloc.dart';
import 'package:flutter_app/blocs/UserBloc.dart';
import 'package:flutter_app/blocs/builders/UserBuilder.dart';
import 'package:flutter_app/blocs/events/AuthenticationEvent.dart';
import 'package:flutter_app/blocs/events/UserEvent.dart';
import 'package:flutter_app/blocs/states/UserState.dart';
import 'package:flutter_app/models/UserModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GinDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<GinDrawer> {
  UserModel _userModel;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context).add(OnGetCurrentUser());
  }

  @override
  Widget build(BuildContext context) {
    _onPressLogout() {
      BlocProvider.of<AuthenticationBloc>(context).add(OnLoggedOut());
    }

    return BlocListener<UserBloc, UserState>(listener: (context, state) {
      if (state is UserInitial) {
        setState(() {
          this._userModel = state.user;
        });
      }
    }, child: userBuilder(builder: (BuildContext context, state) {
      return Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('Welcome '),
                          Text(
                            _userModel != null ? _userModel.username : '',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  ),
                  Align(
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: _userModel != null &&
                              _userModel.avatar != null
                          ? BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(_userModel.avatar)))
                          : null,
                    ),
                    alignment: Alignment.topRight,
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                _onPressLogout();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }));
  }
}
