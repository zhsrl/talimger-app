import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:talimger/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:talimger/utils/storage_secure.dart';

class AuthService {
  static String API_URL = "http://localhost:8080/api/v1/auth/sign-in";
  final storageSecure = AppStorageSecure();

  Future<User?>? signIn(String email, String password) async {
    try {
      final url = Uri.parse(API_URL);
      final response = await http.post(
        url,
        body: json.encode({'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final decodedJsonData = json.decode(response.body);
        debugPrint(decodedJsonData['token']);
        debugPrint(decodedJsonData['refreshToken']);

        await storageSecure.saveTokens(
          decodedJsonData['token'],
          decodedJsonData['refreshToken'],
        );

        return User.fromJson(decodedJsonData);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Sign in exp: $e');

      return null;
    }
  }
}
