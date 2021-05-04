import 'package:flutter/material.dart';
import 'package:mealapp/models/dummyData.dart';
import 'package:mealapp/widget/meal_item.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/categoryItems';

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final filteredCategoryMeal = DUMMY_MEALS
        .where((element) => element.categories.contains(categoryId))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemCount: filteredCategoryMeal.length,
          itemBuilder: (context, index) {
            return MealItem(
              affordability: filteredCategoryMeal[index].affordability,
              complexity: filteredCategoryMeal[index].complexity,
              duration: filteredCategoryMeal[index].duration,
              imageUrl: filteredCategoryMeal[index].imageUrl,
              title: filteredCategoryMeal[index].title,
              id: filteredCategoryMeal[index].id,
            );
          },
        ));
  }
}
