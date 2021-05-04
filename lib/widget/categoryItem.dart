import 'package:flutter/material.dart';
import 'package:mealapp/pages/category_meals.dart';

class CategoryItem extends StatefulWidget {
  final String title;
  final Color color;
  final String id;

  const CategoryItem({Key key, this.title, this.color, this.id})
      : super(key: key);
  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  void _selectCategory(context) {
    Navigator.of(context).pushNamed(CategoryMeals.routeName,
        arguments: {'id': widget.id, 'title': widget.title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Text(
          widget.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [widget.color.withOpacity(0.7), widget.color])),
      ),
    );
  }
}
