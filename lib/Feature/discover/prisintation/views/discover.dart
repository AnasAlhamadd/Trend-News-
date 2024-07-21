import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/Feature/discover/data/repo/discover_repo_imp.dart';
import 'package:untitled4/Feature/discover/prisintation/manager/categores_cubit/category_cubit.dart';
import 'package:untitled4/Feature/discover/prisintation/views/widgets/discover_view_body.dart';
import 'package:untitled4/core/services/service_locater.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(
        getIt.get<DiscoverRepoImp>(),
      )..getItemsByCategors(category: 'business'),
      child: const DiscoverViewBody(),
    );
  }
}
