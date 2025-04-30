import 'package:get/get.dart';

import '../Models/chat_model.dart';


class ChatController extends GetxController {
  var chats = <ChatModel>[
    ChatModel(name: "Sophia Martinez", message: "Neque porro...", time: "2 min ago", avatar: "assets/images/chat_avatar.png", hasUnread: true),
    ChatModel(name: "Albert Flores", message: "Neque porro...", time: "2 min ago", avatar: "assets/images/chat_avatar1.png", hasUnread: true),
    ChatModel(name: "Liam Johnson", message: "Neque porro...", time: "", avatar: "assets/images/chat_avatar2.png"),
    ChatModel(name: "Noah Brown", message: "Neque porro...", time: "", avatar: "assets/images/chat_avatar3.png"),
    // Add more...
  ].obs;
}
