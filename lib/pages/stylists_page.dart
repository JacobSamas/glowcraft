import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class StylistsPage extends StatelessWidget {
  const StylistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final stylists = [
      {
        'name': 'Ava Lee',
        'avatar': 'https://randomuser.me/api/portraits/women/44.jpg',
        'specialty': 'Color Specialist',
        'bio': 'Expert in balayage, ombré, and vibrant hair colors.'
      },
      {
        'name': 'Maya Patel',
        'avatar': 'https://randomuser.me/api/portraits/women/68.jpg',
        'specialty': 'Bridal Stylist',
        'bio': 'Bridal hair & makeup for your big day.'
      },
      {
        'name': 'Liam Chen',
        'avatar': 'https://randomuser.me/api/portraits/men/32.jpg',
        'specialty': 'Men’s Grooming',
        'bio': 'Modern fades, beard styling, and classic cuts.'
      },
      {
        'name': 'Sofia Rossi',
        'avatar': 'https://randomuser.me/api/portraits/women/65.jpg',
        'specialty': 'Skin Care',
        'bio': 'Facials, peels, and glowing skin treatments.'
      },
      {
        'name': 'Noah Kim',
        'avatar': 'https://randomuser.me/api/portraits/men/45.jpg',
        'specialty': 'Massage Therapist',
        'bio': 'Relaxation, deep tissue, and aromatherapy massages.'
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
                  'Meet Our Stylists',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFB2FFFF),
                    shadows: [
                      Shadow(
                        blurRadius: 20,
                        color: const Color(0xFF88FFFF).withOpacity(0.5),
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  height: 5,
                  width: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF88FFFF), Color(0xFF2A3A6C)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF88FFFF).withOpacity(0.3),
                        blurRadius: 14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Stylists carousel
        Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 0, right: 0, bottom: 18),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stylists.length,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            itemBuilder: (context, i) {
              final s = stylists[i];
              return Animate(
                effects: [
                  FadeEffect(duration: 700.ms, delay: (i * 120).ms),
                  SlideEffect(begin: Offset(0.22, 0), delay: (i * 120).ms),
                ],
                child: _StylistGlassCard(
                  name: s['name'] as String,
                  avatar: s['avatar'] as String,
                  specialty: s['specialty'] as String,
                  bio: s['bio'] as String,
                ),
              );
            },
          ),
        ),
        // Floating Join Our Team button
        Positioned(
          bottom: 28,
          right: 28,
          child: Animate(
            effects: [FadeEffect(duration: 900.ms), ScaleEffect()],
            child: FloatingActionButton.extended(
              backgroundColor: const Color(0xFFB2FFFF),
              foregroundColor: const Color(0xFF2A3A6C),
              elevation: 10,
              onPressed: () {},
              icon: const Icon(Icons.star_rounded),
              label: Text(
                'Join Our Team',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _StylistGlassCard extends StatelessWidget {
  final String name;
  final String avatar;
  final String specialty;
  final String bio;
  const _StylistGlassCard({required this.name, required this.avatar, required this.specialty, required this.bio});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: LinearGradient(
          colors: [const Color(0xFF88FFFF).withOpacity(0.14), Colors.white.withOpacity(0.09)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: const Color(0xFF88FFFF).withOpacity(0.32), width: 2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF88FFFF).withOpacity(0.10),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 38,
              backgroundImage: NetworkImage(avatar),
            ),
            const SizedBox(height: 18),
            Text(
              name,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              specialty,
              style: GoogleFonts.poppins(
                color: const Color(0xFFB2FFFF),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              bio,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: const Color(0xFFB2FFFF),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
