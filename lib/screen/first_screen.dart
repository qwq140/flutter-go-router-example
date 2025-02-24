import 'package:flutter/material.dart';
import 'package:flutter_go_router_example/_core/layout/common_layout.dart';
import 'package:go_router/go_router.dart';

class FirstScreen extends StatelessWidget {

  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('FirstScreen build');
    return CommonLayout(
      title: 'First',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(GoRouterState.of(context).matchedLocation),
            ElevatedButton(
              onPressed: () {
                final uriString = Uri(path: '/first/13', queryParameters: {'value' : 'go'}).toString();
                context.go(uriString);
              },
              child: Text('Go to first detail (go)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      )
    );
  }
}
