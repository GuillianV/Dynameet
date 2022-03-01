import 'package:dynameet/widgets/button.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD
import 'inscription.dart';

=======
>>>>>>> d0e2b1fc7c1df9462788e35a0b04dc3bf17c28c8
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
<<<<<<< HEAD
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
=======
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:  Container(
            alignment: Alignment(1, 1.0),
          child:SizedBox(
            child: ButtonBasic(
              text: "Commencer",
              pressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Landing(title: "Ouaii")));
              },
            ),
            height: 80,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(
                  image: AssetImage("assets/images/Dynameet-orange.png")),
              ButtonBasic(
                text: "Commencer",
                pressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Landing(title: "Ouaii")));
                },
              )
            ],
          ),
        ));
>>>>>>> d0e2b1fc7c1df9462788e35a0b04dc3bf17c28c8
  }
}
