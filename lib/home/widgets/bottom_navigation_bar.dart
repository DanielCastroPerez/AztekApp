import 'package:aztekapp/home/route/home_routes.dart';
import 'package:aztekapp/shared/app_navigator.dart';
import 'package:flutter/material.dart';

class ScreenBottomnavigationbar extends StatelessWidget {
  final int currentIndex;

  const ScreenBottomnavigationbar({
    super.key,
    required this.currentIndex,
  });

  void onItemTapped( BuildContext context, int index ) {    
    switch(index) {
      case 0:
        AppNavigator.navigate(
          context, 
          route: HomeRoutes.home,
          type: NavigationType.go,
          pathParams: { 'page': '0' }
        );
        break;
      
      case 1:
        AppNavigator.navigate(
          context, 
          route: HomeRoutes.home,
          type: NavigationType.go,
          pathParams: { 'page': '1' }
        );
        break;

      case 2:
        AppNavigator.navigate(
          context, 
          route: HomeRoutes.home,
          type: NavigationType.go,
          pathParams: { 'page': '2' }
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => onItemTapped(context, value),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined),
            label: "Items",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: "Employees",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping_outlined),
            label: "Movements",
          ),
        ],
      );
  }
}
