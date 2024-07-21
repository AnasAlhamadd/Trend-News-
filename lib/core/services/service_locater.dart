import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled4/Feature/discover/data/repo/discover_repo_imp.dart';
import 'package:untitled4/Feature/news/data/repo/news_repo_imp.dart';
import 'package:untitled4/Feature/search_news/data/repo/search_repo_imp.dart';
import 'package:untitled4/Feature/search_news/presintation/manager/search_news_cubit/search_news_cubit.dart';
import 'package:untitled4/core/services/api_services.dart';

GetIt getIt = GetIt.instance;
void serviceLocater() {
  getIt.registerSingleton(ApiServices(Dio()));
  getIt.registerSingleton(
    NewsRepoImp(
      getIt.get<ApiServices>(),
    ),
  );
  getIt.registerSingleton(
    DiscoverRepoImp(
      getIt.get<ApiServices>(),
    ),
  );
  getIt.registerSingleton(SearchRepoImp(
    getIt.get<ApiServices>(),
  ));
}
