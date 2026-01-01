import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../view_models/theme_view_model.dart';
import '../core/app_colors.dart';
import 'glass_container.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  bool _isMenuOpen = false;

  final List<Map<String, String>> _navItems = [
    {'name': 'Home', 'path': '/'},
    {'name': 'Experience', 'path': '/experience'},
    {'name': 'Projects', 'path': '/projects'},
    {'name': 'Skills', 'path': '/skills'},
    {'name': 'Contact', 'path': '/contact'},
  ];

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  void _viewResume() async {
    final origin = Uri.base.origin;
    final resumeUrl = "$origin/resume.docx";
    final viewerUrl = "https://view.officeapps.live.com/op/view.aspx?src=${Uri.encodeComponent(resumeUrl)}";
    if (!await launchUrl(Uri.parse(viewerUrl))) {
      throw Exception('Could not launch resume viewer');
    }
  }

  void _downloadResume() async {
    final url = Uri.parse('resume.docx');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch resume.docx');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeViewModel = Provider.of<ThemeViewModel>(context);
    final location = GoRouterState.of(context).uri.path;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GlassContainer(
          borderRadius: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              GestureDetector(
                onTap: () => context.go('/'),
                child: ShaderMask(
                  shaderCallback: (bounds) => AppColors.primaryGradient(context).createShader(bounds),
                  child: const Text(
                    'DT',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // Desktop Nav
              if (MediaQuery.of(context).size.width > 768)
                Row(
                  children: [
                    ..._navItems.map((item) {
                      final isActive = location == item['path'];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextButton(
                          onPressed: () => context.go(item['path']!),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                item['name']!,
                                style: TextStyle(
                                  color: isActive
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).colorScheme.onSurface,
                                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                              if (isActive)
                                Container(
                                  margin: const EdgeInsets.only(top: 4),
                                  height: 2,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    }),
                    IconButton(
                      icon: Icon(
                        themeViewModel.themeMode == ThemeMode.light
                            ? Icons.dark_mode
                            : Icons.light_mode,
                      ),
                      onPressed: themeViewModel.toggleTheme,
                    ),
                    const SizedBox(width: 16),
                    PopupMenuButton(
                      child: ElevatedButton.icon(
                        onPressed: null, // Open menu
                        icon: const Icon(Icons.download, size: 18),
                        label: const Text('Resume'),
                        style: ElevatedButton.styleFrom(
                          disabledBackgroundColor: Theme.of(context).primaryColor,
                          disabledForegroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          onTap: _downloadResume,
                          child: const Row(
                            children: [
                              Icon(Icons.download, size: 18),
                              SizedBox(width: 12),
                              Text('Download'),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          onTap: _viewResume,
                          child: const Row(
                            children: [
                              Icon(Icons.visibility, size: 18),
                              SizedBox(width: 12),
                              Text('View'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              else
                // Mobile Menu Toggle
                IconButton(
                  icon: Icon(_isMenuOpen ? Icons.close : Icons.menu),
                  onPressed: () => setState(() => _isMenuOpen = !_isMenuOpen),
                ),
            ],
          ),
        ),
        if (_isMenuOpen && MediaQuery.of(context).size.width <= 768)
          GlassContainer(
            borderRadius: 0,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ..._navItems.map((item) {
                  final isActive = location == item['path'];
                  return ListTile(
                    title: Text(
                      item['name']!,
                      style: TextStyle(
                        color: isActive ? Theme.of(context).primaryColor : null,
                      ),
                    ),
                    onTap: () {
                      setState(() => _isMenuOpen = false);
                      context.go(item['path']!);
                    },
                    tileColor: isActive ? Theme.of(context).primaryColor.withOpacity(0.1) : null,
                  );
                }),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.brightness_4),
                  title: const Text('Theme'),
                  trailing: Switch(
                    value: themeViewModel.themeMode == ThemeMode.dark,
                    onChanged: (value) => themeViewModel.toggleTheme(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _downloadResume,
                          icon: const Icon(Icons.download),
                          label: const Text('Download'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _viewResume,
                          icon: const Icon(Icons.visibility),
                          label: const Text('View'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
