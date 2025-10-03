import 'package:flutter/material.dart';

class ShowEditItemDialog extends StatefulWidget {
  final BuildContext context;
  final Map item;
  final int index;

  const ShowEditItemDialog({
    super.key,
    required this.context,
    required this.item,
    required this.index,
  });

  @override
  State<ShowEditItemDialog> createState() => _ShowEditItemDialogState();
}

class _ShowEditItemDialogState extends State<ShowEditItemDialog> {

  final _name = TextEditingController(); //text: item["tipo"]
  final _type = TextEditingController();
  final _barCode = TextEditingController();
  final _provider = TextEditingController();
  final _price = TextEditingController();
  final _status = TextEditingController();
  final _entryDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
    //   child: showDialog(
    //   context: context,
    //   builder: (context)=>AlertDialog(
    //     title: Text("Editar inventario"),
    //   )
    // ),
    );
    
  }
}
