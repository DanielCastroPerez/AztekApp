import 'package:flutter/material.dart';

class ListviewItems extends StatelessWidget {
  const ListviewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("Boton del elebate"),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                height: 400,
                child: Center(
                  child: ElevatedButton(
                    child: Text("Boton "),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("Boton del elebate"),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                width:double.infinity,
                child: Column(
                  children: [
                    Text("Nombre"),
                    Text("salario"),
                    Text("correo"),
                    Text("telefono"),
                    Text("linkelind"),
                    Text("rol"),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }