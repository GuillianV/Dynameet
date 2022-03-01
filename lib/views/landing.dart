import 'package:dynameet/widgets/button.dart';
import 'package:flutter/material.dart';
import 'inscription.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          alignment: Alignment(1, 1.0),
          child: ButtonBasic(
            text: "Commencer",
            color: Color(0xffFFA857),
            pressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Inscription()));
            },height: 80,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Image(image: AssetImage("assets/images/Dynameet-orange.png")),
            ],
          ),
        ));
  }
}
