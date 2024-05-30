import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_project/features/search_recipes/presentation/bloc/seach_recipes_bloc.dart';
import 'package:take_home_project/features/search_recipes/presentation/bloc/search_recipes_events.dart';

class SearchFieldWidget extends StatefulWidget {
  const SearchFieldWidget({super.key});

  @override
  SearchFieldWidgetState createState() => SearchFieldWidgetState();
}

class SearchFieldWidgetState extends State<SearchFieldWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() => ()));
  }

  @override
  Widget build(BuildContext context) {
    final searchRecipeBloc = context.read<SearchRecipesBloc>();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade400,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: _controller,
        maxLines: 1,
        onChanged: (value) =>
            searchRecipeBloc.add(SearchRecipesByStringEvent(searchText: value)),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 16,
              decoration: TextDecoration.none,
            ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          alignLabelWithHint: true,
          hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey.shade400,
              fontSize: 16,
              fontWeight: FontWeight.w400),
          hintText: 'Search recipe_details',
          icon: Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Icon(
              Icons.search,
              color: Colors.grey.shade400,
              size: 24.0,
            ),
          ),
          isCollapsed: true,
          suffixIcon: _controller.text.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    _controller.clear();
                    searchRecipeBloc.add(ClearSearchEvent());
                  },
                  child: const Icon(
                    Icons.close,
                    // color: AppColors.iconDefaultColor,
                    size: 30.0,
                  ),
                )
              : null,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
