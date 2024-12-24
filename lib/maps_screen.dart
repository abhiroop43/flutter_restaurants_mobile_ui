import 'package:flutter/material.dart';
import 'package:restaurants_mobile_ui/main.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Restaurants Near You'),
          backgroundColor: primaryColor,
        ),
        body: Center(
          child: Text('Maps Page'),
        ));
  }
}
