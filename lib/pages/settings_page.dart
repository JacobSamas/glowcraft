import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notifications = true;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
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
                  'Settings',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFB2FFFF),
                    shadows: [
                      Shadow(
                        blurRadius: 18,
                        color: const Color(0xFF88FFFF).withOpacity(0.5),
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  height: 5,
                  width: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF88FFFF), Color(0xFF2A3A6C)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF88FFFF).withOpacity(0.3),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Settings cards
        Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 18, right: 18, bottom: 18),
          child: ListView(
            children: [
              _SettingsCard(
                icon: Icons.person,
                title: 'Account',
                subtitle: 'Profile, Email',
                trailing: Icon(Icons.arrow_forward_ios, color: const Color(0xFFB2FFFF), size: 20),
                onTap: () {},
              ),
              const SizedBox(height: 16),
              _SettingsCard(
                icon: Icons.notifications_active,
                title: 'Notifications',
                subtitle: 'Push, Email',
                trailing: Switch(
                  value: notifications,
                  onChanged: (val) => setState(() => notifications = val),
                  activeColor: const Color(0xFF2A3A6C),
                  activeTrackColor: const Color(0xFFB2FFFF),
                  inactiveThumbColor: Colors.grey.shade600,
                  inactiveTrackColor: Colors.grey.shade400,
                ),
              ),
              const SizedBox(height: 16),
              _SettingsCard(
                icon: Icons.brightness_6_rounded,
                title: 'Dark Mode',
                subtitle: 'Toggle app theme',
                trailing: Switch(
                  value: darkMode,
                  onChanged: (val) => setState(() => darkMode = val),
                  activeColor: const Color(0xFF2A3A6C),
                  activeTrackColor: const Color(0xFFB2FFFF),
                  inactiveThumbColor: Colors.grey.shade600,
                  inactiveTrackColor: Colors.grey.shade400,
                ),
              ),
              const SizedBox(height: 16),
              _SettingsCard(
                icon: Icons.lock,
                title: 'Privacy',
                subtitle: 'Manage data & permissions',
                trailing: Icon(Icons.arrow_forward_ios, color: const Color(0xFFB2FFFF), size: 20),
                onTap: () {},
              ),
              const SizedBox(height: 16),
              _SettingsCard(
                icon: Icons.help_outline,
                title: 'Help & Support',
                subtitle: 'FAQs, Contact',
                trailing: Icon(Icons.arrow_forward_ios, color: const Color(0xFFB2FFFF), size: 20),
                onTap: () {},
              ),
              const SizedBox(height: 32),
              Animate(
                effects: [FadeEffect(duration: 1200.ms), ScaleEffect()],
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB2FFFF),
                      foregroundColor: const Color(0xFF2A3A6C),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      elevation: 10,
                    ),
                    icon: const Icon(Icons.logout),
                    label: Text(
                      'Logout',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SettingsCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget trailing;
  final VoidCallback? onTap;
  const _SettingsCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: LinearGradient(
            colors: [const Color(0xFFB2FFFF).withOpacity(0.18), Colors.white.withOpacity(0.10)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: const Color(0xFFB2FFFF).withOpacity(0.25), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFB2FFFF).withOpacity(0.09),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFFB2FFFF), size: 28),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFB2FFFF),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}
