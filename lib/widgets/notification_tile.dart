import 'package:flutter/material.dart';
import 'package:task_buddy/constant/colors/AppColors.dart';
import '../Models/ NotificationModel.dart';


class NotificationTile extends StatelessWidget {
  final NotificationModel notification;

  const NotificationTile({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16), // flexible padding
    //  padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.notifications_none, color: AppColors.PrimaryColor),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              notification.message,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          Text(
            notification.timeAgo,
            style: TextStyle(fontSize: 12, color: Colors.yellow[700]),
          ),
        ],
      ),
    );
  }
}
