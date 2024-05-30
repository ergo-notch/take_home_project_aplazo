import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:take_home_project/features/search_recipes/domain/entities/recipe_entity.dart';
import 'package:take_home_project/features/search_recipes/presentation/ui/rate_widget.dart';

class RecipeTileWidget extends StatelessWidget {
  const RecipeTileWidget(
      {super.key, required this.onPressed, required this.recipeEntity});

  final Function() onPressed;
  final RecipeEntity recipeEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: CachedNetworkImage(
                imageUrl: recipeEntity.urlImage ?? '',
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  color: Colors.brown.withOpacity(0.4),
                )),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.topRight,
                  child: RateWidget(stars: recipeEntity.rating ?? 0),
                )),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${recipeEntity.name}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white),
                    ),
                    Text(
                      '${recipeEntity.cuisine}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
