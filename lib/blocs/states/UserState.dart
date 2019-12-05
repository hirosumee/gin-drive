import 'package:equatable/equatable.dart';
import 'package:flutter_app/models/UserModel.dart';

class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {
  UserModel user;
  UserInitial({this.user});
}

class UserLoading extends UserState {}

class UserFailure extends UserState {}
