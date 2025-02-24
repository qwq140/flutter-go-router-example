import 'package:flutter/material.dart';
import 'package:flutter_go_router_example/_core/layout/common_layout.dart';
import 'package:flutter_go_router_example/_core/router/router.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
        title: 'login',
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(GoRouterState.of(context).matchedLocation),
              Text('login : $isLoggedIn'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isLoggedIn = !isLoggedIn;
                  });
                },
                child: Text(isLoggedIn ? 'logout' : 'login'),
              ),
            ],
          ),
        )
    );;
  }
}
