import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'GlowCraft Salon\nModern Beauty, Modern Tech',
        textAlign: TextAlign.center,
        style: TextStyle(color: Color(0xFFB2FFFF), fontSize: 20),
      ),
    );
  }
}
