import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/Feature/news/data/repo/news_repo_imp.dart';
import 'package:untitled4/Feature/news/prisintaion/manager/explore_cubit/explore_cubit.dart';
import 'package:untitled4/Feature/news/prisintaion/manager/top_news_cubit/top_news_cubit.dart';
import 'package:untitled4/bloc_observer.dart';
import 'package:untitled4/core/services/service_locater.dart';
import 'package:untitled4/core/utils/app_router.dart';

void main() {
  serviceLocater();
  Bloc.observer = SimpleBlocObserver();
  runApp(const TrendNewsApp());
}

class TrendNewsApp extends StatelessWidget {
  const TrendNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TopNewsCubit(
            getIt.get<NewsRepoImp>(),
          )..getTopNews(),
        ),
        BlocProvider(
          create: (context) => ExploreCubit(
            getIt.get<NewsRepoImp>(),
          )..getExploreNews(),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
