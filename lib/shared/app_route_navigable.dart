abstract class NavigableRoute {
  String get path;

  /// Construye la ruta con pathParams y queryParams
  String buildPath({Map<String, String>? pathParams, Map<String, String>? queryParams});
}
