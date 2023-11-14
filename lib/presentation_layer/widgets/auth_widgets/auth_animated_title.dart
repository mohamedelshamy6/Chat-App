import 'dart:async';

import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class MyAnimatedTitle extends StatefulWidget {
  final String firstTitle;
  final String secondTitle;
  const MyAnimatedTitle(
      {super.key, required this.firstTitle, required this.secondTitle});

  @override
  State<MyAnimatedTitle> createState() => _MyAnimatedTitleState();
}

class _MyAnimatedTitleState extends State<MyAnimatedTitle>
    with TickerProviderStateMixin {
  late AnimationController firstFadeAnimationController,
      secondFadeAnimationController;

  late Animation<double> firstFadeAnimation, secondFadeAnimation;
  bool isShowWelcomeText = false;
  @override
  void initState() {
    super.initState();
    myFirstFadeAnimation();
    mySecondFadeAnimation();
    Timer(const Duration(milliseconds: 4000), () {
      setState(() {
        isShowWelcomeText = true;
      });
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
      duration: const Duration(milliseconds: 8000),
    )..forward();
    secondFadeAnimation = Tween<double>(
      begin: -.5,
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
    return !isShowWelcomeText
        ? FadeTransition(
            opacity: firstFadeAnimation,
            child: Text(
              widget.firstTitle,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 34,
                color: AppColors.myAccentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : FadeTransition(
            opacity: secondFadeAnimation,
            child: Text(
              widget.secondTitle,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 34,
                color: AppColors.myAccentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}
