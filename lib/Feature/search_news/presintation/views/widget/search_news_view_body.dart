import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/Feature/search_news/presintation/manager/search_news_cubit/search_news_cubit.dart';
import 'package:untitled4/Feature/search_news/presintation/views/widget/custom_textfield_search.dart';
import 'package:untitled4/Feature/search_news/presintation/views/widget/list_search_view_items.dart';
import 'package:untitled4/core/utils/constant.dart';

class SearchNewsViewBody extends StatelessWidget {
  const SearchNewsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formstate = GlobalKey<FormState>();
    String? query;
    return Form(
      key: formstate,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(kpaddingScreen),
              child: Column(
                children: [
                  CustomTextFieldSearch(
                    onPressed: () {
                      if (formstate.currentState!.validate()) {
                        formstate.currentState!.save();

                        //! get data from apiSearch
                        BlocProvider.of<SearchNewsCubit>(context)
                            .getSearchNews(query!);
                      }
                    },
                    onSaved: (val) {
                      query = val;
                    },
                  ),
                ],
              ),
            ),
          ),
          const ListItemsSearch(),
        ],
      ),
    );
  }
}
