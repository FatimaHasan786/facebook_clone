import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {

  final IconData icon;
  final double iconSize;
  final Function onPressed;

  const CircleButton({super.key, required this.icon, required this.iconSize, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[200],
        ),
          child: IconButton(
            icon: Icon(icon,
            color: Colors.black,),
            iconSize: iconSize,
            onPressed: onPressed(),
          ),
        ); 
  }
}
