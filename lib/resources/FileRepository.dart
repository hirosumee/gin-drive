import 'package:flutter_app/apis/FileApiProvider.dart';
import 'package:flutter_app/models/FileModel.dart';

class FileRepository {

  Future<List<FileModel>> load() {
    return fileApiProvider.load().then((json) {
      List<FileModel> _list = [];
      json.forEach((res) {
        _list.add(FileModel.fromJSON(res));
      });
      print(_list);
      return _list;
    });
  }


}

FileRepository fileRepository = FileRepository();
