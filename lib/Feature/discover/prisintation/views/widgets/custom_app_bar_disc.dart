import 'package:flutter/material.dart';
import 'package:untitled4/core/utils/app_styles.dart';

class CustomAppBarDiscover extends StatelessWidget {
  const CustomAppBarDiscover({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Discover',
          style: AppTextStyles.style26.copyWith(
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          'News From around the wourld',
          style: AppTextStyles.style20.copyWith(
            color: Colors.black.withOpacity(.4),
            fontSize: 18.0,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
