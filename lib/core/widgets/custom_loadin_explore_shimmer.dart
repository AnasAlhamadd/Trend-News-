import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadinExploreShimmer extends StatelessWidget {
  const CustomLoadinExploreShimmer({
    super.key,
  });
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
                color: Colors.white,
                child: const Text('data data data data data'),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 30.0,
                color: Colors.white,
                child: const Text('datadatadatadatadata'),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .5,
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                  ),
                  color: Colors.white,
                ),
                child: Text('data data'),
              ),
              const SizedBox(
                height: 5.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
