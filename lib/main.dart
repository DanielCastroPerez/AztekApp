import 'package:aztekapp/core/route/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: createAppRouter(),
      title:  "Almacen Aztek",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.tealAccent,
          foregroundColor: Colors.white,
          elevation: 8,
        ),      
      ),
    );
  }
}
