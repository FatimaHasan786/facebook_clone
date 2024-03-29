// ignore_for_file: prefer_const_constructors
import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_app/config/palatte.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {

  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar({super.key,required this.imageUrl,  this.isActive=false, this.hasBorder=false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
                radius:hasBorder?17 :20,
                backgroundColor: Colors.grey,
                backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
        ),
        isActive?
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: Palette.online,
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: Colors.white,
              )
            ),
          ),
          )
          : SizedBox.shrink(),
      ],
    );
  }
} 