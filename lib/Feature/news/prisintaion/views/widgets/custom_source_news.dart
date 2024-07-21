import 'package:flutter/material.dart';
import 'package:untitled4/core/utils/app_color.dart';
import 'package:untitled4/core/utils/app_styles.dart';

class CustomSourceNews extends StatelessWidget {
  const CustomSourceNews({super.key, required this.source});
  final String source;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8.0),
          bottomLeft: Radius.circular(8.0),
        ),
        color: Appcolor.kRadiusColor,
      ),
      child: Text(
        source,
        style: AppTextStyles.style20,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }
}
