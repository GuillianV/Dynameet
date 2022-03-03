import 'package:dynameet/views/landing.dart';
import 'package:dynameet/views/match.dart';
import 'package:dynameet/views/swipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'models/entreprise.dart';
import 'models/etudiant.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  GenerateEntreprise();
  ResetEntreprise();
  GenerateEtudiant();
  ResetEtudiant();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynameet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Landing(title: "Dynameet"), //SwipePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
