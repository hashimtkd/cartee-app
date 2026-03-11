import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../providers/pinned_provider.dart';
import '../../home/widgets/product_card.dart';

class PinnedScreen extends StatelessWidget {
  const PinnedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.pinnedItems,
          style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textDark),
      ),
      body: Consumer<PinnedProvider>(
        builder: (context, pinnedProvider, child) {
          if (pinnedProvider.items.isEmpty) {
            return const Center(
              child: Text(
                'No pinned items yet.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          final products = pinnedProvider.items.values.toList();

          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          );
        },
      ),
    );
  }
}
