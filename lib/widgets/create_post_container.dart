import 'package:flutter/material.dart';
import 'package:flutter_facebook/models/models.dart';
import 'package:flutter_facebook/widgets/widgets.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({Key? key, required this.currentUser})
      : super(key: key);

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
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: "What's on your mind?"),
                )),
              ],
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.videocam,
                        color: Colors.red,
                      ),
                      label: Text("Live")),
                  VerticalDivider(
                    width: 8,
                  ),
                  FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.photo_library,
                        color: Colors.green,
                      ),
                      label: Text("Photo")),
                  VerticalDivider(
                    width: 8,
                  ),
                  FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.video_call,
                        color: Colors.purple,
                      ),
                      label: Text("Room")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
