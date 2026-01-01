import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/app_colors.dart';
import 'glass_container.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  final List<Map<String, dynamic>> socials = const [
    {'icon': FontAwesomeIcons.github, 'link': 'https://github.com/Dharmenthiran', 'label': 'GitHub'},
    {'icon': FontAwesomeIcons.linkedinIn, 'link': 'https://www.linkedin.com/in/dharmenthiran-t-248173276', 'label': 'LinkedIn'},
    {'icon': FontAwesomeIcons.twitter, 'link': 'https://twitter.com/dharma22twitter', 'label': 'Twitter'},
    {'icon': FontAwesomeIcons.instagram, 'link': 'https://instagram.com/dharma._4506', 'label': 'Instagram'},
    {'icon': Icons.mail_outline_rounded, 'link': 'mailto:tdharmenthiran@gmail.com', 'label': 'Email'},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1024;

    if (isDesktop) {
      return Positioned(
        left: 40,
        bottom: 0,
        child: Column(
          children: [
            ...socials.map((social) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: _SocialIcon(social: social),
              );
            }),
            Container(
              width: 2,
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary(context), Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ).animate().fadeIn(delay: 1.seconds).slideY(begin: 0.2),
      );
    } else {
      return Positioned(
        bottom: 32,
        left: 0,
        right: 0,
        child: Center(
          child: GlassContainer(
            borderRadius: 30,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: socials.map((social) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: _SocialIcon(social: social, isMobile: true),
                );
              }).toList(),
            ),
          ).animate().fadeIn(delay: 1.seconds).slideY(begin: 0.5),
        ),
      );
    }
  }
}

class _SocialIcon extends StatefulWidget {
  final Map<String, dynamic> social;
  final bool isMobile;
  const _SocialIcon({required this.social, this.isMobile = false});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = _isHovered ? AppColors.primary(context) : Theme.of(context).colorScheme.onSurface.withOpacity(0.6);
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.social['link'])),
        child: AnimatedScale(
          scale: _isHovered ? 1.2 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: FaIcon(
            widget.social['icon'],
            size: widget.isMobile ? 22 : 24,
            color: color,
          ),
        ),
      ),
    );
  }
}
