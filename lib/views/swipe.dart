import 'package:dynameet/widgets/bottom_bar.dart';
import 'package:dynameet/widgets/button.dart';
import 'package:dynameet/widgets/button_icon.dart';
import 'package:flutter/material.dart';

import '../widgets/components.dart';

class SwipePage extends StatefulWidget {
  const SwipePage({
    Key? key,
  }) : super(key: key);

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
 

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Container(
                      width: _width * 0.9,
                      height: _height * 0.5,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 0,
                              blurRadius: 10),
                        ],
                      ),
                      child: Center(
                        child: Text("Hello"),
                      ))),
              Center(
                child: Row(
                  children: [
                    ButtonIcon(
                        pressed: () {},
                        icon: const Icon(Icons.close, color: Colors.white70),
                        width: _height * 0.1,
                        height: _height * 0.1,
                        padding: EdgeInsets.zero,
                        color: const Color(0xffE65B6A)),
                    ButtonIcon(
                        pressed: () {},
                        icon: const Icon(Icons.star, color: Colors.white70),
                        width: _height * 0.1,
                        height: _height * 0.1,
                        padding: EdgeInsets.zero,
                        color: const Color(0xff1F3C7C)),
                    ButtonIcon(
                        pressed: () {},
                        icon: const Icon(Icons.favorite, color: Colors.white70),
                        width: _height * 0.1,
                        height: _height * 0.1,
                        padding: EdgeInsets.zero,
                        color: const Color(0xffF1AC60))
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: const BottomBar(baseIndex: 0));
  }
}
