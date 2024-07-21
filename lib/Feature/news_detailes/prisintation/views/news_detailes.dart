import 'package:flutter/material.dart';
import 'package:untitled4/Feature/news/data/models/news_models/article.dart';
import 'package:untitled4/Feature/news_detailes/prisintation/views/widgets/news_detailes_view.dart';

class NewsDetailes extends StatelessWidget {
  const NewsDetailes({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewsDetailesBodyView(
        article: article,
      ),
    );
  }
}
