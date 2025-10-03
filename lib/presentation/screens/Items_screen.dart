import 'package:aztekapp/data/datasources/almacen_remote_datasource.dart';
import 'package:aztekapp/presentation/screens/forms/form_ItemEditForm.dart';
import 'package:aztekapp/presentation/widgets/backgroundcontainer.dart';
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
      body: Backgroundcontainer(
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final item = _items[index];
            final nameItem = item["nombre"];
            final typeItem = item["tipo"];
            final provider = item["proveedor"];
            final priceItem = item["precio"];
            return Card(
              margin: EdgeInsets.all(8.0),
              elevation: 4,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.build, color: Colors.blue),
                    title: Text("$nameItem"),
                    subtitle: Text(
                      "Tipo: $typeItem\nProvedor: $provider\nPrecio: \$$priceItem",
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          //Pendientes: todo esto meterlo en una clase
                          backgroundColor: Colors.lightBlue[100],
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              width: double.infinity,
                              height: 500,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsGeometry.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.people,
                                            color: Colors.purple,
                                          ),
                                          SizedBox(width: 8.0),
                                          Text("Datos de el articulo "),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.label_outline,
                                            color: Colors.blueGrey,
                                          ),
                                          SizedBox(width: 8.0),
                                          Text("Nombre: $nameItem"),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsGeometry.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.category,
                                            color: Colors.deepOrange,
                                          ),
                                          SizedBox(width: 8.0),
                                          Text("Tipo: $typeItem"),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.qr_code_scanner,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(width: 8.0),
                                          Text(
                                            "Codigo de barras: ${item["codigo_de_barras"]}",
                                          ),
                                        ],
                                      ),
                                    ),

                                    ///
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.store,
                                            color: Colors.indigo,
                                          ),
                                          SizedBox(width: 8.0),
                                          Text("Proveedor: $provider"),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.attach_money,
                                            color: Colors.green,
                                          ),
                                          SizedBox(width: 8.0),
                                          Text(
                                            "Precio: ${priceItem.toString()}",
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.info_outline,
                                            color: Colors.teal,
                                          ),
                                          SizedBox(width: 8.0),
                                          Text("Estado: ${item["estado"]}"),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today,
                                            color: Colors.brown,
                                          ),
                                          SizedBox(width: 8.0),
                                          Text(
                                            "Fecha entrada: ${item["fecha_de_entrada"]}",
                                          ),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsetsGeometry.all(8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.edit,
                                              color: Colors.orange,
                                            ),
                                            iconSize: 30,
                                            tooltip: "Editar este elemento",
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PageItemeditform(
                                                        item: item,
                                                      ),
                                                ),
                                              );
                                              debugPrint("Editando Empl $item");
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                            iconSize: 30,
                                            tooltip: "Eliminar este elemento",
                                            onPressed: () {
                                              debugPrint("Eliminar item $item");
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.keyboard_arrow_right_sharp),
                    ),
                    onTap: () {
                      //Pendientes: ESTE REPLICARLO EN EMPOYEE, MOVEMENTS PARA MOSTRAR TODA LA INFORMACION EN UN A PANTALLA O CUADRITO
                      debugPrint("QUIERE VER MAS INFORMACION");
                    },
                  ),
                ],
              ),
            );
          },
        ),
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
