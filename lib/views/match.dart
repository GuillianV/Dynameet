import 'package:carbon_icons/carbon_icons.dart';
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
          centerTitle: false,
          leadingWidth: 0,
          title: Container(
              // decoration: BoxDecoration(color: Colors.red),
              child: Row(
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
                  Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: ButtonIcon(
                        pressed: () {},
                        icon: const Icon(CarbonIcons.user_avatar,
                            color: Colors.black87, size: 50),
                        width: _height * 0.058,
                        height: _height * 0.058,
                        padding: EdgeInsets.zero,
                        color: Colors.white,
                      )),
                ],
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          )),
        ),
        body: CustomPagePadding(
            child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            createRow(),
            createRow(),
            createRow(),
            createRow(),
          ],
        )),
        bottomNavigationBar: const BottomBar(baseIndex: 1));
  }

  createRow() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                H4(
                  text: "Justine, 21",
                  padding: 0,
                ),
                TextAdd(
                  text: "Alternance en coiffure",
                  padding: 0,
                )
              ],
            ),
            ButtonBasic(
              text: "Voir",
              pressed: () {},
              color: const Color(0xff1F3C7C),
              height: 50,
              width: 150,
            )
          ],
        ));
  }
}
