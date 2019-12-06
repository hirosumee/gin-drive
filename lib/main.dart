import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/AuthenticationBloc.dart';
import 'package:flutter_app/blocs/states/AuthenticationState.dart';
import 'package:flutter_app/components/LoadingIndicator.dart';
import 'package:flutter_app/constants/Constant.dart';
import 'package:flutter_app/resources/UserRepository.dart';
import 'package:flutter_app/screens/HomeScreen.dart';
import 'package:flutter_app/screens/LoginScreen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/screens/RegisterScreen.dart';
import 'package:flutter_app/screens/SplashScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/events/AuthenticationEvent.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(OnAppStarted());
      },
      child: App(userRepository: userRepository),
    ),
  );
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print('onEvent:');
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print('onError:');
    print(error);
  }
}

final themeData = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    primaryColor: Colors.blue,
    textTheme: TextTheme(
      body1: TextStyle(color: Colors.blue, fontSize: 18.0),
      button: TextStyle(color: Colors.white),
      display1: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: Colors.blue),
      display2: TextStyle(color: Colors.white, fontSize: 1.0),
    ));

final appBloc = BlocBuilder<AuthenticationBloc, AuthenticationState>(
    builder: (context, state) {
  if (state is AuthenticationUninitialized) {
    return SplashScreen();
  }
  if (state is AuthenticationAuthenticated) {
    return HomeScreen();
  }
  if (state is AuthenticationUnauthenticated) {
    return LoginScreen();
  }
  if (state is AuthenticationLoading) {
    return LoadingIndicator();
  }
  if (state is AuthenticationRegister) {
    return RegisterScreen();
  }
  return LoadingIndicator();
});

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      theme: themeData,
      home: appBloc,
    );
  }
}
