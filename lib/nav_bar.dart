import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurants_mobile_ui/main.dart';

class NavBar extends ConsumerWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({super.key, required this.pageIndex, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomAppBar(
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
              navItem(Icons.home_outlined, pageIndex == 0,
                  onTap: () => onTap(0)),
              navItem(Icons.pin_drop_outlined, pageIndex == 1,
                  onTap: () => onTap(1)),
              const SizedBox(width: 80),
              navItem(Icons.favorite_outline, pageIndex == 2,
                  onTap: () => onTap(2)),
              navItem(Icons.person_outline, pageIndex == 3,
                  onTap: () => onTap(3)),
            ]));
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
}
