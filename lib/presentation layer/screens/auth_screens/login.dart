import 'dart:async';

import 'package:chat_app/constants/app_images.dart';
import 'package:chat_app/presentation%20layer/widgets/auth_widgets/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/app_colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int id = 1;
  @override
  void initState() {
    Timer(
        const Duration(seconds: 1),
        () => setState(() {
              id = 2;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    double mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.myBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: mediaQueryHeight * 0.050),
              child: Hero(
                tag: 'appLogo',
                child: Expanded(
                  child: Center(
                    child: Image.asset(
                      Assets.imagesChatLogo,
                      height: mediaQueryHeight / 5,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
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
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyAnimatedTitle(
                        id: id,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: mediaQueryHeight * 0.015,
                          horizontal: mediaQueryWidth * 0.050,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'E-mail',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: AppColors.myAccentColor,
                              ),
                            ),
                            TextFormField(
                              style: const TextStyle(
                                color: AppColors.myPrimaryColor,
                                fontSize: 16,
                                fontFamily: 'Nunito',
                              ),
                              keyboardType: TextInputType.emailAddress,
                              enableSuggestions: true,
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.myAccentColor,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.myAccentColor,
                                  ),
                                ),
                                hintText: 'example@gmail.com',
                                hintStyle: TextStyle(
                                  fontFamily: 'Nunito',
                                  color: AppColors.myAccentColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(height: mediaQueryHeight * 0.030),
                            const Text(
                              'Password',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: AppColors.myAccentColor,
                              ),
                            ),
                            TextFormField(
                              style: const TextStyle(
                                color: AppColors.myPrimaryColor,
                                fontSize: 16,
                                fontFamily: 'Nunito',
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              enableSuggestions: true,
                              decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.visibility),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.myAccentColor,
                                  ),
                                ),
                                suffixIconColor: AppColors.myAccentColor,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.myAccentColor,
                                  ),
                                ),
                                hintText: '*********',
                                hintStyle: TextStyle(
                                  fontFamily: 'Nunito',
                                  color: AppColors.myAccentColor,
                                  fontSize: 14,
                                ),
                              ),
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
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              height: mediaQueryHeight * 0.065,
                              width: double.infinity,
                              child: MaterialButton(
                                color: AppColors.myAccentColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                onPressed: () {},
                                elevation: 10,
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 20,
                                    color: AppColors.myPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: mediaQueryHeight * 0.010),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.myAccentColor,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.zero,
                                    ),
                                  ),
                                  child: const Text(
                                    'Sign up',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.myAccentColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: AppColors.myAccentColor,
                              thickness: 1.5,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Or login with',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.myAccentColor,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: AppColors.myAccentColor,
                              thickness: 1.5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: mediaQueryHeight * 0.015),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: mediaQueryHeight * 0.050,
                            width: mediaQueryWidth * 0.2,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.myAccentColor.withOpacity(0.7),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0.5, 0.5),
                                  color: AppColors.myAccentColor
                                      .withOpacity(0.2),
                                ),
                                BoxShadow(
                                  offset: const Offset(-0.5, -0.5),
                                  color: AppColors.myAccentColor
                                      .withOpacity(0.2),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: FaIcon(
                                FontAwesomeIcons.squareFacebook,
                                color: AppColors.myPrimaryColor,
                              ),
                            ),
                          ),
                          Container(
                            height: mediaQueryHeight * 0.050,
                            width: mediaQueryWidth * 0.2,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.myAccentColor.withOpacity(0.7),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0.5, 0.5),
                                  color: AppColors.myAccentColor
                                      .withOpacity(0.2),
                                ),
                                BoxShadow(
                                  offset: const Offset(-0.5, -0.5),
                                  color: AppColors.myAccentColor
                                      .withOpacity(0.2),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: FaIcon(
                                FontAwesomeIcons.google,
                                color: AppColors.myPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
