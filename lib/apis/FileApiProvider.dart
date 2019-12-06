import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_app/apis/Api.dart';
import 'package:path_provider/path_provider.dart';

class FileApiProvider {
  Dio _dio = new Dio();

  Future<List<dynamic>> load() {
    return Api.get('/files').then((res) {
      if (res.statusCode == 200) {
        return jsonDecode(res.body)['data'];
      }
      throw new Exception('Fail');
    });
  }

  Future<String> download(String id, String originalName) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    String file = '$dir/$originalName';
    print(file);
    return _dio
        .download('https://gin-drive.herokuapp.com/files/download/' + id, file,
            options: Options(headers: await Api.getHeaders()))
        .then((res) {
      return file;
    });
  }
}

FileApiProvider fileApiProvider = FileApiProvider();
