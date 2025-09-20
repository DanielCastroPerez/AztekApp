import 'package:aztekapp/data/datasources/almacen_remote_datasource.dart';
import 'package:flutter/material.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});
  Future <List<dynamic>> _loadItems ()async{
    final almacenRemoteDatasource =  AlmacenRemoteDatasource();
    final data = almacenRemoteDatasource.getItems();
    return data;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
    // return Center(
    //   child: Text("Items Screen",style: TextStyle(fontSize: 40),),
    // );
  }
}