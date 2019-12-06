import 'package:flutter_app/blocs/events/FileBloc.dart';
import 'package:flutter_app/blocs/events/FileEvent.dart';
import 'package:flutter_app/blocs/states/FileState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

fileBuilder(builder) {
  return BlocBuilder<FileBloc, FileState>(
    builder: builder,
  );
}

fileCreator(child) {
  return BlocProvider(
    create: (context) {
      return FileBloc()..add(OnLoadFile());
    },
    child: child,
  );
}
