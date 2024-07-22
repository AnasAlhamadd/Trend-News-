import 'package:flutter/material.dart';
import 'package:untitled4/Feature/news/prisintaion/views/widgets/list_explore.dart';
import 'package:untitled4/Feature/news/prisintaion/views/widgets/custom_app_bar.dart';
import 'package:untitled4/Feature/news/prisintaion/views/widgets/top_news.dart';
import 'package:untitled4/core/utils/app_styles.dart';

class NewsViewBody extends StatelessWidget {
  const NewsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomAppBarNews(),
          ),
          SliverToBoxAdapter(
            child: Text(
              'Top News',
              style: AppTextStyles.style30,
            ),
          ),
          TopNews(),
          SliverToBoxAdapter(
            child: Text(
              'Explore News',
              style: AppTextStyles.style30,
            ),
          ),
          ListExplore(),
        ],
      ),
    );
  }
}
