import '../pages/ChatPage.dart';

class ChatModel{
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;

  ChatModel({
    required this.name,
    required this.isGroup,
    required this.currentMessage,
    required this.icon,
    required this.time,
  });
  }

