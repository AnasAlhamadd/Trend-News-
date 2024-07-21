import 'package:flutter/material.dart';
import 'package:untitled4/Feature/discover/prisintation/views/widgets/custom_app_bar_disc.dart';
import 'package:untitled4/Feature/discover/prisintation/views/widgets/custom_list_dicover.dart';
import 'package:untitled4/Feature/discover/prisintation/views/widgets/list_categoreis.dart';
import 'package:untitled4/core/utils/constant.dart';

class DiscoverViewBody extends StatelessWidget {
  const DiscoverViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: kpaddingScreen,
        right: kpaddingScreen,
        top: 50,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomAppBarDiscover(),
          ),
          SliverToBoxAdapter(
            child: ListCategories(),
          ),
          CustomListDiscover(),
        ],
      ),
    );
  }
}
