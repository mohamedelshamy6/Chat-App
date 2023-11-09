import 'dart:async';

import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class MyAnimatedTitle extends StatefulWidget {
  const MyAnimatedTitle({super.key});

  @override
  State<MyAnimatedTitle> createState() => _MyAnimatedTitleState();
}

class _MyAnimatedTitleState extends State<MyAnimatedTitle>
    with TickerProviderStateMixin {
  late AnimationController firstFadeAnimationController,
      secondFadeAnimationController;

  late Animation<double> firstFadeAnimation, secondFadeAnimation;
  bool isShowLoginText = false;
  @override
  void initState() {
    super.initState();
    myFirstFadeAnimation();

    Timer(const Duration(milliseconds: 4000), () {
      setState(() {
        isShowLoginText = true;
      });
      mySecondFadeAnimation();
    });
  }

  void myFirstFadeAnimation() {
    firstFadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..forward();
    firstFadeAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
          parent: firstFadeAnimationController, curve: Curves.easeInQuad),
    );
  }

  void mySecondFadeAnimation() {
    secondFadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..forward();
    secondFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
          parent: secondFadeAnimationController, curve: Curves.easeInQuad),
    );
  }

  @override
  void dispose() {
    firstFadeAnimationController.dispose();
    secondFadeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return !isShowLoginText
        ? FadeTransition(
            opacity: firstFadeAnimation,
            child: const Text(
              'Welcome to Chaty',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 34,
                color: AppColors.myAccentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : FadeTransition(
            opacity: secondFadeAnimation,
            child: const Text(
              'Login',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 34,
                color: AppColors.myAccentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}
