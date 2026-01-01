import 'package:flutter/material.dart';

class ContactViewModel extends ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  bool _isSending = false;
  bool get isSending => _isSending;

  void sendMessage(BuildContext context) async {
    if (nameController.text.isEmpty || emailController.text.isEmpty || messageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    _isSending = true;
    notifyListeners();

    // Simulate sending
    await Future.delayed(const Duration(seconds: 2));

    _isSending = false;
    notifyListeners();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Message Sent! Thank you for reaching out.')),
    );

    nameController.clear();
    emailController.clear();
    messageController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }
}
