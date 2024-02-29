// ignore_for_file: prefer_const_constructors

import 'package:facebook_app/models/user_model.dart';
import 'package:facebook_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {

  final List<User> onlineUsers;

  const Rooms({super.key,required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 4,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, int index){
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _CreateRoomButton(),
             );
          }
          final User user = onlineUsers[index-1];          
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ProfileAvatar(
              imageUrl: user.imageUrl,
              isActive: true,
              ),
            );
        }
        ),
    );
  }
}


class _CreateRoomButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => print("Create room") ,
         style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
          side: BorderSide(width:3, color:Colors.blue),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
          ),
         ),
         child: Row(
          children: [
            Icon(
              Icons.video_call,
              size: 30.0,
              color: Colors.purple,
            ),
            const SizedBox(width:4.0),
            Text('Create\nRoom',
            style: TextStyle(
              color: Colors.blue
            ),),

          ],
        ),
    );
  }
} 