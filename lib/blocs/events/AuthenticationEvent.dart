import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class OnAppStarted extends AuthenticationEvent {}

class OnLoggedIn extends AuthenticationEvent {
  final String token;

  const OnLoggedIn({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class OnLoggedOut extends AuthenticationEvent {}

class OnRegisterPage extends AuthenticationEvent {}

class OnLoginPage extends AuthenticationEvent {}

class OnAuthenticationLoading extends AuthenticationEvent {}
