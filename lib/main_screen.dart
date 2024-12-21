import 'package:flutter/material.dart';
import 'package:restaurants_mobile_ui/main.dart';
import 'package:restaurants_mobile_ui/nav_bar.dart';
import 'package:restaurants_mobile_ui/nav_model.dart';

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
          // return Future.value(false);
        } else {}
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
          )),
    );

    // return Scaffold(
    //     appBar: AppBar(
    //   backgroundColor: primaryColor,
    //   title: const Text("Restaurants Management"),
    // ));
  }
}

class TabPage extends StatelessWidget {
  final int tab;

  // const TabPage({Key? key, required this.tab}) : super(key: key);

  const TabPage({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tab $tab'), backgroundColor: primaryColor),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Tab $tab'),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Page(tab: tab)));
              },
              child: const Text('Go to page'))
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
    return Scaffold(
      appBar:
          AppBar(title: Text('Page Tab $tab'), backgroundColor: primaryColor),
      body: Center(child: Text('Tab $tab')),
    );
  }
}
