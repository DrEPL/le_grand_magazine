import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/models/article.dart';
import 'package:le_grand_magazine/backend/services/article_api.dart';

// class ArticleServices {
//   final List<Article> _articles = [
//     Article(
//       image: 'assets/images/article_1.png',
//       title:
//           'Congo-Affaires : le groupe ASC Impact va investir 23 milliards FCFA dans le bois et l’agriculture',
//       summary:
//           'Le président directeur général du groupe ASC Impact, Karl E. Kirchmayer, a annoncé, le 31 mai à Brazzaville, son ambition d’investir en République du Congo dans les secteurs de l’agriculture, de l’exploitation forestière, de la transformation poussée du bois et l’afforestation pour un engagement prévisionnel de 23 milliards de francs CFA contre six mille emplois attendus.',
//       content:
//           'Créé en Suisse depuis 300 ans, ASC Impact a déjà mis sur pied au Congo trois sociétés de droit congolais. Il s’agit d’Agricaf Congo destinée au développement de l’agriculture, Transfor Congo dédiée à l’exploitation forestière et à la transformation poussée du bois, Afforest Congo consacrée à l’afforestation et au reboisement.'
//           'Le groupe suisse sollicite à la partie congolaise 42 000 hectares de terres agricoles dans le département du Niari ; 178 000 hectares dans la Cuvette pour l’afforestation ; 50 000 hectares pour l’aménagement forestier, la transformation plus poussée du bois et la contribution au développement local de l’unité forestière d’exploitation Mila Mila, dans le Niari.'
//           'L’entreprise tricentenaire prévoit également de s’engager dans la transformation du bois en produits finis dans les zones économiques spéciales d’Oyo-Ollombo et de Pointe-Noire. Elle n’attend plus que la levée des obstacles concernant les autorisations d’exploitation forestière et d’accès aux terres cultivables pour entrer en phase opérationnelle, a expliqué la directrice générale de l’Agence pour la promotion des investissements, Annick Mongo.\n\n'
//           'Elle s’est exprimée lors d’une rencontre réunissant les responsables d’ASC Impact et les représentants de la primature, des ministères de l’Industrie, de l’Agriculture, de l’Economie forestière et d’autres départements.'
//           'Le groupe ASC Impact est présent sur le continent africain dans les pays comme l’Angola, l’Ouganda et l’Ethiopie. Il a déjà fait ses preuves dans les domaines agricole et forestier en Europe, notamment en Autriche, en Allemagne, en Slovénie et en Russie.'
//           'Au Congo, le groupe ASC Impact entend, selon son président directeur général, Karl E. Kirchmayer, mettre un accent dans un premier temps sur l’exploitation et la transformation poussée du bois, l’afforestation, la production du soja, du maïs, du blé et d’autres cultures agricoles.\n\n'
//           'Le Congo et d’autres pays membres de la Communauté économique et monétaire de l’Afrique centrale sont engagés dans une dynamique communautaire interdisant d’exporter les grumes au profit de leur transformation locale. Une approche qui apporte de la plus-value au secteur du bois à travers l’implantation d’industries et la création des milliers d’emplois directs et indirects.\n\n'
//           'Pays à vocation agropastorale, le Congo compte dix millions d’hectares de terres arables dont 3% seulement sont utilisés tandis qu’il consacre annuellement 700 milliards de F CFA aux importations des produits alimentaires. Le groupe ASC Impact peut saisir l’opportunité pour développer ses activités dans ce pays qui partage avec d’autres de l’Afrique centrale les écosystèmes forestiers du Bassin du Congo.Christian Brice Elion',
//       category: Category.Economie,
//       section: 'Jeux',
//       source: 'Adiac',
//       publicationDate: DateTime(2023, 6, 1, 10, 7),
//       isBreakingNews: false,
//     ),
//     Article(
//       image: 'assets/images/article_2.png',
//       title:
//           'Intégration sous-régionale : redonner au Congo sa vocation de pays de transit',
//       summary:
//           'Le président de la République, Denis Sassou N’Guesso, a lancé officiellement, le 20 mai au village Mbindjo (district de Mokeko), dans le département de la Sangha, les travaux d’aménagement et de bitumage de la route Ouesso-Pokola, longue de 47 km, avec construction d’un pont de 616 m sur la rivière Sangha. Un projet intégrateur dont l’ambition majeure est de redonner au Congo sa vocation de pays de transit.',
//       content:
//           'Financés entièrement par la Banque de développement des Etats de l’Afrique centrale (BDEAC) à hauteur de 99 700 000 000 FCFA, les travaux de la première phase du projet d’aménagement et de bitumage du corridor 13, Ouesso-Bangui-N’Djamena, sont confiés à la société China road and bridge corporation (CRBC) pour une durée de trois ans. Ils prévoient, entre autres, le bitumage de la section Ouesso-Pokola ; la construction de trois ponts majeurs dotés d’une structure mixte constituée des poutres métalliques surmontées d’une dalle de hourdis en béton armé.'
//           'Il est également prévu la construction d’un poste de pesage des essieux; de 8,5 km de voiries urbaines avec éclairage à Pokola. Selon le délégué général aux Grands travaux, Oscar Otoka, il y aura aussi la dalle en béton armé du tablier, portée par deux poutres métalliques de 3,6 m de hauteur, avec une épaisseur de 25 cm. « Cette route d’intérêt sous-régional qui vient concrétiser l’ambitieux programme d’investissements que le gouvernement, fort des objectifs, enjeux et défis d’opérationnalisation de la Zone de libre-échange continentale africaine, entend mettre en œuvre pour développer et moderniser tous azimuts le réseau routier national en vue d’améliorer la connectivité nationale et régionale », a rappelé le délégué général.\n\n'
//           'Louant les efforts du gouvernement et de ses partenaires, le sous-préfet de Mokeko, Odile Kinzenzé Kossa, a indiqué que la construction du plus grand pont du pays sur la rivière Sangha va moderniser la liaison routière entre la République du Congo, la République centrafricaine et la République du Tchad en passant par Pokola avec ses voiries urbaines et le département de la Likouala. « Nous observons non sans faute que la notion de carrefour de la partie septentrionale du Congo, conférée au département de la Sangha dans sa globalité, revient particulièrement à Mokeko qui joue inéluctablement cette fonction. Le développement du district de Mokeko passe par celui de la route qui mène au désenclavement des bassins de production. Ce qui favoriserait les échanges commerciaux entre les différents pays de la Communauté économique et monétaire de l’Afrique centrale (Cémac) », a-t-elle souligné.\n\n'
//           'Augmenter la valeur annuelle des exportations des pays membres.\n\n'
//           'Le vice-président de la BDEAC, Jean Paterne Megné Ekoga, quant à lui, a déclaré que ce projet intégrateur permettra à la République centrafricaine et à la République du Tchad d’avoir une alternative d’accès à la mer par voie ferrée, voie routière et par voie fluviale. La République du Congo verra, de son côté, sa vocation séculaire de pays de transit et de transport multimodal renforcée. « Les avantages économiques, sociaux et environnementaux du projet confirment bien son importance pour le Congo en particulier et l’Afrique centrale en général. A travers la mise en œuvre de ce projet, le Congo participera à la réalisation des programmes intégrateurs en matière de liaison routière entre les capitales de la Cémac », a-t-il laissé entendre, réitérant l’engagement de son institution à œuvrer toujours aux côtés de la République du Congo.\n\n'
//           'Le ministre d’Etat, ministre de l’Aménagement du territoire, des Infrastructures et de l’Entretien routier, Jean Jacques Bouya, pour sa part, a estimé que la construction d’une route et d’un grand pont aux standards internationaux pour enjamber la redoutable rivière Sangha et relier ce département à son voisin la Likouala permettra, à terme, de connecter non seulement le Congo à la Centrafrique, mais aussi de participer à la connexion du Nord au Sud de l’Afrique par le centre. « Cette route vient compléter la chaîne des infrastructures de transports terrestres de nature à restituer au Congo sa vocation d’un pays de transit, offrant une plaque tournante d’échanges intra et extra pays, à partir du port autonome de Pointe-Noire », a précisé le ministre d’Etat.\n\n'
//           'D’après lui, le rapport 2018 de la Communauté économique des Etats de l’Afrique centrale sur l’étude économique du projet de la route Ouesso-Bangui-N’Djamena ainsi que de la navigation sur le fleuve Congo et ses affluents, les rivières Oubangui et Sangha, révèle qu’à la mise en service de la route, la valeur annuelle des estimations d’exportations des pays membres sera globalement plus élevée. Elle passera de 274 milliards 191 millions FCFA à 2 125 milliards 158 millions FCFA. Pour le Congo, on notera, a-t-il annoncé, une augmentation substantielle de 11%, soit de 20 milliards 688 millions FCFA à 694 milliards 218 millions FCFA.Parfait Wilfried Douniama.',
//       category: Category.Politique,
//       source: 'Adiac',
//       section: 'Jeux',
//       publicationDate: DateTime(2023, 5, 24, 15, 11),
//       isBreakingNews: false,
//     ),
//     Article(
//       image: 'assets/images/article_3.png',
//       title: 'Jumelage: les villes de Pointe-Noire et Kigali bientôt unies',
//       summary:
//           'L’information a été rendue publique par Théoneste Mutsindashyaka, ambassadeur de la République du Rwanda au Congo, à l’issue  d’un entretien, le 23 mai, avec Evelyne Tchitchellé, maire de la ville de Pointe-Noire.',
//       content:
//           'L’ambassadeur du Rwanda au Congo a signifié, au sortir de l’audience, que l’entretien avec le maire a porté sur le jumelage de la ville de Pointe-Noire et celle de Kigali. « J’ai expliqué, au cours de cette rencontre avec madame le maire, que la ville de Kigali est prête a accepté le jumelage avec celle de Pointe-Noire », a-t-il indiqué.\n\n'
//           'Au cours de cette rencontre, l’ambassadeur Théoneste Mutsindashyaka a présenté les opportunités de son pays exploitables au Congo.  Les deux personnalités ont aussi envisagé la possibilité d’une visite de travail à Kigali en vue d’un échange d’expérience dans les domaines de l’agriculture, du tourisme et autres. La signature d’un partenariat ou d’un protocole d’accord entre les autorités des deux villes est également prévue, en vue du jumelage.\n\n'
//           'Soulignons  que cette audience a eu lieu au moment où la mairie de Pointe-Noire est paralysée, depuis le 17 mai dernier, par une grève de ses  agents.Séverin Ibara',
//       category: Category.Societe,
//       source: 'Adiac',
//       section: 'journal',
//       publicationDate: DateTime(2023, 5, 24, 15, 15),
//       isBreakingNews: false,
//     ),
//     Article(
//       image: 'assets/images/article_4.png',
//       title: 'Musique: des artistes ivoiriens invités au Fespam',
//       summary:
//           'Les artistes ivoiriens sont invités à participer à la 11e édition du  Festival panafricain de musique (Fespam) qui aura lieu du 15 au 22 juillet prochain, à Brazzaville.',
//       content:
//           'L’invitation a été transmise à la ministre ivoirienne de la Culture et de la Francophonie, Françoise Remarck, par son homologue congolaise, Lydie Pongault, en marge du Salon international du livre d’Abidjan (Sila) qui s’est tenu du 9 au 13 mai dernier et  dont la République du Congo avait été l’invitée d’honneur.\n\n'
//           'Au cours de ces retrouvailles marquées à la fois par les allocutions et les ateliers, la délégation congolaise, forte d’une dizaine d’écrivains et d’autres professionnels du livre, a eu des échanges fructueux avec tous ses partenaires. Des prises de parole des autorités ivoiriennes, il en ressort une reconnaissance du rayonnement international de la littérature congolaise ; la nécessité de penser le livre comme levier de l’inclusion sociale et du développement des économies, à travers notamment la mise en place des industries culturelles et créatives et le renforcement des liens d’amitié et de la coopération culturelle entre le Congo et la Côte d’Ivoire.\n\n'
//           'Par ailleurs, les discussions entre les deux ministres, qui ont eu lieu en marge du salon, ont porté essentiellement sur la mise en application de l’Accord de coopération culturelle et artistique entre le Congo et la Côte d’Ivoire du 22 novembre 2022 ; le statut et le cadre juridique de l’artiste et des professionnels de la culture et des arts ; la restitution des œuvres d’art africain ; la réforme du corpus juridique réglementant le fonctionnement des institutions en charge de la gestion collective que sont le Bureau ivoirien du droit d’auteur et le Bureau congolais du droit d’auteur ; le développement des industries culturelles et créatives, à travers la création ou l’augmentation des fonds dédiés à la création et à l’action culturelle ; les formations professionnalisantes dans les domaines artistiques et d’expertise culturelle ; l’appui ou la relance des centres de lecture et d’animation culturelle en zones urbaines et rurales ; la construction ou la rénovation d’infrastructures culturelles ainsi que la préservation du patrimoine.\n\n'
//           'En effet, la participation du Congo au Sila constitue un premier pas dans la démarche de mise en application de l’accord susmentionné. De plus, il s’agit également de la nécessité d’un dialogue ouvert avec les experts des pays africains au sujet de la restitution des œuvres d’art, laquelle est régie par le Rapport Jean Luc Martinez, loi-cadre fixant les critères de restitution des œuvres dans le but de faire bloc et de repenser les critères jugés européo-centrés. De la même manière, la participation du Congo au Sila devrait permettre d’établir des objectifs chiffrés en termes d’organisation d’événements culturels dans les grandes villes et dans l’hinterland afin d’apporter un dynamisme aux vies culturelles nationales.      Roger Ngombé',
//       category: Category.Culture,
//       source: 'Adiac',
//       section: 'journal',
//       publicationDate: DateTime(2023, 5, 24, 15, 23),
//       isBreakingNews: false,
//     ),
//     Article(
//       image: 'assets/images/article_5.png',
//       title:
//           'Nigeria : le nouveau président oriente le développement numérique sur sept axes stratégiques',
//       summary:
//           'Durant sa présidence démarrée en mai 2015, Muhammadu Buhari, le président sortant, a réussi à faire briller le Nigeria sur la scène technologique et numérique internationale. Pour les quatre prochaines années, son successeur veut faire encore mieux.',
//       content:
//           'Bola Tinubu (photo) a prêté serment le lundi 29 mai à Abuja pour devenir officiellement le nouveau président du Nigeria. Elu le 25 février, l’ex-gouverneur de l’Etat de Lagos croit au pouvoir catalyseur du numérique pour le développement du pays.'
//           'Il a prévu à cet effet un programme qui se concentre sur sept domaines à savoir l’innovation et l’entreprenariat, la fourniture de services et l’externalisation, la fabrication des produits technologiques, le commerce électronique, la numérisation des services publics, la large bande et la blockchain.\n\n'
//           'L’administration Tinubu prévoit de mettre en œuvre des politiques pour soutenir les opportunités de financement locales et l’accès au capital pour encourager les investisseurs étrangers à continuer d’investir au Nigeria. Des politiques visant à former et renforcer les capacités des jeunes dans le domaine des TIC seront également élaborées.\n\n'
//           'Une autre industrie de l’écosystème technologique nigérian que le programme promet de développer est le secteur du commerce électronique en modernisant l’infrastructure nationale de transport du pays, afin d’offrir des services à l’échelle nationale et de répondre aux besoins des consommateurs dans tout le pays.\n\n'
//           'Des investissements dans la fabrication des produits technologiques sont également prévus, car elle présente selon le programme une autre opportunité importante pour la création d’emplois au Nigeria. Ainsi, l’importation de smartphones sera remplacée par l’assemblage local pour le développement du secteur manufacturier technologique.\n\n'
//           'Concernant la Blockchain, le nouveau président envisage de réformer la politique gouvernementale pour encourager l’utilisation prudente de cette nouvelle technologie dans la finance et la banque, la gestion des identités, la collecte des revenus et l’utilisation des crypto-actifs.'
//           'Conscient que tous ces projets ne se réaliseront pas sans une bonne connectivité Internet, le nouveau chef d’Etat ambitionne d’ici deux ans d’accroître la large bande et de fournir des services haut débit à 90 % de la population. Actuellement, le réseau national de fibre optique du Nigeria est achevé à 98 %, selon le gouvernement.\n\n'
//           'La couverture Internet universelle permettra ainsi l’utilisation des services publics qui seront davantage mis en ligne dans les prochains mois, selon le chef de l’Etat.'
//           'Pour les 24 premiers mois de son mandant, M. Tinubu mise sur la création d’un million d’emplois dans le secteur des TIC.',
//       category: Category.Afrique,
//       source: 'We are Tech',
//       section: 'Divers',
//       publicationDate: DateTime(2023, 5, 31, 08, 40),
//       isBreakingNews: false,
//     ),
//     Article(
//       image: 'assets/images/article_5.png',
//       title:
//           'Nigeria : le nouveau président oriente le développement numérique sur sept axes stratégiques',
//       summary:
//           'Durant sa présidence démarrée en mai 2015, Muhammadu Buhari, le président sortant, a réussi à faire briller le Nigeria sur la scène technologique et numérique internationale. Pour les quatre prochaines années, son successeur veut faire encore mieux.',
//       content:
//           'Bola Tinubu (photo) a prêté serment le lundi 29 mai à Abuja pour devenir officiellement le nouveau président du Nigeria. Elu le 25 février, l’ex-gouverneur de l’Etat de Lagos croit au pouvoir catalyseur du numérique pour le développement du pays.'
//           'Il a prévu à cet effet un programme qui se concentre sur sept domaines à savoir l’innovation et l’entreprenariat, la fourniture de services et l’externalisation, la fabrication des produits technologiques, le commerce électronique, la numérisation des services publics, la large bande et la blockchain.\n\n'
//           'L’administration Tinubu prévoit de mettre en œuvre des politiques pour soutenir les opportunités de financement locales et l’accès au capital pour encourager les investisseurs étrangers à continuer d’investir au Nigeria. Des politiques visant à former et renforcer les capacités des jeunes dans le domaine des TIC seront également élaborées.\n\n'
//           'Une autre industrie de l’écosystème technologique nigérian que le programme promet de développer est le secteur du commerce électronique en modernisant l’infrastructure nationale de transport du pays, afin d’offrir des services à l’échelle nationale et de répondre aux besoins des consommateurs dans tout le pays.\n\n'
//           'Des investissements dans la fabrication des produits technologiques sont également prévus, car elle présente selon le programme une autre opportunité importante pour la création d’emplois au Nigeria. Ainsi, l’importation de smartphones sera remplacée par l’assemblage local pour le développement du secteur manufacturier technologique.\n\n'
//           'Concernant la Blockchain, le nouveau président envisage de réformer la politique gouvernementale pour encourager l’utilisation prudente de cette nouvelle technologie dans la finance et la banque, la gestion des identités, la collecte des revenus et l’utilisation des crypto-actifs.'
//           'Conscient que tous ces projets ne se réaliseront pas sans une bonne connectivité Internet, le nouveau chef d’Etat ambitionne d’ici deux ans d’accroître la large bande et de fournir des services haut débit à 90 % de la population. Actuellement, le réseau national de fibre optique du Nigeria est achevé à 98 %, selon le gouvernement.\n\n'
//           'La couverture Internet universelle permettra ainsi l’utilisation des services publics qui seront davantage mis en ligne dans les prochains mois, selon le chef de l’Etat.'
//           'Pour les 24 premiers mois de son mandant, M. Tinubu mise sur la création d’un million d’emplois dans le secteur des TIC.',
//       category: Category.Afrique,
//       source: 'We are Tech',
//       section: 'Divers',
//       publicationDate: DateTime(2023, 5, 31, 08, 40),
//       isBreakingNews: false,
//     ),
//     Article(
//       image: 'assets/images/article_1.png',
//       title:
//           'Congo-Affaires : le groupe ASC Impact va investir 23 milliards FCFA dans le bois et l’agriculture',
//       summary:
//           'Le président directeur général du groupe ASC Impact, Karl E. Kirchmayer, a annoncé, le 31 mai à Brazzaville, son ambition d’investir en République du Congo dans les secteurs de l’agriculture, de l’exploitation forestière, de la transformation poussée du bois et l’afforestation pour un engagement prévisionnel de 23 milliards de francs CFA contre six mille emplois attendus.',
//       content:
//           'Créé en Suisse depuis 300 ans, ASC Impact a déjà mis sur pied au Congo trois sociétés de droit congolais. Il s’agit d’Agricaf Congo destinée au développement de l’agriculture, Transfor Congo dédiée à l’exploitation forestière et à la transformation poussée du bois, Afforest Congo consacrée à l’afforestation et au reboisement.'
//           'Le groupe suisse sollicite à la partie congolaise 42 000 hectares de terres agricoles dans le département du Niari ; 178 000 hectares dans la Cuvette pour l’afforestation ; 50 000 hectares pour l’aménagement forestier, la transformation plus poussée du bois et la contribution au développement local de l’unité forestière d’exploitation Mila Mila, dans le Niari.'
//           'L’entreprise tricentenaire prévoit également de s’engager dans la transformation du bois en produits finis dans les zones économiques spéciales d’Oyo-Ollombo et de Pointe-Noire. Elle n’attend plus que la levée des obstacles concernant les autorisations d’exploitation forestière et d’accès aux terres cultivables pour entrer en phase opérationnelle, a expliqué la directrice générale de l’Agence pour la promotion des investissements, Annick Mongo.\n\n'
//           'Elle s’est exprimée lors d’une rencontre réunissant les responsables d’ASC Impact et les représentants de la primature, des ministères de l’Industrie, de l’Agriculture, de l’Economie forestière et d’autres départements.'
//           'Le groupe ASC Impact est présent sur le continent africain dans les pays comme l’Angola, l’Ouganda et l’Ethiopie. Il a déjà fait ses preuves dans les domaines agricole et forestier en Europe, notamment en Autriche, en Allemagne, en Slovénie et en Russie.'
//           'Au Congo, le groupe ASC Impact entend, selon son président directeur général, Karl E. Kirchmayer, mettre un accent dans un premier temps sur l’exploitation et la transformation poussée du bois, l’afforestation, la production du soja, du maïs, du blé et d’autres cultures agricoles.\n\n'
//           'Le Congo et d’autres pays membres de la Communauté économique et monétaire de l’Afrique centrale sont engagés dans une dynamique communautaire interdisant d’exporter les grumes au profit de leur transformation locale. Une approche qui apporte de la plus-value au secteur du bois à travers l’implantation d’industries et la création des milliers d’emplois directs et indirects.\n\n'
//           'Pays à vocation agropastorale, le Congo compte dix millions d’hectares de terres arables dont 3% seulement sont utilisés tandis qu’il consacre annuellement 700 milliards de F CFA aux importations des produits alimentaires. Le groupe ASC Impact peut saisir l’opportunité pour développer ses activités dans ce pays qui partage avec d’autres de l’Afrique centrale les écosystèmes forestiers du Bassin du Congo.Christian Brice Elion',
//       category: Category.Economie,
//       section: 'Jeux',
//       source: 'Adiac',
//       publicationDate: DateTime(2023, 6, 1, 10, 7),
//       isBreakingNews: false,
//     ),
//     Article(
//       image: 'assets/images/article_2.png',
//       title:
//           'Intégration sous-régionale : redonner au Congo sa vocation de pays de transit',
//       summary:
//           'Le président de la République, Denis Sassou N’Guesso, a lancé officiellement, le 20 mai au village Mbindjo (district de Mokeko), dans le département de la Sangha, les travaux d’aménagement et de bitumage de la route Ouesso-Pokola, longue de 47 km, avec construction d’un pont de 616 m sur la rivière Sangha. Un projet intégrateur dont l’ambition majeure est de redonner au Congo sa vocation de pays de transit.',
//       content:
//           'Financés entièrement par la Banque de développement des Etats de l’Afrique centrale (BDEAC) à hauteur de 99 700 000 000 FCFA, les travaux de la première phase du projet d’aménagement et de bitumage du corridor 13, Ouesso-Bangui-N’Djamena, sont confiés à la société China road and bridge corporation (CRBC) pour une durée de trois ans. Ils prévoient, entre autres, le bitumage de la section Ouesso-Pokola ; la construction de trois ponts majeurs dotés d’une structure mixte constituée des poutres métalliques surmontées d’une dalle de hourdis en béton armé.'
//           'Il est également prévu la construction d’un poste de pesage des essieux; de 8,5 km de voiries urbaines avec éclairage à Pokola. Selon le délégué général aux Grands travaux, Oscar Otoka, il y aura aussi la dalle en béton armé du tablier, portée par deux poutres métalliques de 3,6 m de hauteur, avec une épaisseur de 25 cm. « Cette route d’intérêt sous-régional qui vient concrétiser l’ambitieux programme d’investissements que le gouvernement, fort des objectifs, enjeux et défis d’opérationnalisation de la Zone de libre-échange continentale africaine, entend mettre en œuvre pour développer et moderniser tous azimuts le réseau routier national en vue d’améliorer la connectivité nationale et régionale », a rappelé le délégué général.\n\n'
//           'Louant les efforts du gouvernement et de ses partenaires, le sous-préfet de Mokeko, Odile Kinzenzé Kossa, a indiqué que la construction du plus grand pont du pays sur la rivière Sangha va moderniser la liaison routière entre la République du Congo, la République centrafricaine et la République du Tchad en passant par Pokola avec ses voiries urbaines et le département de la Likouala. « Nous observons non sans faute que la notion de carrefour de la partie septentrionale du Congo, conférée au département de la Sangha dans sa globalité, revient particulièrement à Mokeko qui joue inéluctablement cette fonction. Le développement du district de Mokeko passe par celui de la route qui mène au désenclavement des bassins de production. Ce qui favoriserait les échanges commerciaux entre les différents pays de la Communauté économique et monétaire de l’Afrique centrale (Cémac) », a-t-elle souligné.\n\n'
//           'Augmenter la valeur annuelle des exportations des pays membres.\n\n'
//           'Le vice-président de la BDEAC, Jean Paterne Megné Ekoga, quant à lui, a déclaré que ce projet intégrateur permettra à la République centrafricaine et à la République du Tchad d’avoir une alternative d’accès à la mer par voie ferrée, voie routière et par voie fluviale. La République du Congo verra, de son côté, sa vocation séculaire de pays de transit et de transport multimodal renforcée. « Les avantages économiques, sociaux et environnementaux du projet confirment bien son importance pour le Congo en particulier et l’Afrique centrale en général. A travers la mise en œuvre de ce projet, le Congo participera à la réalisation des programmes intégrateurs en matière de liaison routière entre les capitales de la Cémac », a-t-il laissé entendre, réitérant l’engagement de son institution à œuvrer toujours aux côtés de la République du Congo.\n\n'
//           'Le ministre d’Etat, ministre de l’Aménagement du territoire, des Infrastructures et de l’Entretien routier, Jean Jacques Bouya, pour sa part, a estimé que la construction d’une route et d’un grand pont aux standards internationaux pour enjamber la redoutable rivière Sangha et relier ce département à son voisin la Likouala permettra, à terme, de connecter non seulement le Congo à la Centrafrique, mais aussi de participer à la connexion du Nord au Sud de l’Afrique par le centre. « Cette route vient compléter la chaîne des infrastructures de transports terrestres de nature à restituer au Congo sa vocation d’un pays de transit, offrant une plaque tournante d’échanges intra et extra pays, à partir du port autonome de Pointe-Noire », a précisé le ministre d’Etat.\n\n'
//           'D’après lui, le rapport 2018 de la Communauté économique des Etats de l’Afrique centrale sur l’étude économique du projet de la route Ouesso-Bangui-N’Djamena ainsi que de la navigation sur le fleuve Congo et ses affluents, les rivières Oubangui et Sangha, révèle qu’à la mise en service de la route, la valeur annuelle des estimations d’exportations des pays membres sera globalement plus élevée. Elle passera de 274 milliards 191 millions FCFA à 2 125 milliards 158 millions FCFA. Pour le Congo, on notera, a-t-il annoncé, une augmentation substantielle de 11%, soit de 20 milliards 688 millions FCFA à 694 milliards 218 millions FCFA.Parfait Wilfried Douniama.',
//       category: Category.Politique,
//       source: 'Adiac',
//       section: 'Jeux',
//       publicationDate: DateTime(2023, 5, 24, 15, 11),
//       isBreakingNews: false,
//     ),
//     Article(
//       image: 'assets/images/article_3.png',
//       title: 'Jumelage: les villes de Pointe-Noire et Kigali bientôt unies',
//       summary:
//           'L’information a été rendue publique par Théoneste Mutsindashyaka, ambassadeur de la République du Rwanda au Congo, à l’issue  d’un entretien, le 23 mai, avec Evelyne Tchitchellé, maire de la ville de Pointe-Noire.',
//       content:
//           'L’ambassadeur du Rwanda au Congo a signifié, au sortir de l’audience, que l’entretien avec le maire a porté sur le jumelage de la ville de Pointe-Noire et celle de Kigali. « J’ai expliqué, au cours de cette rencontre avec madame le maire, que la ville de Kigali est prête a accepté le jumelage avec celle de Pointe-Noire », a-t-il indiqué.\n\n'
//           'Au cours de cette rencontre, l’ambassadeur Théoneste Mutsindashyaka a présenté les opportunités de son pays exploitables au Congo.  Les deux personnalités ont aussi envisagé la possibilité d’une visite de travail à Kigali en vue d’un échange d’expérience dans les domaines de l’agriculture, du tourisme et autres. La signature d’un partenariat ou d’un protocole d’accord entre les autorités des deux villes est également prévue, en vue du jumelage.\n\n'
//           'Soulignons  que cette audience a eu lieu au moment où la mairie de Pointe-Noire est paralysée, depuis le 17 mai dernier, par une grève de ses  agents.Séverin Ibara',
//       category: Category.Societe,
//       source: 'Adiac',
//       section: 'journal',
//       publicationDate: DateTime(2023, 5, 24, 15, 15),
//       isBreakingNews: false,
//     ),
//     Article(
//       image: 'assets/images/article_4.png',
//       title: 'Musique: des artistes ivoiriens invités au Fespam',
//       summary:
//           'Les artistes ivoiriens sont invités à participer à la 11e édition du  Festival panafricain de musique (Fespam) qui aura lieu du 15 au 22 juillet prochain, à Brazzaville.',
//       content:
//           'L’invitation a été transmise à la ministre ivoirienne de la Culture et de la Francophonie, Françoise Remarck, par son homologue congolaise, Lydie Pongault, en marge du Salon international du livre d’Abidjan (Sila) qui s’est tenu du 9 au 13 mai dernier et  dont la République du Congo avait été l’invitée d’honneur.\n\n'
//           'Au cours de ces retrouvailles marquées à la fois par les allocutions et les ateliers, la délégation congolaise, forte d’une dizaine d’écrivains et d’autres professionnels du livre, a eu des échanges fructueux avec tous ses partenaires. Des prises de parole des autorités ivoiriennes, il en ressort une reconnaissance du rayonnement international de la littérature congolaise ; la nécessité de penser le livre comme levier de l’inclusion sociale et du développement des économies, à travers notamment la mise en place des industries culturelles et créatives et le renforcement des liens d’amitié et de la coopération culturelle entre le Congo et la Côte d’Ivoire.\n\n'
//           'Par ailleurs, les discussions entre les deux ministres, qui ont eu lieu en marge du salon, ont porté essentiellement sur la mise en application de l’Accord de coopération culturelle et artistique entre le Congo et la Côte d’Ivoire du 22 novembre 2022 ; le statut et le cadre juridique de l’artiste et des professionnels de la culture et des arts ; la restitution des œuvres d’art africain ; la réforme du corpus juridique réglementant le fonctionnement des institutions en charge de la gestion collective que sont le Bureau ivoirien du droit d’auteur et le Bureau congolais du droit d’auteur ; le développement des industries culturelles et créatives, à travers la création ou l’augmentation des fonds dédiés à la création et à l’action culturelle ; les formations professionnalisantes dans les domaines artistiques et d’expertise culturelle ; l’appui ou la relance des centres de lecture et d’animation culturelle en zones urbaines et rurales ; la construction ou la rénovation d’infrastructures culturelles ainsi que la préservation du patrimoine.\n\n'
//           'En effet, la participation du Congo au Sila constitue un premier pas dans la démarche de mise en application de l’accord susmentionné. De plus, il s’agit également de la nécessité d’un dialogue ouvert avec les experts des pays africains au sujet de la restitution des œuvres d’art, laquelle est régie par le Rapport Jean Luc Martinez, loi-cadre fixant les critères de restitution des œuvres dans le but de faire bloc et de repenser les critères jugés européo-centrés. De la même manière, la participation du Congo au Sila devrait permettre d’établir des objectifs chiffrés en termes d’organisation d’événements culturels dans les grandes villes et dans l’hinterland afin d’apporter un dynamisme aux vies culturelles nationales.      Roger Ngombé',
//       category: Category.Culture,
//       source: 'Adiac',
//       section: 'journal',
//       publicationDate: DateTime(2023, 5, 24, 15, 23),
//       isBreakingNews: false,
//     ),
//     Article(
//       image: 'assets/images/article_5.png',
//       title:
//           'Nigeria : le nouveau président oriente le développement numérique sur sept axes stratégiques',
//       summary:
//           'Durant sa présidence démarrée en mai 2015, Muhammadu Buhari, le président sortant, a réussi à faire briller le Nigeria sur la scène technologique et numérique internationale. Pour les quatre prochaines années, son successeur veut faire encore mieux.',
//       content:
//           'Bola Tinubu (photo) a prêté serment le lundi 29 mai à Abuja pour devenir officiellement le nouveau président du Nigeria. Elu le 25 février, l’ex-gouverneur de l’Etat de Lagos croit au pouvoir catalyseur du numérique pour le développement du pays.'
//           'Il a prévu à cet effet un programme qui se concentre sur sept domaines à savoir l’innovation et l’entreprenariat, la fourniture de services et l’externalisation, la fabrication des produits technologiques, le commerce électronique, la numérisation des services publics, la large bande et la blockchain.\n\n'
//           'L’administration Tinubu prévoit de mettre en œuvre des politiques pour soutenir les opportunités de financement locales et l’accès au capital pour encourager les investisseurs étrangers à continuer d’investir au Nigeria. Des politiques visant à former et renforcer les capacités des jeunes dans le domaine des TIC seront également élaborées.\n\n'
//           'Une autre industrie de l’écosystème technologique nigérian que le programme promet de développer est le secteur du commerce électronique en modernisant l’infrastructure nationale de transport du pays, afin d’offrir des services à l’échelle nationale et de répondre aux besoins des consommateurs dans tout le pays.\n\n'
//           'Des investissements dans la fabrication des produits technologiques sont également prévus, car elle présente selon le programme une autre opportunité importante pour la création d’emplois au Nigeria. Ainsi, l’importation de smartphones sera remplacée par l’assemblage local pour le développement du secteur manufacturier technologique.\n\n'
//           'Concernant la Blockchain, le nouveau président envisage de réformer la politique gouvernementale pour encourager l’utilisation prudente de cette nouvelle technologie dans la finance et la banque, la gestion des identités, la collecte des revenus et l’utilisation des crypto-actifs.'
//           'Conscient que tous ces projets ne se réaliseront pas sans une bonne connectivité Internet, le nouveau chef d’Etat ambitionne d’ici deux ans d’accroître la large bande et de fournir des services haut débit à 90 % de la population. Actuellement, le réseau national de fibre optique du Nigeria est achevé à 98 %, selon le gouvernement.\n\n'
//           'La couverture Internet universelle permettra ainsi l’utilisation des services publics qui seront davantage mis en ligne dans les prochains mois, selon le chef de l’Etat.'
//           'Pour les 24 premiers mois de son mandant, M. Tinubu mise sur la création d’un million d’emplois dans le secteur des TIC.',
//       category: Category.Afrique,
//       source: 'We are Tech',
//       section: 'Divers',
//       publicationDate: DateTime(2023, 5, 31, 08, 40),
//       isBreakingNews: false,
//     ),
//     Article(
//       image: 'assets/images/article_5.png',
//       title:
//           'Nigeria : le nouveau président oriente le développement numérique sur sept axes stratégiques',
//       summary:
//           'Durant sa présidence démarrée en mai 2015, Muhammadu Buhari, le président sortant, a réussi à faire briller le Nigeria sur la scène technologique et numérique internationale. Pour les quatre prochaines années, son successeur veut faire encore mieux.',
//       content:
//           'Bola Tinubu (photo) a prêté serment le lundi 29 mai à Abuja pour devenir officiellement le nouveau président du Nigeria. Elu le 25 février, l’ex-gouverneur de l’Etat de Lagos croit au pouvoir catalyseur du numérique pour le développement du pays.'
//           'Il a prévu à cet effet un programme qui se concentre sur sept domaines à savoir l’innovation et l’entreprenariat, la fourniture de services et l’externalisation, la fabrication des produits technologiques, le commerce électronique, la numérisation des services publics, la large bande et la blockchain.\n\n'
//           'L’administration Tinubu prévoit de mettre en œuvre des politiques pour soutenir les opportunités de financement locales et l’accès au capital pour encourager les investisseurs étrangers à continuer d’investir au Nigeria. Des politiques visant à former et renforcer les capacités des jeunes dans le domaine des TIC seront également élaborées.\n\n'
//           'Une autre industrie de l’écosystème technologique nigérian que le programme promet de développer est le secteur du commerce électronique en modernisant l’infrastructure nationale de transport du pays, afin d’offrir des services à l’échelle nationale et de répondre aux besoins des consommateurs dans tout le pays.\n\n'
//           'Des investissements dans la fabrication des produits technologiques sont également prévus, car elle présente selon le programme une autre opportunité importante pour la création d’emplois au Nigeria. Ainsi, l’importation de smartphones sera remplacée par l’assemblage local pour le développement du secteur manufacturier technologique.\n\n'
//           'Concernant la Blockchain, le nouveau président envisage de réformer la politique gouvernementale pour encourager l’utilisation prudente de cette nouvelle technologie dans la finance et la banque, la gestion des identités, la collecte des revenus et l’utilisation des crypto-actifs.'
//           'Conscient que tous ces projets ne se réaliseront pas sans une bonne connectivité Internet, le nouveau chef d’Etat ambitionne d’ici deux ans d’accroître la large bande et de fournir des services haut débit à 90 % de la population. Actuellement, le réseau national de fibre optique du Nigeria est achevé à 98 %, selon le gouvernement.\n\n'
//           'La couverture Internet universelle permettra ainsi l’utilisation des services publics qui seront davantage mis en ligne dans les prochains mois, selon le chef de l’Etat.'
//           'Pour les 24 premiers mois de son mandant, M. Tinubu mise sur la création d’un million d’emplois dans le secteur des TIC.',
//       category: Category.Afrique,
//       source: 'We are Tech',
//       section: 'Divers',
//       publicationDate: DateTime(2023, 5, 31, 08, 40),
//       isBreakingNews: false,
//     ),
//     Article(
//       image: 'assets/images/article_1.png',
//       title:
//           'Congo-Affaires : le groupe ASC Impact va investir 23 milliards FCFA dans le bois et l’agriculture',
//       summary:
//           'Le président directeur général du groupe ASC Impact, Karl E. Kirchmayer, a annoncé, le 31 mai à Brazzaville, son ambition d’investir en République du Congo dans les secteurs de l’agriculture, de l’exploitation forestière, de la transformation poussée du bois et l’afforestation pour un engagement prévisionnel de 23 milliards de francs CFA contre six mille emplois attendus.',
//       content:
//           'Créé en Suisse depuis 300 ans, ASC Impact a déjà mis sur pied au Congo trois sociétés de droit congolais. Il s’agit d’Agricaf Congo destinée au développement de l’agriculture, Transfor Congo dédiée à l’exploitation forestière et à la transformation poussée du bois, Afforest Congo consacrée à l’afforestation et au reboisement.'
//           'Le groupe suisse sollicite à la partie congolaise 42 000 hectares de terres agricoles dans le département du Niari ; 178 000 hectares dans la Cuvette pour l’afforestation ; 50 000 hectares pour l’aménagement forestier, la transformation plus poussée du bois et la contribution au développement local de l’unité forestière d’exploitation Mila Mila, dans le Niari.'
//           'L’entreprise tricentenaire prévoit également de s’engager dans la transformation du bois en produits finis dans les zones économiques spéciales d’Oyo-Ollombo et de Pointe-Noire. Elle n’attend plus que la levée des obstacles concernant les autorisations d’exploitation forestière et d’accès aux terres cultivables pour entrer en phase opérationnelle, a expliqué la directrice générale de l’Agence pour la promotion des investissements, Annick Mongo.\n\n'
//           'Elle s’est exprimée lors d’une rencontre réunissant les responsables d’ASC Impact et les représentants de la primature, des ministères de l’Industrie, de l’Agriculture, de l’Economie forestière et d’autres départements.'
//           'Le groupe ASC Impact est présent sur le continent africain dans les pays comme l’Angola, l’Ouganda et l’Ethiopie. Il a déjà fait ses preuves dans les domaines agricole et forestier en Europe, notamment en Autriche, en Allemagne, en Slovénie et en Russie.'
//           'Au Congo, le groupe ASC Impact entend, selon son président directeur général, Karl E. Kirchmayer, mettre un accent dans un premier temps sur l’exploitation et la transformation poussée du bois, l’afforestation, la production du soja, du maïs, du blé et d’autres cultures agricoles.\n\n'
//           'Le Congo et d’autres pays membres de la Communauté économique et monétaire de l’Afrique centrale sont engagés dans une dynamique communautaire interdisant d’exporter les grumes au profit de leur transformation locale. Une approche qui apporte de la plus-value au secteur du bois à travers l’implantation d’industries et la création des milliers d’emplois directs et indirects.\n\n'
//           'Pays à vocation agropastorale, le Congo compte dix millions d’hectares de terres arables dont 3% seulement sont utilisés tandis qu’il consacre annuellement 700 milliards de F CFA aux importations des produits alimentaires. Le groupe ASC Impact peut saisir l’opportunité pour développer ses activités dans ce pays qui partage avec d’autres de l’Afrique centrale les écosystèmes forestiers du Bassin du Congo.Christian Brice Elion',
//       category: Category.Economie,
//       section: 'Jeux',
//       source: 'Adiac',
//       publicationDate: DateTime(2023, 6, 1, 10, 7),
//       isBreakingNews: false,
//     ),
//     Article(
//       image: 'assets/images/article_2.png',
//       title:
//           'Intégration sous-régionale : redonner au Congo sa vocation de pays de transit',
//       summary:
//           'Le président de la République, Denis Sassou N’Guesso, a lancé officiellement, le 20 mai au village Mbindjo (district de Mokeko), dans le département de la Sangha, les travaux d’aménagement et de bitumage de la route Ouesso-Pokola, longue de 47 km, avec construction d’un pont de 616 m sur la rivière Sangha. Un projet intégrateur dont l’ambition majeure est de redonner au Congo sa vocation de pays de transit.',
//       content:
//           'Financés entièrement par la Banque de développement des Etats de l’Afrique centrale (BDEAC) à hauteur de 99 700 000 000 FCFA, les travaux de la première phase du projet d’aménagement et de bitumage du corridor 13, Ouesso-Bangui-N’Djamena, sont confiés à la société China road and bridge corporation (CRBC) pour une durée de trois ans. Ils prévoient, entre autres, le bitumage de la section Ouesso-Pokola ; la construction de trois ponts majeurs dotés d’une structure mixte constituée des poutres métalliques surmontées d’une dalle de hourdis en béton armé.'
//           'Il est également prévu la construction d’un poste de pesage des essieux; de 8,5 km de voiries urbaines avec éclairage à Pokola. Selon le délégué général aux Grands travaux, Oscar Otoka, il y aura aussi la dalle en béton armé du tablier, portée par deux poutres métalliques de 3,6 m de hauteur, avec une épaisseur de 25 cm. « Cette route d’intérêt sous-régional qui vient concrétiser l’ambitieux programme d’investissements que le gouvernement, fort des objectifs, enjeux et défis d’opérationnalisation de la Zone de libre-échange continentale africaine, entend mettre en œuvre pour développer et moderniser tous azimuts le réseau routier national en vue d’améliorer la connectivité nationale et régionale », a rappelé le délégué général.\n\n'
//           'Louant les efforts du gouvernement et de ses partenaires, le sous-préfet de Mokeko, Odile Kinzenzé Kossa, a indiqué que la construction du plus grand pont du pays sur la rivière Sangha va moderniser la liaison routière entre la République du Congo, la République centrafricaine et la République du Tchad en passant par Pokola avec ses voiries urbaines et le département de la Likouala. « Nous observons non sans faute que la notion de carrefour de la partie septentrionale du Congo, conférée au département de la Sangha dans sa globalité, revient particulièrement à Mokeko qui joue inéluctablement cette fonction. Le développement du district de Mokeko passe par celui de la route qui mène au désenclavement des bassins de production. Ce qui favoriserait les échanges commerciaux entre les différents pays de la Communauté économique et monétaire de l’Afrique centrale (Cémac) », a-t-elle souligné.\n\n'
//           'Augmenter la valeur annuelle des exportations des pays membres.\n\n'
//           'Le vice-président de la BDEAC, Jean Paterne Megné Ekoga, quant à lui, a déclaré que ce projet intégrateur permettra à la République centrafricaine et à la République du Tchad d’avoir une alternative d’accès à la mer par voie ferrée, voie routière et par voie fluviale. La République du Congo verra, de son côté, sa vocation séculaire de pays de transit et de transport multimodal renforcée. « Les avantages économiques, sociaux et environnementaux du projet confirment bien son importance pour le Congo en particulier et l’Afrique centrale en général. A travers la mise en œuvre de ce projet, le Congo participera à la réalisation des programmes intégrateurs en matière de liaison routière entre les capitales de la Cémac », a-t-il laissé entendre, réitérant l’engagement de son institution à œuvrer toujours aux côtés de la République du Congo.\n\n'
//           'Le ministre d’Etat, ministre de l’Aménagement du territoire, des Infrastructures et de l’Entretien routier, Jean Jacques Bouya, pour sa part, a estimé que la construction d’une route et d’un grand pont aux standards internationaux pour enjamber la redoutable rivière Sangha et relier ce département à son voisin la Likouala permettra, à terme, de connecter non seulement le Congo à la Centrafrique, mais aussi de participer à la connexion du Nord au Sud de l’Afrique par le centre. « Cette route vient compléter la chaîne des infrastructures de transports terrestres de nature à restituer au Congo sa vocation d’un pays de transit, offrant une plaque tournante d’échanges intra et extra pays, à partir du port autonome de Pointe-Noire », a précisé le ministre d’Etat.\n\n'
//           'D’après lui, le rapport 2018 de la Communauté économique des Etats de l’Afrique centrale sur l’étude économique du projet de la route Ouesso-Bangui-N’Djamena ainsi que de la navigation sur le fleuve Congo et ses affluents, les rivières Oubangui et Sangha, révèle qu’à la mise en service de la route, la valeur annuelle des estimations d’exportations des pays membres sera globalement plus élevée. Elle passera de 274 milliards 191 millions FCFA à 2 125 milliards 158 millions FCFA. Pour le Congo, on notera, a-t-il annoncé, une augmentation substantielle de 11%, soit de 20 milliards 688 millions FCFA à 694 milliards 218 millions FCFA.Parfait Wilfried Douniama.',
//       category: Category.Politique,
//       source: 'Adiac',
//       section: 'Jeux',
//       publicationDate: DateTime(2023, 5, 24, 15, 11),
//       isBreakingNews: false,
//     ),
//     Article(
//       image: 'assets/images/article_3.png',
//       title: 'Jumelage: les villes de Pointe-Noire et Kigali bientôt unies',
//       summary:
//           'L’information a été rendue publique par Théoneste Mutsindashyaka, ambassadeur de la République du Rwanda au Congo, à l’issue  d’un entretien, le 23 mai, avec Evelyne Tchitchellé, maire de la ville de Pointe-Noire.',
//       content:
//           'L’ambassadeur du Rwanda au Congo a signifié, au sortir de l’audience, que l’entretien avec le maire a porté sur le jumelage de la ville de Pointe-Noire et celle de Kigali. « J’ai expliqué, au cours de cette rencontre avec madame le maire, que la ville de Kigali est prête a accepté le jumelage avec celle de Pointe-Noire », a-t-il indiqué.\n\n'
//           'Au cours de cette rencontre, l’ambassadeur Théoneste Mutsindashyaka a présenté les opportunités de son pays exploitables au Congo.  Les deux personnalités ont aussi envisagé la possibilité d’une visite de travail à Kigali en vue d’un échange d’expérience dans les domaines de l’agriculture, du tourisme et autres. La signature d’un partenariat ou d’un protocole d’accord entre les autorités des deux villes est également prévue, en vue du jumelage.\n\n'
//           'Soulignons  que cette audience a eu lieu au moment où la mairie de Pointe-Noire est paralysée, depuis le 17 mai dernier, par une grève de ses  agents.Séverin Ibara',
//       category: Category.Societe,
//       source: 'Adiac',
//       section: 'journal',
//       publicationDate: DateTime(2023, 5, 24, 15, 15),
//       isBreakingNews: false,
//     ),
//     Article(
//       image: 'assets/images/article_4.png',
//       title: 'Musique: des artistes ivoiriens invités au Fespam',
//       summary:
//           'Les artistes ivoiriens sont invités à participer à la 11e édition du  Festival panafricain de musique (Fespam) qui aura lieu du 15 au 22 juillet prochain, à Brazzaville.',
//       content:
//           'L’invitation a été transmise à la ministre ivoirienne de la Culture et de la Francophonie, Françoise Remarck, par son homologue congolaise, Lydie Pongault, en marge du Salon international du livre d’Abidjan (Sila) qui s’est tenu du 9 au 13 mai dernier et  dont la République du Congo avait été l’invitée d’honneur.\n\n'
//           'Au cours de ces retrouvailles marquées à la fois par les allocutions et les ateliers, la délégation congolaise, forte d’une dizaine d’écrivains et d’autres professionnels du livre, a eu des échanges fructueux avec tous ses partenaires. Des prises de parole des autorités ivoiriennes, il en ressort une reconnaissance du rayonnement international de la littérature congolaise ; la nécessité de penser le livre comme levier de l’inclusion sociale et du développement des économies, à travers notamment la mise en place des industries culturelles et créatives et le renforcement des liens d’amitié et de la coopération culturelle entre le Congo et la Côte d’Ivoire.\n\n'
//           'Par ailleurs, les discussions entre les deux ministres, qui ont eu lieu en marge du salon, ont porté essentiellement sur la mise en application de l’Accord de coopération culturelle et artistique entre le Congo et la Côte d’Ivoire du 22 novembre 2022 ; le statut et le cadre juridique de l’artiste et des professionnels de la culture et des arts ; la restitution des œuvres d’art africain ; la réforme du corpus juridique réglementant le fonctionnement des institutions en charge de la gestion collective que sont le Bureau ivoirien du droit d’auteur et le Bureau congolais du droit d’auteur ; le développement des industries culturelles et créatives, à travers la création ou l’augmentation des fonds dédiés à la création et à l’action culturelle ; les formations professionnalisantes dans les domaines artistiques et d’expertise culturelle ; l’appui ou la relance des centres de lecture et d’animation culturelle en zones urbaines et rurales ; la construction ou la rénovation d’infrastructures culturelles ainsi que la préservation du patrimoine.\n\n'
//           'En effet, la participation du Congo au Sila constitue un premier pas dans la démarche de mise en application de l’accord susmentionné. De plus, il s’agit également de la nécessité d’un dialogue ouvert avec les experts des pays africains au sujet de la restitution des œuvres d’art, laquelle est régie par le Rapport Jean Luc Martinez, loi-cadre fixant les critères de restitution des œuvres dans le but de faire bloc et de repenser les critères jugés européo-centrés. De la même manière, la participation du Congo au Sila devrait permettre d’établir des objectifs chiffrés en termes d’organisation d’événements culturels dans les grandes villes et dans l’hinterland afin d’apporter un dynamisme aux vies culturelles nationales.      Roger Ngombé',
//       category: Category.Culture,
//       source: 'Adiac',
//       section: 'journal',
//       publicationDate: DateTime(2023, 5, 24, 15, 23),
//       isBreakingNews: false,
//     ),
//     Article(
//       image: 'assets/images/article_5.png',
//       title:
//           'Nigeria : le nouveau président oriente le développement numérique sur sept axes stratégiques',
//       summary:
//           'Durant sa présidence démarrée en mai 2015, Muhammadu Buhari, le président sortant, a réussi à faire briller le Nigeria sur la scène technologique et numérique internationale. Pour les quatre prochaines années, son successeur veut faire encore mieux.',
//       content:
//           'Bola Tinubu (photo) a prêté serment le lundi 29 mai à Abuja pour devenir officiellement le nouveau président du Nigeria. Elu le 25 février, l’ex-gouverneur de l’Etat de Lagos croit au pouvoir catalyseur du numérique pour le développement du pays.'
//           'Il a prévu à cet effet un programme qui se concentre sur sept domaines à savoir l’innovation et l’entreprenariat, la fourniture de services et l’externalisation, la fabrication des produits technologiques, le commerce électronique, la numérisation des services publics, la large bande et la blockchain.\n\n'
//           'L’administration Tinubu prévoit de mettre en œuvre des politiques pour soutenir les opportunités de financement locales et l’accès au capital pour encourager les investisseurs étrangers à continuer d’investir au Nigeria. Des politiques visant à former et renforcer les capacités des jeunes dans le domaine des TIC seront également élaborées.\n\n'
//           'Une autre industrie de l’écosystème technologique nigérian que le programme promet de développer est le secteur du commerce électronique en modernisant l’infrastructure nationale de transport du pays, afin d’offrir des services à l’échelle nationale et de répondre aux besoins des consommateurs dans tout le pays.\n\n'
//           'Des investissements dans la fabrication des produits technologiques sont également prévus, car elle présente selon le programme une autre opportunité importante pour la création d’emplois au Nigeria. Ainsi, l’importation de smartphones sera remplacée par l’assemblage local pour le développement du secteur manufacturier technologique.\n\n'
//           'Concernant la Blockchain, le nouveau président envisage de réformer la politique gouvernementale pour encourager l’utilisation prudente de cette nouvelle technologie dans la finance et la banque, la gestion des identités, la collecte des revenus et l’utilisation des crypto-actifs.'
//           'Conscient que tous ces projets ne se réaliseront pas sans une bonne connectivité Internet, le nouveau chef d’Etat ambitionne d’ici deux ans d’accroître la large bande et de fournir des services haut débit à 90 % de la population. Actuellement, le réseau national de fibre optique du Nigeria est achevé à 98 %, selon le gouvernement.\n\n'
//           'La couverture Internet universelle permettra ainsi l’utilisation des services publics qui seront davantage mis en ligne dans les prochains mois, selon le chef de l’Etat.'
//           'Pour les 24 premiers mois de son mandant, M. Tinubu mise sur la création d’un million d’emplois dans le secteur des TIC.',
//       category: Category.Afrique,
//       source: 'We are Tech',
//       section: 'Divers',
//       publicationDate: DateTime(2023, 5, 31, 08, 40),
//       isBreakingNews: true,
//     ),
//     Article(
//       image: 'assets/images/article_5.png',
//       title:
//           'Nigeria : le nouveau président oriente le développement numérique sur sept axes stratégiques',
//       summary:
//           'Durant sa présidence démarrée en mai 2015, Muhammadu Buhari, le président sortant, a réussi à faire briller le Nigeria sur la scène technologique et numérique internationale. Pour les quatre prochaines années, son successeur veut faire encore mieux.',
//       content:
//           'Bola Tinubu (photo) a prêté serment le lundi 29 mai à Abuja pour devenir officiellement le nouveau président du Nigeria. Elu le 25 février, l’ex-gouverneur de l’Etat de Lagos croit au pouvoir catalyseur du numérique pour le développement du pays.'
//           'Il a prévu à cet effet un programme qui se concentre sur sept domaines à savoir l’innovation et l’entreprenariat, la fourniture de services et l’externalisation, la fabrication des produits technologiques, le commerce électronique, la numérisation des services publics, la large bande et la blockchain.\n\n'
//           'L’administration Tinubu prévoit de mettre en œuvre des politiques pour soutenir les opportunités de financement locales et l’accès au capital pour encourager les investisseurs étrangers à continuer d’investir au Nigeria. Des politiques visant à former et renforcer les capacités des jeunes dans le domaine des TIC seront également élaborées.\n\n'
//           'Une autre industrie de l’écosystème technologique nigérian que le programme promet de développer est le secteur du commerce électronique en modernisant l’infrastructure nationale de transport du pays, afin d’offrir des services à l’échelle nationale et de répondre aux besoins des consommateurs dans tout le pays.\n\n'
//           'Des investissements dans la fabrication des produits technologiques sont également prévus, car elle présente selon le programme une autre opportunité importante pour la création d’emplois au Nigeria. Ainsi, l’importation de smartphones sera remplacée par l’assemblage local pour le développement du secteur manufacturier technologique.\n\n'
//           'Concernant la Blockchain, le nouveau président envisage de réformer la politique gouvernementale pour encourager l’utilisation prudente de cette nouvelle technologie dans la finance et la banque, la gestion des identités, la collecte des revenus et l’utilisation des crypto-actifs.'
//           'Conscient que tous ces projets ne se réaliseront pas sans une bonne connectivité Internet, le nouveau chef d’Etat ambitionne d’ici deux ans d’accroître la large bande et de fournir des services haut débit à 90 % de la population. Actuellement, le réseau national de fibre optique du Nigeria est achevé à 98 %, selon le gouvernement.\n\n'
//           'La couverture Internet universelle permettra ainsi l’utilisation des services publics qui seront davantage mis en ligne dans les prochains mois, selon le chef de l’Etat.'
//           'Pour les 24 premiers mois de son mandant, M. Tinubu mise sur la création d’un million d’emplois dans le secteur des TIC.',
//       category: Category.Afrique,
//       source: 'We are Tech',
//       section: 'Divers',
//       publicationDate: DateTime(2023, 5, 31, 08, 40),
//       isBreakingNews: true,
//     ),
//     Article(
//       image: 'assets/images/article_1.png',
//       title:
//           'Congo-Affaires : le groupe ASC Impact va investir 23 milliards FCFA dans le bois et l’agriculture',
//       summary:
//           'Le président directeur général du groupe ASC Impact, Karl E. Kirchmayer, a annoncé, le 31 mai à Brazzaville, son ambition d’investir en République du Congo dans les secteurs de l’agriculture, de l’exploitation forestière, de la transformation poussée du bois et l’afforestation pour un engagement prévisionnel de 23 milliards de francs CFA contre six mille emplois attendus.',
//       content:
//           'Créé en Suisse depuis 300 ans, ASC Impact a déjà mis sur pied au Congo trois sociétés de droit congolais. Il s’agit d’Agricaf Congo destinée au développement de l’agriculture, Transfor Congo dédiée à l’exploitation forestière et à la transformation poussée du bois, Afforest Congo consacrée à l’afforestation et au reboisement.'
//           'Le groupe suisse sollicite à la partie congolaise 42 000 hectares de terres agricoles dans le département du Niari ; 178 000 hectares dans la Cuvette pour l’afforestation ; 50 000 hectares pour l’aménagement forestier, la transformation plus poussée du bois et la contribution au développement local de l’unité forestière d’exploitation Mila Mila, dans le Niari.'
//           'L’entreprise tricentenaire prévoit également de s’engager dans la transformation du bois en produits finis dans les zones économiques spéciales d’Oyo-Ollombo et de Pointe-Noire. Elle n’attend plus que la levée des obstacles concernant les autorisations d’exploitation forestière et d’accès aux terres cultivables pour entrer en phase opérationnelle, a expliqué la directrice générale de l’Agence pour la promotion des investissements, Annick Mongo.\n\n'
//           'Elle s’est exprimée lors d’une rencontre réunissant les responsables d’ASC Impact et les représentants de la primature, des ministères de l’Industrie, de l’Agriculture, de l’Economie forestière et d’autres départements.'
//           'Le groupe ASC Impact est présent sur le continent africain dans les pays comme l’Angola, l’Ouganda et l’Ethiopie. Il a déjà fait ses preuves dans les domaines agricole et forestier en Europe, notamment en Autriche, en Allemagne, en Slovénie et en Russie.'
//           'Au Congo, le groupe ASC Impact entend, selon son président directeur général, Karl E. Kirchmayer, mettre un accent dans un premier temps sur l’exploitation et la transformation poussée du bois, l’afforestation, la production du soja, du maïs, du blé et d’autres cultures agricoles.\n\n'
//           'Le Congo et d’autres pays membres de la Communauté économique et monétaire de l’Afrique centrale sont engagés dans une dynamique communautaire interdisant d’exporter les grumes au profit de leur transformation locale. Une approche qui apporte de la plus-value au secteur du bois à travers l’implantation d’industries et la création des milliers d’emplois directs et indirects.\n\n'
//           'Pays à vocation agropastorale, le Congo compte dix millions d’hectares de terres arables dont 3% seulement sont utilisés tandis qu’il consacre annuellement 700 milliards de F CFA aux importations des produits alimentaires. Le groupe ASC Impact peut saisir l’opportunité pour développer ses activités dans ce pays qui partage avec d’autres de l’Afrique centrale les écosystèmes forestiers du Bassin du Congo.Christian Brice Elion',
//       category: Category.Economie,
//       section: 'Jeux',
//       source: 'Adiac',
//       publicationDate: DateTime(2023, 6, 1, 10, 7),
//       isBreakingNews: true,
//     ),
//     Article(
//       image: 'assets/images/article_2.png',
//       title:
//           'Intégration sous-régionale : redonner au Congo sa vocation de pays de transit',
//       summary:
//           'Le président de la République, Denis Sassou N’Guesso, a lancé officiellement, le 20 mai au village Mbindjo (district de Mokeko), dans le département de la Sangha, les travaux d’aménagement et de bitumage de la route Ouesso-Pokola, longue de 47 km, avec construction d’un pont de 616 m sur la rivière Sangha. Un projet intégrateur dont l’ambition majeure est de redonner au Congo sa vocation de pays de transit.',
//       content:
//           'Financés entièrement par la Banque de développement des Etats de l’Afrique centrale (BDEAC) à hauteur de 99 700 000 000 FCFA, les travaux de la première phase du projet d’aménagement et de bitumage du corridor 13, Ouesso-Bangui-N’Djamena, sont confiés à la société China road and bridge corporation (CRBC) pour une durée de trois ans. Ils prévoient, entre autres, le bitumage de la section Ouesso-Pokola ; la construction de trois ponts majeurs dotés d’une structure mixte constituée des poutres métalliques surmontées d’une dalle de hourdis en béton armé.'
//           'Il est également prévu la construction d’un poste de pesage des essieux; de 8,5 km de voiries urbaines avec éclairage à Pokola. Selon le délégué général aux Grands travaux, Oscar Otoka, il y aura aussi la dalle en béton armé du tablier, portée par deux poutres métalliques de 3,6 m de hauteur, avec une épaisseur de 25 cm. « Cette route d’intérêt sous-régional qui vient concrétiser l’ambitieux programme d’investissements que le gouvernement, fort des objectifs, enjeux et défis d’opérationnalisation de la Zone de libre-échange continentale africaine, entend mettre en œuvre pour développer et moderniser tous azimuts le réseau routier national en vue d’améliorer la connectivité nationale et régionale », a rappelé le délégué général.\n\n'
//           'Louant les efforts du gouvernement et de ses partenaires, le sous-préfet de Mokeko, Odile Kinzenzé Kossa, a indiqué que la construction du plus grand pont du pays sur la rivière Sangha va moderniser la liaison routière entre la République du Congo, la République centrafricaine et la République du Tchad en passant par Pokola avec ses voiries urbaines et le département de la Likouala. « Nous observons non sans faute que la notion de carrefour de la partie septentrionale du Congo, conférée au département de la Sangha dans sa globalité, revient particulièrement à Mokeko qui joue inéluctablement cette fonction. Le développement du district de Mokeko passe par celui de la route qui mène au désenclavement des bassins de production. Ce qui favoriserait les échanges commerciaux entre les différents pays de la Communauté économique et monétaire de l’Afrique centrale (Cémac) », a-t-elle souligné.\n\n'
//           'Augmenter la valeur annuelle des exportations des pays membres.\n\n'
//           'Le vice-président de la BDEAC, Jean Paterne Megné Ekoga, quant à lui, a déclaré que ce projet intégrateur permettra à la République centrafricaine et à la République du Tchad d’avoir une alternative d’accès à la mer par voie ferrée, voie routière et par voie fluviale. La République du Congo verra, de son côté, sa vocation séculaire de pays de transit et de transport multimodal renforcée. « Les avantages économiques, sociaux et environnementaux du projet confirment bien son importance pour le Congo en particulier et l’Afrique centrale en général. A travers la mise en œuvre de ce projet, le Congo participera à la réalisation des programmes intégrateurs en matière de liaison routière entre les capitales de la Cémac », a-t-il laissé entendre, réitérant l’engagement de son institution à œuvrer toujours aux côtés de la République du Congo.\n\n'
//           'Le ministre d’Etat, ministre de l’Aménagement du territoire, des Infrastructures et de l’Entretien routier, Jean Jacques Bouya, pour sa part, a estimé que la construction d’une route et d’un grand pont aux standards internationaux pour enjamber la redoutable rivière Sangha et relier ce département à son voisin la Likouala permettra, à terme, de connecter non seulement le Congo à la Centrafrique, mais aussi de participer à la connexion du Nord au Sud de l’Afrique par le centre. « Cette route vient compléter la chaîne des infrastructures de transports terrestres de nature à restituer au Congo sa vocation d’un pays de transit, offrant une plaque tournante d’échanges intra et extra pays, à partir du port autonome de Pointe-Noire », a précisé le ministre d’Etat.\n\n'
//           'D’après lui, le rapport 2018 de la Communauté économique des Etats de l’Afrique centrale sur l’étude économique du projet de la route Ouesso-Bangui-N’Djamena ainsi que de la navigation sur le fleuve Congo et ses affluents, les rivières Oubangui et Sangha, révèle qu’à la mise en service de la route, la valeur annuelle des estimations d’exportations des pays membres sera globalement plus élevée. Elle passera de 274 milliards 191 millions FCFA à 2 125 milliards 158 millions FCFA. Pour le Congo, on notera, a-t-il annoncé, une augmentation substantielle de 11%, soit de 20 milliards 688 millions FCFA à 694 milliards 218 millions FCFA.Parfait Wilfried Douniama.',
//       category: Category.Politique,
//       source: 'Adiac',
//       section: 'Jeux',
//       publicationDate: DateTime(2023, 5, 24, 15, 11),
//       isBreakingNews: true,
//     ),
//     Article(
//       image: 'assets/images/article_3.png',
//       title: 'Jumelage: les villes de Pointe-Noire et Kigali bientôt unies',
//       summary:
//           'L’information a été rendue publique par Théoneste Mutsindashyaka, ambassadeur de la République du Rwanda au Congo, à l’issue  d’un entretien, le 23 mai, avec Evelyne Tchitchellé, maire de la ville de Pointe-Noire.',
//       content:
//           'L’ambassadeur du Rwanda au Congo a signifié, au sortir de l’audience, que l’entretien avec le maire a porté sur le jumelage de la ville de Pointe-Noire et celle de Kigali. « J’ai expliqué, au cours de cette rencontre avec madame le maire, que la ville de Kigali est prête a accepté le jumelage avec celle de Pointe-Noire », a-t-il indiqué.\n\n'
//           'Au cours de cette rencontre, l’ambassadeur Théoneste Mutsindashyaka a présenté les opportunités de son pays exploitables au Congo.  Les deux personnalités ont aussi envisagé la possibilité d’une visite de travail à Kigali en vue d’un échange d’expérience dans les domaines de l’agriculture, du tourisme et autres. La signature d’un partenariat ou d’un protocole d’accord entre les autorités des deux villes est également prévue, en vue du jumelage.\n\n'
//           'Soulignons  que cette audience a eu lieu au moment où la mairie de Pointe-Noire est paralysée, depuis le 17 mai dernier, par une grève de ses  agents.Séverin Ibara',
//       category: Category.Societe,
//       source: 'Adiac',
//       section: 'journal',
//       publicationDate: DateTime(2023, 5, 24, 15, 15),
//       isBreakingNews: true,
//     ),
//     Article(
//       image: 'assets/images/article_4.png',
//       title: 'Musique: des artistes ivoiriens invités au Fespam',
//       summary:
//           'Les artistes ivoiriens sont invités à participer à la 11e édition du  Festival panafricain de musique (Fespam) qui aura lieu du 15 au 22 juillet prochain, à Brazzaville.',
//       content:
//           'L’invitation a été transmise à la ministre ivoirienne de la Culture et de la Francophonie, Françoise Remarck, par son homologue congolaise, Lydie Pongault, en marge du Salon international du livre d’Abidjan (Sila) qui s’est tenu du 9 au 13 mai dernier et  dont la République du Congo avait été l’invitée d’honneur.\n\n'
//           'Au cours de ces retrouvailles marquées à la fois par les allocutions et les ateliers, la délégation congolaise, forte d’une dizaine d’écrivains et d’autres professionnels du livre, a eu des échanges fructueux avec tous ses partenaires. Des prises de parole des autorités ivoiriennes, il en ressort une reconnaissance du rayonnement international de la littérature congolaise ; la nécessité de penser le livre comme levier de l’inclusion sociale et du développement des économies, à travers notamment la mise en place des industries culturelles et créatives et le renforcement des liens d’amitié et de la coopération culturelle entre le Congo et la Côte d’Ivoire.\n\n'
//           'Par ailleurs, les discussions entre les deux ministres, qui ont eu lieu en marge du salon, ont porté essentiellement sur la mise en application de l’Accord de coopération culturelle et artistique entre le Congo et la Côte d’Ivoire du 22 novembre 2022 ; le statut et le cadre juridique de l’artiste et des professionnels de la culture et des arts ; la restitution des œuvres d’art africain ; la réforme du corpus juridique réglementant le fonctionnement des institutions en charge de la gestion collective que sont le Bureau ivoirien du droit d’auteur et le Bureau congolais du droit d’auteur ; le développement des industries culturelles et créatives, à travers la création ou l’augmentation des fonds dédiés à la création et à l’action culturelle ; les formations professionnalisantes dans les domaines artistiques et d’expertise culturelle ; l’appui ou la relance des centres de lecture et d’animation culturelle en zones urbaines et rurales ; la construction ou la rénovation d’infrastructures culturelles ainsi que la préservation du patrimoine.\n\n'
//           'En effet, la participation du Congo au Sila constitue un premier pas dans la démarche de mise en application de l’accord susmentionné. De plus, il s’agit également de la nécessité d’un dialogue ouvert avec les experts des pays africains au sujet de la restitution des œuvres d’art, laquelle est régie par le Rapport Jean Luc Martinez, loi-cadre fixant les critères de restitution des œuvres dans le but de faire bloc et de repenser les critères jugés européo-centrés. De la même manière, la participation du Congo au Sila devrait permettre d’établir des objectifs chiffrés en termes d’organisation d’événements culturels dans les grandes villes et dans l’hinterland afin d’apporter un dynamisme aux vies culturelles nationales.      Roger Ngombé',
//       category: Category.Culture,
//       source: 'Adiac',
//       section: 'journal',
//       publicationDate: DateTime(2023, 5, 24, 15, 23),
//       isBreakingNews: false,
//     ),
//     Article(
//       image: 'assets/images/article_5.png',
//       title:
//           'Nigeria : le nouveau président oriente le développement numérique sur sept axes stratégiques',
//       summary:
//           'Durant sa présidence démarrée en mai 2015, Muhammadu Buhari, le président sortant, a réussi à faire briller le Nigeria sur la scène technologique et numérique internationale. Pour les quatre prochaines années, son successeur veut faire encore mieux.',
//       content:
//           'Bola Tinubu (photo) a prêté serment le lundi 29 mai à Abuja pour devenir officiellement le nouveau président du Nigeria. Elu le 25 février, l’ex-gouverneur de l’Etat de Lagos croit au pouvoir catalyseur du numérique pour le développement du pays.'
//           'Il a prévu à cet effet un programme qui se concentre sur sept domaines à savoir l’innovation et l’entreprenariat, la fourniture de services et l’externalisation, la fabrication des produits technologiques, le commerce électronique, la numérisation des services publics, la large bande et la blockchain.\n\n'
//           'L’administration Tinubu prévoit de mettre en œuvre des politiques pour soutenir les opportunités de financement locales et l’accès au capital pour encourager les investisseurs étrangers à continuer d’investir au Nigeria. Des politiques visant à former et renforcer les capacités des jeunes dans le domaine des TIC seront également élaborées.\n\n'
//           'Une autre industrie de l’écosystème technologique nigérian que le programme promet de développer est le secteur du commerce électronique en modernisant l’infrastructure nationale de transport du pays, afin d’offrir des services à l’échelle nationale et de répondre aux besoins des consommateurs dans tout le pays.\n\n'
//           'Des investissements dans la fabrication des produits technologiques sont également prévus, car elle présente selon le programme une autre opportunité importante pour la création d’emplois au Nigeria. Ainsi, l’importation de smartphones sera remplacée par l’assemblage local pour le développement du secteur manufacturier technologique.\n\n'
//           'Concernant la Blockchain, le nouveau président envisage de réformer la politique gouvernementale pour encourager l’utilisation prudente de cette nouvelle technologie dans la finance et la banque, la gestion des identités, la collecte des revenus et l’utilisation des crypto-actifs.'
//           'Conscient que tous ces projets ne se réaliseront pas sans une bonne connectivité Internet, le nouveau chef d’Etat ambitionne d’ici deux ans d’accroître la large bande et de fournir des services haut débit à 90 % de la population. Actuellement, le réseau national de fibre optique du Nigeria est achevé à 98 %, selon le gouvernement.\n\n'
//           'La couverture Internet universelle permettra ainsi l’utilisation des services publics qui seront davantage mis en ligne dans les prochains mois, selon le chef de l’Etat.'
//           'Pour les 24 premiers mois de son mandant, M. Tinubu mise sur la création d’un million d’emplois dans le secteur des TIC.',
//       category: Category.Afrique,
//       source: 'We are Tech',
//       section: 'Divers',
//       publicationDate: DateTime(2023, 5, 31, 08, 40),
//       isBreakingNews: true,
//     ),
//     Article(
//       image: 'assets/images/article_5.png',
//       title:
//           'Nigeria : le nouveau président oriente le développement numérique sur sept axes stratégiques',
//       summary:
//           'Durant sa présidence démarrée en mai 2015, Muhammadu Buhari, le président sortant, a réussi à faire briller le Nigeria sur la scène technologique et numérique internationale. Pour les quatre prochaines années, son successeur veut faire encore mieux.',
//       content:
//           'Bola Tinubu (photo) a prêté serment le lundi 29 mai à Abuja pour devenir officiellement le nouveau président du Nigeria. Elu le 25 février, l’ex-gouverneur de l’Etat de Lagos croit au pouvoir catalyseur du numérique pour le développement du pays.'
//           'Il a prévu à cet effet un programme qui se concentre sur sept domaines à savoir l’innovation et l’entreprenariat, la fourniture de services et l’externalisation, la fabrication des produits technologiques, le commerce électronique, la numérisation des services publics, la large bande et la blockchain.\n\n'
//           'L’administration Tinubu prévoit de mettre en œuvre des politiques pour soutenir les opportunités de financement locales et l’accès au capital pour encourager les investisseurs étrangers à continuer d’investir au Nigeria. Des politiques visant à former et renforcer les capacités des jeunes dans le domaine des TIC seront également élaborées.\n\n'
//           'Une autre industrie de l’écosystème technologique nigérian que le programme promet de développer est le secteur du commerce électronique en modernisant l’infrastructure nationale de transport du pays, afin d’offrir des services à l’échelle nationale et de répondre aux besoins des consommateurs dans tout le pays.\n\n'
//           'Des investissements dans la fabrication des produits technologiques sont également prévus, car elle présente selon le programme une autre opportunité importante pour la création d’emplois au Nigeria. Ainsi, l’importation de smartphones sera remplacée par l’assemblage local pour le développement du secteur manufacturier technologique.\n\n'
//           'Concernant la Blockchain, le nouveau président envisage de réformer la politique gouvernementale pour encourager l’utilisation prudente de cette nouvelle technologie dans la finance et la banque, la gestion des identités, la collecte des revenus et l’utilisation des crypto-actifs.'
//           'Conscient que tous ces projets ne se réaliseront pas sans une bonne connectivité Internet, le nouveau chef d’Etat ambitionne d’ici deux ans d’accroître la large bande et de fournir des services haut débit à 90 % de la population. Actuellement, le réseau national de fibre optique du Nigeria est achevé à 98 %, selon le gouvernement.\n\n'
//           'La couverture Internet universelle permettra ainsi l’utilisation des services publics qui seront davantage mis en ligne dans les prochains mois, selon le chef de l’Etat.'
//           'Pour les 24 premiers mois de son mandant, M. Tinubu mise sur la création d’un million d’emplois dans le secteur des TIC.',
//       category: Category.Afrique,
//       source: 'We are Tech',
//       section: 'Divers',
//       publicationDate: DateTime(2023, 5, 31, 08, 40),
//       isBreakingNews: true,
//     ),
//   ];

