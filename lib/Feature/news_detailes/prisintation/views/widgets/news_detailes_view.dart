import 'package:flutter/material.dart';
import 'package:untitled4/Feature/lasted_news/prisintation/views/widgets/list_lasted_news.dart';
import 'package:untitled4/Feature/news/data/models/news_models/article.dart';
import 'package:untitled4/Feature/news_detailes/prisintation/views/widgets/section_news_detaiels_stack.dart';
import 'package:untitled4/Feature/news_detailes/prisintation/views/widgets/section_news_detailes_source_desc.dart';

class NewsDetailesBodyView extends StatefulWidget {
  const NewsDetailesBodyView({
    super.key,
    required this.article,
  });
  final Article article;

  @override
  State<NewsDetailesBodyView> createState() => _NewsDetailesBodyViewState();
}

class _NewsDetailesBodyViewState extends State<NewsDetailesBodyView> {
  //!scroll Controller
  ScrollController scrollController = ScrollController();
  //!Animated AppBar
  bool isAppBarActive = false;
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset > MediaQuery.of(context).size.height * 0.5) {
        setState(() {
          isAppBarActive = true;
        });
      } else {
        setState(() {
          isAppBarActive = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SectionNewsDetailesStack(
            isAppBarActive: isAppBarActive,
            article: widget.article,
          ),
          SectionNewsDetailesSourceAndDesc(
            widget: widget,
          ),
          ListLastedNews(
            source: widget.article.source!.name!,
          ),
        ],
      ),
    );
  }
}
