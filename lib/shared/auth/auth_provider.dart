import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class AuthProvider extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  bool isAuthorized = false;

  Future<void> logout() async {
    await storage.deleteAll();
    notifyListeners();
  }

  // Future<bool> isAuthorized() async {
  //   return (await storage.read(key: 'accessToken')) != null;
  // }

  Future<bool> doNewLogin(String email, String password) async {
    debugPrint('Logging in with email: $email');
    debugPrint('Logging in with password: $password');
    try {
      Response response = await post(
          Uri.parse(
              'https://abhiroopsantra-restaurants-api-prod.azurewebsites.net/api/identity/login'),
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
          headers: {
            'Content-Type': 'application/json',
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        await storage.write(key: 'accessToken', value: data['accessToken']);
        await storage.write(key: 'email', value: email);
        debugPrint('Logged in with email: $email');
        isAuthorized = true;
        notifyListeners();
        return true;
      } else {
        isAuthorized = false;
        return false;
      }
    } catch (e) {
      isAuthorized = false;
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> tryLogin() async {
    var accessToken = await storage.read(key: 'accessToken');

    if (accessToken != null && accessToken.isNotEmpty) {
      notifyListeners();
      return true;
    }

    return false;
  }
}
