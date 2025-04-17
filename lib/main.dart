import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_seek/presentation/auth/sign_auth.dart';
import 'package:food_seek/presentation/home_view.dart';
import 'package:food_seek/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final cameras = await availableCameras();
  runApp(MyApp(cameras: cameras,));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User? user = snapshot.data;
            if (user == null) {
              return SignAuth(cameras: cameras,); // Usuario no autenticado
            } else {
              return HomeView(cameras: cameras); // Usuario autenticado
            }
          }
          // Mientras espera, muestra un indicador de carga
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}