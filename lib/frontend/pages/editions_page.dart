import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/models/edition.dart';
import 'package:le_grand_magazine/backend/services/edition_services.dart';
import 'package:le_grand_magazine/frontend/themes/colors_theme.dart';
import 'package:le_grand_magazine/frontend/widgets/edition_card.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../utils/app_strings.dart';
import '../widgets/category_chip.dart';

class SavedArticlePage extends StatefulWidget {
  const SavedArticlePage({super.key});

  @override
  State<SavedArticlePage> createState() => _SavedArticlePageState();
}

class _SavedArticlePageState extends State<SavedArticlePage> {
  int _currentCategoryIndex = 0;
  dynamic yearSelected = "Toutes";
  List<String> years = [];
  final AutoScrollController _scrollController = AutoScrollController();
  bool _isAtTop = true;
  // final editions = EditionService().editions;

  List<String> getYears() {
    final currentYear = DateTime.now().year;
    final years = <String>[];

    for (int year = currentYear; year >= 2014; year--) {
      if (years.isEmpty) {
        years.add("Toutes");
      }
      years.add(year.toString());
    }

    return years;
  }

  @override
  void initState() {
    years = getYears();
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _isAtTop = _scrollController.offset <=
            _scrollController.position.minScrollExtent;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final editionProvider = Provider.of<EditionListProvider>(context);
    List<Edition> editions = editionProvider.listOfEdition;
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.saved,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 40,
                  fontFamily: 'DIN')),
          Text(AppStrings.savedDescription,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w400, color: Colors.black)),
          SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryChip(
                    label: years[index],
                    labelColor: _currentCategoryIndex == index
                        ? Colors.white
                        : ColorThemes.primarySwatch,
                    backgroundColor: _currentCategoryIndex == index
                        ? ColorThemes.primarySwatch
                        : Colors.white,
                    onTap: () {
                      setState(() {
                        _currentCategoryIndex = index;
                        yearSelected = years[index];
                      });
                    });
              },
              separatorBuilder: (context, _) {
                return const SizedBox(width: 5);
              },
              itemCount: years.length,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  // height: MediaQuery.of(context).size.height*0.62,
                  physics: const ClampingScrollPhysics(),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return yearSelected ==
                              editions[index].dateEdition.year.toString()
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: EditionCard(
                                title: editions[index].title ?? "",
                                imageUrl: editions[index].imageUrl,
                                dateEdition: editions[index].dateEdition,
                                numero: editions[index].numero,
                                theme: editions[index].theme ?? "",
                                pdfUrl: editions[index].pdfUrl,
                                periode: editions[index].periode,
                              ),
                            )
                          : yearSelected == "Toutes"
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: EditionCard(
                                    title: editions[index].title ?? "",
                                    imageUrl: editions[index].imageUrl,
                                    dateEdition: editions[index].dateEdition,
                                    numero: editions[index].numero,
                                    theme: editions[index].theme ?? "",
                                    pdfUrl: editions[index].pdfUrl,
                                    periode: editions[index].periode,
                                  ),
                                )
                              : const SizedBox.shrink();
                    },
                    separatorBuilder: (context, _) => const SizedBox(height: 5),
                    itemCount: editions.length,
                  ),
                ),
                Visibility(
                  visible: !_isAtTop,
                  child: Positioned(
                    bottom: 10.0,
                    right: 5.0,
                    child: FloatingActionButton(
                      onPressed: () {
                        _scrollController.animateTo(0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: const Icon(Icons.arrow_upward),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
