import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';


var UUID = const Uuid();
List<Entreprise> listEntreprise = [];

void GenerateEntreprise(){
  listEntreprise.add(Entreprise.CreateEntreprise("Webb Company", ["loyal","dynamique"], ["jeune startup","motivation"], ["Dev web","Marketteur"]));
  listEntreprise.add(Entreprise.CreateEntreprise("RATP", ["drole","sympathique"], ["dicipliné"], ["Réseau"]));
}

class Entreprise {

  String uuid = "";
  String nom = "";
  List<String> valeurs = [];
  List<String> apropos = [];
  List<String> missions = [];
    List<String> matchedEtudiant = [];


  Entreprise(String _uuid){
    uuid = _uuid;
  }
 
factory Entreprise.CreateEntreprise(String _nom,List<String> _valeurs,List<String> _apropos,List<String> _missions) {
    Entreprise entreprise = Entreprise(UUID.v4());
    entreprise.nom = _nom;
    entreprise.valeurs = _valeurs;
    entreprise.apropos = _apropos;
    entreprise.missions = _missions;
    return entreprise;
  }
 
  static Entreprise? GetEntreprise(String _uuid){
    Entreprise entreprise = listEntreprise.firstWhere((element) => element.nom == _uuid);
    if (entreprise != null) {
      return entreprise;
    } else {
      return null;
    }
  }



  static void AddEntreprisesMatched(String _uuid,String _uuidEtudiant){
    Entreprise? entreprise = GetEntreprise(_uuid);
    if(entreprise != null){
      entreprise.matchedEtudiant.add(_uuidEtudiant);
    }
  }

  static List<Entreprise>? GetEntreprisesMatched(String _uuidEtudiant){
    return listEntreprise.where((element) => element.matchedEtudiant.contains(_uuidEtudiant) == true).toList();
  }

  static  List<Entreprise>? GetAllEntreprise(){
    return listEntreprise;
  }
}
