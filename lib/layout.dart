// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'controller/chat_detail_controller.dart';
// //
// // class ChatDetailScreen extends StatelessWidget {
// //   final ChatDetailController controller = Get.put(ChatDetailController());
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Color(0xFFF7F7F7),
// //       body: SafeArea(
// //         child: Column(
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.all(12.0),
// //               child: Row(
// //                 children: [
// //                   Icon(Icons.arrow_back, color: Colors.black),
// //                   SizedBox(width: 10),
// //                   CircleAvatar(
// //                     backgroundColor: Colors.red.shade100,
// //                     child: Icon(Icons.person, color: Colors.white),
// //                   ),
// //                   SizedBox(width: 10),
// //                   Text('Sophia Martinez',
// //                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
// //                 ],
// //               ),
// //             ),
// //             Expanded(child: _buildChatList()),
// //             _buildInputArea(),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildChatList() {
// //     return Obx(() {
// //       final grouped = controller.groupedMessages;
// //       final sections = grouped.entries.toList();
// //
// //       int totalItemCount = 0;
// //       for (var section in sections) {
// //         totalItemCount += section.value.length + 1; // +1 for header
// //       }
// //
// //       return ListView.builder(
// //         padding: EdgeInsets.all(12),
// //         itemCount: totalItemCount,
// //         itemBuilder: (context, index) {
// //           int count = 0;
// //           for (var entry in sections) {
// //             if (index == count) {
// //               return Center(
// //                 child: Padding(
// //                   padding: const EdgeInsets.symmetric(vertical: 8),
// //                   child: Text(
// //                     entry.key,
// //                     style: TextStyle(
// //                         fontWeight: FontWeight.bold, color: Colors.grey),
// //                   ),
// //                 ),
// //               );
// //             }
// //             count++;
// //             for (var msg in entry.value) {
// //               if (index == count) {
// //                 bool isSender = msg['type'] == 'sender';
// //                 return Align(
// //                   alignment:
// //                   isSender ? Alignment.centerLeft : Alignment.centerRight,
// //                   child: Column(
// //                     crossAxisAlignment: isSender
// //                         ? CrossAxisAlignment.start
// //                         : CrossAxisAlignment.end,
// //                     children: [
// //                       Container(
// //                         margin: EdgeInsets.symmetric(vertical: 6),
// //                         padding: EdgeInsets.all(12),
// //                         decoration: BoxDecoration(
// //                           color: isSender
// //                               ? Colors.white
// //                               : Colors.grey.shade200,
// //                           borderRadius: BorderRadius.circular(16),
// //                         ),
// //                         child: Text(msg['text']),
// //                       ),
// //                       SizedBox(height: 10),
// //                     ],
// //                   ),
// //                 );
// //               }
// //               count++;
// //             }
// //           }
// //           return SizedBox(); // fallback
// //         },
// //       );
// //     });
// //   }
// //
// Widget _buildInputArea() {
//   return Container(
//     padding: const EdgeInsets.all(12),
//     color: AppColors.secondary, // Matches the screen background
//     child: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(30), // Fully rounded edges
//       ),
//       child: Row(
//         children: [
//           Icon(Icons.attach_file, color: Colors.orange),
//           const SizedBox(width: 10),
//           Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: "Type a Message",
//                 hintStyle: TextStyle(color: Colors.grey),
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//           Container(
//             height: 24,
//             width: 1,
//             color: Colors.grey.shade300,
//             margin: const EdgeInsets.symmetric(horizontal: 8),
//           ),
//           Icon(Icons.send, color: Colors.orange),
//         ],
//       ),
//     ),
//   );
// }
// // }
