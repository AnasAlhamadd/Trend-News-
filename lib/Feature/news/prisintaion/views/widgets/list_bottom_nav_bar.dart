import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<BottomNavigationBarItem> bottomNavigationBarItems = [
  const BottomNavigationBarItem(
    icon: Icon(FontAwesomeIcons.houseChimney),
    label: 'Home',
  ),
  const BottomNavigationBarItem(
    icon: Icon(FontAwesomeIcons.newspaper),
    label: 'discover',
  ),
  const BottomNavigationBarItem(
    label: 'Saved',
    icon: Icon(FontAwesomeIcons.bookmark),
  ),
  const BottomNavigationBarItem(
    label: 'Profile',
    icon: Icon(FontAwesomeIcons.user),
  ),
];
