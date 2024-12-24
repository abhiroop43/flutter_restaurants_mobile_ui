import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurants_mobile_ui/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Restaurants'),
          backgroundColor: primaryColor,
        ),
        body: Center(
          child: Text('Home Page'),
        ));
  }
}
