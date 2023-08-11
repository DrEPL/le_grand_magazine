enum Category {
  Toutes,
  Afrique,
  Politique,
  Economie,
  Societe,
  Sport,
  Culture,
  Agenda,
  Tech,
  Diaspora,
  Env
}

extension CategoryExtension on Category {
  String displayName() {
    String category = toString().split(".").last;

    switch (category) {
      case "Toutes":
        return "Toutes";
      case "Afrique":
        return "Afrique";
      case "Politique":
        return "Politique";
      case "Economie":
        return "Economie";
      case "Societe":
        return "Société";
      case "Diaspora":
        return "Diaspora";
      case "Sport":
        return "Sport";
      case "Culture":
        return "Culture";
      case "Agenda":
        return "Agenda";
      case "Tech":
        return "Technologie";
      case "Env":
        return "Environnement";
      default:
        return "Inconnue";
    }
  }
}
