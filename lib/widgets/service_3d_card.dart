import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Service3DCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color color;
  final int delay;
  const Service3DCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.delay,
  });
  @override
  State<Service3DCard> createState() => _Service3DCardState();
}

class _Service3DCardState extends State<Service3DCard> {
  double tiltX = 0;
  double tiltY = 0;
  bool _pressed = false;

  void _onPointerMove(PointerEvent e, Size size) {
    final x = (e.localPosition.dx - size.width / 2) / (size.width / 2);
    final y = (e.localPosition.dy - size.height / 2) / (size.height / 2);
    setState(() {
      tiltX = y * 0.15;
      tiltY = -x * 0.15;
    });
  }

  void _onPointerExit(dynamic e) {
    setState(() {
      tiltX = 0;
      tiltY = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.9, end: 1.0),
      duration: Duration(milliseconds: 800),
      curve: Curves.elasticOut,
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: MouseRegion(
        onExit: _onPointerExit,
        child: Listener(
          onPointerMove: (e) {
            final box = context.findRenderObject() as RenderBox;
            _onPointerMove(e, box.size);
          },
          onPointerUp: (_) => _onPointerExit(null),
          onPointerCancel: (_) => _onPointerExit(null),
          child: GestureDetector(
            onTapDown: (_) => setState(() => _pressed = true),
            onTapUp: (_) => setState(() => _pressed = false),
            onTapCancel: () => setState(() => _pressed = false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(tiltX + (_pressed ? 0.10 : 0))
                ..rotateY(tiltY + (_pressed ? 0.10 : 0)),
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(
                  colors: [const Color(0xFF88FFFF).withOpacity(0.8), const Color(0xFF1C75BC).withOpacity(0.5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF88FFFF).withOpacity(0.3),
                    blurRadius: 24,
                    offset: const Offset(0, 12),
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
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
