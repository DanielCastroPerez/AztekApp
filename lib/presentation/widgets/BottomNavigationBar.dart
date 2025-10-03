import 'package:flutter/material.dart';

class ScreenBottomnavigationbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const ScreenBottomnavigationbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        
        backgroundColor: Color(0xFFB2EBF2),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined,color: Colors.black87,),
            label: "Items",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined,color: Colors.black87,),
            label: "Employees",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping_outlined,color: Colors.black87,),
            label: "Movements",
          ),
        ],
      );
  }
}
