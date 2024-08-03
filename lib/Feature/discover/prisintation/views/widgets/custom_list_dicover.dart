import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/Feature/discover/prisintation/manager/categores_cubit/category_cubit.dart';
import 'package:untitled4/Feature/discover/prisintation/views/widgets/custom_items_discover.dart';
import 'package:untitled4/core/widgets/custom_loading_explore_shimmer.dart';

class CustomListDiscover extends StatelessWidget {
  const CustomListDiscover({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryFaliure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errMesage),
            ),
          );
        } else if (state is CategorySuccess) {
          return SliverList.builder(
              itemCount: state.listCategory[0].sources!.length,
              itemBuilder: (context, index) {
                return CustomItemsNewsDiscover(
                  sourceModel: state.listCategory[0].sources![index],
                );
              });
        } else {
          return SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) =>
                const CustomLoadinItemsNewsShimmer(isExploreOrNot: false),
          );
        }
      },
    );
  }
}
