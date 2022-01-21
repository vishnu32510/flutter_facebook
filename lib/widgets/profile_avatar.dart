import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook/config/palette.dart';
import 'package:flutter_facebook/data/data.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar(
      {Key? key, required this.imageUrl, this.isActive = false, this.hasBorder = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Palette.facebookBlue,
          radius: 20,
          child: CircleAvatar(
            radius: hasBorder? 17:20,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
        ),
        !isActive
            ? SizedBox()
            : Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Palette.online,
                      border: Border.all(width: 2, color: Colors.white)),
                ),
              )
      ],
    );
  }
}
