import 'package:flutter/material.dart';

class FloatingMenu extends StatelessWidget {
  const FloatingMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100, // Ajusta la altura sobre el FloatingActionButton
      left: MediaQuery.of(context).size.width * 0.15,
      right: MediaQuery.of(context).size.width * 0.15,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Color.fromARGB(69, 0, 0, 0),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _menuButton(Icons.qr_code_scanner, "General"),
            _menuButton(Icons.egg, "Alimentos"),
            _menuButton(Icons.image, "Gallery"),
          ],
        ),
      ),
    );
  }

  Widget _menuButton(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 24),
        Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
