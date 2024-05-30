import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:take_home_project/features/favorites/presentation/bloc/favorites_recipes_bloc.dart';
import 'package:take_home_project/features/favorites/presentation/bloc/favorites_recipes_event.dart';
import 'package:take_home_project/features/favorites/presentation/bloc/favorites_recipes_state.dart';

import '../../../shared/ui/failure_widget.dart';
import '../../../shared/ui/no_results_widget.dart';
import '../../recipe_details/presentation/recipe_details_screen.dart';
import '../../search_recipes/presentation/bloc/search_recipes_state.dart';
import '../../search_recipes/presentation/ui/recipe_tile_widget.dart';

class FavoritesRecipesScreen extends StatefulWidget {
  const FavoritesRecipesScreen({super.key});

  static const path = '/favorites-recipes';
  static const name = 'favorites-recipes';

  @override
  FavoritesRecipesScreenState createState() => FavoritesRecipesScreenState();
}

class FavoritesRecipesScreenState extends State<FavoritesRecipesScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    loadRecipes();
  }

  void loadRecipes() {
    final favoritesRecipesBloc = context.read<FavoritesRecipesBloc>();
    favoritesRecipesBloc.add(GetFavoritesRecipesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite recipes'),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async => loadRecipes(),
        child: BlocBuilder<FavoritesRecipesBloc, FavoritesRecipesState>(
          builder: (_, state) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Visibility(
                        visible: state.status == PostStatus.success,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Results',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${state.favoritesRecipes.length} results',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Slide to remove from favorites',
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                ),
                state.status == PostStatus.failure
                    ? SliverToBoxAdapter(
                        child: FailureWidget(
                            message: state.errorMessage,
                            onRetry: () => loadRecipes()),
                      )
                    : state.status == PostStatus.fetching
                        ? SliverToBoxAdapter(child: Container())
                        : state.favoritesRecipes.isEmpty
                            ? const SliverToBoxAdapter(child: NoResultsWidget())
                            : SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    final recipe =
                                        state.favoritesRecipes[index];
                                    return Hero(
                                      tag: '$index',
                                      child: Material(
                                        child: Dismissible(
                                          key: Key('${recipe.id}'),
                                          onDismissed: (direction) => context
                                              .read<FavoritesRecipesBloc>()
                                              .add(DeleteFavoriteRecipeEvent(
                                                  recipeEntity: recipe)),
                                          background: Container(
                                            color: Colors.red,
                                            child: const Icon(Icons.delete),
                                          ),
                                          child: SizedBox(
                                            height: 80,
                                            child: RecipeTileWidget(
                                              recipeEntity: recipe,
                                              onPressed: () => context.push(
                                                  RecipeDetailsScreen.path,
                                                  extra: RecipeDetailsArgs(
                                                      index: index,
                                                      recipeEntity: recipe)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  childCount: state.favoritesRecipes.length,
                                ),
                              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
