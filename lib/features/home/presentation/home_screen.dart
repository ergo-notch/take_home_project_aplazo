import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:take_home_project/core/utils/app_images.dart';
import 'package:take_home_project/shared/ui/home_button.dart';

import '../../../core/utils/app_icons.dart';
import '../../search_recipes/presentation/search_recipe_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const name = 'home-screen';
  static const path = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        AppImages.homeScreenBackgroundImage,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppIcons.cookingHatIcon),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '100K+ Premium Recipe',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get\nCooking',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 46),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Simple way to find Tasty Recipe',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 75),
                    child: HomeButton(
                        onPressed: () => context.push(SearchRecipeScreen.path)),
                  )
                ],
              ),
            )
          ],
        ),
      )
    ]);
  }
}
