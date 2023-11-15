import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/app_colors.dart';
import '../../../logic_layer/cubit/auth_cubit/auth_card_animation_cubit.dart';
import '../../widgets/auth_widgets/auth_animated_title.dart';
import '../../widgets/auth_widgets/auth_custom_widgets.dart';
import '../../widgets/auth_widgets/custom_tff.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isHittable = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      setState(() {
        isHittable = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    double mediaQueryWidth = MediaQuery.of(context).size.width;

    return IgnorePointer(
      ignoring: !isHittable,
      child: SizedBox(
        width: double.infinity,
        child: Card(
          margin: EdgeInsets.zero,
          color: AppColors.mySecondryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyAnimatedTitle(
                  firstTitle: 'Welcome to Chaty',
                  secondTitle: 'Login',
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: mediaQueryHeight * 0.015,
                    horizontal: mediaQueryWidth * 0.050,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TFFLabel(label: 'E-mail'),
                      const CustomTFF(
                        hintText: 'example@gmail.com',
                      ),
                      SizedBox(height: mediaQueryHeight * 0.030),
                      const TFFLabel(label: 'Password'),
                      const CustomTFF(
                        hintText: '***********',
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.zero,
                            ),
                          ),
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: AppColors.myAccentColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: mediaQueryHeight * 0.005),
                      AuthButton(
                        mediaQueryHeight: mediaQueryHeight,
                        title: 'Login',
                      ),
                      SizedBox(height: mediaQueryHeight * 0.010),
                      CheckAccountRow(
                        question: 'Don\'t have an account ?',
                        action: 'Sign Up',
                        checkAccount:
                            BlocProvider.of<AuthCardAnimationCubit>(context)
                                .showSignupCard,
                      ),
                    ],
                  ),
                ),
                const CustomDivider(
                  label: 'Or Login with',
                ),
                SizedBox(height: mediaQueryHeight * 0.015),
                MediaAuthRow(
                  mediaQueryWidth: mediaQueryWidth,
                  mediaQueryHeight: mediaQueryHeight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
