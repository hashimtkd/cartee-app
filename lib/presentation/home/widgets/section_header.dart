import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final VoidCallback? onTap;

  const SectionHeader({
    super.key,
    required this.title,
    this.isExpanded = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          if (onTap != null)
            GestureDetector(
              onTap: onTap,
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
                child: Text(
                  isExpanded ? AppStrings.showLess : AppStrings.seeAll,
                  style: const TextStyle(color: AppColors.textGrey, fontSize: 12),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
