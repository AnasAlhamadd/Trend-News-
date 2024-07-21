import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled4/Feature/news/prisintaion/views/widgets/custom_circle_avatar.dart';

class CustomSharingNewsAndArrawoBack extends StatelessWidget {
  const CustomSharingNewsAndArrawoBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        children: [
          CustomCircleAvatar(
            radiusCircleAvatar: 22.0,
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          const Spacer(),
          CustomCircleAvatar(
            radiusCircleAvatar: 22.0,
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.share,
            ),
          ),
        ],
      ),
    );
  }
}
