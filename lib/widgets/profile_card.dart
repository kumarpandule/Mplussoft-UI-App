import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: CircularAvetor(
              child: Image.asset(
                'assets/images/profile.jpg',
                fit: BoxFit.cover,
              ),
              height: MediaQuery.of(context).size.height / 9,
              width: MediaQuery.of(context).size.height / 9,
              border: 2.0,
            ),
            onTap: () {},
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  'welcome',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.9,
                padding: const EdgeInsets.all(0),
                child: Text(
                  'Kumar Pandule',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.pink[300]),
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 10,
          ),
        ],
      ),
    );
  }
}

class CircularAvetor extends StatelessWidget {
  final double height;
  final double width;
  final double border;
  final Widget child;
  const CircularAvetor(
      {Key? key,
      required this.child,
      required this.height,
      required this.width,
      required this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.pink, width: border),
      ),
      child: ClipOval(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: child,
        ),
      ),
    );
  }
}
