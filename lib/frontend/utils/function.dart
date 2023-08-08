  import 'package:provider/provider.dart';

import '../../backend/services/article_services.dart';
import '../../backend/services/category_services.dart';
import '../../backend/services/edition_services.dart';
import '../../backend/services/video_services.dart';

  CategoryProvider(context) {
    final categoryProvider =
        Provider.of<CategoryListProvider>(context, listen: false);
    categoryProvider.listCategories();
  }

  ArticleProvider(context) {
    final articleProvider =
        Provider.of<ArticleListProvider>(context, listen: false);
    articleProvider.listArticles();
  }

  VideoProvider(context) {
    final videoProvider =
        Provider.of<VideoListProvider>(context, listen: false);
    videoProvider.listVideos();
  }

  EditionProvider(context) {
    final editionProvider =
        Provider.of<EditionListProvider>(context, listen: false);
    editionProvider.listEditions();
  }