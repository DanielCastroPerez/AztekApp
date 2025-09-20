import 'package:aztekapp/domain/entities/employees_entities.dart';
import 'package:aztekapp/domain/entities/items_entities.dart';

class MovementsEntities {
  final int id;
  final ItemsEntities itemsId;
  final EmployeesEntities employeeId;
  final String type;
  final String reason;
  final String date;
  
  MovementsEntities({
    required this.id,
    required this.itemsId,
    required this.employeeId,
    required this.type,
    required this.reason,
    required this.date,
  });
}