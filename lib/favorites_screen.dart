import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurants_mobile_ui/main.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Favorite Restaurants'),
          backgroundColor: primaryColor,
        ),
        body: Center(
          child: Text('Favorites Page'),
        ));
  }
}
