import 'dart:convert';

import 'package:flutter_app/apis/Api.dart';

class FileApiProvider {
  Future<List<dynamic>> load() {
    return Api.get('/files').then((res) {
      if (res.statusCode == 200) {
        return jsonDecode(res.body)['data'];
      }
      throw new Exception('Fail');
    });
  }
}

FileApiProvider fileApiProvider = FileApiProvider();
