import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:food_seek/presentation/cameraFood/camera_screen_food.dart';
import 'package:get/get.dart';
import 'package:food_seek/services/navigation_service.dart';

class HomeView extends StatelessWidget {
  final List<CameraDescription> cameras;
  HomeView({super.key, required this.cameras});

  final NavigationService navigationService = Get.put(NavigationService());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: navigationService.pages[navigationService.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navigationService.currentIndex.value,
            onTap: navigationService.updateIndex,
            items: [
              BottomNavigationBarItem(
                icon: Transform.translate(
                  offset: const Offset(-10, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.home_filled, size: 30),
                      Text('Home'),
                    ],
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Transform.translate(
                  offset: const Offset(-25, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.bar_chart, size: 30),
                      Text('Analytics'),
                    ],
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Transform.translate(
                  offset: const Offset(-50, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.person, size: 30),
                      Text('Perfil'),
                    ],
                  ),
                ),
                label: '',
              ),
            ],
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            shape: const CircleBorder(),
            onPressed: () {
              Get.to(() => CameraScreenFood(cameras: cameras));
            },
            child: const Icon(Icons.add, size: 30, color: Colors.white),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        ));
  }
}
