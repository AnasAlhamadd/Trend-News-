import 'package:flutter/material.dart';
import 'package:untitled4/Feature/discover/data/models/categores_model/source.dart';
import 'package:untitled4/Feature/discover/prisintation/views/widgets/section_discover_news_detailes_source_desc.dart';
import 'package:untitled4/Feature/discover/prisintation/views/widgets/section_news_detailes_stack.dart';

class DiscoverItemsDetailes extends StatefulWidget {
  const DiscoverItemsDetailes({super.key, required this.sourceModel});
  final Source sourceModel;

  @override
  State<DiscoverItemsDetailes> createState() => _DiscoverItemsDetailesState();
}

class _DiscoverItemsDetailesState extends State<DiscoverItemsDetailes> {
  //!scroll Controller
  ScrollController scrollController = ScrollController();
  //!Animated AppBar
  bool isAppBarActive = false;
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset > MediaQuery.of(context).size.height * 0.5) {
        setState(() {
          isAppBarActive = true;
        });
      } else {
        setState(() {
          isAppBarActive = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(controller: scrollController, slivers: [
      SectionDisoverNewsDetailesStack(
        isAppBarActive: isAppBarActive,
        source: widget.sourceModel,
      ),
      SectionDisvoverNewsDetailesSourceAndDesc(
        source: widget.sourceModel,
      ),
    ]);
  }
}
