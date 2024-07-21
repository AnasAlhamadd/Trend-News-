import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextFieldSearch extends StatelessWidget {
  const CustomTextFieldSearch(
      {super.key, required this.onPressed, required this.onSaved});
  final void Function()? onPressed;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextFormField(
        maxLines: 2,
        minLines: 1,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onSaved: onSaved,
        validator: (val) {
          if (val!.isEmpty) return 'please fill this field , it is required';
          return null;
        },
        decoration: InputDecoration(
            hintText: 'Click here to search',
            prefixIcon: IconButton(
              onPressed: onPressed,
              icon: const Icon(FontAwesomeIcons.magnifyingGlass),
            ),
            border: InputBorder.none,
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.red),
            )),
      ),
    );
  }
}
