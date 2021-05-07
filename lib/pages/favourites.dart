import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widget/meal_item.dart';

class Favourite extends StatefulWidget {
  final List<Meal> favouriteMeal;

  const Favourite({Key key, this.favouriteMeal}) : super(key: key);
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    if (widget.favouriteMeal.isEmpty) {
      return Center(
        child: Text('Tou have no favourites yet - start adding some'),
      );
    } else {
      return ListView.builder(
        itemCount: widget.favouriteMeal.length,
        itemBuilder: (context, index) {
          return MealItem(
            affordability: widget.favouriteMeal[index].affordability,
            complexity: widget.favouriteMeal[index].complexity,
            duration: widget.favouriteMeal[index].duration,
            imageUrl: widget.favouriteMeal[index].imageUrl,
            title: widget.favouriteMeal[index].title,
            id: widget.favouriteMeal[index].id,
          );
        },
      );
    }
  }
}
