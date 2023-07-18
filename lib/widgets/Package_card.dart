import 'package:flutter/material.dart';
import 'package:kumarpandule/widgets/button.dart';

class PackageCard extends StatelessWidget {
  final String name;
  final int price;
  final String description;
  final int id;
  const PackageCard(
      {super.key,
      required this.name,
      required this.price,
      required this.description,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 0.0),
        decoration: BoxDecoration(
          color: id % 2 == 0 ? Colors.blue[100] : Colors.pink[100],
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  size: 40.0,
                  color: id % 2 == 0 ? Colors.blue[400] : Colors.pink[300],
                ),
                id % 2 == 0
                    ? CustomButtonBlue(text: 'Book Now')
                    : CustomButtonPink(text: 'Book Now'),
              ],
            ),
            SizedBox(height: 18.0),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name,
                      style:
                          TextStyle(fontSize: 16.0, color: Colors.blue[900])),
                  Text('₹' + '$price',
                      style:
                          TextStyle(fontSize: 16.0, color: Colors.blue[900])),
                ],
              ),
            ),
            SizedBox(height: 18.0),
            Text(
              description,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
