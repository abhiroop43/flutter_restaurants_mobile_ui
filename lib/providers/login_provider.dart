import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginNotifier extends StateNotifier<bool> {
  LoginNotifier() : super(false);

  void loginUser(String email, String password) {
    // TODO: implement login logic
    state = true;
  }

  void logoutUser() {
    state = false;
  }
}

final loginProvider =
    StateNotifierProvider<LoginNotifier, bool>((ref) => LoginNotifier());
