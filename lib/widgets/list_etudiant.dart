import 'package:dynameet/models/etudiant.dart';
import 'package:flutter/material.dart';

import '../widgets/components.dart';

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
                          width: _width * 0.9,
                          color: Color.fromARGB(255, 243, 243, 243),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextAdd(
                                        text: "Soft Skills",
                                        padding: 0,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(
                                            listEtudiant[index]
                                                .softSkills
                                                .length,
                                            (index2) => Text("• " +
                                                listEtudiant[index]
                                                    .softSkills[index2])),
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
                                        text: "Hard Skills",
                                        padding: 0,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(
                                            listEtudiant[index]
                                                .hardSkills
                                                .length,
                                            (index2) => Text("• " +
                                                listEtudiant[index]
                                                    .hardSkills[index2])),
                                      )
                                    ],
                                  )),
                                ]),
                          ),
                        )
                      ],
                    )),
                  ))
          : [Center(child: H4(text: "Aucun Résultat"))],
    );
  }
}
