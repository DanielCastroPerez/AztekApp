import 'package:aztekapp/data/datasources/almacen_remote_datasource.dart';
import 'package:aztekapp/presentation/screens/forms/form_EmployeeEditForm.dart';
import 'package:aztekapp/presentation/widgets/backgroundcontainer.dart';
import 'package:flutter/material.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  final AlmacenRemoteDatasource _datasource = AlmacenRemoteDatasource();
  List<dynamic> _employees = [];

  // Esto es para cuando arranca la app es lo primero que hace
  @override
  void initState() {
    super.initState();
    _loadinData(); // mi metodo al que llamara
  }

  Future<void> _loadinData() async {
    await _datasource.loadData();
    setState(() {
      _employees = _datasource.getEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_employees.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: Backgroundcontainer(
        child: ListView.builder(
          itemCount: _employees.length,
          itemBuilder: (context, index) {
            final empl = _employees[index];
            debugPrint("valor de emp: $empl  ?");
            return Card(
              margin: EdgeInsets.all(8.0),
              elevation: 4,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      color: Colors.blue,
                      size: 60.0,
                    ),
                    title: Text("${empl["nombre"]} ${empl["apellido"]}"),
                    subtitle: Text(
                      "${empl["correo_electronico"]}\nRol: ${empl["rol"]}",
                    ),
                    trailing: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.orange),
                          tooltip: "Editar este elemento",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PageEmployeEditform(employ: empl),
                              ),
                            );
                            debugPrint("Editando Empl $empl");
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          tooltip: "Eliminar este elemento",
                          onPressed: () {
                            debugPrint("Eliminar item $empl");
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
