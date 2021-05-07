import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mealapp/models/dummyData.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/pages/category_meals.dart';
import 'package:mealapp/pages/filters.dart';
import 'package:mealapp/pages/mealDetailsPage.dart';
import 'package:mealapp/pages/tabsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !element.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6:
                  TextStyle(fontSize: 20, fontFamily: 'RobotCondensed'))),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMeals.routeName: (context) => CategoryMeals(
              availableMeals: availableMeals,
            ),
        MealDetails.routeName: (context) => MealDetails(),
        Filters.routeName: (context) => Filters(
              filtersFunction: _setFilters,
              currentFiltersData: _filters,
            ),
      },
      //home: MyHomePage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("DeliMeals"),
//         ),
//         body:
//             CategoriesGridView() // This trailing comma makes auto-formatting nicer for build methods.
//         );
//   }
// }
