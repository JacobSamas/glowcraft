import 'package:flutter/material.dart';
import '../widgets/service_3d_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'title': 'Hair Styling',
        'icon': Icons.cut,
        'desc': 'Trendy cuts, blowouts, and styling for all hair types.'
      },
      {
        'title': 'Facials',
        'icon': Icons.face_retouching_natural,
        'desc': 'Custom facials for glowing, healthy skin.'
      },
      {
        'title': 'Nail Art',
        'icon': Icons.brush,
        'desc': 'Creative manicures, gel, and classic polish.'
      },
      {
        'title': 'Spa Therapy',
        'icon': Icons.spa,
        'desc': 'Relaxing massages and rejuvenating spa rituals.'
      },
      {
        'title': 'Makeup',
        'icon': Icons.brush_outlined,
        'desc': 'Event, bridal, and everyday makeup artistry.'
      },
      {
        'title': 'Massage',
        'icon': Icons.self_improvement,
        'desc': 'Deep tissue, Swedish, and aromatherapy massage.'
      },
    ];
    return Stack(
      children: [
        // Animated glowing header
        Positioned(
          top: 32,
          left: 0,
          right: 0,
          child: Animate(
            effects: [FadeEffect(duration: 800.ms), SlideEffect(begin: Offset(0, -0.1))],
            child: Column(
              children: [
                Text(
                  'Our Services',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFB2FFFF),
                    shadows: [
                      Shadow(
                        blurRadius: 24,
                        color: const Color(0xFF88FFFF).withOpacity(0.6),
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  height: 5,
                  width: 72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF88FFFF), Color(0xFF2A3A6C)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF88FFFF).withOpacity(0.3),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Animated service cards grid
        Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 18, right: 18, bottom: 18),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              childAspectRatio: 0.82,
            ),
            itemCount: services.length,
            itemBuilder: (context, i) {
              final s = services[i];
              return Animate(
                effects: [
                  FadeEffect(duration: 600.ms, delay: (i * 120).ms),
                  SlideEffect(begin: Offset(0, 0.12), delay: (i * 120).ms),
                ],
                child: _ServiceGlassCard(
                  title: s['title'] as String,
                  icon: s['icon'] as IconData,
                  desc: s['desc'] as String,
                ),
              );
            },
          ),
        ),
        // Floating Book Now button
        Positioned(
          bottom: 28,
          right: 28,
          child: Animate(
            effects: [FadeEffect(duration: 900.ms), ScaleEffect()],
            child: FloatingActionButton.extended(
              backgroundColor: const Color(0xFF88FFFF),
              foregroundColor: const Color(0xFF2A3A6C),
              elevation: 10,
              onPressed: () => Navigator.of(context).pushNamed('/booking'),
              icon: const Icon(Icons.calendar_today_rounded),
              label: Text(
                'Book Now',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ServiceGlassCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String desc;
  const _ServiceGlassCard({required this.title, required this.icon, required this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: LinearGradient(
          colors: [const Color(0xFF88FFFF).withOpacity(0.18), Colors.white.withOpacity(0.08)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: const Color(0xFF88FFFF).withOpacity(0.32), width: 2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF88FFFF).withOpacity(0.09),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFFB2FFFF), size: 44),
            const SizedBox(height: 18),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: const Color(0xFFB2FFFF),
                fontSize: 13.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
