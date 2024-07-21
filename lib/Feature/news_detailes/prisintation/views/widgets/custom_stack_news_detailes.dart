import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled4/Feature/news/data/models/news_models/article.dart';
import 'package:untitled4/Feature/news/prisintaion/views/widgets/custom_source_news.dart';
import 'package:untitled4/Feature/news_detailes/prisintation/views/widgets/cutsom_sharingnews.dart';
import 'package:untitled4/core/utils/app_styles.dart';
import 'package:untitled4/core/utils/constant.dart';

class CustomStackNewsDetailes extends StatelessWidget {
  const CustomStackNewsDetailes({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: .90,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image(
              image: CachedNetworkImageProvider(
                  article.urlToImage ?? kPhotoNewsUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const CustomSharingNewsAndArrawoBack(),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.1,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSourceNews(
                source: article.source!.name ?? 'noun',
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  article.title ?? 'Title News',
                  maxLines: 3,
                  style: AppTextStyles.style26,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
