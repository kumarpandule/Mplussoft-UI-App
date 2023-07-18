import 'package:flutter/material.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 0.0),
      decoration: BoxDecoration(
        color: Colors.pink[100],
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey,
        //     spreadRadius: 1.0,
        //     blurRadius: 4.0,
        //     offset: const Offset(-2, -2),
        //   ),
        //   BoxShadow(
        //     color: Colors.grey,
        //     spreadRadius: 1.0,
        //     blurRadius: 6.0,
        //     offset: const Offset(4, 4),
        //   ),
        // ],
      ),
      child: Row(
        children: [],
      ),
    );
  }
}
