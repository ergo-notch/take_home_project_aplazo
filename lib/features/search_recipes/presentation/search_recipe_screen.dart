import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:take_home_project/core/utils/app_icons.dart';
import 'package:take_home_project/features/search_recipes/presentation/bloc/seach_recipes_bloc.dart';
import 'package:take_home_project/features/search_recipes/presentation/bloc/search_recipes_events.dart';
import 'package:take_home_project/features/search_recipes/presentation/bloc/search_recipes_state.dart';
import 'package:take_home_project/features/search_recipes/presentation/ui/recipe_tile_widget.dart';
import 'package:take_home_project/features/search_recipes/presentation/ui/search_field_widget.dart';

import '../../../shared/ui/failure_widget.dart';
import '../../../shared/ui/no_results_widget.dart';
import '../../recipe_details/presentation/recipe_details_screen.dart';

class SearchRecipeScreen extends StatefulWidget {
  const SearchRecipeScreen({super.key});

  static const path = '/search_recipes-recipes-screen';
  static const name = 'search_recipes-recipes-screen';

  @override
  SearchRecipeScreenState createState() => SearchRecipeScreenState();
}

class SearchRecipeScreenState extends State<SearchRecipeScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState?.show());
    loadRecipes();
    scrollController.addListener(() {
      var nextPageTrigger = 0.8 * scrollController.position.maxScrollExtent;

      if (scrollController.position.pixels > nextPageTrigger) {
        loadMoreRecipes();
      }
    });
  }

  void loadRecipes() {
    final searchRecipeBloc = context.read<SearchRecipesBloc>();
    searchRecipeBloc.add(GetRecipesEvent());
  }

  void loadMoreRecipes() {
    final searchRecipeBloc = context.read<SearchRecipesBloc>();
    searchRecipeBloc.add(AddMoreRecipesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Search recipes'),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async => loadRecipes(),
        child: BlocBuilder<SearchRecipesBloc, SearchRecipesState>(
          builder: (_, state) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: CustomScrollView(
              controller: scrollController,
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
                      Visibility(
                        visible: state.status == PostStatus.success,
                        child: Row(
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
                              '${state.filteredRecipes.length} results',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.grey),
                            )
                          ],
                        ),
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
                        : state.filteredRecipes.isEmpty
                            ? const SliverToBoxAdapter(child: NoResultsWidget())
                            : SliverGrid(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10),
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    final recipe = state.filteredRecipes[index];
                                    return Hero(
                                      tag: '$index',
                                      child: Material(
                                        child: RecipeTileWidget(
                                          recipeEntity: recipe,
                                          onPressed: () => context.push(
                                              RecipeDetailsScreen.path,
                                              extra: RecipeDetailsArgs(
                                                  index: index,
                                                  recipeEntity: recipe)),
                                        ),
                                      ),
                                    );
                                  },
                                  childCount: state.filteredRecipes.length,
                                ),
                              ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
