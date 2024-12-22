import 'package:flutter/material.dart';
import 'package:restaurants_mobile_ui/main_screen.dart';

void main() {
  runApp(const MyApp());
}

const primaryColor = Colors.blue;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: primaryColor, primarySwatch: primaryColor),
      home: MainScreen(),
    );
  }
}
