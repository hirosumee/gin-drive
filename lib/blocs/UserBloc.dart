import 'package:flutter_app/blocs/events/UserEvent.dart';
import 'package:flutter_app/blocs/states/UserState.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/models/UserModel.dart';
import 'package:flutter_app/resources/UserRepository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository);

  @override
  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is OnGetCurrentUser) {
      yield UserLoading();
      try {
        UserModel user = await this.userRepository.getCurrentUser();
        yield UserInitial(user: user);
      } catch (err) {
        yield UserFailure();
      }
    }
  }
}
