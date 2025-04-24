import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

import 'pages/home_page.dart';
import 'pages/services_page.dart';
import 'pages/stylists_page.dart';
import 'pages/booking_page.dart';
import 'pages/about_page.dart';
import 'widgets/glow_bottom_nav.dart';

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
      routes: {
        '/booking': (_) => const BookingPage(),
        '/services': (_) => const ServicesPage(),
        '/stylists': (_) => const StylistsPage(),
        '/about': (_) => const AboutPage(),
      },
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
        MaterialPageRoute(builder: (_) => const GlowCraftScaffold(selectedIndex: 0)),
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

class GlowCraftScaffold extends StatefulWidget {
  final int selectedIndex;
  const GlowCraftScaffold({super.key, required this.selectedIndex});
  @override
  State<GlowCraftScaffold> createState() => _GlowCraftScaffoldState();
}

class _GlowCraftScaffoldState extends State<GlowCraftScaffold> {
  late int _selectedIndex;
  final _pages = const [
    HomePage(),
    ServicesPage(),
    StylistsPage(),
    BookingPage(),
    AboutPage(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: 500.ms,
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: GlowBottomNav(
        selectedIndex: _selectedIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
