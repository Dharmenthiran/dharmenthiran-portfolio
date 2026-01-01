import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/app_colors.dart';
import '../../view_models/experience_view_model.dart';
import '../../widgets/glass_container.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ExperienceViewModel(),
      child: Consumer<ExperienceViewModel>(
        builder: (context, viewModel, child) {
          final size = MediaQuery.of(context).size;
          final isDesktop = size.width > 992;

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
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    children: [
                      // Header
                      Column(
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => AppColors.primaryGradient(context).createShader(bounds),
                            child: Text(
                              "Work Experience",
                              style: GoogleFonts.poppins(
                                fontSize: isDesktop ? 56 : 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.2),
                          const SizedBox(height: 16),
                          Text(
                            "My professional journey and work experience.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isDesktop ? 20 : 16,
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                            ),
                          ).animate().fadeIn(duration: 800.ms, delay: 200.ms),
                        ],
                      ),

                      const SizedBox(height: 64),

                      // Experience List
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: viewModel.experiences.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 24),
                        itemBuilder: (context, index) {
                          final exp = viewModel.experiences[index];
                          return GlassContainer(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.3)),
                                      ),
                                      child: Icon(Icons.business_center, color: Theme.of(context).primaryColor),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            exp.title,
                                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            exp.company,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context).primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (isDesktop)
                                      OutlinedButton.icon(
                                        onPressed: () => launchUrl(Uri.parse(exp.linkedin)),
                                        icon: const Icon(Icons.link, size: 18),
                                        label: const Text("LinkedIn"),
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: Theme.of(context).primaryColor,
                                          side: BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.5)),
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Wrap(
                                  spacing: 24,
                                  runSpacing: 12,
                                  children: [
                                    _infoItem(Icons.calendar_today, exp.period, context),
                                    _infoItem(Icons.location_on, exp.location, context),
                                    if (exp.employmentType != null)
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.3)),
                                        ),
                                        child: Text(
                                          exp.employmentType!,
                                          style: TextStyle(fontSize: 12, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  exp.description,
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.6,
                                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: exp.technologies.map((tech) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: Theme.of(context).colorScheme.outline.withOpacity(0.2)),
                                      ),
                                      child: Text(tech, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                                    );
                                  }).toList(),
                                ),
                                if (!isDesktop) ...[
                                  const SizedBox(height: 24),
                                  SizedBox(
                                    width: double.infinity,
                                    child: OutlinedButton.icon(
                                      onPressed: () => launchUrl(Uri.parse(exp.linkedin)),
                                      icon: const Icon(Icons.link),
                                      label: const Text("View on LinkedIn"),
                                    ),
                                  ),
                                ]
                              ],
                            ),
                          ).animate().fadeIn(duration: 600.ms, delay: (index * 200).ms).slideY(begin: 0.1);
                        },
                      ),

                      const SizedBox(height: 48),

                      // LinkedIn CTA
                      GlassContainer(
                        padding: const EdgeInsets.all(32),
                        border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.3), style: BorderStyle.solid),
                        child: Column(
                          children: [
                            const Text(
                              "For complete work history and detailed experience, please visit my LinkedIn profile.",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton.icon(
                              onPressed: () => launchUrl(Uri.parse("https://www.linkedin.com/in/dharmenthiran-t-248173276")),
                              icon: const Icon(Icons.link),
                              label: const Text("View Full Profile on LinkedIn"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(duration: 800.ms, delay: 600.ms),
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

  Widget _infoItem(IconData icon, String text, BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
        ),
      ],
    );
  }
}
