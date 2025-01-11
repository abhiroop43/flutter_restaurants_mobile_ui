import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurants_mobile_ui/favorites_screen.dart';
import 'package:restaurants_mobile_ui/home_screen.dart';
import 'package:restaurants_mobile_ui/login_screen.dart';
import 'package:restaurants_mobile_ui/main.dart';
import 'package:restaurants_mobile_ui/maps_screen.dart';
import 'package:restaurants_mobile_ui/profile_screen.dart';
import 'package:restaurants_mobile_ui/providers/login_provider.dart';

enum Tabs { none, home, maps, favorites, profile }

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void onTap(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
    return Expanded(
        child: InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: selected ? Colors.white : Colors.white.withValues(alpha: 0.4),
        size: 30.0,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = ref.watch(loginProvider);
    debugPrint('isLoggedIn: $isLoggedIn');
    debugPrint('currentPageIndex: $currentPageIndex');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 64,
        width: 64,
        margin: EdgeInsets.only(top: 16),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 0,
          onPressed: () => debugPrint('Add new item'),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 3, color: primaryColor),
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Icon(
            Icons.add,
            color: primaryColor,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shape: const CircularNotchedRectangle(),
          notchMargin: 15.0,
          color: primaryColor,
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                navItem(Icons.home_outlined, currentPageIndex == 0,
                    onTap: () => onTap(0)),
                navItem(Icons.pin_drop_outlined, currentPageIndex == 1,
                    onTap: () => onTap(1)),
                const SizedBox(width: 80),
                navItem(Icons.favorite_outline, currentPageIndex == 2,
                    onTap: () => onTap(2)),
                navItem(Icons.person_outline, currentPageIndex == 3,
                    onTap: () => onTap(3)),
              ])),

      body: <Widget>[
        HomeScreen(),
        isLoggedIn == true ? MapsScreen() : LoginScreen(),
        isLoggedIn == true ? FavoritesScreen() : LoginScreen(),
        isLoggedIn == true ? ProfileScreen() : LoginScreen()
      ][currentPageIndex],
    );
  }
}
