import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:food_seek/presentation/home_view.dart';
import 'package:food_seek/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final cameras =  await availableCameras();
  runApp(MyApp(cameras: cameras,));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({super.key, required this.cameras});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
       theme: theme,
      home: HomeView(cameras: cameras,)
    );
  }
}
