import 'package:flutter/material.dart';

class CommonLayout extends StatelessWidget {
  final Widget child;
  final String? title;
  final bool showAppBar;
  final bool showBottomNav;
  final List<BottomNavigationBarItem>? bottomNavItems;
  final int currentIndex;
  final ValueChanged<int>? onBottomNavTap;

  const CommonLayout({
    Key? key,
    required this.child,
    this.title,
    this.showAppBar = true,
    this.showBottomNav = false,
    this.bottomNavItems,
    this.currentIndex = 0,
    this.onBottomNavTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? AppBar(
        title: Text(title ?? 'App Title'),
        centerTitle: true,
      ) : null,
      body: SafeArea(
        child: child,
      ),
      bottomNavigationBar: showBottomNav && bottomNavItems != null
          ? BottomNavigationBar(
        items: bottomNavItems!,
        currentIndex: currentIndex,
        onTap: onBottomNavTap,
      )
          : null,
    );
  }
}