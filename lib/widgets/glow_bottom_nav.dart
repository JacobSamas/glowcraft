import 'package:flutter/material.dart';

class GlowBottomNav extends StatelessWidget {
  final int selectedIndex;
  final void Function(int)? onTap;
  const GlowBottomNav({super.key, required this.selectedIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.home_rounded,
      Icons.spa_rounded,
      Icons.people_alt_rounded,
      Icons.calendar_today_rounded,
      Icons.info_outline_rounded,
    ];
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF2A3A6C).withOpacity(0.95),
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
        children: List.generate(icons.length, (i) {
          final isActive = selectedIndex == i;
          return GestureDetector(
            onTap: onTap == null ? null : () => onTap!(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFF88FFFF).withOpacity(0.18) : Colors.transparent,
                borderRadius: BorderRadius.circular(18),
                boxShadow: isActive
                    ? [
                        BoxShadow(
                          color: const Color(0xFF88FFFF).withOpacity(0.4),
                          blurRadius: 16,
                        ),
                      ]
                    : [],
              ),
              child: Icon(
                icons[i],
                color: isActive ? const Color(0xFFB2FFFF) : Colors.white38,
                size: isActive ? 32 : 28,
              ),
            ),
          );
        }),
      ),
    );
  }
}
