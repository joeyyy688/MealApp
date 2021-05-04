import 'package:flutter/material.dart';
import 'package:mealapp/widget/tabScreenDrawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text('Filters Page'),
      ),
    );
  }
}
