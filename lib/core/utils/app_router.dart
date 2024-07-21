import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled4/Feature/discover/data/models/categores_model/source.dart';
import 'package:untitled4/Feature/discover/prisintation/views/discover_items_detailes.dart';
import 'package:untitled4/Feature/lasted_news/manager/lasted_news_cubit/lasted_news_cubit.dart';
import 'package:untitled4/Feature/news/data/models/news_models/article.dart';
import 'package:untitled4/Feature/news/data/repo/news_repo_imp.dart';
import 'package:untitled4/Feature/news/prisintaion/views/news.dart';
import 'package:untitled4/Feature/news_detailes/prisintation/views/news_detailes.dart';
import 'package:untitled4/Feature/search_news/data/repo/search_repo_imp.dart';
import 'package:untitled4/Feature/search_news/presintation/manager/search_news_cubit/search_news_cubit.dart';
import 'package:untitled4/Feature/search_news/search_news.dart';
import 'package:untitled4/core/services/service_locater.dart';

abstract class AppRouter {
  static const String kNewsBody = '/';
  static const String kNewsDetailes = '/kNewsDetailes';
  static const String kDiscoverItemsDetailes = '/discoverItemsDetailes';
  static const String kSearchNews = '/kSearchNews';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kNewsBody,
        builder: (context, state) => const NewsBody(),
      ),
      GoRoute(
        path: kNewsDetailes,
        builder: (context, state) => BlocProvider(
          create: (context) => LastedNewsCubit(
            getIt.get<NewsRepoImp>(),
          ),
          child: NewsDetailes(
            article: state.extra as Article,
          ),
        ),
      ),
      GoRoute(
        path: kDiscoverItemsDetailes,
        builder: (context, state) => DiscoverDetailes(
          sourceModel: state.extra as Source,
        ),
      ),
      GoRoute(
        path: kSearchNews,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchNewsCubit(
            getIt.get<SearchRepoImp>(),
          ),
          child: const SearchNews(),
        ),
      ),
    ],
  );
}
