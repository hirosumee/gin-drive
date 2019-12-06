import 'package:bloc/bloc.dart';
import 'package:flutter_app/blocs/events/FileEvent.dart';
import 'package:flutter_app/blocs/states/FileState.dart';
import 'package:flutter_app/models/FileModel.dart';
import 'package:flutter_app/resources/FileRepository.dart';

class FileBloc extends Bloc<FileEvent, FileState> {
  @override
  get initialState => FileInitial();

  @override
  Stream<FileState> mapEventToState(FileEvent event) async* {
    if (event is OnLoadFile) {
      yield FileLoading();
      try {
        List<FileModel> _list = await fileRepository.load();
        yield FileInitial(list: _list);
      } catch (e) {
        print(e);
        yield FileFailure();
      }
    }
  }
}
