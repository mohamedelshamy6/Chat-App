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
    with SingleTickerProviderStateMixin {
  late AnimationController slideAnimationController;
  late Animation<Offset> slideAnimation;
  bool isShowLodaingText = false;

  @override
  void initState() {
    super.initState();
    mySlideAnimation();
    Timer(
        const Duration(milliseconds: 2750),
        () => setState(() {
              isShowLodaingText = true;
            }));
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
          isShowLodaingText
              ? Center(
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 30,
                      color: AppColors.myAccentColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito',
                    ),
                    child: AnimatedTextKit(
                      onFinished: () =>
                          Navigator.pushReplacementNamed(context, 'login'),
                      totalRepeatCount: 2,
                      animatedTexts: [
                        TyperAnimatedText(
                          'Loading ...',
                          speed: const Duration(milliseconds: 250),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
