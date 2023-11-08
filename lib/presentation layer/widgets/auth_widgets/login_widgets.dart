import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class MyAnimatedTitle extends StatelessWidget {
  const MyAnimatedTitle({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      switchInCurve: Curves.slowMiddle,
      switchOutCurve: Curves.decelerate,
      duration: const Duration(milliseconds: 4000),
      child: animatedTitle(id),
    );
  }

  animatedTitle(int id) {
    switch (id) {
      case 1:
        return const Row(
          key: ValueKey<int>(1),
          children: [
            Expanded(
              child: Text(
                'Welcome to Chaty',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 34,
                  color: AppColors.myAccentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );

      case 2:
        return const Row(
          key: ValueKey<int>(2),
          children: [
            Expanded(
              child: Text(
                'Login',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 34,
                  color: AppColors.myAccentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
    }
  }
}
