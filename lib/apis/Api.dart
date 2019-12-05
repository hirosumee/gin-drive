import 'package:flutter_app/resources/UserRepository.dart';
import 'package:http/http.dart' as http;

class Api {
  static final client = new http.Client();
  static String _baseUrl = 'https://gin-drive.herokuapp.com';

  static Future<http.Response> post(path, {body}) async {
    String token = await userRepository.getToken();
    return client.post(_baseUrl + path,
        body: body, headers: {'Authorization': 'Bearer ' + token});
  }

  static Future<http.Response> get(path) async {
    String token = await userRepository.getToken();
    return client
        .get(_baseUrl + path, headers: {'Authorization': 'Bearer ' + token});
  }
}
