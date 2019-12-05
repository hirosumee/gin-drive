import 'package:flutter_app/models/UserModel.dart';

class UserApiProvider {
  Future<UserModel> login(String username, String password) async {
    await Future.delayed(Duration(seconds: 4));
    var _temp = {
      'username': username,
      password: password,
      'fullname': 'hirosume'
    };
    return UserModel.fromJSON(_temp);
  }
}
