import 'package:flutter_app/models/UserModel.dart';
import 'package:meta/meta.dart';

class UserRepository {
  UserModel _userModel;

  UserModel get userModel => _userModel;

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    if (username != 'a') {
      throw new Exception('Invalid username or password');
    }
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }

  Future<UserModel> getCurrentUser() async {
    if (this._userModel != null) {
      return this._userModel;
    }
    return this._userModel = UserModel.fromJSON({
      'username': 'hirosume',
      'fullname': 'Vu Ngoc Cuong',
      'email': 'cuongvn@inet.vn',
      'avatar': 'https://google.com'
    });
  }

  onLogout() {
    this._userModel = null;
  }
}

final userRepository = UserRepository();
