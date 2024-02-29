// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_app/config/palatte.dart';
import 'package:facebook_app/models/post_model.dart';
import 'package:facebook_app/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                SizedBox(
                  height: 4,
                ),
                Text(post.caption),
                // ignore: unnecessary_null_comparison
                post.imageUrl != null
                    ? SizedBox.shrink()
                    : SizedBox(
                        height: 6,
                      )
              ],
            ),
          ),
          // ignore: unnecessary_null_comparison
          post.imageUrl != null
              ? Padding(padding: const EdgeInsets.symmetric(vertical: 8),
              child:CachedNetworkImage(imageUrl: post.imageUrl)
              )
              : SizedBox.shrink(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: _PostStats(post:post),
              )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          imageUrl: post.user.imageUrl,
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} .',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
          // ignore: avoid_print
          onPressed: () => print("More"),
          icon: Icon(
            Icons.more_horiz,
          ),
        ),
      ],
    );
  }
}


class _PostStats extends StatelessWidget {

  final Post post;

  const _PostStats({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.facebookBlue,
              ),
              child: Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4,),
            Expanded(
              child: Text("${post.likes}",
              style: TextStyle(
                color: Colors.grey[600],
              ),
              ),
              ),
              Text("${post.comments} Comments",
              style: TextStyle(
                color: Colors.grey[600],
              ),
              ),
              SizedBox(width: 8,),
              Text("${post.shares} Shares",
              style: TextStyle(
                color: Colors.grey[600],
              ),
              ),
          ],
        ),
        const Divider(),
          Row(
            children: [
              _PostButton(
                icon: Icon(
                 MdiIcons.thumbUpOutline,
                 color: Colors.grey[600],
                 size: 20, 
                ),
                label: "Like",
                onTap: () => print("Like"),
              ),
              _PostButton(
                icon: Icon(
                 MdiIcons.commentOutline,
                 color: Colors.grey[600],
                 size: 20, 
                ),
                label: "Comment",
                onTap: () => print("Comment"),
              ),
              _PostButton(
                icon: Icon(
                 MdiIcons. shareOutline,
                 color: Colors.grey[600],
                 size: 25, 
                ),
                label: "Share",
                onTap: () => print("Share"),
              )
            ],
            )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {

final Icon icon;
final String label;
final Function onTap;

  const _PostButton({super.key, required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [
                icon,
                SizedBox(width: 4,),
                Text(label)
              ],
            ),
          ),
        ),
      ),
    );
  }
}