import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnRegistering extends RegisterEvent {}

class OnRegister extends RegisterEvent {
  final String username;
  final String password;

  OnRegister({this.username = '', this.password = ''});

  @override
  List<Object> get props => [username, password];
}

class OnRegisterFailure extends RegisterEvent {}
