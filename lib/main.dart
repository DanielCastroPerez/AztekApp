import 'package:aztekapp/presentation/screens/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:  "Almacen Aztek",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.tealAccent,
          foregroundColor: Colors.white,
          elevation: 8,
        ),
        
      ),
      home: HomeScreen(),
    );
  }
}