import 'package:dynameet/models/etudiant.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';


var UUID = const Uuid();
List<Entreprise> listEntreprise = [];
List<Entreprise> listEntrepriseSave = [];
void GenerateEntreprise(){
  listEntrepriseSave.add(Entreprise.CreateEntreprise("Webb Company","https://img-0.journaldunet.com/a691ldWmyRJa7Nj9Om84GKZSC7M=/1500x/smart/37bb29883db94c988d8701b42ed00ee2/ccmcms-jdn/2034247.jpg", ["loyal","dynamique"], ["jeune startup","motivation"], ["Dev web","Marketteur"]));
  listEntrepriseSave.add(Entreprise.CreateEntreprise("RATP","https://pbs.twimg.com/profile_images/1051762919950684160/6HKNL99g_400x400.jpg", ["drole","sympathique"], ["dicipliné"], ["Réseau"]));
  ResetEntreprise();
}

void ResetEntreprise(){

  listEntreprise.clear();
  listEntrepriseSave.forEach((element) {listEntreprise.add(element);});

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
    Entreprise? entreprise = listEntrepriseSave.firstWhere((element) => element.uuid == _uuid  orElse: () => Entreprise(""));
    if (entreprise != null && entreprise.uuid != "") {
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
    return listEntrepriseSave.where((element) => element.matchedEtudiant.contains(_uuidEtudiant) == true).toList();
  }

  static  List<Entreprise>? GetAllEntreprise(){
    return listEntrepriseSave;
  }
}
