enum Category { Afrique, Politique, Economie, Societe, Sport, Culture, Agenda, Science }

extension CategoryExtension on Category {
  String displayName(){
    String category =  toString().split(".").last;

    switch(category)  {
      case "Afrique":
        return "Afrique";
      case "Politique":
        return "Politique";
      case "Economie":
        return "Economie";
      case "Societe":
        return "Societe";
      case "Sport":
        return "Sport";
      case "Culture":
        return "Culture";
      case "Agenda":
        return "Agenda";
      case "Science":
        return "Science";
      default:
        return "Inconnue";
    }
  }
}
