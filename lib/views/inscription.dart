import 'dart:io';

import 'package:dynameet/views/swipe.dart';
import 'package:dynameet/widgets/button.dart';
import 'package:dynameet/widgets/components.dart';
import 'package:flutter/material.dart';

import 'landing.dart';

bool isEtudiant = false;

class Step2 extends StatefulWidget {
  Step2({Key? key}) : super(key: key);

  TextEditingController etu_name = TextEditingController();
  TextEditingController etu_nom = TextEditingController();
  TextEditingController etu_ddn = TextEditingController();
  TextEditingController etu_bio = TextEditingController();

  TextEditingController ent_nom = TextEditingController();
  TextEditingController ent_sect = TextEditingController();
  TextEditingController ent_sal = TextEditingController();
  TextEditingController ent_loc = TextEditingController();

  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isEtudiant
        ? CustomPagePadding(
            child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              TextInput(
                controller: widget.etu_name,
                hint: "Prénom",
              ),
              const SizedBox(
                height: 10,
              ),
              TextInput(
                controller: widget.etu_nom,
                hint: "Nom",
              ),
              const SizedBox(
                height: 10,
              ),
              TextInput(
                controller: widget.etu_ddn,
                hint: "Date de naissance",
              ),
              const SizedBox(
                height: 10,
              ),
              TextArea(hint: "Biographie", controller: widget.etu_bio)
            ],
          ))
        : CustomPagePadding(
            child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              TextInput(
                controller: widget.ent_nom,
                hint: "Raison sociale",
              ),
              const SizedBox(
                height: 10,
              ),
              TextInput(
                controller: widget.ent_sect,
                hint: "Secteur d'activité",
              ),
              const SizedBox(
                height: 10,
              ),
              TextInput(
                controller: widget.ent_sal,
                hint: "Nombre de salariés",
              ),
              const SizedBox(
                height: 10,
              ),
              TextInput(
                controller: widget.ent_loc,
                hint: "Localisation",
              ),
            ],
          ));
  }
}

class Step3 extends StatefulWidget {
  Step3({Key? key}) : super(key: key);

  TextEditingController etu_dip = TextEditingController();
  TextEditingController etu_post = TextEditingController();

  @override
  _Step3State createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isEtudiant
        ? CustomPagePadding(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              TextInput(
                controller: widget.etu_dip,
                hint: "Mon dernier diplôme",
              ),
              const SizedBox(
                height: 10,
              ),
              TextInput(
                controller: widget.etu_post,
                hint: "Post recherché",
              ),
              const SizedBox(
                height: 20,
              ),
              H3(
                text: "Mes éxperiences",
              ),
              TextAdd(
                text: "+ Ajouter",
              ),
              const SizedBox(
                height: 30,
              ),
              H3(
                text: "Mon CV",
              ),
              TextAdd(
                text: "+ Ajouter",
              ),
            ],
          ))
        : CustomPagePadding(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
              ),
              H4(
                text: "Vous avez un poste disponible ?",
                center: true,
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonBasic(
                text: "Ajouter une offre",
                color: Color(0xff1F3C7C),
                height: 60,
                pressed: () {},
              ),
            ],
          ));
  }
}

class Inscription extends StatefulWidget {
  Inscription({Key? key, this.step}) : super(key: key);

  int? step;

  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  TextEditingController etu_name = TextEditingController();

  StepManager stepManager = StepManager(children: []);

  @override
  void initState() {
    stepManager.children.add(step1(context));
    stepManager.children.add(Step2());
    stepManager.children.add(Step3());

    if (widget.step != null) {
      stepManager.step = widget.step!;
    }
  }

  Widget step1(BuildContext context) {
    return CustomPagePadding(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          width: 100,
          child: Image(image: AssetImage("assets/images/logo_crop.png")),
        ),
        const SizedBox(
          height: 100,
        ),
        H4(text: "Je cherche..."),
        const SizedBox(
          height: 20,
        ),
        ButtonBasic(
          text: "... une entreprise",
          color: Color(0xff1F3C7C),
          height: 60,
          pressed: () {
            setState(() {
              print("une entreprise");
              isEtudiant = true;
              stepManager.next();
            });
          },
        ),
        const SizedBox(
          height: 60,
        ),
        ButtonBasic(
          text: "... un alternant",
          color: Color(0xff1F3C7C),
          height: 60,
          pressed: () {
            setState(() {
              isEtudiant = false;
              stepManager.next();
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        ButtonBasic(
          text: "... un stagiaire",
          color: Color(0xff1F3C7C),
          height: 60,
          pressed: () {
            setState(() {
              isEtudiant = false;
              stepManager.next();
            });
          },
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: stepManager.step == 0
              ? Container()
              : Row(children: [
                  const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: SizedBox(
                        width: 50,
                        child: Image(
                            image: AssetImage("assets/images/logo_crop.png")),
                      )),
                  AppBarText(text: "Inscription"),
                ]),
          //centerTitle: true,
          elevation: 0,
          leading: stepManager.step == 0
              ? Container()
              : IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black87,
                  ),
                  onPressed: () {
                    setState(() {
                      if (stepManager.getStep() == 0) {
                        //Navigator.pop(context);
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Landing(title: 'Dynameet')))
                            .then((_) {
                          setState(() {});
                        });
                      } else {
                        stepManager.previous();
                      }
                    });
                  },
                ),
        ),
        body: stepManager.getActual(),
        bottomSheet: const Padding(padding: EdgeInsets.only(bottom: 0.0)),
        floatingActionButton: stepManager.step == 0
            ? Container()
            : Footer(children: [
                H4(
                    text: (stepManager.step + 1).toString() +
                        "/" +
                        stepManager.children.length.toString()),
                ButtonBasic(
                    text: stepManager.step == stepManager.children.length - 1
                        ? "Terminer"
                        : "Suivant",
                    height: 50,
                    width: 200,
                    color: Color(0xff1F3C7C),
                    pressed: () {
                      setState(() {
                        stepManager.next(callback: () {
                          if (stepManager.step == 2) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SwipePage(
                                          isEtudiant: isEtudiant,
                                        )));
                          } /*else {
                            errorDialog(context, "Erreur",
                                "Tous les champs ne sont pas remplis");
                          }*/
                        });
                      });
                    })
              ]));
  }

  bool _isStr(String value) {
    if (value == null || value == "") {
      return false;
    }
    return true;
  }
}
