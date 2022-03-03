import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';


var UUID = const Uuid();
List<Entreprise> listEntreprise = [];
List<Entreprise> listEntrepriseSave = [];
void GenerateEntreprise(){
  listEntrepriseSave.add(Entreprise.CreateEntreprise("Webb Company","https://www.designwebcompany.fr/wp-content/uploads/2021/12/design-web-company.png", ["loyal","dynamique"], ["jeune startup","motivation"], ["Dev web","Marketteur"]));
  listEntrepriseSave.add(Entreprise.CreateEntreprise("RATP","https://www.cityride.fr/wp-content/uploads/2021/03/ratp-logo-660x340.jpg", ["drole","sympathique"], ["dicipliné"], ["Réseau"]));
  ResetEntreprise();
}

void ResetEntreprise(){
  listEntreprise = listEntrepriseSave;
}

class Entreprise {

  String uuid = "";
  String nom = "";
  String photo = "";
  List<String> valeurs = [];
  List<String> apropos = [];
  List<String> missions = [];
    List<String> matchedEtudiant = [];


  Entreprise(String _uuid){
    uuid = _uuid;
  }
 
factory Entreprise.CreateEntreprise(String _nom, String _photo,List<String> _valeurs,List<String> _apropos,List<String> _missions) {
    Entreprise entreprise = Entreprise(UUID.v4());
    entreprise.nom = _nom;
    entreprise.photo = _photo;
    entreprise.valeurs = _valeurs;
    entreprise.apropos = _apropos;
    entreprise.missions = _missions;
    return entreprise;
  }
 
  static Entreprise? GetEntreprise(String _uuid){
    Entreprise entreprise = listEntreprise.firstWhere((element) => element.uuid == _uuid);
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
