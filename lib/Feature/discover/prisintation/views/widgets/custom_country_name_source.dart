import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled4/core/utils/app_color.dart';

class CustomCountryAndSourceName extends StatelessWidget {
  const CustomCountryAndSourceName(
      {super.key, required this.country, required this.sourceName});
  final String country;
  final String sourceName;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: .4,
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(country,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Appcolor.kpirmaryAuther,
                  fontSize: 15,
                )),
          ),
          const SizedBox(
            width: 50,
          ),
          Text(
            sourceName,
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
