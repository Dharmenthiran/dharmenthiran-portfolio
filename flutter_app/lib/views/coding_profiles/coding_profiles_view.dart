import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/app_colors.dart';
import '../../view_models/coding_profiles_view_model.dart';
import '../../widgets/glass_container.dart';

class CodingProfilesView extends StatelessWidget {
  const CodingProfilesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CodingProfilesViewModel(),
      child: Consumer<CodingProfilesViewModel>(
        builder: (context, viewModel, child) {
          final size = MediaQuery.of(context).size;
          final isDesktop = size.width > 992;
          final isTablet = size.width > 768;

          return Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: isDesktop ? 120 : 100,
                bottom: 80,
                left: size.width * 0.05,
                right: size.width * 0.05,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    children: [
                      // Header
                      Column(
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => AppColors.primaryGradient(context).createShader(bounds),
                            child: Text(
                              "Coding Profiles",
                              style: GoogleFonts.poppins(
                                fontSize: isDesktop ? 56 : 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.2),
                          const SizedBox(height: 16),
                          Text(
                            "My journey across various competitive programming platforms and open source contributions",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isDesktop ? 20 : 16,
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                            ),
                          ).animate().fadeIn(duration: 800.ms, delay: 200.ms),
                        ],
                      ),

                      const SizedBox(height: 64),

                      // Profiles Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isDesktop ? 2 : 1,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 24,
                          mainAxisExtent: 220,
                        ),
                        itemCount: viewModel.profiles.length,
                        itemBuilder: (context, index) {
                          final profile = viewModel.profiles[index];
                          final color = profile.color == 'primary' 
                              ? AppColors.primary(context) 
                              : (profile.color == 'secondary' ? AppColors.secondary(context) : AppColors.accent(context));

                          return GlassContainer(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: color.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Icon(Icons.code, color: color),
                                        ),
                                        const SizedBox(width: 16),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(profile.platform, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                            Text(profile.username, style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5))),
                                          ],
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () => launchUrl(Uri.parse(profile.link)),
                                      icon: const Icon(Icons.launch),
                                      color: color,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: profile.stats.entries.map((entry) {
                                    return Column(
                                      children: [
                                        Text(entry.value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
                                        Text(entry.key.toUpperCase(), style: TextStyle(fontSize: 10, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5), letterSpacing: 1)),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ).animate().fadeIn(duration: 600.ms, delay: (index * 100).ms).scale(begin: const Offset(0.9, 0.9));
                        },
                      ),

                      const SizedBox(height: 80),

                      // Achievements
                      ShaderMask(
                        shaderCallback: (bounds) => AppColors.accentGradient(context).createShader(bounds),
                        child: Text(
                          "Key Achievements",
                          style: GoogleFonts.poppins(
                            fontSize: isDesktop ? 40 : 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 48),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isDesktop ? 3 : (isTablet ? 2 : 1),
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 24,
                          mainAxisExtent: 200,
                        ),
                        itemCount: viewModel.achievements.length,
                        itemBuilder: (context, index) {
                          final ach = viewModel.achievements[index];
                          return GlassContainer(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: AppColors.secondary(context).withOpacity(0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.emoji_events, color: AppColors.secondary(context), size: 32),
                                  ),
                                const SizedBox(height: 16),
                                Text(ach.title, style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                                Text(ach.platform, style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5))),
                                Text(ach.date, style: TextStyle(fontSize: 10, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3))),
                              ],
                            ),
                          ).animate().fadeIn(duration: 600.ms, delay: (800 + index * 100).ms);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
