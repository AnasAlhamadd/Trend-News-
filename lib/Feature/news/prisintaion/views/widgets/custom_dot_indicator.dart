import 'package:flutter/material.dart';
import 'package:untitled4/core/utils/app_color.dart';

class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator({
    super.key,
    required this.currntPage,
    required this.listTopHeadLines,
  });
  final int currntPage;
  final List listTopHeadLines;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          listTopHeadLines.length,
          (index) => AnimatedContainer(
            decoration: BoxDecoration(
              color: index == currntPage
                  ? Appcolor.kRadiusColor
                  : Colors.grey[400],
              borderRadius: BorderRadius.circular(12.0),
            ),
            duration: const Duration(
              milliseconds: 700,
            ),
            width: index == currntPage ? 50 : 20,
            height: 10,
            margin: const EdgeInsets.symmetric(
              horizontal: 2.0,
              vertical: 10.0,
            ),
          ),
        )
      ],
    );
  }
}
