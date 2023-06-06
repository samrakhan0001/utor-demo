
import 'package:flutter/material.dart';

import '../Model/CategoryModel.dart';
import '../Model/SubCategoryModel.dart';
import '../ViewModel/CategoriesViewModel.dart';

class CategoriesView extends StatefulWidget {
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final CategoriesViewModel viewModel = CategoriesViewModel();

  @override
  Widget build(BuildContext context) {
    bool isAllSelected = viewModel.categories.every((category) => category.isSelected);

    return Column(
      children: [
        ListTile(
        //  contentPadding: EdgeInsets.only(bottom: 10),
          tileColor: Colors.blue.withOpacity(0.4),
          title: const Text('All'),
          leading: Checkbox(
            value: isAllSelected,
            onChanged: (value) {
              setState(() {
                viewModel.toggleSelectAll(value ?? false);
              });
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: viewModel.categories.length,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, categoryIndex) {
              Category category = viewModel.categories[categoryIndex];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckboxListTile(
                    title: Text(category.name),
                    value: category.isSelected,
                    onChanged: (_) => setState(() {
                      viewModel.toggleCategorySelection(categoryIndex);
                    }),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: category.subcategories.length,
                    itemBuilder: (context, subcategoryIndex) {
                      Subcategory subcategory = category.subcategories[subcategoryIndex];

                      return Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: CheckboxListTile(
                          title: Text(subcategory.name),
                          value: subcategory.isSelected,
                          onChanged: (_) => setState(() {
                            viewModel.toggleSubcategorySelection(categoryIndex, subcategoryIndex);
                          }),
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}