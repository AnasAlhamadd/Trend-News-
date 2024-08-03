import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadinItemsNewsShimmer extends StatelessWidget {
  const CustomLoadinItemsNewsShimmer({
    super.key,
    required this.isExploreOrNot,
  });
  final bool isExploreOrNot;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              padding: const EdgeInsets.only(bottom: 10.0),
              width: 100.0,
              height: 100.0,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .09,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30.0,
                color: Colors.white,
                width: isExploreOrNot
                    ? MediaQuery.of(context).size.width * .6
                    : MediaQuery.of(context).size.width * .5,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 30.0,
                color: Colors.white,
                width: MediaQuery.of(context).size.width * .6,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: isExploreOrNot
                    ? MediaQuery.of(context).size.width * .5
                    : MediaQuery.of(context).size.width * .4,
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                  ),
                  color: Colors.white,
                ),
                child: const Text('Test Test'),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
