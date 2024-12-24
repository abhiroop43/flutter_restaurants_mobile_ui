import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants_mobile_ui/main_screen.dart';
import 'package:restaurants_mobile_ui/shared/auth/auth_provider.dart';

void main() {
  runApp(const MyApp());
}

const primaryColor = Colors.blueAccent;
const errorColor = Colors.redAccent;
const successColor = Colors.teal;
const warningColor = Colors.orangeAccent;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthProvider())
        ],
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              // theme: ThemeData(primaryColor: primaryColor, primarySwatch: primaryColor),
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: primaryColor)
                    .copyWith(error: errorColor),
                useMaterial3: true,
              ),
              home: MainScreen(),
            ));
  }
}
