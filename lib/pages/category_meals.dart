import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widget/meal_item.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/categoryItems';
  final List<Meal> availableMeals;

  const CategoryMeals({Key key, @required this.availableMeals})
      : super(key: key);

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool doneInitializing = false;

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!doneInitializing) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals
          .where((element) => element.categories.contains(categoryId))
          .toList();
    }
    doneInitializing = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemCount: displayedMeals.length,
          itemBuilder: (context, index) {
            return MealItem(
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity,
              duration: displayedMeals[index].duration,
              imageUrl: displayedMeals[index].imageUrl,
              title: displayedMeals[index].title,
              id: displayedMeals[index].id,
            );
          },
        ));
  }
}
