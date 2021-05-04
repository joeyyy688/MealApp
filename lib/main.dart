import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mealapp/pages/category_meals.dart';
import 'package:mealapp/pages/mealDetailsPage.dart';
import 'package:mealapp/pages/tabsScreen.dart';
import 'package:mealapp/widget/gridViewScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
                  TextStyle(fontSize: 21, fontFamily: 'RobotCondensed'))),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMeals.routeName: (context) => CategoryMeals(),
        MealDetails.routeName: (context) => MealDetails(),
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
