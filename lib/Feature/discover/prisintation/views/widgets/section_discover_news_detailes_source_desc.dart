import 'package:flutter/material.dart';
import 'package:untitled4/Feature/discover/data/models/categores_model/source.dart';
import 'package:untitled4/core/utils/app_styles.dart';
import 'package:untitled4/core/utils/constant.dart';

class SectionDisvoverNewsDetailesSourceAndDesc extends StatelessWidget {
  const SectionDisvoverNewsDetailesSourceAndDesc({
    super.key,
    required this.source,
  });

  final Source source;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              source.name ?? 'no name',
              style: AppTextStyles.style26.copyWith(
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              source.description ?? 'no description',
              style: const TextStyle(
                fontSize: 20.0,
                fontFamily: kFontFamilyRobotoSlab,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
