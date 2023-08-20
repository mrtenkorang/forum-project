import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:knustforum/frontend/pages/authentication/auth.dart';

import 'frontend/forum/forum.dart';
import 'frontend/pages/home_page.dart';
import 'frontend/pages/wrapper.dart';

class Navigation {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const MaterialApp(
            home: Wrapper(),
          );
        },
      ),
      GoRoute(
        path: '/login-register',
        builder: (context, state) {
          return const MaterialApp(
            home: AuthenticationPage(),
          );
        },
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) {
          return const MaterialApp(
            home: HomePage(),
          );
        },
        routes: [
          GoRoute(
              name: 'forum',
              path: 'forum',
              builder: (context, state) {
                return const MaterialApp(
                  home: Forum(),
                );
              }),
        ],
      ),
    ],
  );
}
