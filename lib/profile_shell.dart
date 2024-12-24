import 'package:flutter/material.dart';
import 'package:restaurants_mobile_ui/main.dart';
import 'package:restaurants_mobile_ui/shared/auth/auth_provider.dart';

// TODO: test this

class ProfileShell extends StatefulWidget {
  const ProfileShell({super.key});

  @override
  State<ProfileShell> createState() => _ProfileShellState();
}

class _ProfileShellState extends State<ProfileShell> {
  late Future<bool> _isLoggedInFuture;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _isLoggedInFuture = AuthProvider().isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('ProfileShell build');

    return FutureBuilder<bool>(
      future: _isLoggedInFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Profile'),
              backgroundColor: primaryColor,
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Profile'),
              backgroundColor: primaryColor,
            ),
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          isLoggedIn = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: Text('Profile'),
              backgroundColor: primaryColor,
            ),
            body: Center(
              child: Text(isLoggedIn ? 'Logged In' : 'Not Logged In'),
            ),
          );
        }
      },
    );
  }
}
