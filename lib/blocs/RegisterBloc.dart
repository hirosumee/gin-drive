import 'package:bloc/bloc.dart';
import 'package:flutter_app/blocs/events/RegisterEvent.dart';
import 'package:flutter_app/blocs/states/RegisterState.dart';
import 'package:flutter_app/resources/UserRepository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  @override
  RegisterState get initialState => OnRegisterState();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is OnRegister && event.username.isNotEmpty) {
      yield OnRegisteringState();
      await Future.delayed(Duration(seconds: 1));
      try {
        await userRepository.register(event.username, event.password);
        yield OnRegisterSuccessfulState();
      } catch (e) {
        yield OnRegisterFailureState(e.message);
      }
    }
  }
}
