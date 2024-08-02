import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled4/Feature/news/prisintaion/manager/explore_cubit/explore_cubit.dart';
import 'package:untitled4/Feature/news/prisintaion/views/widgets/custom_items_news_explore.dart';
import 'package:untitled4/core/utils/app_router.dart';
import 'package:untitled4/core/widgets/custom_loadin_explore_shimmer.dart';

class ListExplore extends StatelessWidget {
  const ListExplore({super.key});

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
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    AppRouter.kNewsDetailes,
                    extra: state.listnewsModels[0].articles![index],
                  );
                },
                child: CustomItemsNewsExplore(
                  article: state.listnewsModels[0].articles![index],
                ),
              ),
              childCount: state.listnewsModels[0].articles!.length,
            ),
          );
        } else {
          return SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) => const CustomLoadinExploreShimmer(),
          );
        }
      },
    );
  }
}
