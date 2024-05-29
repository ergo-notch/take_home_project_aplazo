import 'package:flutter/cupertino.dart';
import 'package:take_home_project/shared/ui/custom_button.dart';

class HomeButton extends StatelessWidget {
  final VoidCallback onPressed;

  const HomeButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      label: 'Start cooking',
      onPressed: onPressed,
    );
  }
}
