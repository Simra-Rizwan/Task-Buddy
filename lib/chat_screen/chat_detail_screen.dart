import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../chat_detail_screen_widgets/chat_detail_appbar.dart';
import '../chat_detail_screen_widgets/chat_list.dart';
import '../chat_detail_screen_widgets/input_area.dart';
import '../controller/chat_detail_controller.dart';


class ChatDetailScreen extends StatelessWidget {
  final ChatDetailController controller = Get.put(ChatDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60), // height of your app bar
        child: ChatDetailAppBar(),
      ),
      body: Column(
        children: [
          Expanded(child: ChatList(controller: controller)),
          InputArea(),
        ],
      ),
    );
  }
}
