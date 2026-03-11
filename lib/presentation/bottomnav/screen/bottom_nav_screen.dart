import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/bottom_nav_bar.dart';
import '../providers/bottom_nav_provider.dart';
import '../../home/screen/home_screen.dart';
import '../../chat/screen/chat_screen.dart';
import '../../notification/screen/notification_screen.dart';
import '../../profile/screen/profile_screen.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, provider, child) {
        final List<Widget> pages = [
          const HomeScreen(),
          const ChatScreen(),
          const SizedBox.shrink(),
          const NotificationScreen(),
          const ProfileScreen(),
        ];

        return Scaffold(
          backgroundColor: Colors.white,
          body: IndexedStack(
            index: provider.currentIndex,
            children: pages,
          ),
          bottomNavigationBar: BottomNavBar(
            currentIndex: provider.currentIndex,
            onTap: (index) => provider.setIndex(index),
          ),
        );
      },
    );
  }
}
