import 'SubCategoryModel.dart';

class Category {
  String name;
  bool isSelected;
  List<Subcategory> subcategories;

  Category({required this.name, required this.isSelected, required this.subcategories});
}