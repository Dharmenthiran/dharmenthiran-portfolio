import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import 'nav_bar.dart';
import 'particle_background.dart';
import 'social_links.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: AppColors.backgroundRadial(context),
              ),
            ),
          ),
          // Background Particles
          const ParticleBackground(),
          // Content
          child,
          // Social Links
          const SocialLinks(),
          // Navigation Bar
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavigationBarWidget(),
          ),
        ],
      ),
    );
  }
}
