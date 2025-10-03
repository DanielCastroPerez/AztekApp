import 'package:aztekapp/storage/presentation/Items_screen.dart';
import 'package:aztekapp/home/presentation/employees_screen.dart';
import 'package:aztekapp/storage/presentation/movements_screen.dart';
import 'package:aztekapp/home/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  final int pageIndex;

  const HomeScreen({
    super.key, 
    required this.pageIndex
  });

  final viewRoutes = const <Widget>[
    ItemsScreen(),
    EmployeesScreen(),
    MovementsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Almacen Aztek", style: TextStyle(fontSize: 50.0)),
        centerTitle: true, // despues agregar las extencion de googlefont
      ),
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: ScreenBottomnavigationbar(
        currentIndex: pageIndex,
      ),
    );
  }
}

