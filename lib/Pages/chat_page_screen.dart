import 'package:chat_app/Model/chat_model.dart';
import 'package:chat_app/custom_card.dart';
import 'package:flutter/material.dart';

class ChatPageScreen extends StatefulWidget {
  final ChatModel? chatModel;

  const ChatPageScreen({super.key, this.chatModel});

  @override
  State<ChatPageScreen> createState() => _ChatPageScreenState();
}

class _ChatPageScreenState extends State<ChatPageScreen> {
  List<ChatModel> chats = [
    ChatModel(
      name: "Syed Studio",
      isGroup: false,
      currentMessage: "Hi Everyone",
      time: "04.04",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Maissam Ali",
      isGroup: false,
      currentMessage: "Hi Maissam",
      time: "04.04",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Ali",
      isGroup: false,
      currentMessage: "Hi Ali",
      time: "04.04",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Flutter",
      isGroup: true,
      currentMessage: "Hi Flutter",
      time: "04.04",
      icon: "group.svg",
    ),
    ChatModel(
      name: "CS",
      isGroup: true,
      currentMessage: "Hello Everyone",
      time: "04.04",
      icon: "group.svg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(chatModel: chats[index]),
      ),
    );
  }
}
