import 'package:flutter_app/blocs/AuthenticationBloc.dart';
import 'package:flutter_app/blocs/states/AuthenticationState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

authenticationBuilder({builder}) {
  return BlocBuilder<AuthenticationBloc, AuthenticationState>(
    builder: builder,
  );
}
