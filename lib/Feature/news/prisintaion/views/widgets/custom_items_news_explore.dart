import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/Feature/news/data/models/news_models/article.dart';
import 'package:untitled4/Feature/news/prisintaion/views/widgets/custom_auther_date.dart';
import 'package:untitled4/Feature/news/prisintaion/views/widgets/custom_source_news.dart';
import 'package:untitled4/core/utils/app_styles.dart';
import 'package:untitled4/core/utils/constant.dart';

class CustomItemsNewsExplore extends StatelessWidget {
  const CustomItemsNewsExplore({
    super.key,
    required this.article,
  });
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .5,
      color: Colors.white,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SizedBox(
              width: 100.0,
              height: 100.0,
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? kPhotoNewsUrl,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .09,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAutherAndDatePost(
                auther: article.author ?? 'auther noun',
                date: article.publishedAt!,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: Text(
                  article.title ?? 'Title news',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.style20.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              CustomSourceNews(source: article.source!.name ?? 'News Channel'),
              const SizedBox(
                height: 3.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
