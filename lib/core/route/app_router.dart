import 'package:aztekapp/home/route/home_route_module.dart';
import 'package:aztekapp/home/route/home_routes.dart';
import 'package:aztekapp/shared/app_route_module.dart';
import 'package:go_router/go_router.dart';

GoRouter createAppRouter() {

  final List<AppRouteModule> modules = [    
    HomeRouteModule(),
  ];

  return GoRouter(
    initialLocation: HomeRoutes.home.buildPath(pathParams: {'page': '0'}),
    routes: modules.expand((m) => m.routes).toList(),
  );
}
