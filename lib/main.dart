import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const GlowCraftApp());
}

class GlowCraftApp extends StatelessWidget {
  const GlowCraftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GlowCraft',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF7F53AC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7F53AC),
          brightness: Brightness.dark,
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D133B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Animate(
              effects: [FadeEffect(duration: 800.ms)],
              child: Lottie.asset(
                'assets/animations/glow_logo.json',
                width: 150,
                repeat: true,
                animate: true,
              ),
            ),
            const SizedBox(height: 32),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'GlowCraft',
                  textStyle: GoogleFonts.poppins(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                    shadows: [
                      Shadow(
                        blurRadius: 24,
                        color: Color(0xFF7F53AC).withOpacity(0.7),
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  speed: const Duration(milliseconds: 90),
                ),
              ],
              isRepeatingAnimation: false,
              totalRepeatCount: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF2D133B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'GlowCraft',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF7F53AC), Color(0xFF647DEE), Color(0xFF2D133B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Glowing hero section
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(
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
                            color: Colors.pinkAccent.withOpacity(0.5),
                            blurRadius: 50,
                            spreadRadius: 10,
                          ),
                        ],
                        gradient: const LinearGradient(
                          colors: [Color(0xFFF7971E), Color(0xFFFF5858)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: const Icon(
                        Icons.spa_rounded,
                        color: Colors.white,
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
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 16,
                            color: Colors.pinkAccent.withOpacity(0.6),
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
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Animated cards section
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: SizedBox(
                height: 240,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _AnimatedServiceCard(
                      title: 'Hair Styling',
                      icon: Icons.cut,
                      color: const Color(0xFF7F53AC),
                      delay: 0,
                    ),
                    _AnimatedServiceCard(
                      title: 'Facials',
                      icon: Icons.face_retouching_natural,
                      color: const Color(0xFFF7971E),
                      delay: 200,
                    ),
                    _AnimatedServiceCard(
                      title: 'Nail Art',
                      icon: Icons.brush,
                      color: const Color(0xFFFF5858),
                      delay: 400,
                    ),
                    _AnimatedServiceCard(
                      title: 'Spa Therapy',
                      icon: Icons.spa,
                      color: const Color(0xFF647DEE),
                      delay: 600,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _AnimatedBottomNav(),
    );
  }
}

class _AnimatedServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final int delay;
  const _AnimatedServiceCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.9, end: 1.0),
        duration: 800.ms,
        curve: Curves.elasticOut,
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: child,
          );
        },
        child: GestureDetector(
          onTap: () {},
          child: Animate(
            effects: [
              FadeEffect(duration: 900.ms, delay: Duration(milliseconds: delay)),
              SlideEffect(begin: Offset(0, 0.5)),
            ],
            child: Container(
              width: 160,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(
                  colors: [color.withOpacity(0.8), color.withOpacity(0.5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 24,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: Colors.white, size: 54),
                  const SizedBox(height: 18),
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
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

class _AnimatedBottomNav extends StatefulWidget {
  @override
  State<_AnimatedBottomNav> createState() => _AnimatedBottomNavState();
}

class _AnimatedBottomNavState extends State<_AnimatedBottomNav> {
  int _selected = 0;
  final List<IconData> _icons = [
    Icons.home_rounded,
    Icons.spa_rounded,
    Icons.people_alt_rounded,
    Icons.calendar_today_rounded,
    Icons.info_outline_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 16,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_icons.length, (i) {
          final isActive = _selected == i;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selected = i;
              });
            },
            child: AnimatedContainer(
              duration: 400.ms,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: isActive ? Colors.white.withOpacity(0.12) : Colors.transparent,
                borderRadius: BorderRadius.circular(18),
                boxShadow: isActive
                    ? [
                        BoxShadow(
                          color: Colors.pinkAccent.withOpacity(0.3),
                          blurRadius: 16,
                        ),
                      ]
                    : [],
              ),
              child: Icon(
                _icons[i],
                color: isActive ? Colors.white : Colors.white38,
                size: isActive ? 32 : 28,
              ),
            ),
          );
        }),
      ),
    );
  }
}
