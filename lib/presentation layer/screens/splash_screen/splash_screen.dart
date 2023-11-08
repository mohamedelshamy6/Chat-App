import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController slideAnimationController;
  late Animation<Offset> slideAnimation;
  late AnimationController fadeAnimationController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    mySlideAnimation();
    myFadeAnimation();
    Timer(const Duration(seconds: 8), () {
      Navigator.pushReplacementNamed(context, 'login');
    });
  }

  void myFadeAnimation() {
    fadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..forward();
    fadeAnimation = Tween<double>(
      begin: -1,
      end: 1,
    ).animate(fadeAnimationController);
  }

  void mySlideAnimation() {
    slideAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2250),
    )..forward();
    slideAnimation = Tween<Offset>(
      begin: const Offset(0.5, -1),
      end: const Offset(0.4, 1.2),
    ).animate(CurvedAnimation(
        parent: slideAnimationController, curve: Curves.bounceOut));
  }

  @override
  void dispose() {
    slideAnimationController.dispose();
    fadeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTransition(
            position: slideAnimation,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: Hero(
                tag: 'appLogo',
                child: Image.asset(
                  Assets.imagesChatLogo,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.4),
          FadeTransition(
            opacity: fadeAnimation,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Loading',
                    style: TextStyle(
                      fontSize: 32,
                      color: AppColors.myAccentColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito'
                    ),
                  ),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 30,
                      color: AppColors.myAccentColor,
                    ),
                    child: AnimatedTextKit(
                      totalRepeatCount: 6,
                      animatedTexts: [
                        WavyAnimatedText(
                          ' ...',
                          speed: const Duration(milliseconds: 500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
