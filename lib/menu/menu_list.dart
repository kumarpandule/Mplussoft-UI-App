import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class MenuList extends StatelessWidget {
  final GlobalKey<SideMenuState> menuKey;
  const MenuList({super.key, required this.menuKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(
                      color: Colors.pink,
                      width: 2.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kumar Pandule',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink[300])),
              ],
            ),
            SizedBox(height: 30),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  button(
                      page: 'Home',
                      onTap: () => menuKey.currentState!.closeSideMenu()),
                ]),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 8, left: 18.0),
              child: Divider(
                color: Colors.pink[100],
                height: 1,
                thickness: 0.5,
                indent: 0,
                endIndent: 0,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  button(
                      page: 'Book A Nanny',
                      onTap: () => menuKey.currentState!.closeSideMenu()),
                ]),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 8, left: 18.0),
              child: Divider(
                color: Colors.pink[100],
                height: 1,
                thickness: 0.5,
                indent: 0,
                endIndent: 0,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  button(
                      page: 'How it Works',
                      onTap: () => menuKey.currentState!.closeSideMenu()),
                ]),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 8, left: 18.0),
              child: Divider(
                color: Colors.pink[100],
                height: 1,
                thickness: 0.5,
                indent: 0,
                endIndent: 0,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  button(
                      page: 'Way Nanny Vanny',
                      onTap: () => menuKey.currentState!.closeSideMenu()),
                ]),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 8, left: 18.0),
              child: Divider(
                color: Colors.pink[100],
                height: 1,
                thickness: 0.5,
                indent: 0,
                endIndent: 0,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  button(
                      page: 'My Bookings',
                      onTap: () => menuKey.currentState!.closeSideMenu()),
                ]),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 8, left: 18.0),
              child: Divider(
                color: Colors.pink[100],
                height: 1,
                thickness: 0.5,
                indent: 0,
                endIndent: 0,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  button(
                      page: 'My Profile',
                      onTap: () => menuKey.currentState!.closeSideMenu()),
                ]),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 8, left: 18.0),
              child: Divider(
                color: Colors.pink[100],
                height: 1,
                thickness: 0.5,
                indent: 0,
                endIndent: 0,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  button(
                      page: 'Support',
                      onTap: () => menuKey.currentState!.closeSideMenu()),
                ]),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 8, left: 18.0),
              child: Divider(
                color: Colors.pink[100],
                height: 1,
                thickness: 0.5,
                indent: 0,
                endIndent: 0,
              ),
            ),
          ],
        ));
  }
}

button({
  required String page,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          Text(page,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.indigo[900])),
        ],
      ),
    ),
  );
}
