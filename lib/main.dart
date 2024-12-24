import 'package:flutter/material.dart';
import 'package:restaurants_mobile_ui/main_screen.dart';

void main() {
  runApp(const MyApp());
}

const primaryColor = Colors.blueAccent;
const errorColor = Colors.redAccent;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primaryColor: primaryColor, primarySwatch: primaryColor),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor)
            .copyWith(error: errorColor),
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}
