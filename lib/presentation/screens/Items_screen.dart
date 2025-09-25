import 'package:aztekapp/data/datasources/almacen_remote_datasource.dart';
import 'package:aztekapp/presentation/screens/forms/form_ItemEditForm.dart';
import 'package:flutter/material.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  final AlmacenRemoteDatasource _datasource = AlmacenRemoteDatasource();
  List<dynamic> _items = [];

  @override
  void initState() {
    super.initState();
    _liadData();
  }

  Future<void> _liadData() async {
    await _datasource.loadData();
    setState(() {
      _items = _datasource.getItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_items.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            elevation: 4,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.build, color: Colors.blue),
                  title: Text(
                    " Tipo: ${item["tipo"]}\n Estado: ${item["estado"]}\n Provedor: ${item["proveedor"]}\n Precio: ${item["precio"]}",
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
                            builder: (context) => PageItemeditform(item: item),
                          ),
                        );
                        debugPrint("Editando item $item");
                        
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      tooltip: "Eliminar este elemento",
                      onPressed: () {
                        debugPrint("Eliminar item $item");
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Quiere agregar el usuario");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
