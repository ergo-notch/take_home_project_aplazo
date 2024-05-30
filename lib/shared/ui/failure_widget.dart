import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:take_home_project/core/utils/app_images.dart';
import 'package:take_home_project/shared/ui/custom_button.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget(
      {super.key, required this.message, required this.onRetry});

  final String? message;
  final Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Error, try again',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 10,
            ),
            Lottie.asset(AppImages.failureAnimation),
            const SizedBox(
              height: 10,
            ),
            Text(
              message ?? 'Try again',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomSmallButton(
              title: Text(
                'Retry',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white),
              ),
              onPressed: onRetry,
            )
          ],
        ),
      ),
    );
  }
}
