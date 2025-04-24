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
            child: _AnimatedFAB(
              backgroundColor: const Color(0xFF88FFFF),
              foregroundColor: const Color(0xFF2A3A6C),
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

class _ServiceGlassCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final String desc;
  const _ServiceGlassCard({required this.title, required this.icon, required this.desc});
  @override
  State<_ServiceGlassCard> createState() => _ServiceGlassCardState();
}

class _ServiceGlassCardState extends State<_ServiceGlassCard> {
  bool _pressed = false;
  void _setPressed(bool v) => setState(() => _pressed = v);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      onTap: () {}, // Optionally, you can add action here
      child: AnimatedScale(
        scale: _pressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: Material(
          type: MaterialType.transparency,
          borderRadius: BorderRadius.circular(26),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              gradient: LinearGradient(
                colors: [const Color(0xFF88FFFF).withOpacity(0.18), Colors.white.withOpacity(0.08)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF88FFFF).withOpacity(_pressed ? 0.22 : 0.10),
                  blurRadius: _pressed ? 22 : 12,
                  spreadRadius: _pressed ? 6 : 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(widget.icon, color: const Color(0xFFB2FFFF), size: 54),
                const SizedBox(height: 18),
                Text(
                  widget.title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.desc,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFB2FFFF),
                    fontSize: 13.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedFAB extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final Widget label;
  final Color backgroundColor;
  final Color foregroundColor;
  const _AnimatedFAB({
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
  });
  @override
  State<_AnimatedFAB> createState() => _AnimatedFABState();
}

class _AnimatedFABState extends State<_AnimatedFAB> {
  bool _pressed = false;
  void _setPressed(bool v) => setState(() => _pressed = v);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      child: AnimatedScale(
        scale: _pressed ? 0.93 : 1.0,
        duration: const Duration(milliseconds: 110),
        child: Material(
          type: MaterialType.transparency,
          shape: const StadiumBorder(),
          child: FloatingActionButton.extended(
            backgroundColor: widget.backgroundColor,
            foregroundColor: widget.foregroundColor,
            elevation: _pressed ? 18 : 10,
            onPressed: widget.onPressed,
            icon: widget.icon,
            label: widget.label,
          ),
        ),
      ),
    );
  }
}
