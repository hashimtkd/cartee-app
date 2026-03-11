import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';

import '../../../core/constants/app_icons.dart';
import '../../../models/product.dart';
import '../../../models/category.dart';
import '../widgets/product_card.dart';
import '../widgets/section_header.dart';
import '../widgets/home_banner.dart';
import '../widgets/category_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSpecialExpanded = false;
  bool _isDemandedExpanded = false;

  final List<CategoryItem> categories = [
    CategoryItem(AppStrings.electronics, AppIcons.electronics),
    CategoryItem(AppStrings.textbooks, AppIcons.textbooks),
    CategoryItem(AppStrings.luxury, AppIcons.luxury),
    CategoryItem(AppStrings.sports, AppIcons.sports),
    CategoryItem(AppStrings.booksStationery, AppIcons.booksStationery),
    CategoryItem(AppStrings.antiques, AppIcons.antiques),
    CategoryItem(AppStrings.videoGaming, AppIcons.videoGaming),
    CategoryItem(AppStrings.craft, AppIcons.craft),
    CategoryItem(AppStrings.homeFurniture, AppIcons.homeFurniture),
    CategoryItem(AppStrings.womensFashion, AppIcons.womensFashion),
  ];

  final List<Product> _specialSuggestions = [
    Product(
      id: 'zara1',
      name: 'ZARA Violet Perfume For Men',
      description: 'ZARA Violet Perfume For Men 190G...',
      price: 180.00,
      originalPrice: 200.00,
      imageUrl: 'https://images.unsplash.com/photo-1594035910387-fea47794261f?auto=format&fit=crop&w=800&q=80',
    ),
    Product(
      id: 'bag1',
      name: 'Rams Bags For Women',
      description: 'Ameliagirl26...',
      price: 240.00,
      imageUrl: 'https://images.unsplash.com/photo-1584916201218-f4242ceb4809?auto=format&fit=crop&w=800&q=80',
    ),
  ];

  final List<Product> _mostDemanded = [
    Product(
      id: 'shoe1',
      name: "Men's Shoes AllBacks Titan...",
      description: 'Ameliagirl26...',
      price: 120.00,
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=800&q=80',
    ),
    Product(
      id: 'purse1',
      name: 'HandBag Purse',
      description: 'Ameliagirl26...',
      price: 90.00,
      imageUrl: 'https://images.unsplash.com/photo-1590874103328-eac38a683ce7?auto=format&fit=crop&w=800&q=80',
    ),
  ];

  final List<Product> _recommendedItems = [
    Product(
      id: 'dress1',
      name: 'Branded Gift Item Prod...',
      description: '₹ 150',
      price: 150.00,
      imageUrl: 'https://images.unsplash.com/photo-1595777457583-95e059d581b8?auto=format&fit=crop&w=800&q=80',
    ),
    Product(
      id: 'watch1',
      name: 'Branded Gift Item Prod...',
      description: '₹ 150',
      price: 150.00,
      imageUrl: 'https://images.unsplash.com/photo-1524805444758-089113d48a6d?auto=format&fit=crop&w=800&q=80',
    ),
    Product(
      id: 'speaker1',
      name: 'Branded Gift Item Prod...',
      description: '₹ 150',
      price: 150.00,
      imageUrl: 'https://images.unsplash.com/photo-1545454675-3531b543be5d?auto=format&fit=crop&w=800&q=80',
    ),
    Product(
      id: 'headphones1',
      name: 'Branded Gift Item Prod...',
      description: '₹ 150',
      price: 150.00,
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=800&q=80',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _buildHomeContent(context);
  }

  Widget _buildHomeContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeBanner(),
          SectionHeader(
            title: AppStrings.specialSuggestions,
            isExpanded: _isSpecialExpanded,
            onTap: () => setState(() => _isSpecialExpanded = !_isSpecialExpanded),
          ),
          _isSpecialExpanded
              ? _buildProductGrid(_specialSuggestions)
              : _buildHorizontalScrollList(_specialSuggestions),
          SectionHeader(
            title: AppStrings.mostDemandedItem,
            isExpanded: _isDemandedExpanded,
            onTap: () => setState(() => _isDemandedExpanded = !_isDemandedExpanded),
          ),
          _isDemandedExpanded
              ? _buildProductGrid(_mostDemanded)
              : _buildHorizontalScrollList(_mostDemanded),
          const SectionHeader(title: AppStrings.categories),
          CategoryGrid(categories: categories),
          const SectionHeader(title: AppStrings.recommendedItems),
          _buildProductGrid(_recommendedItems),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildProductGrid(List<Product> products) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
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
  }

  Widget _buildHorizontalScrollList(List<Product> products) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ProductCard(
              product: products[index],
              width: 150,
              imageHeight: 120,
            ),
          );
        },
      ),
    );
  }
}
