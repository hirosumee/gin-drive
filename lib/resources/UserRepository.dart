import 'package:flutter_app/apis/UserApiProvider.dart';
import 'package:flutter_app/models/UserModel.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  UserModel _userModel;

  UserModel get userModel => _userModel;

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    return userApiProvider.login(username, password);
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    /// delete from keystore/keychain
    await prefs.remove("token");
    return;
  }

  Future<void> persistToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    /// write to keystore/keychain
    await prefs.setString("token", token);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") != null;
  }

  Future<UserModel> getCurrentUser() async {
    print(this._userModel);
    if (this._userModel != null) {
      return this._userModel;
    }
    return this._userModel = await userApiProvider.getUser();
  }

  onLogout() {
    this._userModel = null;
  }
}

final userRepository = UserRepository();
