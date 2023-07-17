import 'package:flutter/material.dart';

class RecommendedArticle extends StatelessWidget {
  final String imageUrl, category, title;

  final DateTime publicationDate;

  final Function()? onIconPressed, onTap;

  const RecommendedArticle({
    super.key,
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.publicationDate,
    required this.onIconPressed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context){
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      height: 180,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              // borderRadius: BorderRadius.circular(8),
              // clipBehavior: Clip.antiAlias,
              child: SizedBox(
                width: screenSize.width < 380 ? 130 : 150,
                height: screenSize.width < 380 ? 180 : 200,
                child: Image.asset(imageUrl, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: screenSize.width*0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // const SizedBox(height: 2),
                  Text(category, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.red, fontWeight: FontWeight.w500)),
                  Flexible(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, fontSize: (screenSize.width < 380) ? 15 :18,),
                      maxLines: 5,
                      softWrap: true,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _displayPublicationDate(),
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

  String _displayPublicationDate() {
    DateTime now = DateTime.now();
    if (publicationDate.day == now.day) {
      return "Aujourd'hui";
    }

    if (publicationDate.year != now.year) {
      return "L'an dernier";
    }
    return "${publicationDate.day} ${monthInLetter(publicationDate.month)} ${publicationDate.year}";
  }

  String monthInLetter(int month) {
    switch (month) {
      case 1:
        return "Janvier";
      case 2:
        return "Février";
      case 3:
        return "Mars";
      case 4:
        return "Avril";
      case 5:
        return "Mai";
      case 6:
        return "Juin";
      case 7:
        return "Juillet";
      case 8:
        return "Août";
      case 9:
        return "Septembre";
      case 10:
        return "Octobre";
      case 11:
        return "Novembre";
      case 12:
        return "Décembre";
    }
    return "";
  }
}
