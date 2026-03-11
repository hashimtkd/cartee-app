import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'cartee',
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontSize: 48,
            fontWeight: FontWeight.w800,
            letterSpacing: -1.0,
          ),
    );
  }
}
