import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/Feature/news/prisintaion/manager/top_news_cubit/top_news_cubit.dart';
import 'package:untitled4/Feature/news/prisintaion/views/widgets/custom_dot_indicator.dart';
import 'package:untitled4/Feature/news/prisintaion/views/widgets/sliding_animation.dart';
import 'package:untitled4/core/widgets/custom_loading_top_news.dart';

class TopNews extends StatefulWidget {
  const TopNews({super.key});
  @override
  State<TopNews> createState() => _TopHeadLinesNewsViewState();
}

class _TopHeadLinesNewsViewState extends State<TopNews> {
  @override
  void initState() {
    // animateSlider(
    //   pageController: BlocProvider.of<TopNewsCubit>(context).pageController,
    //   listnewsModels: BlocProvider.of<TopNewsCubit>(context).listTopHeadLines,
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopNewsCubit, TopNewsState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<TopNewsCubit>(context);
        if (state is TopNewsFaliure) {
          return Center(
            child: Text(state.errMesage),
          );
        } else if (state is TopNewsSucces) {
          return SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.26,
                  child: PageView.builder(
                      onPageChanged: (int index) {
                        BlocProvider.of<TopNewsCubit>(context).currntPage =
                            index;
                        setState(() {});
                      },
                      physics: const BouncingScrollPhysics(),
                      controller: cubit.pageController,
                      itemCount: state.listTopNews[0].articles!.take(10).length,
                      itemBuilder: (context, index) {
                        //! scale animation
                        var scalle = cubit.currntPage == index ? 1.0 : 0.95;
                        return SlidingAnimation(
                          scalle: scalle,
                          index: index,
                          listnewsmodels: state.listTopNews,
                        );
                      }),
                ),
                CustomDotIndicator(
                  currntPage: cubit.currntPage,
                  listTopHeadLines:
                      state.listTopNews[0].articles!.take(10).toList(),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: CustomLoadingTopNewsShimmmer(),
          );
        }
      },
    );
  }
}
