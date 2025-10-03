import 'package:google_fonts/google_fonts.dart';
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
          backgroundColor:  Color(0xFF00BCD4),
          foregroundColor: Colors.white,
          elevation: 8,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          TextTheme(
            // displayLarge: TextStyle(// Para los appBar 
            //   color: Colors.black87,
            //   fontWeight: FontWeight.bold,
            //   fontSize: 60.0,
            // ),
            bodyLarge: TextStyle( // Para los titles de ListTilte
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 19.0,
            ),
            bodyMedium: TextStyle( // para el resto de la lista
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 15.0
            )
          )
        ),

      ),
    );
  }
}
