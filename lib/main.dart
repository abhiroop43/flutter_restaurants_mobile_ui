import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurants_mobile_ui/main_screen.dart';

void main() {
  runApp(const ProviderScope(child: RestaurantsApp()));
}

const primaryColor = Colors.blueAccent;
const errorColor = Colors.redAccent;
const successColor = Colors.teal;
const warningColor = Colors.orangeAccent;

class RestaurantsApp extends StatelessWidget {
  const RestaurantsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurants',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primaryColor: primaryColor, primarySwatch: primaryColor),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor)
            .copyWith(error: errorColor),
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: MainScreen(),
    );
  }
}
