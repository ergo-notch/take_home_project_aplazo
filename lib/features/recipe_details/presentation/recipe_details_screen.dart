import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:take_home_project/core/utils/app_colors.dart';
import 'package:take_home_project/core/utils/app_icons.dart';
import 'package:take_home_project/features/recipe_details/presentation/ui/author_recipe_widget.dart';
import 'package:take_home_project/features/recipe_details/presentation/ui/content_recipe_widget.dart';
import 'package:take_home_project/features/search_recipes/domain/entities/recipe_entity.dart';

import '../../favorites/presentation/favorites_recipes_screen.dart';
import '../../search_recipes/presentation/ui/rate_widget.dart';

class RecipeDetailsArgs {
  final int index;
  final RecipeEntity recipeEntity;

  RecipeDetailsArgs({required this.index, required this.recipeEntity});
}

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({super.key, required this.recipeDetailsArgs});

  final RecipeDetailsArgs recipeDetailsArgs;

  static const name = 'recipe_details-details-screen';
  static const path = '/recipe_details-details-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () => context.push(FavoritesRecipesScreen.path),
                icon: const Icon(
                  Icons.star,
                  color: AppColors.homeButtonColor,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: '${recipeDetailsArgs.index}',
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: CachedNetworkImage(
                          height: 220,
                          width: double.infinity,
                          imageUrl:
                              recipeDetailsArgs.recipeEntity.urlImage ?? '',
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Container(
                            height: 220,
                            width: double.infinity,
                            color: Colors.brown.withOpacity(0.4),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: RateWidget(
                              stars:
                                  recipeDetailsArgs.recipeEntity.rating ?? 0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.timer_sharp,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${recipeDetailsArgs.recipeEntity.cookTimeMinutes} min',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Image.asset(AppIcons.bookmarkIcon)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    '${recipeDetailsArgs.recipeEntity.name}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${recipeDetailsArgs.recipeEntity.reviewCount} reviews',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              AuthorRecipeWidget(recipeEntity: recipeDetailsArgs.recipeEntity),
              const SizedBox(
                height: 20,
              ),
              ContentRecipeWidget(recipeEntity: recipeDetailsArgs.recipeEntity)
            ],
          ),
        ),
      ),
    );
  }
}
