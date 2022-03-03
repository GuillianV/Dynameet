import 'package:carbon_icons/carbon_icons.dart';
import 'package:dynameet/views/inscription.dart';
import 'package:dynameet/views/landing.dart';
import 'package:dynameet/views/match.dart';
import 'package:dynameet/models/entreprise.dart';
import 'package:dynameet/models/etudiant.dart';
import 'package:dynameet/widgets/button.dart';
import 'package:dynameet/widgets/button_icon.dart';
import 'package:flutter/material.dart';

import '../widgets/components.dart';

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

    void onTabTapped(int index) {
      setState(() {
        if (index == 0 && _currentIndex != index) {
          currentBody = SwipeWidget(
            isEtudiant: widget.isEtudiant,
          );
        }

        if (index == 1 && _currentIndex != index) {
          currentBody = match(context);
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
                                  builder: (context) =>
                                      Landing(title: "Dynameet")));
                        },
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
        body: currentBody == null
            ? SwipeWidget(
                isEtudiant: isEtudiant,
              )
            : currentBody,
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
  const SwipeWidget({Key? key, required this.isEtudiant}) : super(key: key);

  final bool isEtudiant;

  @override
  _SwipeWidgetState createState() => _SwipeWidgetState();
}

class _SwipeWidgetState extends State<SwipeWidget> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

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
                        if (listEtudiant.isNotEmpty)
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
                      String uuidEtu = "";
                      String uuidEntr = "";

                      Entreprise entreprise =
                          Entreprise.GetEntreprise(uuidEntr) ??
                              new Entreprise("");
                      Etudiant etudiant =
                          Etudiant.GetEtudiant(uuidEtu) ?? new Etudiant("");

                      if (isEtudiant) {
                        etudiant.matchedEntreprise.add(entreprise.uuid);

                        if (entreprise.matchedEtudiant
                            .contains(etudiant.uuid)) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MatchPage(
                                        uuidEntreprise: entreprise.uuid,
                                        uuidStudent: etudiant.uuid,
                                        isEtudiant: isEtudiant,
                                      )));
                        }
                      } else {
                        entreprise.matchedEtudiant.add(etudiant.uuid);

                        if (etudiant.matchedEntreprise
                            .contains(entreprise.uuid)) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MatchPage(
                                        uuidEntreprise: entreprise.uuid,
                                        uuidStudent: etudiant.uuid,
                                        isEtudiant: isEtudiant,
                                      )));
                        }
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

class EntrepriseList extends StatefulWidget {
  const EntrepriseList({Key? key}) : super(key: key);

  @override
  _EntrepriseListState createState() => _EntrepriseListState();
}

class _EntrepriseListState extends State<EntrepriseList> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Stack(
      children: listEtudiant.length > 0
          ? List.generate(
              listEtudiant.length,
              (index) => Container(
                    child: Center(
                        child: Column(
                      children: [
                        Container(
                          child: FittedBox(
                            child: Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Logo_SNCF_2011.svg/2560px-Logo_SNCF_2011.svg.png"),
                            fit: BoxFit.cover,
                          ),
                          height: _height * 0.2,
                          width: _width * 0.9,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                        ),
                        Container(
                          height: _height * 0.41,
                          color: Color(0xffE5E5E5),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                H4(
                                    text: listEtudiant[index].nom +
                                        ", " +
                                        listEtudiant[index].age),
                                TextAdd(
                                  text: listEtudiant[index].titreDescription,
                                  padding: 0,
                                ),
                                Text(listEtudiant[index].description),
                                Container(
                                    child: Column(
                                  children: [
                                    TextAdd(text: "Soft Skills"),
                                    Column(
                                      children: List.generate(
                                          listEtudiant[index].softSkills.length,
                                          (index2) => Text(listEtudiant[index]
                                              .softSkills[index2])),
                                    )
                                  ],
                                )),
                                Container(
                                    child: Column(
                                  children: [
                                    TextAdd(text: "Hard Skills"),
                                    Column(
                                      children: List.generate(
                                          listEtudiant[index].hardSkills.length,
                                          (index2) => Text(listEtudiant[index]
                                              .softSkills[index2])),
                                    )
                                  ],
                                ))
                              ]),
                        )
                      ],
                    )),
                  ))
          : [Center(child: H4(text: "Aucun Résultat"))],
    );
  }
}

class StudentList extends StatefulWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Stack(
      children: listEtudiant.length > 0
          ? List.generate(
              listEtudiant.length,
              (index) => Container(
                    child: Center(
                        child: Column(
                      children: [
                        Container(
                          child: FittedBox(
                            child: Image.network(listEtudiant[index].photo),
                            fit: BoxFit.cover,
                          ),
                          height: _height * 0.2,
                          width: _width * 0.9,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                        ),
                        Container(
                          height: _height * 0.41,
                          color: Color(0xffE5E5E5),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                H4(
                                    text: listEtudiant[index].nom +
                                        ", " +
                                        listEtudiant[index].age),
                                TextAdd(
                                  text: listEtudiant[index].titreDescription,
                                  padding: 0,
                                ),
                                Text(listEtudiant[index].description),
                                Container(
                                    child: Column(
                                  children: [
                                    TextAdd(text: "Soft Skills"),
                                    Column(
                                      children: List.generate(
                                          listEtudiant[index].softSkills.length,
                                          (index2) => Text(listEtudiant[index]
                                              .softSkills[index2])),
                                    )
                                  ],
                                )),
                                Container(
                                    child: Column(
                                  children: [
                                    TextAdd(text: "Hard Skills"),
                                    Column(
                                      children: List.generate(
                                          listEtudiant[index].hardSkills.length,
                                          (index2) => Text(listEtudiant[index]
                                              .softSkills[index2])),
                                    )
                                  ],
                                ))
                              ]),
                        )
                      ],
                    )),
                  ))
          : [Center(child: H4(text: "Aucun Résultat"))],
    );
  }
}

Widget match(context) {
  double _height = MediaQuery.of(context).size.height;
  double _width = MediaQuery.of(context).size.width;

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
      createRow(),
      createRow(),
      createRow(),
      createRow(),
    ],
  ));
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
