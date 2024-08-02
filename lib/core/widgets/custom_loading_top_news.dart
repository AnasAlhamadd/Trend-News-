import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingTopNewsShimmmer extends StatelessWidget {
  const CustomLoadingTopNewsShimmmer({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Opacity(
          opacity: 0.90,
          child: AspectRatio(
            aspectRatio: 3 / 1.5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
