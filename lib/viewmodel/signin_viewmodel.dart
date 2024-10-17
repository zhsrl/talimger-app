import 'package:flutter/material.dart';
import 'package:talimger/model/user.dart';
import 'package:talimger/service/auth_service.dart';

class SignInViewModel extends ChangeNotifier {
  final _authService = AuthService();
  bool _isLoading = false;
  User? _user;

  bool get isLoading => _isLoading;
  User? get user => _user;

  Future<User?> signIn(String email, String password) async {
    _isLoading = true;

    _user = await _authService.signIn(email, password);

    if (_user != null) {
      _isLoading = false;
      notifyListeners();

      return _user!;
    }

    return null;
  }
}
