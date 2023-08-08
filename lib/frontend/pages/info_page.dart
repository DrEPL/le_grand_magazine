import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/app_strings.dart';
import '../widgets/section_text.dart';
import 'maps_page.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  List<dynamic> link = [
    {
      "img": "assets/images/Logo_Facebook.png",
      "url": "https://www.facebook.com/legrandmag.cg/"
    },
    {
      "img": "assets/images/Logo_LinkeIn.png",
      "url": "https://www.linkedin.com/in/magazine-le-grand-11455a253/"
    },
    {
      "img": "assets/images/Logo_Instagram.png",
      "url": "https://www.instagram.com/legrandmagazine.cg/"
    },
    {
      "img": "assets/images/Logo_Twitter.png",
      "url": "https://twitter.com/LeGrandMagazine/"
    },
    {
      "img": "assets/images/Logo_Youtube.png",
      "url": "https://www.youtube.com/@LeGrandMagazine"
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
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
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
            "Le Grand Magazine est avant tout un produit du Grand Rhema qui est une agence de communication. Le Grand Magazine existe depuis 2016 et est considéré comme le magazine de référence de l'actualité générale en République du Congo.Le Grand Magazine est une vitrine mais aussi  le canal de communication des institutions privées et publiques conçu pour donner aux lecteurs accès à l'actualité politique, économique, sociale, culturelle et sportive.",
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 10,
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
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Icon(MdiIcons.web,
                  color: const Color.fromARGB(255, 112, 112, 112)),
              TextButton(
                  onPressed: () async {
                    // if (await canLaunchUrl(url)) {
                    launchUrl(url, mode: LaunchMode.externalApplication);
                    // } else {
                    //   throw Exception('Impossible d\'ouvrir le lien');
                    // }
                  },
                  child: const Text("www.legrandmagazine.cg",
                      style: TextStyle(fontSize: 12))),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(MdiIcons.phoneClassic,
                    color: const Color.fromARGB(255, 112, 112, 112)),
                TextButton(
                    onPressed: () async {
                      Uri phone = Uri(scheme: 'tel', path: "+242066540303");
                      launchUrl(phone);
                    },
                    child: const Text("+242 06 654 03 03",
                        style: TextStyle(fontSize: 12))),
                const Text("/"),
                Flexible(
                  child: TextButton(
                      onPressed: () async {
                        Uri phone = Uri(scheme: 'tel', path: "+242053930624");
                        launchUrl(phone);
                      },
                      child: const Text(
                        "+242 05 393 06 24",
                        style: TextStyle(fontSize: 12),
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                    launchUrl(emailLaunchUri);
                  },
                  child: const Text(
                    "contact@legrandmagazine.cg",
                    style: TextStyle(fontSize: 12),
                  )),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Icon(Icons.location_city,
                  color: Color.fromARGB(255, 112, 112, 112)),
              Flexible(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapPage(),
                          ));
                    },
                    child: const Text(
                        "1661, rue Matsiona Nzoulou en face de la préfecture de Brazzaville",
                        softWrap: true,
                        maxLines: 3,
                        style: TextStyle(fontSize: 12))),
              ),
            ]),
          ),

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
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            child: SizedBox(
                height: 60,
                child: ListView.separated(
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          launchUrl(Uri.parse(link[index]["url"]),
                              mode: LaunchMode.externalApplication);
                        },
                        child: SizedBox(
                          width: screenSize.width < 380 ? 80 : 70,
                          height: screenSize.width < 380 ? 80 : 70,
                          child: Card(child: Image.asset(link[index]["img"])),
                        ),
                      );
                    },
                    separatorBuilder: (context, _) {
                      return const SizedBox(width: 5);
                    },
                    itemCount: link.length)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              "Copyright © ${DateTime.now().year} LE GRAND RHEMA",
              style: const TextStyle(
                  color: Color.fromARGB(255, 112, 112, 112), fontSize: 10),
            ),
          )
        ],
      ),
    ));
  }
}
