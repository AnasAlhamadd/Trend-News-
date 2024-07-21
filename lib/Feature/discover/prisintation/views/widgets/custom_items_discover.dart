import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled4/Feature/discover/data/models/categores_model/source.dart';
import 'package:untitled4/Feature/discover/prisintation/manager/categores_cubit/category_cubit.dart';
import 'package:untitled4/Feature/discover/prisintation/views/widgets/custom_country_name_source.dart';
import 'package:untitled4/Feature/news/prisintaion/views/widgets/custom_source_news.dart';
import 'package:untitled4/core/utils/app_router.dart';
import 'package:untitled4/core/utils/app_styles.dart';
import 'package:untitled4/core/utils/constant.dart';

class CustomItemsNewsDiscover extends StatelessWidget {
  const CustomItemsNewsDiscover({
    super.key,
    required this.sourceModel,
  });
  final Source sourceModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.push(
              AppRouter.kDiscoverItemsDetailes,
              extra: sourceModel,
            );
          },
          child: Card(
            shadowColor: Colors.white,
            elevation: .3,
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 20.0,
                top: 10.0,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: CachedNetworkImage(
                        imageUrl: kPhotoNewsUrl,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .09,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCountryAndSourceName(
                        sourceName: sourceModel.country ?? 'noun',
                        country: sourceModel.name ?? 'noun',
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .5,
                        child: Text(
                          sourceModel.description ?? 'noun',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.style20.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      CustomSourceNews(
                        source: sourceModel.category ?? 'noun',
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
