import 'package:flutter/material.dart';
import 'package:fluttertest/screens/chat_screens/chat_detail_screen.dart';
import '../../Models/chat_model.dart';
import '../../constants/colors.dart';

class ChatItem extends StatelessWidget {
  final ChatModel chat;

  const ChatItem({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatDetailScreen()),
        );
      },
      child: ListTile(
        leading: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage(chat.avatar),
            backgroundColor: Colors.transparent,
            radius: 28,
            onBackgroundImageError: (_, __) {
              print('Image not found: ${chat.avatar}');
            },
          ),
        ),
        title: Text(
          chat.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(chat.message),
        trailing: chat.hasUnread
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.PrimaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                chat.unreadCount.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              chat.time,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        )
            : Text(
          chat.time,
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        ),
      ),
    );
  }
}
