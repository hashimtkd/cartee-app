import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.navNotification)),
      body: const Center(child: Text('Notifications')),
    );
  }
}
