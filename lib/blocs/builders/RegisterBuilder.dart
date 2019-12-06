import 'package:flutter_app/blocs/RegisterBloc.dart';
import 'package:flutter_app/blocs/events/RegisterEvent.dart';
import 'package:flutter_app/blocs/states/RegisterState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

registerCreator(child) {
  return BlocProvider(
    create: (context) {
      return RegisterBloc()..add(OnRegister());
    },
    child: child,
  );
}

registerBuilder(builder) {
  return BlocBuilder<RegisterBloc, RegisterState>(
    builder: builder,
  );
}
