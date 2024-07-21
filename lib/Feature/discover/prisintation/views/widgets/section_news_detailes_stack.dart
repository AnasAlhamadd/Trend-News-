import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled4/Feature/discover/data/models/categores_model/source.dart';
import 'package:untitled4/Feature/news/prisintaion/views/widgets/custom_source_news.dart';
import 'package:untitled4/Feature/news_detailes/prisintation/views/widgets/cutsom_sharingnews.dart';
import 'package:untitled4/core/utils/app_color.dart';
import 'package:untitled4/core/utils/app_styles.dart';
import 'package:untitled4/core/utils/constant.dart';

class SectionDisoverNewsDetailesStack extends StatelessWidget {
  const SectionDisoverNewsDetailesStack(
      {super.key, required this.isAppBarActive, required this.source});
  final bool isAppBarActive;
  final Source source;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.45;
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
            title: const Text(
              'Title News',
              style: AppTextStyles.style26,
            ),
          )
        : SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: height,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Opacity(
                    opacity: .90,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: const Image(
                        image: CachedNetworkImageProvider(kPhotoNewsUrl),
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
                          source: source.category ?? 'no source',
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ],
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
