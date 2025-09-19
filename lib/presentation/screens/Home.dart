import 'package:aztekapp/data/datasources/almacen_remote_datasource.dart';
import 'package:aztekapp/presentation/widgets/BottomNavigationBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AlmacenRemoteDatasource _dataSource = AlmacenRemoteDatasource();
  List<dynamic> _employee = [];
  List<dynamic> _items = [];
  List<dynamic> _movements = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _dataSource.loadData();
    setState(() {
      _employee = _dataSource.getEmployees();
      _items = _dataSource.getItems();
      _movements = _dataSource.getMovements();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: ScreenBottomnavigationbar());
  }
}
