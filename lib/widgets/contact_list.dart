import 'package:flutter/material.dart';
import 'package:flutter_facebook/models/models.dart';
import 'package:flutter_facebook/widgets/user_card.dart';

class ContactList extends StatelessWidget {
  final List<User> users;

  const ContactList({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 200),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                "Contacts",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600]),
              )),
              Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
              const SizedBox(
                width: 8,
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.grey[600],
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final User user = users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: UserCard(
                    user: user,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
