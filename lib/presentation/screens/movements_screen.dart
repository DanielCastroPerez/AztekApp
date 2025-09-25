import 'package:aztekapp/data/datasources/almacen_remote_datasource.dart';
import 'package:aztekapp/presentation/screens/forms/form_MovementEditForm.dart';
import 'package:flutter/material.dart';

class MovementsScreen extends StatefulWidget {
  const MovementsScreen({super.key});

  @override
  State<MovementsScreen> createState() => _MovementsScreenState();
}

class _MovementsScreenState extends State<MovementsScreen> {
  final AlmacenRemoteDatasource _datasource = AlmacenRemoteDatasource();

  List<dynamic> _movements = []; 
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
      orElse: () => [], 
    );
    return item != null ? item["nombre"] : "Desconocido"; 
  }

  String _getEmployeeName(int idEmployee) {
    final emp = _employees.firstWhere(
      (e) => e["id"] == idEmployee,
      orElse: () => [],
    );
    return emp != null ? emp["nombre"] : "Desconocido"; 
  }

  // Map <String,dynamic>? _listaMoviment(Map employ, Map item,Map mov){
  //   Map<String, dynamic> Moviment = Map();
  //   Moviment["id_articulo"]=item;
  //   Moviment["id_empleado"]=employ;
  //   Moviment["tipo"]=mov["tipo"];
  //   Moviment["razon"]=mov["razon"];
  //   Moviment["fecha"]=mov["fecha"];
  //   return Moviment;
  // }

  @override
  Widget build(BuildContext context) {
    if (_movements.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: ListView.builder(
        itemCount: _movements.length,
        itemBuilder: (context, index) {
          final mov = _movements[index];
          final item = _getItemName(mov["id_articulo"]);
          final employ =  _getEmployeeName(mov["id_empleado"]);
          
          Map<String, dynamic> Moviment = Map(); // ESTA WEA METERLA EN UNA FUNCION 
            Moviment["id_articulo"]=item;
            Moviment["id_empleado"]=employ;
            Moviment["tipo"]=mov["tipo"];
            Moviment["razon"]=mov["razon"];
            Moviment["fecha"]=mov["fecha"];
      
          debugPrint("Valor  que nececito jeje ${Moviment} jeje");
          return Card(
            margin: EdgeInsets.all(8.0),
            elevation: 8.0,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    mov["tipo"] == "entrada"
                        ? Icons.arrow_downward_sharp
                        : Icons.arrow_upward_sharp,
                    color: mov["tipo"] == "entrada" ? Colors.green : Colors.red,
                  ),
                  title: Text(
                    "${mov["tipo"].toUpperCase()} - ${employ.toString()}",
                  ),
                  subtitle: Text(
                    "Razon :${mov["razon"].toUpperCase()}\nFecha ${mov["fecha"]}\nEmpleado: ${item.toString()}",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.orange),
                      tooltip: "Editar este elemento",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PageMovementeditform(movement: Moviment),
                          ),
                        );
                        debugPrint("Editando Moviment $Moviment");
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      tooltip: "Eliminar este elemento",
                      onPressed: () {
                        debugPrint("Eliminar item $Moviment");
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ///
      },
      child: Icon(Icons.add),
      ),
    );
    
  }
}
