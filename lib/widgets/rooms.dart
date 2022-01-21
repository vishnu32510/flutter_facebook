import 'package:flutter/material.dart';
import 'package:flutter_facebook/config/palette.dart';
import 'package:flutter_facebook/models/models.dart';
import 'package:flutter_facebook/widgets/profile_avatar.dart';
import 'package:flutter_facebook/widgets/widgets.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key? key, required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: Container(
        height: 60,
        color: Colors.white,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
            scrollDirection: Axis.horizontal,
            itemCount: 1 + onlineUsers.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: _CreateRoomButton(),
                );
              }
              final User user = onlineUsers[index-1];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ProfileAvatar(imageUrl: user.imageUrl,isActive: true,),
              );
            }),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Colors.white,
      borderSide: BorderSide(
        width: 3,
        color: Colors.blueAccent,
      ),
      textColor: Palette.facebookBlue,
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: Icon(
              Icons.video_call,
              size: 35,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text("Create\nRoom")
        ],
      ),
    );
  }
}
