import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/app_images.dart';

class NoResultsWidget extends StatelessWidget {
  const NoResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 200, child: Lottie.asset(AppImages.noResultsAnimation)),
          Text(
            'No results, try again',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
