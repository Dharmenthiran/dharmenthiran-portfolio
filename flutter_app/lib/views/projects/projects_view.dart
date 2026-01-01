import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/app_colors.dart';
import '../../view_models/projects_view_model.dart';
import '../../widgets/glass_container.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProjectsViewModel(),
      child: Consumer<ProjectsViewModel>(
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
                          "My Projects",
                          style: GoogleFonts.poppins(
                            fontSize: isDesktop ? 56 : 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.2),
                      const SizedBox(height: 16),
                      Text(
                        "A collection of my recent work showcasing full-stack development, mobile apps, and API services",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isDesktop ? 20 : 16,
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ).animate().fadeIn(duration: 800.ms, delay: 200.ms),
                    ],
                  ),

                  const SizedBox(height: 64),

                  // Projects Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isDesktop ? 3 : (isTablet ? 2 : 1),
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      mainAxisExtent: 320,
                    ),
                    itemCount: viewModel.projects.length,
                    itemBuilder: (context, index) {
                      final project = viewModel.projects[index];
                      return _ProjectCard(project: project);
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

class _ProjectCard extends StatefulWidget {
  final dynamic project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: _isHovered ? (Matrix4.identity()..scale(1.05)) : Matrix4.identity(),
        child: GlassContainer(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.project.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: _isHovered ? Theme.of(context).primaryColor : null,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.project.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.project.tags.map<Widget>((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.2)),
                        ),
                        child: Text(tag.toString(), style: TextStyle(fontSize: 10, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => launchUrl(Uri.parse(widget.project.github)),
                      icon: const FaIcon(FontAwesomeIcons.github, size: 16),
                      label: const Text("Code", style: TextStyle(fontSize: 12)),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  if (widget.project.demo != null) ...[
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => launchUrl(Uri.parse(widget.project.demo!)),
                        icon: const Icon(Icons.launch, size: 16),
                        label: const Text("Demo", style: TextStyle(fontSize: 12)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 600.ms).scale(begin: const Offset(0.9, 0.9));
  }
}
