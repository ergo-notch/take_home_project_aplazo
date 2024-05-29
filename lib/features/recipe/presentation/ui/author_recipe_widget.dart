import 'package:flutter/material.dart';
import 'package:take_home_project/core/utils/app_colors.dart';
import 'package:take_home_project/core/utils/app_icons.dart';
import 'package:take_home_project/shared/ui/custom_button.dart';

class AuthorRecipeWidget extends StatelessWidget {
  const AuthorRecipeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppIcons.authorIcon,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Laura Wilson',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppColors.homeButtonColor,
                  ),
                  Text(
                    'Lagos, Nigeria',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: CustomSmallButton(
            title: Text(
              'Add to favorites',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
