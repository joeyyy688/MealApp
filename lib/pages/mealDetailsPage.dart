import 'package:flutter/material.dart';
import 'package:mealapp/models/dummyData.dart';

class MealDetails extends StatefulWidget {
  final Function toggleFavouriteFuction;
  final Function isFavourite;
  static const routeName = '/mealDetails';

  const MealDetails({Key key, this.toggleFavouriteFuction, this.isFavourite})
      : super(key: key);
  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  Widget _buildSectionContainer(String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Text(
        value,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 230,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          )),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'];
    final filteredData =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${filteredData.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                filteredData.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionContainer('Ingredient'),
            _buildContainer(
              ListView.builder(
                itemCount: filteredData.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: Text(filteredData.ingredients[index])),
                  );
                },
              ),
            ),
            _buildSectionContainer('Steps to Prepare'),
            _buildContainer(
              ListView.builder(
                itemCount: filteredData.steps.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(filteredData.steps[index]),
                      ),
                      Divider(
                        color: Colors.grey[850],
                      )
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 60,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child:
              Icon(widget.isFavourite(mealId) ? Icons.star : Icons.star_border),
          onPressed: () {
            widget.toggleFavouriteFuction(mealId);
          }),
    );
  }
}
