import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme.dart';
import 'providers/cart_provider.dart';
import 'providers/pinned_provider.dart';
import 'presentation/bottomnav/providers/bottom_nav_provider.dart';
import 'presentation/splash/screen/splash_screen.dart';

void main() {
  runApp(const CarteeApp());
}

class CarteeApp extends StatelessWidget {
  const CarteeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => PinnedProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
      ],
      child: MaterialApp(
        title: 'Cartee',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
