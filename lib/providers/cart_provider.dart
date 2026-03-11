import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  int get itemCount => _items.length;

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.product.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(Product product, {String? color}) {
    // Generate a unique key based on product ID and selected color (if any)
    final cartKey = color != null ? '${product.id}-$color' : product.id;

    if (_items.containsKey(cartKey)) {
      // increase quantity
      _items.update(
        cartKey,
        (existingCartItem) => CartItem(
          product: existingCartItem.product,
          quantity: existingCartItem.quantity + 1,
          selectedColor: existingCartItem.selectedColor,
        ),
      );
    } else {
      _items.putIfAbsent(
        cartKey,
        () => CartItem(
          product: product,
          quantity: 1,
          selectedColor: color,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String cartKey) {
    _items.remove(cartKey);
    notifyListeners();
  }

  void updateQuantity(String cartKey, int quantity) {
    if (!_items.containsKey(cartKey)) return;
    
    if (quantity <= 0) {
      removeItem(cartKey);
    } else {
      _items.update(
        cartKey,
        (existing) => CartItem(
          product: existing.product,
          quantity: quantity,
          selectedColor: existing.selectedColor,
        ),
      );
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
