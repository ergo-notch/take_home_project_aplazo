import 'package:flutter/material.dart';
import 'package:take_home_project/shared/ui/custom_button.dart';

class HomeButton extends StatelessWidget {
  final VoidCallback onPressed;

  const HomeButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Start Cooking',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )
        ],
      ),
      onPressed: onPressed,
    );
  }
}
