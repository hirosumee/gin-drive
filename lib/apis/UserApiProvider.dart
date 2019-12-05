import 'dart:convert';

import 'package:flutter_app/models/UserModel.dart';
import 'package:flutter_app/resources/UserRepository.dart';
import 'package:http/http.dart' as http;

class UserApiProvider {
  var client = new http.Client();

  Future<String> login(String username, String password) async {
    return http.post('https://gin-drive.herokuapp.com/users/login',
        body: {'username': username, 'password': password}).then((response) {
      if (response.statusCode == 200) {
        return json.decode(response.body)['data'];
      }
      throw new Exception('Login failure');
    });
  }

  Future<UserModel> getUser() async {
    String token = await userRepository.getToken();
    return http.get('https://gin-drive.herokuapp.com/users',
        headers: {'Authorization': 'Bearer ' + token}).then((response) {
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var map = json.decode(response.body);
        return UserModel.fromJSON(map['data']);
      }
      throw new Exception('Error');
    });
  }
}

final userApiProvider = new UserApiProvider();
