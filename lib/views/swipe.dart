import 'package:dynameet/widgets/button.dart';
import 'package:dynameet/widgets/button_icon.dart';
import 'package:flutter/material.dart';
class SwipePage extends StatefulWidget {
  const SwipePage({Key? key,}) : super(key: key);

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
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
