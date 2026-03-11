import 'package:flutter/foundation.dart';
import '../models/product.dart';

class PinnedProvider with ChangeNotifier {
  final Map<String, Product> _items = {};

  Map<String, Product> get items => {..._items};

  int get itemCount => _items.length;

  bool isPinned(String productId) {
    return _items.containsKey(productId);
  }

  void togglePin(Product product) {
    if (_items.containsKey(product.id)) {
      _items.remove(product.id);
    } else {
      _items.putIfAbsent(product.id, () => product);
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
