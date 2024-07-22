import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/Feature/news/data/models/news_models/news_models.dart';
import 'package:untitled4/Feature/news/prisintaion/views/widgets/custom_source_news.dart';
import 'package:untitled4/core/utils/app_styles.dart';
import 'package:untitled4/core/utils/constant.dart';

class CustomItemsTopNews extends StatelessWidget {
  const CustomItemsTopNews(
      {super.key, required this.listnewsModel, required this.index});
  final List<NewsModels> listnewsModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Opacity(
        opacity: 0.90,
        child: AspectRatio(
          aspectRatio: 3 / 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: CachedNetworkImageProvider(
                      listnewsModel[0].articles![index].urlToImage ??
                          kPhotoNewsUrl)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSourceNews(
                    source: listnewsModel[0].articles![index].source!.name!,
                  ),
                  const Spacer(),
                  Text(
                    listnewsModel[0].articles![index].title ?? 'News Title',
                    style: AppTextStyles.style26,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: Text(
                      listnewsModel[0].articles![index].description ??
                          'News Description',
                      maxLines: 2,
                      style: AppTextStyles.style20.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
