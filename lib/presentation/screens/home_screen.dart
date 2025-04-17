import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F2F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F2F2),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Reemplaza esto con tu logo
                Icon(FontAwesomeIcons.bowlFood,
                    color: const Color(0xFF07B90D), size: 28),
                const SizedBox(width: 8),
                Text(
                  'FoodSeek',
                  style: GoogleFonts.baloo2(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.topRight,
              children: [
                GestureDetector(
                  onTap: () {
                    // Aquí va la acción al tocar la campanita
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Notificaciones tocadas')),
                    );
                  },
                  child: Icon(Icons.notifications_none,
                      color: Colors.black, size: 28),
                ),
                Positioned(
                  right: 2,
                  top: 2,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Text('shared recipes'),
        // Aquí va tu contenido
      ),
    );
  }
}
