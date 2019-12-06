import 'dart:convert';

import 'package:flutter_app/apis/Api.dart';
import 'package:flutter_app/models/UserModel.dart';
import 'package:http/http.dart' as http;

class UserApiProvider {
  Future<String> login(String username, String password) async {
    return Api.post('/users/login',
        body: {'username': username, 'password': password}).then((response) {
      if (response.statusCode == 200) {
        return json.decode(response.body)['data'];
      }
      throw new Exception('Login failure');
    });
  }

  Future<UserModel> getUser() {
    return Api.get(
      '/users',
    ).then((response) {
      if (response.statusCode == 200) {
        var map = json.decode(response.body);
        return UserModel.fromJSON(map['data']);
      }
      throw new Exception('Error');
    });
  }
}

final userApiProvider = new UserApiProvider();
