import 'package:dynameet/views/landing.dart';
import 'package:dynameet/views/match.dart';
import 'package:dynameet/views/swipe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  
   const BottomBar({Key? key, required this.baseIndex})
      : super(key: key);

  final int baseIndex; 

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {


 int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
     

      if(index == 0 && _currentIndex != index){
        Navigator.push(context,MaterialPageRoute(builder: (context) =>const SwipePage()));
      }

      if(index == 1 && _currentIndex != index){
         Navigator.push(context,MaterialPageRoute(builder: (context) =>const MatchPage()));
      }

       _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {


    _currentIndex = widget.baseIndex;

    return 
    Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: Color(0xffFFA857),
                selectedItemColor: Color(0xff1F3C7C),
                type: BottomNavigationBarType.fixed,
                onTap: onTabTapped,
                currentIndex: _currentIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu),
                    label: 'Matchs',
                  ),
                ],
              ),
            ));
  }
}
