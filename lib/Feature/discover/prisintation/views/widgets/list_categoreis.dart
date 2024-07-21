import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/Feature/discover/prisintation/manager/categores_cubit/category_cubit.dart';
import 'package:untitled4/Feature/discover/prisintation/views/widgets/list_name_categories.dart';
import 'package:untitled4/core/utils/app_color.dart';
import 'package:untitled4/core/utils/app_styles.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 40.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return MaterialButton(
            onPressed: () {
              BlocProvider.of<CategoryCubit>(context).getItemsByCategors(
                category: categores[index],
              );
            },
            color: Appcolor.kprimaryColor,
            splashColor: Colors.grey[400],
            shape: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(22.0),
                topLeft: Radius.circular(18.0),
              ),
            ),
            child: Row(
              children: [
                Text(
                  categores[index],
                  style: AppTextStyles.style20,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 8.0,
          );
        },
        itemCount: categores.length,
      ),
    );
  }
}
