import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled4/Feature/news/prisintaion/manager/explore_cubit/explore_cubit.dart';
import 'package:untitled4/Feature/news/prisintaion/views/widgets/custom_items_news_explore.dart';
import 'package:untitled4/core/utils/app_router.dart';
import 'package:untitled4/core/widgets/custom_loading_explore_shimmer.dart';

class ListExplore extends StatefulWidget {
  const ListExplore({super.key});

  @override
  State<ListExplore> createState() => _ListExploreState();
}

class _ListExploreState extends State<ListExplore> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<ExploreCubit>().getExploreNews();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        if (state is ExploreFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.errMesage,
              ),
            ),
          );
        } else if (state is ExploreSuccess) {
          final articles = state.listNewsData[0].articles ?? [];

          return SliverToBoxAdapter(
            child: ListView.builder(
              shrinkWrap: true,
              controller: _scrollController,
              itemCount: articles.length + 1,
              itemBuilder: (context, index) {
                if (index < articles.length) {
                  return GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.kNewsDetailes,
                        extra: articles[index],
                      );
                    },
                    child: CustomItemsNewsExplore(
                      article: articles[index],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          );
        } else {
          return SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) =>
                const CustomLoadinItemsNewsShimmer(isExploreOrNot: true),
          );
        }
      },
    );
  }
}
