import 'package:aztekapp/data/datasources/almacen_remote_datasource.dart';
import 'package:flutter/material.dart';

class MovementsScreen extends StatefulWidget {
  const MovementsScreen({super.key});

  @override
  State<MovementsScreen> createState() => _MovementsScreenState();
}

class _MovementsScreenState extends State<MovementsScreen> {
  final AlmacenRemoteDatasource _datasource = AlmacenRemoteDatasource();

  List<dynamic> _movements = []; // porque no puedo ponerle final?
  List<dynamic> _employees = [];
  List<dynamic> _items = [];

  @override
  void initState() {
    //??
    super.initState(); //??
    _loadinData();
  }

  Future<void> _loadinData() async {
    await _datasource.loadData();
    setState(() {
      //??
      _movements = _datasource.getMovements();
      _employees = _datasource.getEmployees();
      _items = _datasource.getItems();
    });
  }

  String _getItemName(int idArticulo) {
    final item = _items.firstWhere(
      (i) => i["id"] == idArticulo,
      orElse: () => null, //??
    );
    return item != null ? item["nombre"] : "Desconocido"; //??
  }

  String __getEmployeeName(int idEmployee) {
    final emp = _employees.firstWhere(
      (e) => e["id"] == idEmployee,
      orElse: () => null,
    );
    return emp != null ? emp["nombre"] : "Desconocido"; //??
  }

  @override
  Widget build(BuildContext context) {
    if (_movements.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemCount: _movements.length,
      itemBuilder: (context, index) {
        final mov = _movements[index];
        return Card(
          margin: EdgeInsets.all(8.0),
          elevation: 8.0,
          child: ListTile(
            leading: Icon(
              mov["tipo"] == "entrada"
                  ? Icons.arrow_downward_sharp
                  : Icons.arrow_upward_sharp,
              color: mov["tipo"] == "entrada" ? Colors.green : Colors.red,
            ),
            title: Text(
              "${mov["tipo"].toUpperCase()} - ${_getItemName(mov["id_articulo"])}",
            ),
            subtitle: Text(
              "Razon :${mov["razon"].toUpperCase()} Fecha ${mov["fecha"]}\nEmpleado: ${__getEmployeeName(mov["id_empleado"])}",
            ),
          ),
        );
      },
    );
  }
}
