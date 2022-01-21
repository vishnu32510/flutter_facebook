import 'package:flutter/material.dart';
import 'package:flutter_facebook/config/palette.dart';
import 'package:flutter_facebook/models/models.dart';
import 'package:flutter_facebook/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icon;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomAppBar(
      {Key? key,
      required this.currentUser,
      required this.icon,
      required this.selectedIndex,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(color: Colors.white, boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 2),
          blurRadius: 4,
        ),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "facebook",
              style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
          ),
          Container(
              width: 600,
              height: double.infinity,
              child: CustomTabBar(
                onTap: onTap,
                selectedIndex: selectedIndex,
                icons: icon,
                isBottomIndicator: true
              )),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UserCard(user: currentUser),
              const SizedBox(
                width: 12,
              ),
              CircleButton(icon: Icons.search, iconSize: 30, onPressed: () {}),
              CircleButton(
                  icon: MdiIcons.facebookMessenger,
                  iconSize: 30,
                  onPressed: () {}),
            ],
          ))
        ],
      ),
    );
  }
}
