import 'package:flutter/material.dart';
import 'package:untitled4/core/utils/constant.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    required this.onPressed,
    required this.icon,
    this.backgroundColorIcon,
    this.radiusCircleAvatar,
  });
  final void Function()? onPressed;
  final Widget icon;
  final Color? backgroundColorIcon;
  final double? radiusCircleAvatar;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radiusCircleAvatar ?? kradiusCircleAvatar,
      foregroundColor: Colors.black,
      backgroundColor: backgroundColorIcon ?? kPrimaryColorsCircleAvatar,
      child: IconButton(
        onPressed: onPressed,
        icon: Align(
          alignment: Alignment.center,
          child: icon,
        ),
      ),
    );
  }
}
