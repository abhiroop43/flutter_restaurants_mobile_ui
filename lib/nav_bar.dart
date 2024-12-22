import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restaurants_mobile_ui/main.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({super.key, required this.pageIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.only(
            left: 0, right: 0, bottom: Platform.isAndroid ? 16 : 0),
        child: BottomAppBar(
            elevation: 0.0,
            shape: CircularNotchedRectangle(),
            notchMargin: 8.0,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    height: 60,
                    color: primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        navItem(Icons.home_outlined, pageIndex == 0,
                            onTap: () => onTap(0)),
                        navItem(Icons.pin_drop_outlined, pageIndex == 1,
                            onTap: () => onTap(1)),
                        const SizedBox(width: 80),
                        navItem(Icons.favorite_outline, pageIndex == 2,
                            onTap: () => onTap(2)),
                        navItem(Icons.person_outline, pageIndex == 3,
                            onTap: () => onTap(3)),
                      ],
                    )))));
  }

  Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
    return Expanded(
        child: InkWell(
      onTap: onTap,
      child: Icon(icon,
          color: selected ? Colors.white : Colors.white.withValues(alpha: 0.4)),
    ));
  }
}