//   List<Article> get articles => _articles;
// }

class ArticleListProvider extends ChangeNotifier {
  List<Article> listOfArticle = [];

  void addArticle(Article article) {
    listOfArticle.add(article);
    notifyListeners();
  }

  bool areArticlesEqual(List<Article> newArticles, List<Article> oldArticles) {
    if (newArticles.length != oldArticles.length) {
      return false;
    }

    for (int i = 0; i < newArticles.length; i++) {
      if (newArticles[i] != oldArticles[i]) {
        return false;
      }
    }

    return true; // Les listes sont égales
  }

  listArticles() async {
    List<Article> listOfNewArticles = [];
    // Pour effectuer le fetch des nouveaux articles depuis l'API
    List<dynamic> newArticles = await getArticles();
    
    //Pour convertir les données de la liste Map en liste des articles 
    listOfNewArticles = newArticles.map((article) => Article.fromMap(article)).toList();
    listOfArticle.clear();

    // Pour vérifier si les nouveaux articles sont différentes des articles actuels
    if (!areArticlesEqual(listOfArticle, listOfNewArticles)) {
      // Mettre à jour seulement les catégories qui ont changé
      listOfArticle.clear();
      listOfArticle.addAll(listOfNewArticles);
      notifyListeners();
      return true; // Catégories mises à jour avec succès
    } else {
      return false; // Aucun changement dans les catégories
    }
  }

  Future<List<Article>> listOfArticles() async {
    List<dynamic> articles = await getArticles();
    final listOfArticles = articles.map((article) => Article.fromMap(article)).toList();
    return listOfArticles;
  }
}
