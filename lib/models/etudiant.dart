import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';


var UUID = const Uuid();
List<Etudiant> listEtudiant = [];

void GenerateEtudiant(){
  listEtudiant.add(Etudiant.CreateEtudiant("Timoté","18","https://previews.123rf.com/images/pixinoo/pixinoo1404/pixinoo140400194/27891780-dynamische-nachwuchsf%C3%BChrungs-zum-aufruf-gestikuliert.jpg","Marketteur compétant","Salut moi c'est Timoté, je recherche une alternance dans le domaine du marketting ! Contactez moi !", ["loyal","dynamique"], ["Marketteur"]));
  listEtudiant.add(Etudiant.CreateEtudiant("Charlene","22","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRrXe_3H_aDjBnUpgCztef6DOsXqgrI4WyLA&usqp=CAU","Développeuse en réseaux","Salut moi c'est Charlene, je recherche une alternance dans le domaine de la cybere sécurité ! Contactez moi vite !", ["loyal","assidue"], ["Développeuse","Architecture réseau"]));
}


class Etudiant {

  String uuid = "";
  String nom = "";
  String age = "";
  String photo = "";
  String titreDescription = "";
  String description = "";
  List<String> softSkills = [];
  List<String> hardSkills = [];
  List<String> matchedEntreprise = [];

  Etudiant(String _uuid){
    uuid = _uuid;
  }
 
factory Etudiant.CreateEtudiant(String nom,String age,String photo,String titreDescription,String description,List<String> softSkills,List<String> hardSkills) {
    Etudiant etudiant = Etudiant(UUID.v4());
    etudiant.nom = nom;
    etudiant.age = age;
    etudiant.photo = photo;
    etudiant.titreDescription = titreDescription;
    etudiant.description = description;
    etudiant.softSkills = softSkills;
    etudiant.hardSkills = hardSkills;
    return etudiant;
  }
 


 static Etudiant? GetEtudiant(String uuid){
    Etudiant etudiant = listEtudiant.firstWhere((element) => element.uuid == uuid );
    if (etudiant != null)
      return etudiant;
    else 
      return null;
  }


 static  void AddEtudiantsMatched(String uuid,String uuidEtudiant){
    Etudiant? etudiant = GetEtudiant(uuid);
    if(etudiant != null){
      etudiant.matchedEntreprise.add(uuidEtudiant);
    }
  }

 static List<Etudiant>? GetEtudiantsMatched(String uuidEntrprise){
    return listEtudiant.where((element) => element.matchedEntreprise.contains(uuidEntrprise) == true).toList();
  }

   static List<Etudiant>? GetAllEtudiant(){
    return listEtudiant;
  }

}