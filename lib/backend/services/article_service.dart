import 'package:le_grand_magazine/backend/models/article.dart';
import 'package:le_grand_magazine/frontend/enums/category.dart';

class ArticleService {
  final List<Article> _articles = [
    Article(
      image: 'assets/images/article_1.png',
      title: 'Congo-Affaires : le groupe ASC Impact va investir 23 milliards FCFA dans le bois et l’agriculture',
      summary:
          'Le président directeur général du groupe ASC Impact, Karl E. Kirchmayer, a annoncé, le 31 mai à Brazzaville, son ambition d’investir en République du Congo dans les secteurs de l’agriculture, de l’exploitation forestière, de la transformation poussée du bois et l’afforestation pour un engagement prévisionnel de 23 milliards de francs CFA contre six mille emplois attendus.',
      category: Category.Economie,
      source: 'Adiac',
      publicationDate: DateTime.now(),
      isSaved: false,
    ),

    Article(
      image: 'assets/images/article_2.png',
      title: 'Intégration sous-régionale : redonner au Congo sa vocation de pays de transit',
      summary:
          'Le président de la République, Denis Sassou N’Guesso, a lancé officiellement, le 20 mai au village Mbindjo (district de Mokeko), dans le département de la Sangha, les travaux d’aménagement et de bitumage de la route Ouesso-Pokola, longue de 47 km, avec construction d’un pont de 616 m sur la rivière Sangha. Un projet intégrateur dont l’ambition majeure est de redonner au Congo sa vocation de pays de transit.',
      category: Category.Politique,
      source: 'Adiac',
      publicationDate: DateTime.now(),
      isSaved: false,
    ),

    Article(
      image: 'assets/images/article_3.png',
      title: 'Jumelage: les villes de Pointe-Noire et Kigali bientôt unies',
      summary:
          'L’information a été rendue publique par Théoneste Mutsindashyaka, ambassadeur de la République du Rwanda au Congo, à l’issue  d’un entretien, le 23 mai, avec Evelyne Tchitchellé, maire de la ville de Pointe-Noire.',
      category: Category.Societe,
      source: 'Adiac',
      publicationDate: DateTime.now(),
      isSaved: false,
    ),
    Article(
      image: 'assets/images/article_4.png',
      title: 'Musique: des artistes ivoiriens invités au Fespam',
      summary:
          'Les artistes ivoiriens sont invités à participer à la 11e édition du  Festival panafricain de musique (Fespam) qui aura lieu du 15 au 22 juillet prochain, à Brazzaville.',
      category: Category.Culture,
      source: 'Adiac',
      publicationDate: DateTime.now(),
      isSaved: false,
    ),
    Article(
      image: 'assets/images/article_5.png',
      title: 'Nigeria : le nouveau président oriente le développement numérique sur sept axes stratégiques',
      summary:
          'Durant sa présidence démarrée en mai 2015, Muhammadu Buhari, le président sortant, a réussi à faire briller le Nigeria sur la scène technologique et numérique internationale. Pour les quatre prochaines années, son successeur veut faire encore mieux.',
      category: Category.Afrique,
      source: 'We are Tech',
      publicationDate: DateTime.now(),
      isSaved: false,
    ),
    //'assets/images/article_2.png',
    //'assets/images/article_3.png',
    //'assets/images/article_4.png',
    //'assets/images/article_5.png',
  ];

  List<Article> get articles => _articles;
}
