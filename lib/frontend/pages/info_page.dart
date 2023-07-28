import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/app_strings.dart';
import '../widgets/section_text.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  List<dynamic> link = [
    {
      "img":"assets/images/LGM_CIRCLE.png",
      "url": "https://www.facebook.com/legrandmag.cg/"
    },
    {
      "img":"assets/images/LGM_CIRCLE.png",
      "url": "https://www.linkedin.com/in/magazine-le-grand-11455a253/"
    },
    {
      "img":"assets/images/LGM_CIRCLE.png",
      "url": "https://www.instagram.com/legrandmagazine.cg/"
    },
    {
      "img":"assets/images/LGM_CIRCLE.png",
      "url": "https://twitter.com/LeGrandMagazine/"
    },
  ];

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    Uri url = Uri.parse("https://www.legrandmagazine.cg");
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Row(
            children: [
              Icon(MdiIcons.feather,
                  color: const Color.fromARGB(255, 112, 112, 112)),
              const SizedBox(
                width: 10,
              ),
              SectionText(
                text: AppStrings.aboutUs,
                onSeeMorePressed: () {},
                displayTextButton: false,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Le Grand Magazine créé en 2016, est considéré comme le magazine de référence de l'actualité générale en République du Congo. Le Grand Magazine est une vitrine des institutions publiques et privées, conçu pour donner aux lecteurs accès à l'actualité politique, économique, sociale, culturelle et sportive.",
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
          Row(
            children: [
              Icon(MdiIcons.phoneRingOutline,
                  color: const Color.fromARGB(255, 112, 112, 112)),
              const SizedBox(
                width: 15,
              ),
              SectionText(
                text: AppStrings.contact,
                onSeeMorePressed: () {},
                displayTextButton: false,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // const ContactFormulaire(),
          const Text(
            "Vous pouvez nous joindre par appel en cliquant sur un de nos numéros, en cliquant sur notre adresse email, ou  en cliquant sur les différents images de réseaux sociaux.",
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(MdiIcons.web, color: const Color.fromARGB(255, 112, 112, 112)),
            TextButton(
                onPressed: () async {
                  if (await canLaunchUrl(url)) {
                    launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    throw Exception('Impossible d\'ouvrir le lien');
                  }
                },
                child: const Text("www.legrandmagazine.cg")),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(MdiIcons.phoneClassic,
                  color: const Color.fromARGB(255, 112, 112, 112)),
              TextButton(
                  onPressed: () async {
                    Uri phone = Uri(scheme: 'tel', path: "+242066540303");
                    if (await canLaunchUrl(phone)) {
                      launchUrl(phone);
                    } else {
                      throw Exception('Impossible d\'appeler');
                    }
                  },
                  child: const Text("+242 06 654 03 03")),
              const Text("/"),
              TextButton(
                  onPressed: () async {
                    Uri phone = Uri(scheme: 'tel', path: "+242053930624");
                    if (await canLaunchUrl(phone)) {
                      launchUrl(phone);
                    } else {
                      throw Exception('Impossible d\'appeler');
                    }
                  },
                  child: const Text("+242 05 393 06 24")),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(MdiIcons.emailOutline,
                color: const Color.fromARGB(255, 112, 112, 112)),
            TextButton(
                onPressed: () async {
                  Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'contact@legrandmagazine.cg',
                    query: encodeQueryParameters(<String, String>{
                      'subject': "Ecrivez l'objet de votre demande",
                      'body': 'Ecrivez votre message ici',
                    }),
                  );

                  if (await canLaunchUrl(emailLaunchUri)) {
                    launchUrl(emailLaunchUri);
                  } else {
                    throw Exception('Impossible d\'envoyer un mail');
                  }
                },
                child: const Text("contact@legrandmagazine.cg")),
          ]),

          // GridView(gridDelegate: gridDelegate),
          Row(
            children: [
              Icon(MdiIcons.searchWeb,
                  color: const Color.fromARGB(255, 112, 112, 112)),
              const SizedBox(
                width: 10,
              ),
              SectionText(
                text: AppStrings.socialNetwork,
                onSeeMorePressed: () {},
                displayTextButton: false,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Cliquez sur les différents images pour nous suivre via les réseaux sociaux respectifs.",
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: SizedBox(
                height: 100,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          // _launchURL;
                          if (await canLaunchUrl(Uri.parse(link[index]["url"]))) {
                            launchUrl(Uri.parse(link[index]["url"]), mode: LaunchMode.externalApplication);
                          } else {
                            throw Exception('Impossible d\'ouvrir le lien');
                          }
                        },
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Card(child: Image.asset(link[index]["img"])),
                        ),
                      );
                    },
                    separatorBuilder: (context, _) {
                      return const SizedBox(width: 5);
                    },
                    itemCount: link.length)),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Copyright © ${DateTime.now().year} LE GRAND MAGAZINE | DrEPL",
            style: const TextStyle(color: Color.fromARGB(255, 112, 112, 112)),
          )
        ],
      ),
    ));
  }
}
