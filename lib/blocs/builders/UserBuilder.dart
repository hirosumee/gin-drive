import 'package:flutter_app/blocs/UserBloc.dart';
import 'package:flutter_app/blocs/states/UserState.dart';
import 'package:flutter_app/resources/UserRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

userBuilder({builder}) {
  return BlocBuilder<UserBloc, UserState>(
    builder: builder,
  );
}

userCreator({child}) {
  return BlocProvider(
    create: (context) {
      return UserBloc(userRepository);
    },
    child: child,
  );
}
