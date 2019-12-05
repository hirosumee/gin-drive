class UserModel {
  String _username;
  String _password;
  String _email;
  String _avatar;
  String _fullname;

  UserModel.fromJSON(Map<String, dynamic> parsedJSON) {
    _username = parsedJSON['username'];
    _email = parsedJSON['email'];
    _avatar = parsedJSON['avatar'];
    _fullname = parsedJSON['fullname'];
  }

  String get fullname => _fullname;

  set fullname(String value) {
    _fullname = value;
  }

  String get avatar => _avatar;

  set avatar(String value) {
    _avatar = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }
}
