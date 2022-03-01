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
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Image(image: AssetImage("assets/images/Dynameet-orange.png")),
          ButtonBasic(
            text: "dd",
            pressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Inscription()));
            },
          )
        ],
      ),
    ));
  }
}
