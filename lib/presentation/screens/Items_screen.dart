import 'package:aztekapp/data/datasources/almacen_remote_datasource.dart';
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
  void initState(){
    super.initState();
    _liadData();
  }

  Future<void> _liadData () async{
    await _datasource.loadData();
    setState(() {
      _items = _datasource.getItems();
    });
  }
  
  @override
  Widget build(BuildContext context) {

    if (_items.isEmpty){
      return Center(
        child: CircularProgressIndicator()
        );
    }
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        return Card( 
          margin:  EdgeInsets.all(8.0),
          elevation: 4,
          child: ListTile(
            leading: Icon(Icons.build,color: Colors.blue),
            title: Text("Tipo: ${item["tipo"]} Estado: ${item["estado"]}\n Provedor: ${item["proveedor"]} Precio: ${item["precio"]}"),
          
          ),
        );
      },
      
    );
  }
}
