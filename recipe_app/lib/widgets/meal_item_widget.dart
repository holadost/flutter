import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/meal.dart';


class MealItemWidget extends StatelessWidget {
  final String title;
  final String imageURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItemWidget({
    @required this.title,
    @required this.imageURL,
    @required this.duration,
    @required this.complexity,
    @required this.affordability
  });

  String get complexityText {
    if (complexity == Complexity.Simple) {
      return 'Simple';
    }
    if (complexity == Complexity.Challenging) {
      return 'Challenging';
    }
    if (complexity == Complexity.Hard) {
      return 'Hard';
    }
  }

  String get affordabilityText {
    if (affordability == Affordability.Affordable) {
      return 'Affordable';
    }
    if (affordability == Affordability.Pricey) {
      return 'Pricey';
    }
    if (affordability == Affordability.Luxurious) {
      return 'Luxurious';
    }
  }

  void _selectMeal() {

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                // We use ClipRRect to force images to have rounded corners.
                // It is not possible to directly set a shape attribute to
                // the image widget(as we did with the card above).
                ClipRRect(
                  // Only round the topLeft and topRight.
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageURL,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // The positioned widget works only inside a stack to
                // allow us to place an element above another element
                // at the position/location that we want.
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.all(5),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                // We add the mainAxisAlignment here to add space
                // between the various elements in the row.
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 5),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 5),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 5),
                      Text(affordabilityText),
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
