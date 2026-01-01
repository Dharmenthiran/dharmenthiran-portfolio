import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/app_colors.dart';
import '../../widgets/crystalline_object.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 992;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background Image Overlay (Absolute inset-0 Equivalent)
          Positioned.fill(
            child: Opacity(
              opacity: 0.2, // Matches React 20%
              child: Image.asset(
                'assets/hero-bg.jpg',
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          
          SelectionArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                constraints: BoxConstraints(minHeight: size.height),
                padding: EdgeInsets.symmetric(
                  vertical: isDesktop ? 120 : 60,
                  horizontal: size.width * 0.05,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flex(
                          direction: isDesktop ? Axis.horizontal : Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Left Content
                            Expanded(
                              flex: isDesktop ? 1 : 0,
                              child: Column(
                                crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Hello, I'm",
                                    style: TextStyle(
                                      color: AppColors.primary(context),
                                      fontSize: isDesktop ? 22 : 18,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 2.0,
                                    ),
                                  ).animate().fadeIn(duration: 800.ms).slideX(begin: -0.2),
                                  
                                  const SizedBox(height: 16),
                                  
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    alignment: isDesktop ? Alignment.centerLeft : Alignment.center,
                                    child: ShaderMask(
                                      shaderCallback: (bounds) => AppColors.primaryGradient(context).createShader(bounds),
                                      child: Text(
                                        "Dharmenthiran T",
                                        textAlign: isDesktop ? TextAlign.start : TextAlign.center,
                                        softWrap: false,
                                        style: GoogleFonts.poppins(
                                          fontSize: isDesktop ? 80 : 48,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          letterSpacing: -1.5,
                                          height: 1.1,
                                        ),
                                      ),
                                    ),
                                  ).animate().fadeIn(duration: 800.ms, delay: 200.ms).slideX(begin: -0.2),
                                  
                                  const SizedBox(height: 24),
                                  
                                  Text(
                                    "Full Stack Engineer",
                                    style: TextStyle(
                                      fontSize: isDesktop ? 36 : 24,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                                    ),
                                  ).animate().fadeIn(duration: 800.ms, delay: 400.ms),
                                  
                                  const SizedBox(height: 32),
                                  
                                  ConstrainedBox(
                                    constraints: const BoxConstraints(maxWidth: 600),
                                    child: RichText(
                                      textAlign: isDesktop ? TextAlign.start : TextAlign.center,
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontSize: isDesktop ? 19 : 16,
                                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                                          height: 1.7,
                                          fontFamily: 'Inter',
                                        ),
                                        children: [
                                          const TextSpan(text: "Hi, I'm Dharmenthiran T — a Full Stack Engineer specializing in "),
                                          _gradientTextSpan(context, "Flask", AppColors.primaryGradient(context)),
                                          const TextSpan(text: ", "),
                                          _gradientTextSpan(context, "Django", AppColors.accentGradient(context)),
                                          const TextSpan(text: ", and "),
                                          _gradientTextSpan(context, "FastAPI", AppColors.skillProgressGradient(context)),
                                          const TextSpan(text: ". I craft efficient backend systems and seamless cross-platform experiences with "),
                                          _gradientTextSpan(context, "Flutter", AppColors.primaryGradient(context)),
                                          const TextSpan(text: ". Always pushing the boundaries of the full-stack ecosystem."),
                                        ],
                                      ),
                                    ),
                                  ).animate().fadeIn(duration: 800.ms, delay: 600.ms),
                                  
                                  const SizedBox(height: 56),
                                  
                                  // Buttons
                                  Wrap(
                                    spacing: 20,
                                    runSpacing: 20,
                                    alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
                                    children: [
                                      _buildPrimaryButton(context, 'View My Work', () => context.go('/projects')),
                                      _buildResumeDropdown(context),
                                    ],
                                  ).animate().fadeIn(duration: 1000.ms, delay: 800.ms).slideY(begin: 0.2),
                                  
                                  const SizedBox(height: 64),
                                  
                                  // Tech Stack Badges
                                  if (isDesktop) _buildTechStack(context, isDesktop),
                                ],
                              ),
                            ),
                            
                            if (!isDesktop) const SizedBox(height: 60),

                            // Right Content (Crystal)
                            Expanded(
                              flex: isDesktop ? 1 : 0,
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                child: const Center(
                                  child: CrystallineObject(),
                                ),
                              ),
                            ).animate().fadeIn(duration: 1200.ms, delay: 400.ms).scale(begin: const Offset(0.8, 0.8)),
                          ],
                        ),
                        
                        if (!isDesktop) ...[
                          const SizedBox(height: 48),
                          _buildTechStack(context, isDesktop),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InlineSpan _gradientTextSpan(BuildContext context, String text, LinearGradient gradient) {
    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: ShaderMask(
        shaderCallback: (bounds) => gradient.createShader(bounds),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 19,
          ),
        ),
      ),
    );
  }

  Widget _buildPrimaryButton(BuildContext context, String label, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary(context).withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary(context),
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(width: 12),
            const Icon(Icons.arrow_forward_rounded, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildResumeDropdown(BuildContext context) {
    return PopupMenuButton(
      offset: const Offset(0, 80),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primary(context).withOpacity(0.5), width: 1.5),
        ),
        child: OutlinedButton(
          onPressed: null, // Let context menu handle it
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary(context),
            side: BorderSide.none,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.description_rounded, size: 22),
              SizedBox(width: 12),
              Text('Resume', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              SizedBox(width: 8),
              Icon(Icons.keyboard_arrow_down_rounded, size: 18),
            ],
          ),
        ),
      ),
      itemBuilder: (context) => [
        _buildPopupItem(context, Icons.download_rounded, 'Download', () => _launch("resume.docx")),
        _buildPopupItem(context, Icons.visibility_rounded, 'View', () {
          final origin = Uri.base.origin;
          final resumeUrl = "$origin/resume.docx";
          _launch("https://view.officeapps.live.com/op/view.aspx?src=${Uri.encodeComponent(resumeUrl)}");
        }),
      ],
    );
  }

  PopupMenuItem _buildPopupItem(BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return PopupMenuItem(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.primary(context)),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  void _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Widget _buildTechStack(BuildContext context, bool isDesktop) {
    const tech = ['Python', 'Flask', 'Django', 'FastAPI', 'Flutter'];
    return Column(
      crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          "TECH STACK",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
          children: tech.map((t) => _buildTechBadge(context, t)).toList(),
        ),
      ],
    ).animate().fadeIn(duration: 800.ms, delay: 1200.ms);
  }

  Widget _buildTechBadge(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
      ),
    );
  }
}
