import 'package:flutter/material.dart';
import 'package:take_home_project/core/utils/app_colors.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({super.key, required this.stars});

  final double stars;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: const BoxDecoration(
        color: AppColors.rateWidgetColor,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.star,
            color: AppColors.starColor,
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '$stars',
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
