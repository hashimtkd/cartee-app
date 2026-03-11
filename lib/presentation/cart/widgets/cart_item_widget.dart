import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../models/cart_item.dart';
import '../../../providers/cart_provider.dart';

class CartItemWidget extends StatelessWidget {
  final String cartKey;
  final CartItem cartItem;
  final CartProvider cart;

  const CartItemWidget({
    super.key,
    required this.cartKey,
    required this.cartItem,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: true,
          onChanged: (v) {},
          activeColor: AppColors.primaryLight,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade100,
            image: DecorationImage(
              image: NetworkImage(cartItem.product.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartItem.product.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              const Text('Sold By : Tartech',
                  style: TextStyle(color: AppColors.textGrey, fontSize: 10)),
              const SizedBox(height: 2),
              const Text('100ml', style: TextStyle(color: AppColors.textGrey, fontSize: 10)),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('₹${cartItem.product.price.toStringAsFixed(0)}',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      const SizedBox(width: 6),
                      Text(
                          '₹${(cartItem.product.originalPrice ?? cartItem.product.price * 1.2).toStringAsFixed(0)}',
                          style: const TextStyle(
                              color: AppColors.textGrey,
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough)),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => cart.updateQuantity(cartKey, cartItem.quantity - 1),
                          child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                              child: Text('-',
                                  style: TextStyle(fontSize: 16, color: AppColors.textGrey))),
                        ),
                        Text('${cartItem.quantity}',
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        InkWell(
                          onTap: () => cart.updateQuantity(cartKey, cartItem.quantity + 1),
                          child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                              child: Text('+',
                                  style: TextStyle(fontSize: 16, color: AppColors.textGrey))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Deal Method',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF7E3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: const [
                        Text('Delivery',
                            style: TextStyle(
                                color: Color(0xFFE69A1C),
                                fontSize: 11,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_forward_ios, color: Color(0xFFE69A1C), size: 10),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
