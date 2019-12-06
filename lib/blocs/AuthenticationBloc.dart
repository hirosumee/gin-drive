import 'dart:async';

import 'package:flutter_app/blocs/states/AuthenticationState.dart';
import 'package:flutter_app/resources/UserRepository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'events/AuthenticationEvent.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is OnAppStarted) {
      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is OnLoginPage) {
      yield AuthenticationUnauthenticated();
    }

    if (event is OnLoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is OnLoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      await userRepository.onLogout();
      yield AuthenticationUnauthenticated();
    }

    if (event is OnRegisterPage) {
      yield AuthenticationRegister();
    }

    if (event is OnAuthenticationLoading) {
      yield AuthenticationLoading();
    }
  }
}
