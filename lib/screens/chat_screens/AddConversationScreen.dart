import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../controller/add_conversation_controller.dart';
import '../../controller/chat_controller.dart';
import '../../widgets/Chat/add_conversation_item.dart';
import '../../widgets/Chat/chat_item.dart';

class AddConversationScreen extends StatelessWidget {
  final AddConversationController controller = Get.put(AddConversationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.SecondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Custom App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        'assets/images/arrow-left.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  const Text(
                    'Add Conversation',
                    style: TextStyle(
                      fontFamily: 'Baloo2',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Opacity(
                    opacity: 0,
                    child: Icon(Icons.arrow_back, size: 24),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // 🔹 Search & Add Button Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // Search Field
                  Expanded(
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/search_icon.png',
                              width: 24,
                              height: 24,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search",
                                border: InputBorder.none,

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // 🔹 Chat List with Divider
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.addChats.length,
                itemBuilder: (_, index) => AddConversationItem(addChat: controller.addChats[index]),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
