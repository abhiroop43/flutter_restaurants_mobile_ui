import 'package:flutter/material.dart';
import 'package:restaurants_mobile_ui/main.dart';
import 'package:restaurants_mobile_ui/nav_bar.dart';
import 'package:restaurants_mobile_ui/nav_model.dart';
import 'package:restaurants_mobile_ui/utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final searchNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();

  int selectedTab = 0;

  List<NavModel> items = [];

  @override
  void initState() {
    super.initState();
    items = [
      NavModel(page: const TabPage(tab: 1), navKey: homeNavKey),
      NavModel(page: const TabPage(tab: 2), navKey: searchNavKey),
      NavModel(page: const TabPage(tab: 3), navKey: notificationNavKey),
      NavModel(page: const TabPage(tab: 4), navKey: profileNavKey)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (items[selectedTab].navKey.currentState?.canPop() ?? false) {
          items[selectedTab].navKey.currentState?.pop();
        }
      },
      child: Scaffold(
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

class TabPage extends StatelessWidget {
  final int tab;

  const TabPage({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    String title = getTabName(tab);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () => debugPrint('Notifications'),
          ),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('View $title'),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Page(tab: tab)));
              },
              child: const Text('View Details'))
        ],
      )),
    );
  }
}

class Page extends StatelessWidget {
  final int tab;

  const Page({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    String title = getTabName(tab);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () => debugPrint('Notifications'),
          ),
        ],
      ),
      body: Center(child: Text(title)),
    );
  }
}
