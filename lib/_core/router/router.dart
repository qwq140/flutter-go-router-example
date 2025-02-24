import 'package:flutter_go_router_example/screen/first_detail_screen.dart';
import 'package:flutter_go_router_example/screen/first_screen.dart';
import 'package:flutter_go_router_example/screen/home_screen.dart';
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
      ],
    ),
  ],
);
