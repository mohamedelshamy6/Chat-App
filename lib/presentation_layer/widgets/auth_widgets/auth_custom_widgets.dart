import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/app_colors.dart';
import '../../../logic_layer/cubit/auth_cubit/auth_card_animation_cubit.dart';

class TFFLabel extends StatelessWidget {
  final String label;
  const TFFLabel({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 20,
        fontWeight: FontWeight.w300,
        color: AppColors.myAccentColor,
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  final double mediaQueryHeight;
  final String title;
  const AuthButton({
    super.key,
    required this.mediaQueryHeight,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 20,
            color: AppColors.myPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CheckAccountRow extends StatelessWidget {
  final String question, action;
  final Function() checkAccount;
  const CheckAccountRow({
    super.key,
    required this.question,
    required this.action, required this.checkAccount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: AppColors.myAccentColor,
          ),
        ),
        TextButton(
          onPressed: ()=>checkAccount,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.zero,
            ),
          ),
          child: Text(
            action,
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.myAccentColor,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  final String label;
  const CustomDivider({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        myDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.myAccentColor,
            ),
          ),
        ),
        myDivider(),
      ],
    );
  }

  Expanded myDivider() {
    return const Expanded(
      child: Divider(
        color: AppColors.myAccentColor,
        thickness: 1.5,
      ),
    );
  }
}

class MediaLoginCard extends StatelessWidget {
  final double mediaQueryHeight;
  final double mediaQueryWidth;
  final IconData icon;

  const MediaLoginCard({
    super.key,
    required this.mediaQueryHeight,
    required this.mediaQueryWidth,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.myAccentColor,
      elevation: 5,
      shape: const CircleBorder(),
      child: SizedBox(
        height: mediaQueryHeight * 0.050,
        width: mediaQueryWidth * 0.10,
        child: Center(
          child: FaIcon(
            icon,
            color: AppColors.myPrimaryColor,
          ),
        ),
      ),
    );
  }
}

class MediaAuthRow extends StatelessWidget {
  final double mediaQueryWidth;
  final double mediaQueryHeight;
  const MediaAuthRow({
    super.key,
    required this.mediaQueryWidth,
    required this.mediaQueryHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: mediaQueryWidth * 0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MediaLoginCard(
                icon: FontAwesomeIcons.facebook,
                mediaQueryHeight: mediaQueryHeight,
                mediaQueryWidth: mediaQueryWidth),
            MediaLoginCard(
              mediaQueryHeight: mediaQueryHeight,
              mediaQueryWidth: mediaQueryWidth,
              icon: FontAwesomeIcons.google,
            ),
          ],
        ),
      ),
    );
  }
}
