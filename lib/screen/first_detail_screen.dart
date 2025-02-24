import 'package:flutter/material.dart';
import 'package:flutter_go_router_example/_core/layout/common_layout.dart';
import 'package:go_router/go_router.dart';

class FirstDetailScreen extends StatelessWidget {
  final String id;
  final String query;

  const FirstDetailScreen({super.key, required this.id, required this.query});

  @override
  Widget build(BuildContext context) {
    print('FirstDetailScreen build');
    return CommonLayout(
        title: 'first detail',
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(GoRouterState.of(context).matchedLocation),
              Text('ID (Path Parameter): $id'),
              Text('Query Parameter: $query'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final uriString = Uri(path: '/first/15', queryParameters: {'value' : 'go'}).toString();
                  context.go(uriString);
                },
                child: Text('Go to first detail (go)'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.goNamed('firstDetail', pathParameters: {'id' : '15'}, queryParameters: {'value' : 'goNamed'});
                },
                child: Text('Go to first detail (goNamed)'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final uriString = Uri(path: '/first/15', queryParameters: {'value' : 'push'}).toString();
                  final result =  await context.push(uriString);
                  print('result : $result');
                },
                child: Text('Go to first detail (push)'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed('firstDetail', pathParameters: {'id' : '15'}, queryParameters: {'value' : 'pushNamed'});
                },
                child: Text('Go to first detail (pushNamed)'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.pop('pop');
                },
                child: Text('Go Back'),
              ),
            ],
          ),
        )
    );
  }
}
