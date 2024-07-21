import 'package:flutter/material.dart';
import 'package:untitled4/Feature/discover/data/models/categores_model/source.dart';
import 'package:untitled4/Feature/discover/prisintation/views/widgets/discover_items_detailes_viewbody.dart';

class DiscoverDetailes extends StatelessWidget {
  const DiscoverDetailes({super.key, required this.sourceModel});
  final Source sourceModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DiscoverItemsDetailes(
        sourceModel: sourceModel,
      ),
    );
  }
}
