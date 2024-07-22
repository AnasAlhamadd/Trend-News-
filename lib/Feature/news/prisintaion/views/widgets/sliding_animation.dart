import 'package:flutter/material.dart';
import 'package:untitled4/Feature/news/data/models/news_models/news_models.dart';
import 'package:untitled4/Feature/news/prisintaion/views/widgets/custom_items_top_news.dart';

class SlidingAnimation extends StatelessWidget {
  const SlidingAnimation({
    super.key,
    required this.scalle,
    required this.index,
    required this.listnewsmodels,
  });

  final double scalle;
  final int index;
  final List<NewsModels> listnewsmodels;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(
        begin: scalle,
        end: scalle,
      ),
      duration: const Duration(seconds: 1),
      // curve: Easing.linear,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value.toDouble(),
          child: child,
        );
      },
      child: CustomItemsTopNews(
        listnewsModel: listnewsmodels,
        index: index,
      ),
    );
  }
}

// List<Widget> listimage = [
//   CustomItemsNewsTopHeadlines(listnewsModel: )
// ];
