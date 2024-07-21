import 'package:flutter/cupertino.dart';
import 'package:untitled4/Feature/news/data/models/news_models/news_models.dart';

void animateSlider(
    PageController pageController, List<NewsModels> listnewsModels) {
  Future.delayed(const Duration(seconds: 5)).then(
    (_) {
      int nextPage = pageController.page!.round() + 1;

      //!  nextPage  >= 10 for Make a stop before  the data completely
      if (nextPage == listnewsModels.length || nextPage >= 10) {
        nextPage = 0;
      }

      pageController
          .animateToPage(
            nextPage,
            duration: const Duration(seconds: 2),
            curve: Curves.linear,
          )
          .then((_) =>
              animateSlider(pageController, listnewsModels)); // recursion
    },
  );
}
