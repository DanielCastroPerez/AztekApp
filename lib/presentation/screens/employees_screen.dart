import 'package:aztekapp/data/datasources/almacen_remote_datasource.dart';
import 'package:flutter/material.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {

  final AlmacenRemoteDatasource _datasource = AlmacenRemoteDatasource();
  List<dynamic> _employees  = [];

  // Esto es para cuando arranca la app es lo primero que hace
  @override
  void initState(){
    super.initState();
    _loadinData(); // mi metodo al que llamara
  }

  Future <void> _loadinData() async{
    await _datasource.loadData();
    setState(() {
      _employees  = _datasource.getEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_employees.isEmpty){
      return Center(child:CircularProgressIndicator(),);
    }
    return ListView.builder(
      itemCount: _employees.length,
      itemBuilder: (context, index){
        final  empl = _employees[index];
        return Card(
          margin: EdgeInsets.all(8.0),
          elevation:4,
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text("${empl["nombre"]} ${empl["apellido"]}"),
            subtitle: Text("${empl["correo_electronico"]}Rol: ${empl["rol"]}"),
          ),
        );
      },
      
    );
  }
}