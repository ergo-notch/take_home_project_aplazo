import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Widget title;
  final VoidCallback? onPressed;

  const CustomButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: double.infinity,
      child: FilledButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(AppColors.homeButtonColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
          ),
          child: title),
    );
  }
}

class CustomSmallButton extends StatelessWidget {
  final Widget title;
  final VoidCallback? onPressed;

  const CustomSmallButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.homeButtonColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
        ),
        child: title);
  }
}
