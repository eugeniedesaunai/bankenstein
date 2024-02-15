import 'package:bankenstein/blocs/authentication_cubbit.dart';
import 'package:bankenstein/core/go_route_refresh_stream.dart';
import 'package:bankenstein/presentation/pages/home_page.dart';
import 'package:bankenstein/presentation/pages/preference_page.dart';
import 'package:bankenstein/presentation/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

const _signInPagePath = '/sign-in';
const _homPagePath = '/home';
const _preferencePagePath = '/seeting';

abstract class AppRouter {
  static final _publicRoutes = [
    _signInPagePath,
  ];
  static GoRouter router(BuildContext context) => GoRouter(
        refreshListenable:
            GoRouterRefreshStream(context.read<AuthenticationCubit>().stream),
        redirect: (context, state) {
          final currentState = context.read<AuthenticationCubit>().state;
          final currentRoute = state.uri.toString();

          if (currentState is AuthenticationStateAuthenticated) {
            if (currentRoute == _signInPagePath) {
              return _homPagePath;
            }
          } else if (!_publicRoutes.contains(currentRoute) &&
              currentState is AuthenticationStateUnauthenticated) {
            return _signInPagePath;
          }

          return null;
        },
        initialLocation: _signInPagePath,
        routes: [
          GoRoute(
            name: SignInPage.name,
            path: _signInPagePath,
            builder: (context, state) {
              return const SignInPage();
            },
          ),
          GoRoute(
            name: HomePage.name,
            path: _homPagePath,
            builder: (context, state) {
              return const HomePage();
            },
          ),
          GoRoute(
            name: PreferencePage.name,
            path: _preferencePagePath,
            builder: (context, state) {
              return const PreferencePage();
            },
          ),
        ],
      );
}
