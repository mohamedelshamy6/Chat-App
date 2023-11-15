import 'package:chat_app/logic_layer/cubit/auth_cubit/auth_card_animation_cubit.dart';
import 'package:chat_app/presentation_layer/screens/auth_screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import 'login.dart';

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
                child:
                    BlocBuilder<AuthCardAnimationCubit, AuthCardAnimationState>(
                  builder: (context, state) {
                    return AnimatedSwitcher(
                      switchInCurve: Curves.easeInQuad,
                      switchOutCurve: Curves.easeInQuad,
                      duration: const Duration(seconds: 2),
                      child: state is LoginCardState ||
                              state is AuthCardAnimationInitial
                          ? const Login()
                          : const SignUp(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
