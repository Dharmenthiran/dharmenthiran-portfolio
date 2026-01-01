import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/app_colors.dart';
import '../../view_models/blog_view_model.dart';
import '../../widgets/glass_container.dart';

class BlogView extends StatelessWidget {
  const BlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BlogViewModel(),
      child: Consumer<BlogViewModel>(
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
              child: Column(
                children: [
                  // Header
                  Column(
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => AppColors.primaryGradient(context).createShader(bounds),
                        child: Text(
                          "Blog & Articles",
                          style: GoogleFonts.poppins(
                            fontSize: isDesktop ? 56 : 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.2),
                      const SizedBox(height: 16),
                      Text(
                        "Insights, tutorials, and thoughts on software development, best practices, and technology trends",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isDesktop ? 20 : 16,
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ).animate().fadeIn(duration: 800.ms, delay: 200.ms),
                    ],
                  ),

                  const SizedBox(height: 64),

                  // Articles Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isDesktop ? 3 : (isTablet ? 2 : 1),
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      mainAxisExtent: 400,
                    ),
                    itemCount: viewModel.articles.length,
                    itemBuilder: (context, index) {
                      final article = viewModel.articles[index];
                      return GlassContainer(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.3)),
                              ),
                              child: Text(
                                article.category,
                                style: TextStyle(fontSize: 12, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              article.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 12),
                            Expanded(
                              child: Text(
                                article.excerpt,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                                  height: 1.5,
                                ),
                              ),
                            ),
                            const Divider(height: 32),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.calendar_today, size: 14, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
                                    const SizedBox(width: 8),
                                    Text(article.date, style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5))),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.access_time, size: 14, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
                                    const SizedBox(width: 8),
                                    Text(article.readTime, style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5))),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                foregroundColor: Theme.of(context).primaryColor,
                                padding: EdgeInsets.zero,
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Read More", style: TextStyle(fontWeight: FontWeight.bold)),
                                  SizedBox(width: 8),
                                  Icon(Icons.arrow_forward, size: 16),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(duration: 600.ms, delay: (index * 100).ms).slideY(begin: 0.1);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
