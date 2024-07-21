import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled4/Feature/search_news/presintation/views/widget/search_news_view_body.dart';
import 'package:untitled4/core/utils/app_color.dart';
import 'package:untitled4/core/utils/app_styles.dart';

class SearchNews extends StatelessWidget {
  const SearchNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search News',
          style: AppTextStyles.style26,
        ),
        backgroundColor: Appcolor.kprimaryColor,
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              FontAwesomeIcons.arrowLeft,
              color: Appcolor.white,
            )),
      ),
      body: const SearchNewsViewBody(),
    );
  }
}
