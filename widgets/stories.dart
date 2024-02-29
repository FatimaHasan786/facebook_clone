// ignore_for_file: prefer_const_constructors
import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_app/config/palatte.dart';
import 'package:facebook_app/models/story_model.dart';
import 'package:facebook_app/models/user_model.dart';
import 'package:facebook_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {

  final User currentUser;
  final List<Story> stories;

  const Stories({super.key, required this.currentUser, required this.stories});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 8,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 1+stories.length,
        itemBuilder:(BuildContext context, int index) {
          if (index==0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _StoryCard(
               isAddStory: true,
               currentUser: currentUser, story: stories.first,
              ),
            );
          }
          final Story story = stories[index-1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: _StoryCard(story:story, currentUser: currentUser,),
            );
        }
         ),
    );
  }
}


class _StoryCard extends StatelessWidget {

  final bool isAddStory;
  final User currentUser;
  final Story story;

  const _StoryCard({super.key,this.isAddStory=false, required this.currentUser, required this.story});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
            ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: isAddStory
          ?Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.add),
              iconSize: 30,
              color: Palette.facebookBlue,
              onPressed: () => print("Add to Story"),
            ),
          ) 
          :ProfileAvatar(imageUrl: story.user.imageUrl, hasBorder: !story.isViewed,)
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Text(
              isAddStory? 'Add to Story'
              : story.user.name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
      ],
    ); 
  }
}