import 'package:chat_app/Model/chat_model.dart';
import 'package:chat_app/Screens/individual_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  final ChatModel? chatModel;
  const CustomCard({super.key, this.chatModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IndividualPage(chatModel: chatModel),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                chatModel?.isGroup == true
                    ? 'assets/groups.svg'
                    : 'assets/person.svg',
                color: Colors.white,
                width: 37,
                height: 37,
              ),
            ),
            title: Text(
              chatModel?.name ?? '',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all, size: 16),
                SizedBox(width: 3),
                Text(
                  chatModel?.currentMessage ?? '',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            trailing: Text(
              chatModel?.time ?? '',
              style: TextStyle(fontSize: 13),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Divider(thickness: 1.5),
          ),
        ],
      ),
    );
  }
}
