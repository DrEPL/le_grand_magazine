import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/models/article.dart';
import 'package:le_grand_magazine/frontend/enums/category.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List<Article> articles = [
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

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: articles.length,
          options: CarouselOptions(
            height: 280,
            initialPage: 0,
            autoPlayInterval: const Duration(seconds: 2),
            enlargeCenterPage: true,
            onPageChanged: (index, reason) => setState(() => activeIndex = index),
          ),
          itemBuilder: (context, index, realIndex) {
            final image = articles[index];

            return Stack(children: [_buildImage(index), _buildCategory(index, context), _buildTimeAndTitle(context, index)]);
          },
        ),
        const SizedBox(height: 24),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: articles.length,
          effect: ExpandingDotsEffect(
            activeDotColor: Theme.of(context).primaryColor,
            dotHeight: 5,
            dotWidth: 5,
          ),
        ),
      ],
    );
  }

  Widget _buildTimeAndTitle(BuildContext context, int index) {
    final time = DateTime.now().difference(articles[index].publicationDate);
    return Positioned(
      top: 190,
      left: 15,
      right: 15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Il y a ${time.inMinutes} minutes", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontSize: 11)),
          const SizedBox(height: 8),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              articles[index].title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              softWrap: true,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Positioned _buildCategory(int index, BuildContext context) {
    return Positioned(
      top: 15,
      left: 15,
      child: Container(
        height: 26,
        decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(articles[index].category.displayName().toUpperCase(), style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontSize: 10)),
        ),
      ),
    );
  }

  Widget _buildImage(int index) => ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: Container(
          height: 280,
          width: 2000,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(articles[index].image), fit: BoxFit.cover)),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: const [0.0, 1],
                begin: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(1),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      );
}
