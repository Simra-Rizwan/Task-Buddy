// // achievement_screen.dart
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'controller/achievement_controller.dart';
//
// class AchievementScreen extends StatelessWidget {
//   final AchievementController controller = Get.put(AchievementController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios_new),
//           onPressed: () => Get.back(),
//         ),
//         title: Text('Achievement'),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Current badges',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 12),
//               Obx(() => GridView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   mainAxisSpacing: 20,
//                   crossAxisSpacing: 20,
//                   childAspectRatio: 1,
//                 ),
//                 itemCount: controller.currentBadges.length,
//                 itemBuilder: (context, index) {
//                   var badge = controller.currentBadges[index] as Map<String, String>;
//                   return badgeItem(
//                     label: badge['title'] ?? '',
//                     imagePath: badge['image'] ?? '',
//                     isLocked: false,
//                   );
//                 },
//               )),
//               SizedBox(height: 24),
//               Text(
//                 'Locked badges',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 12),
//               Obx(() => GridView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   mainAxisSpacing: 20,
//                   crossAxisSpacing: 20,
//                   childAspectRatio: 1,
//                 ),
//                 itemCount: controller.lockedBadges.length,
//                 itemBuilder: (context, index) {
//                   return badgeItem(
//                     label: '',
//                     imagePath: controller.lockedBadges[index],
//                     isLocked: true,
//                   );
//                 },
//               )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget badgeItem({required String label, required String imagePath, required bool isLocked}) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Transform.rotate(
//           angle: pi / 4, // Rotate outer container 45 degrees
//           child: Container(
//             width: 80,
//             height: 80,
//             decoration: BoxDecoration(
//               color: Colors.grey.shade300,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Center(
//               child: Transform.rotate(
//                 angle: -pi / 4, // Reverse rotate inner container
//                 child: Container(
//                   width: 60,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Center(
//                     child: Image.asset(
//                       imagePath,
//                       width: 32,
//                       height: 32,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: 8),
//         if (!isLocked)
//           Text(
//             label,
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 12),
//           ),
//       ],
//     );
//   }
// }
