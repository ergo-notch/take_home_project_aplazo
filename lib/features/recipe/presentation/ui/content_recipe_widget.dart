import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:take_home_project/core/utils/app_colors.dart';
import 'package:take_home_project/core/utils/app_icons.dart';

class ContentRecipeWidget extends StatefulWidget {
  const ContentRecipeWidget({super.key});

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
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(AppIcons.portionIcon),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '1 serve',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.grey.shade500),
                  )
                ],
              ),
              Text(
                '10 Steps',
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
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (_, index) {
              return Container(
                padding: const EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.tileBackgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: _tabTextIndexSelected.value == 1
                    ? ListTile(
                        title: Text(
                          'Tomatos',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      )
                    : ListTile(
                        title: Text(
                          'Step 1',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.grey.shade500),
                        ),
                      ),
              );
            })
      ],
    );
  }
}
