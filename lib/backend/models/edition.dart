import 'dart:convert';

class Edition {
  final String imageUrl;
  final String pdfUrl;
  final DateTime dateEdition;
  final String? title;
  final String? theme;
  final String numero;
  final String periode;
  Edition({
    required this.imageUrl,
    required this.pdfUrl,
    required this.dateEdition,
    this.title,
    this.theme,
    required this.numero,
    required this.periode,
  });
  
  

  Edition copyWith({
    String? imageUrl,
    String? pdfUrl,
    DateTime? dateEdition,
    String? title,
    String? theme,
    String? numero,
    String? periode,
  }) {
    return Edition(
      imageUrl: imageUrl ?? this.imageUrl,
      pdfUrl: pdfUrl ?? this.pdfUrl,
      dateEdition: dateEdition ?? this.dateEdition,
      title: title ?? this.title,
      theme: theme ?? this.theme,
      numero: numero ?? this.numero,
      periode: periode ?? this.periode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'pdfUrl': pdfUrl,
      'dateEdition': dateEdition.millisecondsSinceEpoch,
      'title': title,
      'theme': theme,
      'numero': numero,
      'periode': periode,
    };
  }

  factory Edition.fromMap(Map<String, dynamic> map) {
    return Edition(
      imageUrl: map['imageUrl'] ?? '',
      pdfUrl: map['pdfUrl'] ?? '',
      dateEdition: DateTime.fromMillisecondsSinceEpoch(map['dateEdition']),
      title: map['title'],
      theme: map['theme'],
      numero: map['numero'] ?? '',
      periode: map['periode'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Edition.fromJson(String source) => Edition.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Edition(imageUrl: $imageUrl, pdfUrl: $pdfUrl, dateEdition: $dateEdition, title: $title, theme: $theme, numero: $numero, periode: $periode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Edition &&
      other.imageUrl == imageUrl &&
      other.pdfUrl == pdfUrl &&
      other.dateEdition == dateEdition &&
      other.title == title &&
      other.theme == theme &&
      other.numero == numero &&
      other.periode == periode;
  }

  @override
  int get hashCode {
    return imageUrl.hashCode ^
      pdfUrl.hashCode ^
      dateEdition.hashCode ^
      title.hashCode ^
      theme.hashCode ^
      numero.hashCode ^
      periode.hashCode;
  }
}
