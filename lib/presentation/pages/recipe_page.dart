import 'dart:io';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  final String imagePath;
  const RecipePage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.5, // Ocupa el 50% del alto total
                width: double.infinity, // Ocupa todo el ancho
                child: Image.file(
                  File(imagePath),
                  fit: BoxFit.cover, // Ajusta la imagen para cubrir el espacio
                ),
              ),
            ],
          ),
          Positioned(
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text("Resultado",
                  style: TextStyle(
                    color: Colors.white70,
                    fontFamily: 'Roboto',
                     fontWeight: FontWeight.normal,
              )),
              centerTitle: true,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.black.withValues(alpha: 0.2),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withValues(alpha: 0.2),
                    child: IconButton(
                      icon: const Icon(Icons.more_horiz, color: Colors.white),
                      onPressed: () {
                        // Acción para el botón de tres puntos
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
