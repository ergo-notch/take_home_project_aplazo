import 'package:flutter/material.dart';
import 'package:take_home_project/core/utils/app_colors.dart';
import 'package:take_home_project/core/utils/app_icons.dart';
import 'package:take_home_project/features/search_recipes/domain/entities/recipe_entity.dart';
import 'package:take_home_project/shared/ui/custom_button.dart';

class AuthorRecipeWidget extends StatelessWidget {
  const AuthorRecipeWidget({super.key, required this.recipeEntity});

  final RecipeEntity recipeEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppIcons.authorIcon,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${recipeEntity.difficulty}',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: AppColors.homeButtonColor,
                  ),
                  Text(
                    '${recipeEntity.cuisine}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: CustomSmallButton(
            title: Text(
              'Add to favorites',
              textAlign: TextAlign.center,
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
