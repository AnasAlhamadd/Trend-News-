import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled4/Feature/saved_news/prisintation/views/widgets/saved_news_view_body.dart';
import 'package:untitled4/core/utils/app_color.dart';
import 'package:untitled4/core/utils/app_styles.dart';

class SavedNews extends StatelessWidget {
  const SavedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.kprimaryColor,
        centerTitle: true,
        title: const Text(
          'Saved News ',
          style: AppTextStyles.style26,
        ),
      ),
      body: const SavedNewsViewBody(),
    );
  }
}
