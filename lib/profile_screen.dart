import 'package:flutter/material.dart';
import 'package:restaurants_mobile_ui/main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: primaryColor,
        ),
        body: Center(
          child: Text('Congratulations, you have logged in'),
        ));
  }
}
