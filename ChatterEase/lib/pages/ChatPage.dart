import 'package:chatapp/Custom_UI/CustomCard.dart';
import 'package:chatapp/models/ChatModel.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: "Dev Stack",
      isGroup: false,
      currentMessage: "Hii, Everyone",
      icon: 'asset/person_black_36dp.svg',
      time: '8:00',
    ),
    ChatModel(
      name: "Niharika",
      isGroup: true,
      currentMessage: "Hii, Everyone",
      icon: 'asset/person_black_36dp.svg',
      time: '4:00',
    ),
    ChatModel(
      name: "Aditi",
      isGroup: false,
      currentMessage: "Hii, Everyone",
      icon: 'asset/person_black_36dp.svg',
      time: '12:00',
    ),
    ChatModel(
      name: "Ishita",
      isGroup: true,
      currentMessage: "Hii, Everyone",
      icon: 'asset/person_black_36dp.svg',
      time: '3:10',
    ),
    ChatModel(
      name: "Shreya",
      isGroup: false,
      currentMessage: "Hii, Everyone",
      icon: 'asset/person_black_36dp.svg',
      time: '8:09',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(chatModel: chats[index]),
      ),
    );
  }
}
