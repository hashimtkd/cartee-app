import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../providers/cart_provider.dart';

class CheckoutPanel extends StatelessWidget {
  final CartProvider cart;

  const CheckoutPanel({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFAF8FF),
        borderRadius:
            BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Amount',
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                      Text('₹${cart.totalAmount.toStringAsFixed(0)}',
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Shipping/Discount',
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                      Text('₹20', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Divider(color: Colors.grey.shade300, thickness: 1),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Amount Payable',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      Text('₹${(cart.totalAmount + 20).toStringAsFixed(0)}',
                          style:
                              const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _buildAddressSection(),
                ],
              ),
            ),
            _buildProceedToPay(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Deliver to', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            Text('Edit',
                style: TextStyle(
                    color: AppColors.primaryLight,
                    fontWeight: FontWeight.bold,
                    fontSize: 12)),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Palimooli House, Railway station Road, Near\nTown Busstand, Olavakode, Palakkad\nPincode : 678002\nContact : 8564245318',
          style: TextStyle(fontSize: 11, color: AppColors.textDark, height: 1.5),
        ),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add_circle_outline, size: 16),
          label: const Text('Add new Address',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primaryLight,
            side: BorderSide.none,
            minimumSize: const Size(double.infinity, 44),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            alignment: Alignment.center,
          ),
        ),
      ],
    );
  }

  Widget _buildProceedToPay(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          boxShadow: [
            BoxShadow(color: Color(0x0A000000), blurRadius: 10, offset: Offset(0, -5))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('₹${(cart.totalAmount + 20).toStringAsFixed(0)}',
                  style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
              const Text('Grand Total',
                  style: TextStyle(fontSize: 10, color: AppColors.textGrey)),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Proceeding to pay...')));
              cart.clear();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryLight,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              minimumSize: Size.zero,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Proceed to Pay', style: TextStyle(fontSize: 14)),
                SizedBox(width: 8),
                Icon(Icons.keyboard_arrow_right, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
