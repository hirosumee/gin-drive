import 'dart:async';

import 'package:flutter_app/blocs/states/LoginState.dart';
import 'package:flutter_app/resources/UserRepository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'AuthenticationBloc.dart';
import 'events/AuthenticationEvent.dart';
import 'events/LoginEvent.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is OnLoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );
        authenticationBloc.add(OnLoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.message.toString());
      }
    }
  }
}
