import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/app_colors.dart';
import '../../view_models/skills_view_model.dart';
import '../../widgets/glass_container.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SkillsViewModel(),
      child: Consumer<SkillsViewModel>(
        builder: (context, viewModel, child) {
          final size = MediaQuery.of(context).size;
          final isDesktop = size.width > 1024;
          final isTablet = size.width > 768;

          return Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                top: isDesktop ? 128 : 100, // pt-32 (128px) vs pt-24 (96px)
                bottom: 80, // pb-20 (80px)
                left: size.width * 0.05,
                right: size.width * 0.05,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Column(
                    children: [
                      // Header
                      Column(
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => AppColors.primaryGradient(context).createShader(bounds),
                            child: Text(
                              "Skills & Expertise",
                              style: GoogleFonts.poppins(
                                fontSize: isDesktop ? 60 : 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.2),
                          const SizedBox(height: 16),
                          Text(
                            "A comprehensive overview of my technical skills and proficiency levels",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isDesktop ? 20 : 16,
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                              height: 1.5,
                            ),
                          ).animate().fadeIn(duration: 800.ms, delay: 200.ms),
                        ],
                      ),

                      const SizedBox(height: 64),

                      // Skills Grid matching React layout
                      LayoutBuilder(
                        builder: (context, constraints) {
                          int crossAxisCount = isDesktop ? 3 : (isTablet ? 2 : 1);
                          double spacing = 24.0; // gap-6
                          
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: spacing,
                              mainAxisSpacing: spacing,
                              mainAxisExtent: 420, // Pre-defined height to ensure uniformity
                            ),
                            itemCount: viewModel.categories.length,
                            itemBuilder: (context, index) {
                              final category = viewModel.categories[index];
                              return _buildSkillCard(context, category, index);
                            },
                          );
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

  Widget _buildSkillCard(BuildContext context, dynamic category, int index) {
    return GlassContainer(
      padding: const EdgeInsets.all(24),
      borderRadius: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary(context).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary(context).withOpacity(0.2),
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: FaIcon(category.icon, color: AppColors.primary(context), size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  category.title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: -0.5),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: category.skills.length,
              separatorBuilder: (_, __) => const SizedBox(height: 20),
              itemBuilder: (context, sIndex) {
                final skill = category.skills[sIndex];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          skill.name,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${skill.level}%",
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return Container(
                                width: constraints.maxWidth * (skill.level / 100),
                                decoration: BoxDecoration(
                                  gradient: AppColors.skillProgressGradient(context),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.primary(context).withOpacity(0.3),
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                              ).animate().scaleX(
                                duration: 1.seconds,
                                delay: (index * 100 + sIndex * 50).ms,
                                alignment: Alignment.centerLeft,
                                curve: Curves.easeOut,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms, delay: (index * 100).ms).scale(begin: const Offset(0.9, 0.9));
  }
}
