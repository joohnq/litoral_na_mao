import 'package:flutter/material.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({super.key, required this.icon, this.color});

  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: color,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
