import 'package:flutter/material.dart';
import '../widgets/service_3d_card.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {'title': 'Hair Styling', 'icon': Icons.cut, 'color': Color(0xFF7F53AC)},
      {'title': 'Facials', 'icon': Icons.face_retouching_natural, 'color': Color(0xFFF7971E)},
      {'title': 'Nail Art', 'icon': Icons.brush, 'color': Color(0xFFFF5858)},
      {'title': 'Spa Therapy', 'icon': Icons.spa, 'color': Color(0xFF647DEE)},
      {'title': 'Makeup', 'icon': Icons.brush_outlined, 'color': Color(0xFFD72660)},
      {'title': 'Massage', 'icon': Icons.self_improvement, 'color': Color(0xFF2DCE98)},
    ];
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          childAspectRatio: 0.8,
        ),
        itemCount: services.length,
        itemBuilder: (context, i) {
          final s = services[i];
          return Service3DCard(
            title: s['title'] as String,
            icon: s['icon'] as IconData,
            color: const Color(0xFF88FFFF),
            delay: i * 120,
          );
        },
      ),
    );
  }
}
