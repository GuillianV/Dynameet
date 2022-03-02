import 'package:dynameet/widgets/button.dart';
import 'package:dynameet/widgets/button_icon.dart';
import 'package:flutter/material.dart';
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
            children:  <Widget>[
              ButtonIcon(pressed: (){


              }, icon: const Icon(Icons.star,color: Colors.white70), color: const Color(0xff1F3C7C))
            ],
          ),
        ));
  }
}
