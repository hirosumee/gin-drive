import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class OnGetCurrentUser extends UserEvent {
  @override
  List<Object> get props => [];
}
