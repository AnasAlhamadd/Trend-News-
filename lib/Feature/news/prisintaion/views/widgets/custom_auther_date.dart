import 'package:flutter/material.dart';
import 'package:untitled4/core/utils/app_color.dart';
import 'package:untitled4/core/widgets/custom_formate_date.dart';

class CustomAutherAndDatePost extends StatelessWidget {
  const CustomAutherAndDatePost(
      {super.key, required this.auther, required this.date});
  final String auther;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: .4,
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: Text(auther,
                maxLines: 1,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Appcolor.kpirmaryAuther,
                  fontSize: 15,
                )),
          ),
          Text(
            getDate(date),
            style: const TextStyle(
              color: Appcolor.kpirmaryAuther,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
