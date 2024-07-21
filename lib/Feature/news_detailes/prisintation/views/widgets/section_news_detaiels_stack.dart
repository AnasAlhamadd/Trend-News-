import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled4/Feature/news/data/models/news_models/article.dart';
import 'package:untitled4/Feature/news_detailes/prisintation/views/widgets/custom_stack_news_detailes.dart';
import 'package:untitled4/core/utils/app_color.dart';
import 'package:untitled4/core/utils/app_styles.dart';

class SectionNewsDetailesStack extends StatelessWidget {
  const SectionNewsDetailesStack(
      {super.key, required this.isAppBarActive, required this.article});
  final bool isAppBarActive;
  final Article article;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.5;
    return isAppBarActive
        ? SliverAppBar(
            backgroundColor: Appcolor.kprimaryColor,
            pinned: true,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 28.0,
                  color: Colors.white,
                )),
            title: Text(
              article.source!.name ?? 'Title News',
              style: AppTextStyles.style26,
            ),
          )
        : SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: height,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: CustomStackNewsDetailes(
                article: article,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                ),
                child: Container(
                  width: 80.0,
                  height: 6.0,
                  decoration: const BoxDecoration(
                    color: Appcolor.kpirmaryAuther,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
