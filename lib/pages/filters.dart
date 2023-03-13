import 'package:flutter/material.dart';
import 'package:mealapp/widget/tabScreenDrawer.dart';

class Filters extends StatefulWidget {
  final Map<String, bool> currentFiltersData;
  final Function filtersFunction;
  static const routeName = '/filters';

  const Filters(
      {Key key,
      @required this.filtersFunction,
      @required this.currentFiltersData})
      : super(key: key);
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildAdaptiveSwitchTile(
      {String title, bool value, String subtitle, Function onchangeCallBack}) {
    return SwitchListTile.adaptive(
        value: value,
        title: Text(title),
        subtitle: Text(subtitle),
        onChanged: onchangeCallBack);
  }

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget.currentFiltersData['gluten'];
    _vegetarian = widget.currentFiltersData['vegetarian'];
    _vegan = widget.currentFiltersData['vegan'];
    _lactoseFree = widget.currentFiltersData['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Map<String, bool> selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.filtersFunction(selectedFilters);
              },
            )
          ],
        ),
        drawer: CustomDrawer(),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection here',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildAdaptiveSwitchTile(
                    value: _glutenFree,
                    subtitle: 'Only include gluten-free meals',
                    title: 'Gluten Free',
                    onchangeCallBack: (value) {
                      setState(() {
                        _glutenFree = value;
                      });
                      print(_glutenFree);
                    },
                  ),
                  _buildAdaptiveSwitchTile(
                    value: _vegetarian,
                    subtitle: 'Only include vegetarian meals',
                    title: 'Vegetarian',
                    onchangeCallBack: (value) {
                      setState(() {
                        _vegetarian = value;
                      });
                      print(_vegetarian);
                    },
                  ),
                  _buildAdaptiveSwitchTile(
                    value: _vegan,
                    subtitle: 'Only include vegan meals',
                    title: 'Vegan',
                    onchangeCallBack: (value) {
                      setState(() {
                        _vegan = value;
                      });
                      print(_vegan);
                    },
                  ),
                  _buildAdaptiveSwitchTile(
                    value: _lactoseFree,
                    subtitle: 'Only include Lactose Free meals',
                    title: 'Lactose Free',
                    onchangeCallBack: (value) {
                      setState(() {
                        _lactoseFree = value;
                      });
                      print(_lactoseFree);
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
