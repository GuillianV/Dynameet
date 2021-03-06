import 'package:carbon_icons/carbon_icons.dart';
import 'package:dynameet/models/entreprise.dart';
import 'package:dynameet/models/etudiant.dart';
import 'package:dynameet/views/swipe.dart';
import 'package:dynameet/widgets/button.dart';
import 'package:dynameet/widgets/button_icon.dart';
import 'package:flutter/material.dart';

import '../widgets/components.dart';
import 'inscription.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({
    Key? key,
    required this.uuidEntreprise,
    required this.uuidStudent,
    required this.isEtudiant,
  }) : super(key: key);

  final String uuidStudent;
  final String uuidEntreprise;
  final bool isEtudiant;

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  @override
  Widget build(BuildContext context) {
 double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;


    Entreprise entreprise =
        Entreprise.GetEntreprise(widget.uuidEntreprise) ?? new Entreprise("");
    Etudiant etudiant =
        Etudiant.GetEtudiant(widget.uuidStudent) ?? new Etudiant("");

    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff4E71BE),
              Color(0xff1F3C7C),
            ],
          )),
          child: Center(
            child: Column(
              children: [
                 SizedBox(
                  height: _height*0.3,
                ),
                const H2(text: "It's a Match !"),
                 SizedBox(
                  height:  _height*0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.translate(
                      offset: const Offset(20, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.network(
                          entreprise.photo,
                          width: _height*0.15,
                          height: _height*0.15,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(-20, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.network(
                          etudiant.photo,
                          width: _height*0.15,
                          height: _height*0.15,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                 SizedBox(
                  height:  _height*0.05,
                ),
                ButtonBasic(
                  text: "Rentrer en contact",
                  color: Color(0xffFFA857),
                  fontColor: Colors.black87,
                  height: _height*0.1,
                  fontSize: 30,
                  pressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonBasic(
                  text: "Continuer",
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontColor: Colors.black87,
                  height:  _height*0.1,
                  fontSize: 30,
                  pressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SwipePage(
                                  isEtudiant: isEtudiant,
                                )));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
