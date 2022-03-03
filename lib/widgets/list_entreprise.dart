import 'package:dynameet/models/entreprise.dart';
import 'package:dynameet/models/etudiant.dart';
import 'package:dynameet/views/match.dart';
import 'package:flutter/material.dart';

import '../widgets/components.dart';

class EntrepriseList extends StatefulWidget {
  const EntrepriseList(
      {Key? key, required this.isEtudiant, required this.uuidCible})
      : super(key: key);

  final bool isEtudiant;
  final String uuidCible;
  @override
  _EntrepriseListState createState() => _EntrepriseListState();
}

class _EntrepriseListState extends State<EntrepriseList> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    Etudiant? etuCible = Etudiant.GetEtudiant(widget.uuidCible);
    Entreprise? entrCible = Entreprise.GetEntreprise(widget.uuidCible);

    return Stack(
      children: listEntreprise.length > 0
          ? List.generate(
              listEntreprise.length,
              (index) => Dismissible(
                    key: Key(index.toString()),
                    child: Container(
                      width: _width * 0.9,
                      child: Center(
                          child: Column(
                        children: [
                          Container(
                            child: FittedBox(
                              child: Image.network(
                                listEntreprise[index].photo,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  {
                                    if (loadingProgress == null) return child;
                                    return Container(
                                        child: Padding(
                                      padding: EdgeInsets.all(60),
                                      child: SizedBox(
                                        child: CircularProgressIndicator(
                                          color: Color(0xff1F3C7C),
                                        ),
                                      ),
                                    ));
                                  }
                                },
                              ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                                  .apropos[
                                                              index2])),
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
                                                                  .valeurs[
                                                              index2])),
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
                                                                  .missions[
                                                              index2])),
                                                )
                                              ],
                                            )),
                                          ]),
                                    ]),
                              ))
                        ],
                      )),
                    ),
                    onDismissed: (DismissDirection direction) {
                      print(direction);

                      if (direction.name == "startToEnd") {
                        if (widget.isEtudiant) {
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
                                          isEtudiant: widget.isEtudiant,
                                        )));
                          }

                          setState(() {
                            if (widget.isEtudiant == true &&
                                listEtudiant.isNotEmpty) {
                              listEntreprise
                                  .removeAt(listEntreprise.length - 1);
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
                                          isEtudiant: widget.isEtudiant,
                                        )));
                          }

                          setState(() {
                            if (widget.isEtudiant == false &&
                                listEntreprise.isNotEmpty) {
                              listEtudiant.removeAt(listEtudiant.length - 1);
                            }
                          });
                        }
                      }

                      if (direction.name == "endToStart") {
                        setState(() {
                          if (widget.isEtudiant == true &&
                              listEtudiant.isNotEmpty)
                            listEntreprise.removeAt(listEntreprise.length - 1);

                          if (widget.isEtudiant == false &&
                              listEntreprise.isNotEmpty)
                            listEtudiant.removeAt(listEtudiant.length - 1);
                        });
                      }
                    },
                    background: Container(),
                  ))
          : [Center(child: H4(text: "Aucun Résultat"))],
    );
  }
}
