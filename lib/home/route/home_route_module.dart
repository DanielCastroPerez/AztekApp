import 'package:aztekapp/home/presentation/home_screen.dart';
import 'package:aztekapp/home/route/home_routes.dart';
import 'package:aztekapp/shared/app_route_module.dart';
import 'package:go_router/go_router.dart';

class HomeRouteModule extends AppRouteModule {
  
  @override
  List<GoRoute> get routes => [
        GoRoute(
          path: HomeRoutes.home.path,
          name: HomeRoutes.home.name,
          builder:  (context, state) {
        final pageIndex = int.parse( state.pathParameters['page'] ?? '0' );

        return HomeScreen( pageIndex: pageIndex );
      }
        ),
      ];
}