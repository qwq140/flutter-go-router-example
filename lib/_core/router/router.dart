import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_go_router_example/screen/error_screen.dart';
import 'package:flutter_go_router_example/screen/first_detail_screen.dart';
import 'package:flutter_go_router_example/screen/first_screen.dart';
import 'package:flutter_go_router_example/screen/home_screen.dart';
import 'package:flutter_go_router_example/screen/profile_screen.dart';
import 'package:flutter_go_router_example/screen/search_screen.dart';
import 'package:flutter_go_router_example/screen/settings_screen.dart';
import 'package:flutter_go_router_example/screen/shell_route_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return HomeScreen();
      },
      routes: [
        GoRoute(
          path: 'first',
          name: 'first',
          builder: (context, state) {
            return FirstScreen();
          },
          routes: [
            GoRoute(
              path: ':id',
              name: 'firstDetail',
              builder: (context, state) {
                final id = state.pathParameters['id'];
                final query = state.uri.queryParameters['value'];
                return FirstDetailScreen(
                    id: id ?? 'No Id', query: query ?? 'No Query');
              },
            ),
          ],
        ),
        ShellRoute(
          builder: (context, state, child) {
            return ShellRouteScreen(child: child);
          },
          routes: [
            GoRoute(
              path: '/shell/search',
              name: 'search',
              builder: (context, state) {
                return SearchScreen();
              },
            ),
            GoRoute(
              path: '/shell/settings',
              name: 'settings',
              builder: (context, state) {
                return SettingsScreen();
              },
            ),
            GoRoute(
              path: '/shell/profile',
              name: 'profile',
              builder: (context, state) {
                return ProfileScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
  // 에러 발생 시 반환할 위젯을 정의
  // 기본 네비게이션 트랜지션
  // errorBuilder: (context, state) {
  //   print(state.error.toString());
  //   return ErrorScreen(error: state.error.toString());
  // },
  // 커스텀 트랜지션 가능
  errorPageBuilder: (context, state) {
    print(state.error.toString());
    return CustomTransitionPage(
      key: state.pageKey,
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween(begin: Offset(1.0, 0.0), end: Offset.zero).animate(animation),
          child: child,
        );
      },
      child: ErrorScreen(
        error: state.error.toString(),
      ),
    );
  },
  debugLogDiagnostics: true,
);
