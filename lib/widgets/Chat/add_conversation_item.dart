import 'package:flutter/material.dart';
import '../../controller/add_conversation_controller.dart';


class AddConversationItem extends StatelessWidget {
  final AddConversationModel addChat;

  const AddConversationItem({Key? key, required this.addChat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        //leading: CircleAvatar(backgroundImage: AssetImage(chat.avatar)),
        leading: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white, // white background
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage(addChat.avatar),
            backgroundColor: Colors.transparent, // remove default grey background
            radius: 28, // slightly larger size
            onBackgroundImageError: (_, __) {
              print('Image not found: ${addChat.avatar}');
            },
          ),

        ),
        title: Text(addChat.name, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
