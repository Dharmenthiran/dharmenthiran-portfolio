import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/app_colors.dart';
import '../../view_models/contact_view_model.dart';
import '../../widgets/glass_container.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ContactViewModel(),
      child: Consumer<ContactViewModel>(
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
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Column(
                    children: [
                      // Header
                      Column(
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => AppColors.primaryGradient(context).createShader(bounds),
                            child: Text(
                              "Get In Touch",
                              style: GoogleFonts.poppins(
                                fontSize: isDesktop ? 56 : 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.2),
                          const SizedBox(height: 16),
                          Text(
                            "Have a project in mind? Let's work together to bring your ideas to life",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isDesktop ? 20 : 16,
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                            ),
                          ).animate().fadeIn(duration: 800.ms, delay: 200.ms),
                        ],
                      ),

                      const SizedBox(height: 64),

                      // Contact Content
                      Flex(
                        direction: isDesktop ? Axis.horizontal : Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Contact Form
                          Expanded(
                            flex: isDesktop ? 1 : 0,
                            child: GlassContainer(
                              padding: const EdgeInsets.all(32),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Send Me a Message", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 32),
                                  _buildTextField(context, "Name", "Your name", viewModel.nameController),
                                  const SizedBox(height: 24),
                                  _buildTextField(context, "Email", "your.email@example.com", viewModel.emailController, keyboardType: TextInputType.emailAddress),
                                  const SizedBox(height: 24),
                                  _buildTextField(context, "Message", "Tell me about your project...", viewModel.messageController, maxLines: 5),
                                  const SizedBox(height: 32),
                                  ElevatedButton(
                                    onPressed: viewModel.isSending ? null : () => viewModel.sendMessage(context),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context).primaryColor,
                                      foregroundColor: Colors.white,
                                      minimumSize: const Size(double.infinity, 56),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    ),
                                    child: viewModel.isSending
                                        ? const CircularProgressIndicator(color: Colors.white)
                                        : const Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.send, size: 18),
                                              SizedBox(width: 12),
                                              Text("Send Message", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                            ],
                                          ),
                                  ),
                                ],
                              ),
                            ).animate().fadeIn(duration: 800.ms, delay: 400.ms).slideX(begin: -0.1),
                          ),

                          if (isDesktop) const SizedBox(width: 48) else const SizedBox(height: 48),

                          // Contact Info
                          Expanded(
                            flex: isDesktop ? 1 : 0,
                            child: Column(
                              children: [
                                GlassContainer(
                                  padding: const EdgeInsets.all(32),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("Contact Information", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 32),
                                      _infoTile(Icons.mail, "Email", "tdharmenthiran@gmail.com", "mailto:tdharmenthiran@gmail.com", context),
                                      const SizedBox(height: 20),
                                      _infoTile(Icons.phone, "Phone", "+91 6383402108", "tel:+916383402108", context),
                                      const SizedBox(height: 20),
                                      _infoTile(Icons.location_on, "Location", "Coimbatore, Tamil Nadu, India", "https://www.google.com/maps?q=10.99975,77.046", context),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 24),
                                GlassContainer(
                                  padding: const EdgeInsets.all(32),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("Let's Connect", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 16),
                                      Text(
                                        "I'm always open to discussing new projects, creative ideas, or opportunities to be part of your vision.",
                                        style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),
                                      ),
                                      const SizedBox(height: 32),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: OutlinedButton(
                                              onPressed: () => launchUrl(Uri.parse("https://www.linkedin.com/in/dharmenthiran-t-248173276")),
                                              child: const Text("LinkedIn"),
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: OutlinedButton(
                                              onPressed: () => launchUrl(Uri.parse("https://github.com/Dharmenthiran")),
                                              child: const Text("GitHub"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ).animate().fadeIn(duration: 800.ms, delay: 600.ms).slideX(begin: 0.1),
                          ),
                        ],
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

  Widget _buildTextField(BuildContext context, String label, String placeholder, TextEditingController controller, {int maxLines = 1, TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
            filled: true,
            fillColor: Colors.white.withOpacity(0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primary(context)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _infoTile(IconData icon, String title, String value, String link, BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(link)),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Theme.of(context).primaryColor),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5))),
                  Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
