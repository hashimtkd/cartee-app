import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icons.dart';
import '../../../core/constants/app_strings.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryLight,
          unselectedItemColor: AppColors.textGrey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontSize: 10),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.home, width: 24, height: 24,
                  color: currentIndex == 0 ? AppColors.primaryLight : AppColors.textGrey),
              label: AppStrings.navHome,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.chat, width: 24, height: 24,
                  color: currentIndex == 1 ? AppColors.primaryLight : AppColors.textGrey),
              label: AppStrings.navChat,
            ),
            const BottomNavigationBarItem(
              icon: SizedBox(height: 24),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.notification, width: 24, height: 24,
                  color: currentIndex == 3 ? AppColors.primaryLight : AppColors.textGrey),
              label: AppStrings.navNotification,
            ),
            const BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 12,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=200&q=80',
                ),
              ),
              label: AppStrings.navProfile,
            ),
          ],
        ),
        Positioned(
          top: -15,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.primaryLight,
            elevation: 4,
            shape: const CircleBorder(),
            child: const Icon(Icons.add, color: AppColors.backgroundColor, size: 30),
          ),
        ),
      ],
    );
  }
}
