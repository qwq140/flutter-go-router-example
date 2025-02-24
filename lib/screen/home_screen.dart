import 'package:flutter/material.dart';
import 'package:flutter_go_router_example/_core/layout/common_layout.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('HomeScreen build');
    return CommonLayout(
      title: 'Home',
      child: ListView(
        children: [
          Text(GoRouterState.of(context).matchedLocation),
          ElevatedButton(
            onPressed: () {
              context.go('/first');
            },
            child: Text('Go to First Screen (go)'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed('first');
            },
            child: Text('Go to First Screen (goNamed)'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/shell/search');
            },
            child: Text('go shell route screen'),
          ),
        ],
      ),
    );
  }
}
