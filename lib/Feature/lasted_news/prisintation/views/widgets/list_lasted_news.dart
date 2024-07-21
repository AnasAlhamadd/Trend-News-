import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled4/Feature/lasted_news/manager/lasted_news_cubit/lasted_news_cubit.dart';
import 'package:untitled4/Feature/news/prisintaion/views/widgets/custom_items_news_explore.dart';
import 'package:untitled4/core/utils/app_router.dart';

class ListLastedNews extends StatefulWidget {
  const ListLastedNews({super.key, required this.source});
  final String source;
  @override
  State<ListLastedNews> createState() => _ListLastedNewsState();
}

class _ListLastedNewsState extends State<ListLastedNews> {
  @override
  void initState() {
    BlocProvider.of<LastedNewsCubit>(context).getDatelastednews(
      source: widget.source,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LastedNewsCubit, LastedNewsState>(
      builder: (context, state) {
        if (state is LastedNewsSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pushReplacement(
                      AppRouter.kNewsDetailes,
                      extra: state.listnewsModels[0].articles![index],
                    );
                  },
                  child: CustomItemsNewsExplore(
                    article: state.listnewsModels[0].articles![index],
                  ),
                ),
              ),
              childCount: state.listnewsModels[0].articles!.length,
            ),
          );
        } else if (state is LastedNewsFaliure) {
          return SliverToBoxAdapter(
            child: Center(
                child: Text(
              state.errMesage,
            )),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
