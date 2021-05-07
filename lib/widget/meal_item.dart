import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/pages/mealDetailsPage.dart';

class MealItem extends StatefulWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    Key key,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.id,
  }) : super(key: key);

  @override
  _MealItemState createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  // String get complexityValue{
  //   if (widget.complexity == Complexity.Simple){
  //     return 'Simple';
  //   }else if (widget.complexity == Complexity.Challenging){
  //     return 'Challenging';
  //   }else if (widget.complexity == Complexity.Hard){
  //     return 'Hard';
  //   }
  // }

  String get complexityValue {
    switch (widget.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Uknown';
    }
  }

  String get affordabilityValue {
    switch (widget.affordability) {
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Affordable:
        return 'Affordable';
        break;
      default:
        return 'Unknown';
    }
  }

  void goToMealDetails(context) {
    Navigator.of(context).pushNamed(MealDetails.routeName, arguments: {
      'id': widget.id,
    }).then((value) {
      print(value);
      if (value != null) {
        //widget.removeItem(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToMealDetails(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: EdgeInsets.all(18),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18)),
                  child: Image.network(
                    widget.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 1,
                  child: Container(
                    margin: EdgeInsets.all(0),
                    width: 380,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    //height: 50,
                    color: Colors.black54,
                    child: Text(
                      widget.title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      //overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule_outlined),
                      SizedBox(
                        width: 7,
                      ),
                      Text('${widget.duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 7,
                      ),
                      Text('$complexityValue')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money_outlined),
                      SizedBox(
                        width: 7,
                      ),
                      Text('$affordabilityValue')
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
