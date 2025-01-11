import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurants_mobile_ui/favorites_screen.dart';
import 'package:restaurants_mobile_ui/home_screen.dart';
import 'package:restaurants_mobile_ui/login_screen.dart';
import 'package:restaurants_mobile_ui/main.dart';
import 'package:restaurants_mobile_ui/maps_screen.dart';
import 'package:restaurants_mobile_ui/nav_bar.dart';
import 'package:restaurants_mobile_ui/nav_model.dart';
import 'package:restaurants_mobile_ui/profile_screen.dart';
import 'package:restaurants_mobile_ui/providers/login_provider.dart';

enum Tabs { none, home, maps, favorites, profile }

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final mapNavKey = GlobalKey<NavigatorState>();
  final favoritesNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();

  int selectedTab = 0;

  List<NavModel> items = [];

  @override
  void initState() {
    super.initState();

    items = [
      NavModel(page: HomeScreen(), navKey: homeNavKey),
      NavModel(page: MapsScreen(), navKey: mapNavKey),
      NavModel(page: FavoritesScreen(), navKey: favoritesNavKey),
      NavModel(page: ProfileScreen(), navKey: profileNavKey)
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = ref.watch(loginProvider);
    debugPrint('isLoggedIn: $isLoggedIn');

    items = [
      NavModel(page: HomeScreen(), navKey: homeNavKey),
      NavModel(
          page: isLoggedIn == true ? MapsScreen() : LoginScreen(),
          navKey: mapNavKey),
      NavModel(
          page: isLoggedIn == true ? FavoritesScreen() : LoginScreen(),
          navKey: favoritesNavKey),
      NavModel(
          page: isLoggedIn == true ? ProfileScreen() : LoginScreen(),
          navKey: profileNavKey)
    ];

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (items[selectedTab].navKey.currentState?.canPop() ?? false) {
          items[selectedTab].navKey.currentState?.pop();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: NavBar(
          pageIndex: selectedTab,
          onTap: (index) {
            if (index == selectedTab) {
              items[index]
                  .navKey
                  .currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                selectedTab = index;
              });
            }
          },
        ),
        body: IndexedStack(
          index: selectedTab,
          children: items
              .map((page) => Navigator(
                    key: page.navKey,
                    onGenerateInitialRoutes: (navigator, initialRoute) {
                      return [
                        MaterialPageRoute(builder: (context) => page.page)
                      ];
                    },
                  ))
              .toList(),
        ),
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
      ),
    );
  }
}
