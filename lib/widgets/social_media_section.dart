import 'package:flutter/material.dart';
import 'package:litoral_na_mao/widgets/social_media_icon.dart';
import 'package:unicons/unicons.dart';
import 'package:ionicons/ionicons.dart';

class SocialMediaSection extends StatelessWidget {
  const SocialMediaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: const Row(
        children: [
          SocialMediaIcon(
              icon: UniconsLine.facebook_f,
              color: Color.fromRGBO(59, 89, 151, 1)),
          SizedBox(
            width: 10,
          ),
          SocialMediaIcon(
              icon: UniconsLine.twitter,
              color: Color.fromRGBO(65, 183, 216, 1)),
          SizedBox(
            width: 10,
          ),
          SocialMediaIcon(
              icon: UniconsLine.youtube,
              color: Color.fromRGBO(178, 178, 178, 1)),
          SizedBox(
            width: 10,
          ),
          SocialMediaIcon(
              icon: Ionicons.logo_pinterest,
              color: Color.fromRGBO(203, 32, 39, 1)),
          SizedBox(
            width: 10,
          ),
          SocialMediaIcon(
              icon: UniconsLine.instagram,
              color: Color.fromRGBO(61, 115, 156, 1)),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
