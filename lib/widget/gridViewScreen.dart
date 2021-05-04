import 'package:flutter/material.dart';
import 'package:mealapp/widget/categoryItem.dart';
import '../models/dummyData.dart';

class CategoriesGridView extends StatefulWidget {
  @override
  _CategoriesGridViewState createState() => _CategoriesGridViewState();
}

class _CategoriesGridViewState extends State<CategoriesGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map((dummyCatData) => CategoryItem(
                  color: dummyCatData.color,
                  title: dummyCatData.title,
                  id: dummyCatData.id,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ));
  }
}
