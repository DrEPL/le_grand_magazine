import 'package:flutter/material.dart';

class RecommendedArticle extends StatelessWidget {
  final String imageUrl, category, title;

  final DateTime publicationDate;

  final IconData icon;

  final Color iconColor;

  final Function()? onIconPressed, onTap;

  const RecommendedArticle({
    super.key,
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.publicationDate,
    required this.icon,
    required this.iconColor,
    required this.onIconPressed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(imageUrl, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(category, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.red, fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              SizedBox(
                width: 210,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 220,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _displayPublicationDate(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                    IconButton(onPressed: onIconPressed, icon: Icon(icon, size: 20, color: iconColor))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

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
