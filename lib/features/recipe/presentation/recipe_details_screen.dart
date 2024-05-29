import 'package:flutter/material.dart';
import 'package:take_home_project/core/utils/app_icons.dart';
import 'package:take_home_project/features/recipe/presentation/ui/author_recipe_widget.dart';
import 'package:take_home_project/features/recipe/presentation/ui/content_recipe_widget.dart';

import '../../search/presentation/ui/rate_widget.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({super.key, required this.index});

  final int index;

  static const name = 'recipe-details-screen';
  static const path = '/recipe-details-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.more_horiz),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: '$index',
                child: Container(
                  height: 220,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Stack(
                    children: [
                      const Align(
                        alignment: Alignment.topRight,
                        child: RateWidget(stars: 4.0),
                      ),
                      Align(
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
                              '20 min',
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
                    "Spicy chicken burger with French fries",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "(13k Reviews)",
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
              const AuthorRecipeWidget(),
              const SizedBox(
                height: 20,
              ),
              ContentRecipeWidget()
            ],
          ),
        ),
      ),
    );
  }
}
