import 'package:flutter_app/resources/UserRepository.dart';
import 'package:http/http.dart' as http;

class Api {
  static final client = new http.Client();
  static String _baseUrl = 'https://gin-drive.herokuapp.com';

  static Future<Map<String, String>> getHeaders() async {
    String _token = await userRepository.getToken();
    if (_token != null) {
      return {'Authorization': 'Bearer ' + _token};
    }
    return {};
  }

  static Future<http.Response> post(path, {body}) async {
    var headers = await getHeaders();
    return client.post(_baseUrl + path, body: body, headers: headers);
  }

  static Future<http.Response> get(path) async {
    var headers = await getHeaders();
    return client.get(_baseUrl + path, headers: headers);
  }
}
