import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled4/Feature/news/prisintaion/views/widgets/custom_circle_avatar.dart';
import 'package:untitled4/core/utils/app_router.dart';
import 'package:untitled4/core/utils/constant.dart';

class CustomAppBarNews extends StatelessWidget {
  const CustomAppBarNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          height: 100,
        ),
        CircleAvatar(
          radius: kradiusCircleAvatar,
          backgroundColor: kPrimaryColorsCircleAvatar,
          backgroundImage: const NetworkImage(
            'https://picsum.photos/id/237/200/300',
          ),
        ),
        const Spacer(),
        CustomCircleAvatar(
            onPressed: () {
              context.push(AppRouter.kSearchNews);
            },
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.black.withOpacity(.6),
            )),
        const SizedBox(
          width: 15.0,
        ),
        CustomCircleAvatar(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.bell,
              color: Colors.black.withOpacity(.6),
            )),
      ],
    );
  }
}
