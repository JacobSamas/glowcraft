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
                  // Banner Carousel
                  SizedBox(
                    height: 140,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.88),
                      children: [
                        _BannerCard(
                          image: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=400&q=80',
                          title: 'Summer Glow Sale',
                          subtitle: 'Up to 30% off facials & spa!',
                          cta: 'Book Now',
                          onTap: () {},
                        ),
                        _BannerCard(
                          image: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80',
                          title: 'Refer & Earn',
                          subtitle: 'Invite friends and get ₹200 credit!',
                          cta: 'Invite',
                          onTap: () {},
                        ),
                        _BannerCard(
                          image: 'https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?auto=format&fit=crop&w=400&q=80',
                          title: 'New Spa Rituals',
                          subtitle: 'Try our latest therapies!',
                          cta: 'Explore',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  // Offers Row
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Exclusive Offers',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFFB2FFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _OfferCard(
                          icon: Icons.spa_rounded,
                          color: const Color(0xFFB2FFFF),
                          offer: '20% Off Facials',
                          onTap: () {},
                        ),
                        _OfferCard(
                          icon: Icons.favorite_rounded,
                          color: const Color(0xFF88FFFF),
                          offer: 'Combo: Hair + Spa',
                          onTap: () {},
                        ),
                        _OfferCard(
                          icon: Icons.card_giftcard,
                          color: const Color(0xFFB2FFFF),
                          offer: 'First Visit: Free Gift',
                          onTap: () {},
                        ),
                        _OfferCard(
                          icon: Icons.redeem,
                          color: const Color(0xFF88FFFF),
                          offer: 'Refer & Earn ₹200',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  // Popular Services Row
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Popular Services',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFFB2FFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 110,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _ServiceMiniCard(
                          icon: Icons.cut,
                          label: 'Hair Styling',
                          onTap: () {},
                        ),
                        _ServiceMiniCard(
                          icon: Icons.face_retouching_natural,
                          label: 'Facials',
                          onTap: () {},
                        ),
                        _ServiceMiniCard(
                          icon: Icons.brush,
                          label: 'Nail Art',
                          onTap: () {},
                        ),
                        _ServiceMiniCard(
                          icon: Icons.spa,
                          label: 'Spa Therapy',
                          onTap: () {},
                        ),
                        _ServiceMiniCard(
                          icon: Icons.color_lens,
                          label: 'Makeup',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
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

class _GlowingActionButton extends StatefulWidget {
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
  State<_GlowingActionButton> createState() => _GlowingActionButtonState();
}

class _GlowingActionButtonState extends State<_GlowingActionButton> {
  bool _pressed = false;
  void _setPressed(bool v) => setState(() => _pressed = v);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedScale(
          scale: _pressed ? 0.94 : 1.0,
          duration: const Duration(milliseconds: 120),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            decoration: BoxDecoration(
              color: widget.color.withOpacity(0.13),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: widget.color.withOpacity(0.36), width: 2),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withOpacity(_pressed ? 0.5 : 0.28),
                  blurRadius: _pressed ? 26 : 16,
                  spreadRadius: _pressed ? 6 : 2,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(widget.icon, color: widget.color, size: 32),
                const SizedBox(height: 8),
                Text(
                  widget.label,
                  style: GoogleFonts.poppins(
                    color: widget.color,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
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

class _BannerCard extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final String cta;
  final VoidCallback onTap;
  const _BannerCard({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.cta,
    required this.onTap,
  });
  @override
  State<_BannerCard> createState() => _BannerCardState();
}

class _BannerCardState extends State<_BannerCard> {
  bool _pressed = false;
  void _setPressed(bool v) => setState(() => _pressed = v);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedScale(
          scale: _pressed ? 0.96 : 1.0,
          duration: const Duration(milliseconds: 120),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white.withOpacity(0.08),
              border: Border.all(color: const Color(0xFFB2FFFF).withOpacity(0.18), width: 1.5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.image),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFB2FFFF).withOpacity(_pressed ? 0.25 : 0.15),
                  blurRadius: _pressed ? 30 : 18,
                  spreadRadius: _pressed ? 7 : 3,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFB2FFFF),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.subtitle,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFB2FFFF).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    widget.cta,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFB2FFFF),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
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

class _OfferCard extends StatefulWidget {
  final IconData icon;
  final Color color;
  final String offer;
  final VoidCallback onTap;
  const _OfferCard({
    required this.icon,
    required this.color,
    required this.offer,
    required this.onTap,
  });
  @override
  State<_OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<_OfferCard> {
  bool _pressed = false;
  void _setPressed(bool v) => setState(() => _pressed = v);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedScale(
          scale: _pressed ? 0.95 : 1.0,
          duration: const Duration(milliseconds: 120),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: widget.color.withOpacity(0.13),
              border: Border.all(color: widget.color.withOpacity(0.36), width: 2),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withOpacity(_pressed ? 0.45 : 0.28),
                  blurRadius: _pressed ? 22 : 16,
                  spreadRadius: _pressed ? 7 : 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(widget.icon, color: widget.color, size: 32),
                const SizedBox(height: 8),
                Text(
                  widget.offer,
                  style: GoogleFonts.poppins(
                    color: widget.color,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
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

class _ServiceMiniCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ServiceMiniCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });
  @override
  State<_ServiceMiniCard> createState() => _ServiceMiniCardState();
}

class _ServiceMiniCardState extends State<_ServiceMiniCard> {
  bool _pressed = false;
  void _setPressed(bool v) => setState(() => _pressed = v);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedScale(
          scale: _pressed ? 0.95 : 1.0,
          duration: const Duration(milliseconds: 120),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white.withOpacity(0.08),
              border: Border.all(color: const Color(0xFFB2FFFF).withOpacity(0.18), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFB2FFFF).withOpacity(_pressed ? 0.38 : 0.18),
                  blurRadius: _pressed ? 20 : 10,
                  spreadRadius: _pressed ? 7 : 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(widget.icon, color: const Color(0xFFB2FFFF), size: 32),
                const SizedBox(height: 8),
                Text(
                  widget.label,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFB2FFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
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
