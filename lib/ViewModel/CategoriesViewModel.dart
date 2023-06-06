import 'package:flutter/cupertino.dart';

import '../Model/CategoryModel.dart';
import '../Model/SubCategoryModel.dart';

class CategoriesViewModel extends ChangeNotifier {
  List<Category> categories = [
    Category(
      name: 'Public',
      isSelected: false,
      subcategories: [],
    ),
    Category(
      name: 'Internal',
      isSelected: false,
      subcategories: [],
    ),
    Category(
      name: 'Private',
      isSelected: false,
      subcategories: [],
    ),
    Category(
      name: 'Private Subscription',
      isSelected: false,
      subcategories: [
        Subcategory(name: 'Host A', isSelected: false),
        Subcategory(name: 'Host B', isSelected: false),
        Subcategory(name: 'Host c', isSelected: false),

      ],
    ),
    Category(
      name: 'Institution',
      isSelected: false,
      subcategories: [
        Subcategory(name: 'Institution A', isSelected: false),
        Subcategory(name: 'Institution B', isSelected: false),
      ],
    ),
  ];

  void toggleCategorySelection(int categoryIndex) {
    Category category = categories[categoryIndex];
    category.isSelected = !category.isSelected;

    for (Subcategory subcategory in category.subcategories) {
      subcategory.isSelected = category.isSelected;
    }

    notifyListeners();
  }

  void toggleSubcategorySelection(int categoryIndex, int subcategoryIndex) {
    Category category = categories[categoryIndex];
    Subcategory subcategory = category.subcategories[subcategoryIndex];

    subcategory.isSelected = !subcategory.isSelected;

    if (!subcategory.isSelected) {
      category.isSelected = false;
    } else {
      bool allSubcategoriesSelected = true;
      for (Subcategory subcategory in category.subcategories) {
        if (!subcategory.isSelected) {
          allSubcategoriesSelected = false;
          break;
        }
      }
      category.isSelected = allSubcategoriesSelected;
    }

    notifyListeners();
  }

  void toggleSelectAll(bool isSelected) {
    for (Category category in categories) {
      category.isSelected = isSelected;
      for (Subcategory subcategory in category.subcategories) {
        subcategory.isSelected = isSelected;
      }
    }

    notifyListeners();
  }
}
