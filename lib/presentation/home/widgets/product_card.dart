import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../models/product.dart';
import '../../../providers/pinned_provider.dart';
import '../../product_details/screen/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double? width;
  final double? imageHeight;

  const ProductCard({
    super.key,
    required this.product,
    this.width,
    this.imageHeight = 140,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(
                    product.imageUrl,
                    height: imageHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  bottom: 8,
                  left: 8,
                  child: Text('8w ago',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          shadows: [Shadow(color: Colors.black87, blurRadius: 4)])),
                ),
                const Positioned(
                  bottom: 8,
                  right: 8,
                  child: Text('Brand New',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          shadows: [Shadow(color: Colors.black87, blurRadius: 4)])),
                ),
                const Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.more_vert, color: Colors.white, size: 16),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('₹${product.price.toStringAsFixed(0)}',
                          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
                      Consumer<PinnedProvider>(
                        builder: (context, pinnedProvider, child) {
                          final isPinned = pinnedProvider.isPinned(product.id);
                          return GestureDetector(
                            onTap: () => pinnedProvider.togglePin(product),
                            child: Icon(
                              isPinned ? Icons.favorite : Icons.favorite_border,
                              size: 16,
                              color: isPinned ? Colors.purpleAccent : AppColors.textGrey,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: _getAvatarColor(product.id),
                        child: const Icon(Icons.person, size: 12, color: Colors.white),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          product.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getAvatarColor(String id) {
    final colors = [Colors.amber, Colors.green, Colors.blue, Colors.purple, Colors.orange];
    return colors[id.length % colors.length];
  }
}
