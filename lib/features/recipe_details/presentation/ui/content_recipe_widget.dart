import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:take_home_project/core/utils/app_colors.dart';
import 'package:take_home_project/core/utils/app_icons.dart';
import 'package:take_home_project/features/search_recipes/domain/entities/recipe_entity.dart';

class ContentRecipeWidget extends StatefulWidget {
  const ContentRecipeWidget({super.key, required this.recipeEntity});

  final RecipeEntity recipeEntity;

  @override
  ContentRecipeWidgetState createState() => ContentRecipeWidgetState();
}

class ContentRecipeWidgetState extends State<ContentRecipeWidget> {
  final ValueNotifier<int> _tabTextIndexSelected = ValueNotifier(0);

  List<String> get _listTextTabToggle => ["Procedure", "Ingredient"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlutterToggleTab(
          width: 90,
          borderRadius: 10,
          height: 40,
          selectedIndex: _tabTextIndexSelected.value,
          selectedBackgroundColors: const [AppColors.homeButtonColor],
          unSelectedBackgroundColors: const [Colors.white],
          selectedTextStyle: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
          unSelectedTextStyle: const TextStyle(
              color: AppColors.homeButtonColor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
          labels: _listTextTabToggle,
          selectedLabelIndex: (index) {
            setState(() {
              _tabTextIndexSelected.value = index;
            });
          },
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(AppIcons.portionIcon),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${widget.recipeEntity.servings} serve',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.grey.shade500),
                  )
                ],
              ),
              Text(
                '${widget.recipeEntity.steps?.length} Steps',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.grey.shade500),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _tabTextIndexSelected.value == 1
                ? widget.recipeEntity.ingredients?.length
                : widget.recipeEntity.steps?.length,
            itemBuilder: (_, index) {
              return Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: const BoxDecoration(
                  color: AppColors.tileBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: _tabTextIndexSelected.value == 1
                    ? ListTile(
                        title: Text(
                          '${widget.recipeEntity.ingredients?[index]}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      )
                    : ListTile(
                        title: Text(
                          'Step ${index + 1}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          '${widget.recipeEntity.steps?[index]}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.grey.shade500),
                        ),
                      ),
              );
            }),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
