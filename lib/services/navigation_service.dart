import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_seek/presentation/screens/home_screen.dart';

class NavigationService extends GetxService {
  var currentIndex = 0.obs;
  var previusIndex = 0.obs;

  // Todas las páginas
  final List<Widget> pages = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  void updateIndex(int index) {
    previusIndex.value = currentIndex.value;
    currentIndex.value = index; 
  }

  // Volver a la página anterior
  void backToPrevPage() {
    Get.back();
  }
}
