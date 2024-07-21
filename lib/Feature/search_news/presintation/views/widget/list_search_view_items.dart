import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/Feature/search_news/presintation/manager/search_news_cubit/search_news_cubit.dart';
import 'package:untitled4/Feature/search_news/presintation/views/widget/custom_items_search.dart';
import 'package:untitled4/core/utils/app_styles.dart';

class ListItemsSearch extends StatelessWidget {
  const ListItemsSearch({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchNewsCubit, SearchNewsState>(
      builder: (context, state) {
        if (state is SearchNewsLoading) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is SearchNewsSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (state.listnewsModels[0].articles!.isNotEmpty) {
                return CustomItemsNewsSearch(
                  article: state.listnewsModels[0].articles![index],
                );
              }
              return null;
            }),
          );
        } else if (state is SearchNewsFaliure) {
          return SliverToBoxAdapter(
            child: Text(state.errMesage),
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(
                child: Text(
              'Now Search',
              style: AppTextStyles.style20.copyWith(
                color: Colors.black,
                fontSize: 24.0,
              ),
            )),
          );
        }
      },
    );
  }
}
