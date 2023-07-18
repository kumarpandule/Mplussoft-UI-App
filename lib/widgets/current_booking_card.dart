import 'package:flutter/material.dart';
import 'package:kumarpandule/widgets/button.dart';

class CurrentBooking extends StatelessWidget {
  final String label;
  final String from_date;
  final String to_date;
  final String from_time;
  final String to_time;
  const CurrentBooking(
      {super.key,
      required this.label,
      required this.from_date,
      required this.to_date,
      required this.from_time,
      required this.to_time});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 0.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), //color of shadow
              spreadRadius: 1, //spread radius
              blurRadius: 3, // blur radius
              offset: Offset(0, 0),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label,
                    style: TextStyle(fontSize: 18.0, color: Colors.pink[300])),
                CustomButtonPink(text: 'Start'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('From', style: TextStyle(fontSize: 12.0)),
                      Row(
                        children: [
                          Icon(Icons.calendar_month,
                              size: 16.0, color: Colors.pink[300]),
                          SizedBox(width: 4.0),
                          Text(from_date),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.alarm,
                              size: 16.0, color: Colors.pink[300]),
                          SizedBox(width: 4.0),
                          Text(from_time),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('To', style: TextStyle(fontSize: 12.0)),
                      Row(
                        children: [
                          Icon(Icons.calendar_month,
                              size: 16.0, color: Colors.pink[300]),
                          SizedBox(width: 4.0),
                          Text(to_date),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.alarm,
                              size: 16.0, color: Colors.pink[300]),
                          SizedBox(width: 4.0),
                          Text(to_time),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonDarkBlue(text: 'Rate Us'),
                CustomButtonDarkBlue(text: 'Geolocation'),
                CustomButtonDarkBlue(text: 'Survillence'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
