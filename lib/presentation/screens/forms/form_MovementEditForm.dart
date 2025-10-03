import 'package:flutter/material.dart';


class PageMovementeditform extends StatefulWidget {
  final Map movement;
  const PageMovementeditform({super.key,required this.movement});

  @override
  State<PageMovementeditform> createState() => _PageMovementeditformState();
}

class _PageMovementeditformState extends State<PageMovementeditform> {

  late TextEditingController type;
  late TextEditingController reason;
  late TextEditingController date;

  @override
  void initState(){
    super.initState();
    
    type = TextEditingController(text: widget.movement["tipo"]);
    reason =TextEditingController(text: widget.movement["razon"]);
    date =TextEditingController(text: widget.movement["fecha"]);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editar Movimiento"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(13.0)),
          child: Column(
            children: [
              TextField(
                controller: type,
                decoration: InputDecoration(
                  labelText: "Tipo",
                  hintText: widget.movement["tipo"],
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      //
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),

              SizedBox(height: 17.0),

              TextField(
                controller: reason,
                decoration: InputDecoration(
                  labelText: "Razon",
                  hintText: widget.movement["razon"],
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      //
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),

              SizedBox(height: 17.0),

              TextField(
                controller: date,
                decoration: InputDecoration(
                  labelText: "Fecha",
                  hintText: widget.movement["fecha"], // poner tipo date 
                  border: OutlineInputBorder(),
                  prefixIcon: IconButton(
                    onPressed: () {
                      //
                    },
                    icon: Icon(Icons.date_range_outlined),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}