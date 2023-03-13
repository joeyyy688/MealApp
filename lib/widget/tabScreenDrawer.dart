import 'package:flutter/material.dart';
import 'package:mealapp/pages/filters.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  Widget buildDrawerTile(
      {String text, IconData iconselected, Function tapEventHandler}) {
    return ListTile(
      leading: Icon(
        iconselected,
        size: 24,
      ),
      title: Text(
        text,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.w700),
      ),
      onTap: tapEventHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text('Cooking Up',
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor,
                )),
          ),
          SizedBox(
            height: 20,
          ),
          buildDrawerTile(
              iconselected: Icons.restaurant,
              tapEventHandler: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
              text: 'Meals'),
          buildDrawerTile(
              iconselected: Icons.settings,
              tapEventHandler: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacementNamed(Filters.routeName);
              },
              text: 'Settings'),
        ],
      ),
    );
  }
}
