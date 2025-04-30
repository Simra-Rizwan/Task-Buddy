import 'package:get/get.dart';

import '../Models/chat_model.dart';


class AddConversationController extends GetxController {
  var addChats = <AddConversationModel>[
    AddConversationModel(name: "Sophia Martinez", avatar: "assets/images/chat_avatar.png"),
    AddConversationModel(name: "Albert Flores", avatar: "assets/images/chat_avatar1.png"),
    AddConversationModel(name: "Liam Johnson", avatar: "assets/images/chat_avatar2.png"),
    AddConversationModel(name: "Noah Brown", avatar: "assets/images/chat_avatar3.png"),
    // Add more...
  ].obs;
}


class AddConversationModel {
   final String name;
   final String avatar;

   AddConversationModel({
     required this.name, required this.avatar
});
}
