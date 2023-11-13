import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/app_colors.dart';
import '../../../logic_layer/cubit/auth_cubit/auth_card_animation_cubit.dart';
import '../../widgets/auth_widgets/auth_animated_title.dart';
import '../../widgets/auth_widgets/auth_custom_widgets.dart';
import '../../widgets/auth_widgets/custom_tff.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<AuthCardAnimationCubit, AuthCardAnimationState>(
        builder: (context, state) {
          return Card(
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
                    firstTitle: 'Hello there',
                    secondTitle: 'Sign Up',
                  ),
                  SizedBox(height: mediaQueryHeight * 0.015),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior:
                          const ScrollBehavior().copyWith(overscroll: false),
                      child: ListView(
                        children: [
                          SizedBox(height: mediaQueryHeight * 0.015),
                          const Center(
                            child: CircleAvatar(
                              backgroundColor: AppColors.myAccentColor,
                              radius: 60,
                              child: Center(
                                child: Icon(
                                  Icons.camera_alt,
                                  color: AppColors.myPrimaryColor,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: mediaQueryHeight * 0.015,
                              horizontal: mediaQueryWidth * 0.050,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TFFLabel(label: 'Username'),
                                const CustomTFF(
                                  hintText: 'Elshamy15',
                                ),
                                SizedBox(height: mediaQueryHeight * 0.030),
                                const TFFLabel(label: 'E-mail'),
                                const CustomTFF(
                                  hintText: 'example@gmail.com',
                                ),
                                SizedBox(height: mediaQueryHeight * 0.030),
                                const TFFLabel(label: 'Password'),
                                const CustomTFF(
                                  hintText: '***********',
                                ),
                                SizedBox(height: mediaQueryHeight * 0.030),
                                const TFFLabel(label: 'Password Confirmation'),
                                const CustomTFF(
                                  hintText: '***********',
                                ),
                                SizedBox(height: mediaQueryHeight * 0.030),
                                AuthButton(
                                  mediaQueryHeight: mediaQueryHeight,
                                  title: 'Sign Up',
                                ),
                                SizedBox(height: mediaQueryHeight * 0.010),
                                const CheckAccountRow(
                                  question: 'Already have an account?',
                                  action: 'Login',
                                ),
                              ],
                            ),
                          ),
                          const CustomDivider(label: 'Or Signup with'),
                          SizedBox(height: mediaQueryHeight * 0.015),
                          MediaAuthRow(
                            mediaQueryWidth: mediaQueryWidth,
                            mediaQueryHeight: mediaQueryHeight,
                          ),
                          SizedBox(height: mediaQueryHeight * 0.010),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
