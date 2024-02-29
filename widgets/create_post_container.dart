// ignore_for_file: prefer_const_constructors
 
import 'package:facebook_app/data/data.dart';
import 'package:facebook_app/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class CreatePostContainer  extends StatelessWidget {
  const CreatePostContainer ({super.key, required currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl:currentUser.imageUrl),
              SizedBox(width: 8,),
              Expanded(
              child:TextField(
                decoration: InputDecoration.collapsed(
                  hintText: "What\'s on your mind?"
                ),
              )
              ),
            ],
          ),
          const Divider(
            height: 10,
            thickness: 0.5,
          ),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () => print("Live"),
                  icon: Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label:Text("Live"),
                  ),
          
                  VerticalDivider(width: 8.0,),
          
                  TextButton.icon(
                  onPressed: () => print("Photo"),
                  icon: Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label:Text("Photo"),
                  ),
          
                  VerticalDivider(width: 8.0,),
          
                  TextButton.icon(
                  onPressed: () => print("Room"),
                  icon: Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  label:Text("Room"),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}