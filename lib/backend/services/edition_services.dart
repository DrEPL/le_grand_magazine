import 'package:le_grand_magazine/backend/models/edition.dart';

class EditionService {
  List<Edition> editions = [
    Edition(imageUrl: "assets/images/0.jpg", pdfUrl: "https://static.fnac-static.com/multimedia/editorial/pdf/9782212133448.pdf", dateEdition: DateTime(2022, 5, 13), title: "ANTOINETTE SASSOU N'GUESSO GRANDE DAME AU GRAND CŒUR", theme: "Journée internationale de la femme : Femmes congolaises,Femmes inspirantes", numero: "N° 141", periode: "Avril-Mai 2023"),
    Edition(imageUrl: "assets/images/1.jpg", pdfUrl: "https://static.fnac-static.com/multimedia/editorial/pdf/9782212133448.pdf", dateEdition: DateTime(2023, 5, 13), numero: "Spécial N° 001", periode: "Fév-Mars 2023")
  ];
}
