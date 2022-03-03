import 'package:carbon_icons/carbon_icons.dart';
import 'package:dynameet/views/inscription.dart';
import 'package:dynameet/views/landing.dart';
import 'package:dynameet/views/match.dart';
import 'package:dynameet/models/entreprise.dart';
import 'package:dynameet/models/etudiant.dart';
import 'package:dynameet/widgets/button.dart';
import 'package:dynameet/widgets/button_icon.dart';
import 'package:dynameet/widgets/list_etudiant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../widgets/components.dart';
import '../widgets/list_entreprise.dart';

class SwipePage extends StatefulWidget {
  const SwipePage({Key? key, required this.isEtudiant}) : super(key: key);

  final bool isEtudiant;

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  int _currentIndex = 0;
  Widget? currentBody = null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    String uuidCible = "";

    if (isEtudiant == true)
      uuidCible = listEtudiant.first.uuid;
    else
      uuidCible = listEntreprise.first.uuid;

    void onTabTapped(int index) {
      setState(() {
        if (index == 0 && _currentIndex != index) {
          currentBody = SwipeWidget(
            isEtudiant: widget.isEtudiant,
            uuidCible: uuidCible,
          );
        }

        if (index == 1 && _currentIndex != index) {
          currentBody = match(context, uuidCible);
        }

        _currentIndex = index;
      });
    }

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
                        pressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Landing(
                                      title: dotenv.env['ProjectName'] ??
                                          "Dynameet")));
                        },
                        icon: const Icon(CarbonIcons.user_avatar,
                            color: Colors.black87, size: 50),
                        width: 50,
                        height: 50,
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
        body: currentBody ??
            SwipeWidget(
              isEtudiant: isEtudiant,
              uuidCible: uuidCible,
            ),
        bottomNavigationBar: Container(
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
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 32,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.menu,
                      size: 32,
                    ),
                    label: 'Matchs',
                  ),
                ],
              ),
            )));
  }
}

class SwipeWidget extends StatefulWidget {
  const SwipeWidget(
      {Key? key, required this.isEtudiant, required this.uuidCible})
      : super(key: key);

  final bool isEtudiant;
  final String uuidCible;

  @override
  _SwipeWidgetState createState() => _SwipeWidgetState();
}

class _SwipeWidgetState extends State<SwipeWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    Etudiant? etuCible = Etudiant.GetEtudiant(widget.uuidCible);
    Entreprise? entrCible = Entreprise.GetEntreprise(widget.uuidCible);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                  width: _width * 0.9,
                  height: _height * 0.61,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(4, 4),
                          spreadRadius: 0,
                          blurRadius: 10),
                    ],
                  ),
                  child: widget.isEtudiant ? EntrepriseList() : StudentList())),
          Center(
            child: Row(
              children: [
                ButtonIcon(
                    pressed: () {
                      setState(() {
                        if (isEtudiant == true && listEtudiant.isNotEmpty)
                          listEntreprise.removeAt(listEntreprise.length - 1);

                        if (isEtudiant == false && listEntreprise.isNotEmpty)
                          listEtudiant.removeAt(listEtudiant.length - 1);
                      });
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white70,
                      size: 40,
                    ),
                    width: _height * 0.1,
                    height: _height * 0.1,
                    padding: EdgeInsets.zero,
                    color: const Color(0xffE65B6A)),
                ButtonIcon(
                    pressed: () {},
                    icon: const Icon(
                      Icons.star,
                      color: Colors.white70,
                      size: 40,
                    ),
                    width: _height * 0.1,
                    height: _height * 0.1,
                    padding: EdgeInsets.zero,
                    color: const Color(0xff1F3C7C)),
                ButtonIcon(
                    pressed: () {
                      if (isEtudiant) {
                        Entreprise entreprise = Entreprise.GetEntreprise(
                                listEntreprise[listEntreprise.length - 1]
                                    .uuid) ??
                            Entreprise("");
                        etuCible!.matchedEntreprise.add(entreprise.uuid);

                        if (entreprise.matchedEtudiant
                            .contains(etuCible.uuid)) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MatchPage(
                                        uuidEntreprise: entreprise.uuid,
                                        uuidStudent: etuCible.uuid,
                                        isEtudiant: isEtudiant,
                                      )));
                        }

                        setState(() {
                          if (isEtudiant == true && listEtudiant.isNotEmpty) {
                            listEntreprise.removeAt(listEntreprise.length - 1);
                          }
                        });
                      } else {
                        Etudiant etudiant = Etudiant.GetEtudiant(
                                listEtudiant[listEtudiant.length - 1].uuid) ??
                            Etudiant("");
                        entrCible!.matchedEtudiant.add(etudiant.uuid);

                        if (etudiant.matchedEntreprise
                            .contains(entrCible.uuid)) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MatchPage(
                                        uuidEntreprise: entrCible.uuid,
                                        uuidStudent: etudiant.uuid,
                                        isEtudiant: isEtudiant,
                                      )));
                        }

                        setState(() {
                          if (isEtudiant == false &&
                              listEntreprise.isNotEmpty) {
                            listEtudiant.removeAt(listEtudiant.length - 1);
                          }
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.white70,
                      size: 40,
                    ),
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
    );
  }
}

Widget match(context, _uuid) {
  double _height = MediaQuery.of(context).size.height;
  double _width = MediaQuery.of(context).size.width;

  List<String> nom = [];
  if (isEtudiant) {
    Entreprise.GetEntreprisesMatched(_uuid)?.forEach((element) {
      nom.add(element.nom);
    });
  } else {
    Etudiant.GetEtudiantsMatched(_uuid)?.forEach((element) {
      nom.add(element.nom + " ," + element.age);
    });
  }

  return CustomPagePadding(
      child: Column(
    children: [
      const SizedBox(
        height: 30,
      ),
      H4(
        text: "Mes matchs",
      ),
      const SizedBox(
        height: 30,
      ),
      Column(
        children: List.generate(
            nom.length, (index) => createRow(nom[index], isEtudiant)),
      )
    ],
  ));
}

createRow(String nom, bool isEtudiant) {
  return Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              H4(
                text: nom,
                padding: 0,
              ),
              if (isEtudiant)
                TextAdd(
                  text: "Entreprise",
                  padding: 0,
                )
              else
                TextAdd(
                  text: "Alternant",
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
