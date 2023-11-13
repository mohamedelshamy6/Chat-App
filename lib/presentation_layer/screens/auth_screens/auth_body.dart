import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../logic_layer/cubit/auth_cubit/auth_card_animation_cubit.dart';
import 'login.dart';
import 'signup.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.myBackgroundColor,
      body: SafeArea(
        child: SizedBox(
          height: mediaQueryHeight,
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: mediaQueryHeight * 0.050),
                child: Hero(
                  tag: 'appLogo',
                  child: Center(
                    child: Image.asset(
                      Assets.imagesChatLogo,
                      height: mediaQueryHeight / 5,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: AnimatedSwitcher(
                  switchInCurve: Curves.easeInQuad,
                  switchOutCurve: Curves.easeInQuad,
                  duration: const Duration(seconds: 2),
                  child: changeCard(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  changeCard(context) {
    switch (BlocProvider.of<AuthCardAnimationCubit>(context).isShowLoginCard) {
      case true:
        return const Login();
      case false:
        return const SignUp();
    }
  }
}
