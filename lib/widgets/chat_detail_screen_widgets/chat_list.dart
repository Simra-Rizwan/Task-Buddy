import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants/colors.dart';
import '../../controller/chat_detail_controller.dart';

class ChatList extends StatelessWidget {
  final ChatDetailController controller;

  const ChatList({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final grouped = controller.groupedMessages;
      final sections = grouped.entries.toList();

      int totalItemCount = 0;
      for (var section in sections) {
        totalItemCount += section.value.length + 1;
      }

      return Container(
        color: AppColors.secondary,
        child: ListView.builder(
          padding: EdgeInsets.all(12.0),
          itemCount: totalItemCount,
          itemBuilder: (context, index) {
            int count = 0;
            for (var entry in sections) {
              if (index == count) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      entry.key,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              }
              count++;
              for (var msg in entry.value) {
                if (index == count) {
                  bool isSender = msg['type'] == 'sender';
                  String date = '';
                  if (msg['date'] is DateTime) {
                    date = DateFormat('dd/MM/yyyy').format(msg['date']);
                  } else if (msg['date'] is String) {
                    date = msg['date'];
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: isSender
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        if (isSender)
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      constraints: BoxConstraints(
                                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                                      ),
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                          bottomRight: Radius.circular(16),
                                        ),
                                      ),
                                      child: Text(
                                        msg['text'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Baloo2",
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        date,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: -14,
                                left: -7,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundImage: AssetImage('assets/images/sender_image.png'),
                                ),
                              ),
                            ],
                          )
                        else
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                                ),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                    bottomLeft: Radius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  msg['text'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Baloo2",
                                  ),
                                ),
                              ),
                              if (date.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Align(
                                    alignment: isSender
                                        ? Alignment.bottomRight // Align to bottom right for sender
                                        : Alignment.bottomLeft, // Align to bottom left for receiver
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10, bottom: 4),
                                      child: Text(
                                        date, // Display formatted date here
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                      ],
                    ),
                  );
                }
                count++;
              }
            }
            return SizedBox();
          },
        ),
      );
    });
  }
}
