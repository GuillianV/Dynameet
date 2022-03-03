import 'package:dynameet/models/entreprise.dart';
import 'package:flutter/material.dart';

import '../widgets/components.dart';

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
      children: listEntreprise.length > 0
          ? List.generate(
              listEntreprise.length,
              (index) => Container(
                    width: _width * 0.9,
                    child: Center(
                        child: Column(
                      children: [
                        Container(
                          child: FittedBox(
                            child: Image.network(listEntreprise[index].photo),
                            fit: BoxFit.cover,
                          ),
                          height: _height * 0.2,
                          width: _width * 0.9,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                        ),
                        Container(
                            height: _height * 0.41,
                            width: _width * 0.9,
                            color: Color.fromARGB(255, 243, 243, 243),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          H4(text: listEntreprise[index].nom),
                                          Container(
                                              child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextAdd(
                                                text: "A propos",
                                                padding: 0,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: List.generate(
                                                    listEntreprise[index]
                                                        .apropos
                                                        .length,
                                                    (index2) => Text("• " +
                                                        listEntreprise[index]
                                                            .apropos[index2])),
                                              )
                                            ],
                                          )),
                                          Container(
                                              child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextAdd(
                                                text: "Nos Valeurs",
                                                padding: 0,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: List.generate(
                                                    listEntreprise[index]
                                                        .valeurs
                                                        .length,
                                                    (index2) => Text("• " +
                                                        listEntreprise[index]
                                                            .valeurs[index2])),
                                              )
                                            ],
                                          )),
                                          Container(
                                              child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextAdd(
                                                text: "Nos Missions",
                                                padding: 0,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: List.generate(
                                                    listEntreprise[index]
                                                        .missions
                                                        .length,
                                                    (index2) => Text("• " +
                                                        listEntreprise[index]
                                                            .missions[index2])),
                                              )
                                            ],
                                          )),
                                        ]),
                                  ]),
                            ))
                      ],
                    )),
                  ))
          : [Center(child: H4(text: "Aucun Résultat"))],
    );
  }
}
