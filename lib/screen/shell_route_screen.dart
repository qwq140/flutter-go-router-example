import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellRouteScreen extends StatelessWidget {
  final Widget child;

  const ShellRouteScreen({super.key, required this.child});

  int _getCurrentIndex(BuildContext context) {
    print('_getCurrentIndex');
    final path = GoRouterState.of(context).matchedLocation;

    if(path == 'shell/search') {
      return 0;
    } else if(path == 'shell/settings') {
      return 1;
    } else {
      return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${GoRouterState.of(context).matchedLocation}'),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _getCurrentIndex(context),
        onTap: (index) {
          if(index == 0) {
            context.go('/shell/search');
          } else if(index == 1) {
            context.go('/shell/settings');
          } else {
            context.go('/shell/profile');
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
        ],
      ),
    );
  }
}
