import 'package:flutter/material.dart';
import 'package:kumarpandule/widgets/button.dart';

class NannyCard extends StatelessWidget {
  NannyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: GestureDetector(
        onTap: null,
        child: Stack(alignment: Alignment.bottomRight, children: <Widget>[
          Card(
              child: Container(
                  height: MediaQuery.of(context).size.height / 6,
                  decoration: BoxDecoration(
                    color: Colors.pink[100],
                    borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 3),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Nanny And Babystting Services',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.indigo[900],
                          ),
                        ),
                      ),
                      subtitle: Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width / 4,
                              top: 8.0),
                          child: CustomButtonDarkBlue(
                            text: 'Book Now',
                          )),
                    ),
                  ))),
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Container(
                child: Image.asset(
              'assets/images/nanny.png',
              height: MediaQuery.of(context).size.width / 2,
            )),
          )
        ]),
      ),
    );
  }
}
