// ignore_for_file: prefer_const_constructors

import 'package:facebook_app/config/palatte.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {

  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomTabBar({super.key, required this.icons, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Palette.facebookBlue,
            width: 3.0,
          ),
        ),
      ),
      tabs: icons
      .asMap()
      .map((i,e) => MapEntry(
          i,
        Tab(
          icon: Icon(
            e,
            color: i == selectedIndex
            ? Palette.facebookBlue
            : Color.fromARGB(255, 98, 95, 95),
            size: 30,
            ),
        ),
        ),
        )
        .values
        .toList(),
        onTap: onTap,
    );
  }
}