import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/gradient_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBackground(),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Animate(
                    effects: [
                      FadeEffect(duration: 800.ms),
                      SlideEffect(begin: Offset(0, -0.4)),
                    ],
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF88FFFF).withOpacity(0.5),
                            blurRadius: 50,
                            spreadRadius: 10,
                          ),
                        ],
                        gradient: const LinearGradient(
                          colors: [Color(0xFF88FFFF), Color(0xFF1C75BC)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: const Icon(
                        Icons.spa_rounded,
                        color: Color(0xFFB2FFFF),
                        size: 80,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Animate(
                    effects: [
                      FadeEffect(duration: 900.ms),
                      SlideEffect(begin: Offset(0, 0.3)),
                    ],
                    child: Text(
                      'Welcome to GlowCraft',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB2FFFF),
                        shadows: [
                          Shadow(
                            blurRadius: 16,
                            color: Color(0xFF88FFFF).withOpacity(0.6),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Animate(
                    effects: [
                      FadeEffect(duration: 1000.ms),
                      SlideEffect(begin: Offset(0, 0.7)),
                    ],
                    child: Text(
                      'Experience beauty reimagined',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Quick Actions
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _GlowingActionButton(
                          label: 'Book Now',
                          icon: Icons.calendar_today_rounded,
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed('/booking');
                          },
                          color: const Color(0xFF88FFFF),
                        ),
                        const SizedBox(width: 24),
                        _GlowingActionButton(
                          label: 'View Services',
                          icon: Icons.spa_rounded,
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed('/services');
                          },
                          color: const Color(0xFFB2FFFF),
                        ),
                        const SizedBox(width: 24),
                        _GlowingActionButton(
                          label: 'Meet Stylists',
                          icon: Icons.people_alt_rounded,
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed('/stylists');
                          },
                          color: const Color(0xFF88FFFF),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),
                  // About/Tagline Section
                  Animate(
                    effects: [FadeEffect(duration: 1200.ms)],
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Colors.white.withOpacity(0.06),
                        border: Border.all(color: const Color(0xFF88FFFF).withOpacity(0.2), width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF88FFFF).withOpacity(0.10),
                            blurRadius: 24,
                          ),
                        ],
                      ),
                      child: Text(
                        'GlowCraft is your destination for luxury, technology, and beauty. Book your next appointment and experience the future of self-care.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: const Color(0xFFB2FFFF),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Testimonial/Highlight
                  Animate(
                    effects: [FadeEffect(duration: 1400.ms), SlideEffect(begin: Offset(0, 0.2))],
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.white.withOpacity(0.08),
                        border: Border.all(color: const Color(0xFFB2FFFF).withOpacity(0.18), width: 1.5),
                      ),
                      child: Text(
                        '“Best salon experience ever! The tech and vibe are unmatched.”',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _GlowingActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  const _GlowingActionButton({
    required this.label,
    required this.icon,
    required this.onTap,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.13),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: color.withOpacity(0.36), width: 2),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.28),
                blurRadius: 16,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 32),
              const SizedBox(height: 8),
              Text(
                label,
                style: GoogleFonts.poppins(
                  color: color,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
