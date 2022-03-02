import 'package:dynameet/widgets/bottom_bar.dart';
import 'package:dynameet/widgets/button.dart';
import 'package:dynameet/widgets/button_icon.dart';
import 'package:flutter/material.dart';

import '../widgets/components.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
 

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              Row(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: SizedBox(
                        width: 50,
                        child: Image(
                            image: AssetImage("assets/images/logo_crop.png")),
                      )),
                  AppBarText(text: "Dynameet"),
                ],
              ),
              ButtonIcon(
                pressed: () {},
                icon: const Icon(Icons.person, color: Colors.black87),
                width: _height * 0.05,
                height: _height * 0.05,
                padding: EdgeInsets.zero,
                color: const Color(0xffffffff),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ),
        body: Text("Match"),
        bottomNavigationBar: const BottomBar(baseIndex: 1));
  }
}
