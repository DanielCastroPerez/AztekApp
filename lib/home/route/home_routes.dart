import 'package:aztekapp/shared/app_route_navigable.dart';

enum HomeRoutes implements NavigableRoute {
  home('/home/:page');

  @override
  final String path;
  const HomeRoutes(this.path);

  @override
  String buildPath({
    Map<String, String>? pathParams,
    Map<String, String>? queryParams,
  }) {
    var result = path;
    pathParams?.forEach((key, value) {
      result = result.replaceAll(':$key', value);
    });
    if (queryParams != null && queryParams.isNotEmpty) {
      final queryString = queryParams.entries
          .map((e) => '${e.key}=${e.value}')
          .join('&');
      result = '$result?$queryString';
    }
    return result;
  }
}
