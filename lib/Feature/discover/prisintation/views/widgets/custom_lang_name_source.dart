import 'package:flutter/material.dart';
import 'package:untitled4/core/utils/app_color.dart';
import 'package:untitled4/core/widgets/custom_formate_date.dart';

class CustomLanguageAndNameSourceItems extends StatelessWidget {
  const CustomLanguageAndNameSourceItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Opacity(
      opacity: .4,
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: Text('name source',
                maxLines: 1,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Appcolor.kpirmaryAuther,
                  fontSize: 15,
                )),
          ),
          Text(
            'language',
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
