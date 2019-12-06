import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

class OnRegisterState extends RegisterState {}

class OnRegisteringState extends RegisterState {}

class OnRegisterFailureState extends RegisterState {
  final String message;

  OnRegisterFailureState(this.message);

  List<Object> get props => [message];
}

class OnRegisterSuccessfulState extends RegisterState {}
