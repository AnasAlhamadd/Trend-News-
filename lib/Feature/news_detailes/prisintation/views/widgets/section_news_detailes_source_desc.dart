import 'package:flutter/material.dart';
import 'package:untitled4/Feature/news_detailes/prisintation/views/widgets/news_detailes_view.dart';
import 'package:untitled4/core/utils/app_styles.dart';
import 'package:untitled4/core/utils/constant.dart';

class SectionNewsDetailesSourceAndDesc extends StatelessWidget {
  const SectionNewsDetailesSourceAndDesc({
    super.key,
    required this.widget,
  });

  final NewsDetailesBodyView widget;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.article.source!.name!,
              style: AppTextStyles.style26.copyWith(
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              widget.article.description!,
              style: const TextStyle(
                fontSize: 20.0,
                fontFamily: kFontFamilyRobotoSlab,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Lasted News',
              style: AppTextStyles.style26.copyWith(
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
