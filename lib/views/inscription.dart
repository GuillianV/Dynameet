import 'dart:io';

import 'package:dynameet/widgets/button.dart';
import 'package:dynameet/widgets/components.dart';
import 'package:flutter/material.dart';

import 'landing.dart';

class Inscription extends StatefulWidget {
  Inscription({Key? key, this.step}) : super(key: key);

  int? step;

  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  TextEditingController nameController = TextEditingController(text: "tt");
  TextEditingController descriptionController =
      TextEditingController(text: "tt");
  TextEditingController passwordController = TextEditingController(text: "tt");


  bool isEtudiant = false;
  bool isCompany = false;

  StepManager stepManager = StepManager(children: []);

  @override
  void initState() {
    stepManager.children.add(step1(context));
    stepManager.children.add(step2(context));
    stepManager.children.add(step3(context));

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
          child: const Image(image: AssetImage("assets/images/logo_crop.png")),
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
          color:Color(0xff1F3C7C),
          height: 50,
          pressed: () {
            print("next");
            setState(() {
              stepManager.next();
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        ButtonBasic(
          text: "... un alternant",
          color:Color(0xff1F3C7C),
          height: 50,
          pressed: () {
            print("next");
            setState(() {
              stepManager.next();
            });
          },
        )
      ],
    ));
  }

  Widget step2(BuildContext context) {
    void _choose() {
      /* Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CameraApp()),
      );*/
    }

    return CustomPagePadding(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        H4(text: "3. Ajouter des photos de l'objet"),
        Padding(padding: EdgeInsets.only(top: 50), child: Center()),
      ],
    ));
  }

  Widget step3(BuildContext context) {
    return CustomPagePadding(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        H4(text: "4. Ajouter un mot de passe"),
        Description(
            text:
                "Le mot de passe sera demandé pour modifier l'objet et donc pouvoir se l'attribuer. Il permet de prouver que c'est votre objet"),
        Padding(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Description(text: "Mot de passe"),
                TextInput(
                  hint: "Mot de passe",
                  controller: passwordController,
                ),
              ],
            ))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: stepManager.step != 1 ?  Container() : AppBarText(text: "Inscription"),
          centerTitle: true,
          elevation: 0,
          leading: Container()/*IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.black87,),
            onPressed: () {
              setState(() {
                if (stepManager.getStep() == 0) {
                  //Navigator.pop(context);
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Landing(title: 'Dynameet')));/*
                  ).then((_) {
                    setState(() {});
                  });*/
                } else {
                  stepManager.previous();
                }
              });
            },
          )*/,
        ),
        body: stepManager.getActual(),
        bottomSheet: Padding(padding: EdgeInsets.only(bottom: 0.0)),
        floatingActionButton: stepManager.step != 1 ?  Container() : Footer(children: [
          H4(
              text: "Etape " +
                  (stepManager.step + 1).toString() +
                  "/" +
                  stepManager.children.length.toString()),

          ButtonBasic(text: "Suivant", height: 50,color: Color(0xffFFA857),pressed: () {
                setState(() {
                  stepManager.next(callback: () {
                    if (_isStr(nameController.text) &&
                        _isStr(descriptionController.text) &&
                        _isStr(passwordController.text)) {
                    } else {
                      errorDialog(context, "Erreur",
                          "Tous les champs ne sont pas remplis");
                    }
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
