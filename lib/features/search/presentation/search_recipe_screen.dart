import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:take_home_project/core/utils/app_icons.dart';
import 'package:take_home_project/features/recipe/presentation/recipe_details_screen.dart';
import 'package:take_home_project/features/search/presentation/ui/recipe_tile_widget.dart';
import 'package:take_home_project/features/search/presentation/ui/search_field_widget.dart';

class SearchRecipeScreen extends StatelessWidget {
  const SearchRecipeScreen({super.key});

  static const path = '/search-recipes-screen';
  static const name = 'search-recipes-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Search recipes'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(child: SearchFieldWidget()),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        AppIcons.filterIcon,
                        height: 50,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Search Result',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '255 results',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Hero(
                    tag: '$index',
                    child: Material(
                      child: RecipeTileWidget(
                        onPressed: () => context.push(RecipeDetailsScreen.path,
                            extra: index),
                      ),
                    ),
                  );
                },
                childCount: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
