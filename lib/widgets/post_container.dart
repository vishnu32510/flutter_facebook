import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook/config/palette.dart';
import 'package:flutter_facebook/models/models.dart';
import 'package:flutter_facebook/widgets/profile_avatar.dart';
import 'package:flutter_facebook/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0,vertical: 5),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: Container(
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
                  const SizedBox(
                    height: 4,
                  ),
                  Text(post.caption),
                  post.imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(
                          height: 6,
                        )
                ],
              ),
            ),
            post.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CachedNetworkImage(imageUrl: post.imageUrl.toString()),
                  )
                : SizedBox.shrink(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: _PostStat(post: post),
            )
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user!.imageUrl),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${post.user!.name}",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    "${post.timeAgo} . ",
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12,
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
      ],
    );
  }
}

class _PostStat extends StatelessWidget {
  final Post post;

  const _PostStat({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Palette.facebookBlue, shape: BoxShape.circle),
              child: const Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
                child: Text(
              "${post.likes}",
              style: TextStyle(color: Colors.grey[600]),
            )),
            Text(
              "${post.comments} Comments",
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              "${post.shares} Shared",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
                icon: Icon(
                  MdiIcons.thumbsUpDownOutline,
                  size: 20,
                  color: Colors.grey[600],
                ),
                label: 'Like',
                onTap: () {}),
            _PostButton(
                icon: Icon(
                  MdiIcons.commentOutline,
                  size: 20,
                  color: Colors.grey[600],
                ),
                label: 'Comment',
                onTap: () {}),
            _PostButton(
                icon: Icon(
                  MdiIcons.shareOutline,
                  size: 25,
                  color: Colors.grey[600],
                ),
                label: 'Share',
                onTap: () {}),
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback onTap;
  const _PostButton({Key? key, required this.icon, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4,),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
