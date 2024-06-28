import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/screens/main_navagation_screen.dart';
import 'package:thread_clone/setting/privacy_screen.dart';
import 'package:thread_clone/setting/setting_screen.dart';

final router = GoRouter(initialLocation: "/home", routes: [
  GoRoute(
    path: '/:tab(home|search|activity|profile)',
    name: MainNavigationScreen.routeName,
    builder: (context, state) {
      final String tab = state.pathParameters["tab"]!;
      return MainNavigationScreen(tab: tab);
    },
  ),
  GoRoute(
    path: SettingScreen.routeURL,
    name: SettingScreen.routeName,
    builder: (context, state) => const SettingScreen(),
    routes: [
      GoRoute(
        path: PrivacyScreen.routeURL,
        name: PrivacyScreen.routeName,
        builder: (context, state) => const PrivacyScreen(),
      )
    ],
  ),
], observers: [
  MyGoRouterObserver()
]);

class MyGoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    print('didPush: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    print('didPop: ${route.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    print('didRemove: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    print('didReplace: ${oldRoute?.settings.name} with ${newRoute?.settings.name}');
  }
}
