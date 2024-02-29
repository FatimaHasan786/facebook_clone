// ignore_for_file: prefer_const_constructors
import 'package:facebook_app/config/palatte.dart';
import 'package:facebook_app/models/post_model.dart';
import 'package:facebook_app/widgets/circle_button.dart';
import 'package:facebook_app/widgets/create_post_container.dart';
import 'package:facebook_app/widgets/post_container.dart';
import 'package:facebook_app/widgets/rooms.dart';
import 'package:facebook_app/widgets/stories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../data/data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: Colors.white,
            title: Text(
              "facebook",
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(
              icon: Icons.search, 
              iconSize: 30, 
              onPressed: () => print("Search"),
              ),
              CircleButton(
              icon: MdiIcons.facebookMessenger, 
              iconSize: 30, 
              onPressed: () => print("Messenger"),
              )
            ],
          ),
          SliverToBoxAdapter(
            child:
            CreatePostContainer(currentUser:currentUser),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: 
              Rooms(onlineUsers:onlineUsers),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 5 , 0, 5),
            sliver: SliverToBoxAdapter(
              child: 
              Stories(currentUser:currentUser, stories:stories),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final Post post = posts[index];
              return PostContainer(post: post);
              },
              childCount: posts.length,
            ),
            ),
        ],
      ),
    );
  }
}