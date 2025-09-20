import 'dart:convert';

import 'package:flutter/services.dart';

class AlmacenRemoteDatasource {
  static Map<String, dynamic>? _data;
  Future<void> loadData() async {
    if (_data == null) {
      final String jsonString = await rootBundle.loadString(
        "assets/data/mocks.json",
      );
      _data = json.decode(jsonString);
    }
  }

  List<dynamic> getEmployees() {
    return _data?["empleados"] ?? [];
  }

  List<dynamic> getItems(){
    return _data?['articulos'] ?? [];
  }
  List<dynamic> getMovements(){
    return _data?["movimientos"]?? [];
  }
}
