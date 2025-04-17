import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_seek/presentation/home_view.dart';
import 'package:food_seek/services/auth_service.dart';

class SignAuth extends StatelessWidget {
  final List<CameraDescription> cameras;
  const SignAuth({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService(); // Instancia el servicio de autenticación

    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo que cubre toda la pantalla
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/reciples.png'),
                fit: BoxFit.cover,
                alignment: Alignment(0, -0.4),
              ),
            ),
          ),

          // Gradiente sobre la imagen para la transición al texto
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.0),
                    Colors.white.withOpacity(0.7),
                    Colors.white,
                  ],
                  stops: const [0.0, 0.3, 0.5],
                ),
              ),
            ),
          ),

          // Contenido (textos y botón)
          Positioned(
            bottom: 22,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Título principal
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        const TextSpan(text: 'Your '),
                        TextSpan(
                          text: 'Recipe Haven',
                          style: TextStyle(color: Color(0xFF07B90D)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Awaits Exploration!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  // Texto Lorem Ipsum
                  const SizedBox(height: 18),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),

                  // Botón de Google Sign-in
                  const SizedBox(height: 33),
                  ElevatedButton.icon(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );

                      try {
                        final userCredential =
                            await authService.signInWithGoogle();

                        if (context.mounted) Navigator.pop(context);

                        if (userCredential != null && context.mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomeView(cameras: cameras)),
                          );
                        }
                      } catch (e) {
                        if (context.mounted) Navigator.pop(context);

                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Error de autenticación: $e')),
                          );
                        }
                      }
                    },
                    icon: Icon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                      size: 20,
                    ),
                    label: const Text(
                      'Sign in with Google',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF07B90D),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 54),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
