import 'package:flutter/material.dart';

class PageItemeditform extends StatefulWidget {
  final Map item;
  const PageItemeditform({super.key, required this.item});

  @override
  State<PageItemeditform> createState() => _PageItemeditformState();
}

class _PageItemeditformState extends State<PageItemeditform> {
  late TextEditingController nameItem;
  late TextEditingController typeItem;
  late TextEditingController barcode;
  late TextEditingController provider;
  late TextEditingController priceItem;
  late TextEditingController statusItem;
  late TextEditingController entryDate;

  @override
  void initState() {
    super.initState();
    nameItem = TextEditingController(text: widget.item["nombre"]);
    typeItem = TextEditingController(text: widget.item["tipo"]);
    barcode = TextEditingController(text: widget.item["codigo_de_barras"]);
    provider = TextEditingController(text: widget.item["proveedor"]);
    priceItem = TextEditingController(text: widget.item["precio"].toString());
    statusItem = TextEditingController(text: widget.item["estado"]);
    entryDate = TextEditingController(text: widget.item["fecha_de_entrada"]);
  }
  

  // tal ves se podria separar para que esta pantalla solo sea formulario 
  //y en otra mandar a llamar TextField no se se veria chido, pero deveria migrar los initState,TextEditingController 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editar Articulo "), centerTitle: true),
      //backgroundColor: Colors.lime,
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.0),
            
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameItem,
                decoration: InputDecoration(
                  labelText: "Nombre del articulo",
                  hintText: nameItem.toString(),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      nameItem.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),

              SizedBox(height: 17.0),

              TextField(
                controller: typeItem,
                decoration: InputDecoration(
                  labelText: widget.item["tipo"],
                  hintText: typeItem.toString(),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      typeItem.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),

              SizedBox(height: 17.0),

              TextField(
                controller: barcode,
                decoration: InputDecoration(
                  labelText: "Codigo de barras",
                  hintText: barcode.toString(),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      barcode.clear();
                    },
                    icon: Icon(Icons.qr_code_scanner_sharp),
                  ),
                ),
              ),

              SizedBox(height: 17.0),

              TextField(
                controller:provider ,// a la variable que le dara seguimiento
                decoration: InputDecoration(
                  labelText: "Proveedor", 
                  hintText: provider.toString(),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed: (){
                    provider.clear();
                  }, 
                  icon: Icon(Icons.clear))
                ),
              ),

               SizedBox(height: 17.0),

               TextField(
                controller: priceItem,
                decoration: InputDecoration(
                  labelText: "Precio del articulo",
                  hintText:priceItem.toString(),
                  border: OutlineInputBorder(),
                  suffixIcon:IconButton(onPressed: (){
                      priceItem.clear();
                  }, 
                  icon: Icon(Icons.clear))
                ),
               ),

               SizedBox(height: 17.0),

               TextField(
                controller: statusItem,// aqui si agregar una lista en cascada[]
                decoration: InputDecoration(
                  labelText: "Estatus Disponible/En uso",
                  hintText: statusItem.toString(),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed: (){
                    statusItem.clear();
                  }, icon: Icon(Icons.clear))
                ),
               ),

               SizedBox(height: 17.0),

               TextField(
                controller: entryDate,
                decoration: InputDecoration(
                  labelText: "Fecha de entrada:",// PONER UN DATE
                  hintText: entryDate.toString(),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed: (){
                    entryDate.clear();
                  }, 
                  icon: Icon(Icons.calendar_month_outlined))
                ),
               )

            ],
          ),
        ),
      ),
    );
  }
}
