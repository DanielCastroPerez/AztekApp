import 'package:flutter/material.dart';

class PageEmployeEditform extends StatefulWidget {
  final Map employ;

  const PageEmployeEditform({super.key, required this.employ});

  @override
  State<PageEmployeEditform> createState() => _PageEmployeEditformState();
}

class _PageEmployeEditformState extends State<PageEmployeEditform> {
  late TextEditingController name;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController rol;

  @override
  void initState() {
    super.initState();

    name = TextEditingController(text: widget.employ["nombre"]);
    lastName = TextEditingController(text: widget.employ["apellido"]);
    email = TextEditingController(text: widget.employ["correo_electronico"]);
    rol = TextEditingController(text: widget.employ["rol"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editar Empleado"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(13.0)),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: "Nombre del empleado",
                  hintText: widget.employ["nombre"],
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
                controller: lastName,
                decoration: InputDecoration(
                  labelText: "Apellido",
                  hintText: widget.employ["apellido"],
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
                controller: email,
                decoration: InputDecoration(
                  labelText: "Correo electronico",
                  hintText: widget.employ["correo_electronico"],
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
                controller: rol,
                decoration: InputDecoration(
                  labelText: "Rol del empleado",
                  hintText: widget.employ["rol"],
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      //
                    },
                    icon: Icon(Icons.clear),
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
