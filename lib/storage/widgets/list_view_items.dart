import 'package:flutter/material.dart';

class ListviewItems extends StatelessWidget {
  final List<dynamic> data;
  const ListviewItems({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return ListTile(
          title: Text(item["name"] ?? "Sin nombre"),
          subtitle: Text(item["provider"] ?? "Sin proveedor"),
        );
      },
    );
  }
}
