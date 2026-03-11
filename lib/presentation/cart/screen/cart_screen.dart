import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../providers/cart_provider.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/checkout_panel.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(AppStrings.shoppingCart,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
      ),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_cart, size: 120, color: AppColors.primaryLight),
                    const SizedBox(height: 24),
                    const Text('Your Cart is Empty',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    const Text(
                      'It Looks like you haven\'t Added anything Yet.\nGo ahead, and Explore more categories',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.textGrey, height: 1.5, fontSize: 14),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryLight,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        minimumSize: Size.zero,
                      ),
                      child: const Text('Shop Now'),
                    ),
                  ],
                ),
              ),
            );
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${cart.items.length} items',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 13, color: AppColors.textGrey)),
                    TextButton(
                      onPressed: () => cart.clear(),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      child: const Text('remove all',
                          style: TextStyle(
                              color: AppColors.errorColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1, color: Color(0xFFF0F0F0), height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (v) {},
                      activeColor: AppColors.primaryLight,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    const Text('All', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  itemCount: cart.items.length,
                  separatorBuilder: (context, index) =>
                      const Divider(thickness: 1, color: Color(0xFFF0F0F0), height: 32),
                  itemBuilder: (context, index) {
                    final cartKey = cart.items.keys.toList()[index];
                    final cartItem = cart.items.values.toList()[index];
                    return CartItemWidget(cartKey: cartKey, cartItem: cartItem, cart: cart);
                  },
                ),
              ),
              CheckoutPanel(cart: cart),
            ],
          );
        },
      ),
    );
  }
}
