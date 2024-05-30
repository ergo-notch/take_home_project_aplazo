import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:take_home_project/core/utils/app_icons.dart';
import 'package:take_home_project/features/search_recipes/presentation/bloc/seach_recipes_bloc.dart';
import 'package:take_home_project/features/search_recipes/presentation/bloc/search_recipes_events.dart';
import 'package:take_home_project/features/search_recipes/presentation/bloc/search_recipes_state.dart';
import 'package:take_home_project/features/search_recipes/presentation/ui/recipe_tile_widget.dart';
import 'package:take_home_project/features/search_recipes/presentation/ui/search_field_widget.dart';

import '../../recipe_details/presentation/recipe_details_screen.dart';

class SearchRecipeScreen extends StatefulWidget {
  const SearchRecipeScreen({super.key});

  static const path = '/search_recipes-recipes-screen';
  static const name = 'search_recipes-recipes-screen';

  @override
  SearchRecipeScreenState createState() => SearchRecipeScreenState();
}

class SearchRecipeScreenState extends State<SearchRecipeScreen> {
  @override
  void initState() {
    super.initState();
    final searchRecipeBloc = context.read<SearchRecipesBloc>();
    searchRecipeBloc.add(GetRecipesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Search recipes'),
      ),
      body: BlocBuilder<SearchRecipesBloc, SearchRecipesState>(
        builder: (_, state) => Padding(
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
                          '${state.recipesTotal} results',
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
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final recipe = state.recipes[index];
                    return Hero(
                      tag: '$index',
                      child: Material(
                        child: RecipeTileWidget(
                          recipeEntity: recipe,
                          onPressed: () => context.push(
                              RecipeDetailsScreen.path,
                              extra: RecipeDetailsArgs(
                                  index: index, recipeEntity: recipe)),
                        ),
                      ),
                    );
                  },
                  childCount: state.recipes.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
