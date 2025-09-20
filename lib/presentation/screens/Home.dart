import 'package:aztekapp/presentation/screens/Items_screen.dart';
import 'package:aztekapp/presentation/screens/employees_screen.dart';
import 'package:aztekapp/presentation/screens/movements_screen.dart';
import 'package:aztekapp/presentation/widgets/BottomNavigationBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> navigationScreen = [
    ItemsScreen(),
    EmployeesScreen(),
    MovementsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Almacen Aztek", style: TextStyle(fontSize: 8.0)),
        centerTitle: true, // despues agregar las extencion de googlefont
      ),
      body: navigationScreen[_selectedIndex],
      bottomNavigationBar: ScreenBottomnavigationbar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
      ),
    );
  }
}
