import 'package:aztekapp/shared/app_route_navigable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum NavigationType { go, push, replace }

class AppNavigator {
  /// Método genérico
  static void navigate(
    BuildContext context, {
    required NavigableRoute route,
    Map<String, String>? pathParams,
    Map<String, String>? queryParams,
    NavigationType type = NavigationType.replace,
  }) {
    final path = route.buildPath(pathParams: pathParams, queryParams: queryParams);

    switch (type) {
      case NavigationType.go:
        context.go(path);
        break;
      case NavigationType.push:
        context.push(path);
        break;
      case NavigationType.replace:
        context.replace(path);
        break;
    }
  }
}
