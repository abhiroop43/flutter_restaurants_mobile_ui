import 'package:flutter/material.dart';
import 'package:restaurants_mobile_ui/main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Text('Please login before accessing this feature'),
      ),
    );
  }
}
