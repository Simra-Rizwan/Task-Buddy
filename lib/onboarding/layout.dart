// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../contoller/avatar_controller.dart';
//
//
// class ChooseAvatarScreen extends StatelessWidget {
//   final AvatarController controller = Get.put(AvatarController());
//
//   final List<String> avatarPaths = List.generate(
//     12,
//         (index) => 'assets/avatars/avatar_${index + 1}.png',
//   );
//
//   final int defaultAvatarIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     // Set default avatar if none is selected
//     controller.selectedAvatarIndex.value = defaultAvatarIndex;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Text(
//                 "Choose avatar for profile Image",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 "Choose an avatar that best fits your profile.",
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 20),
//
//               // Selected avatar preview
//               Obx(() => Container(
//                 height: 120,
//                 width: 120,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: Colors.grey.shade100,
//                   image: DecorationImage(
//                     image: AssetImage(
//                       avatarPaths[controller.selectedAvatarIndex.value],
//                     ),
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               )),
//               SizedBox(height: 12),
//
//               ElevatedButton(
//                 onPressed: () {
//                   Get.snackbar("Saved", "Avatar selection saved!");
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.amber,
//                   padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: Text("Save", style: TextStyle(color: Colors.black)),
//               ),
//               SizedBox(height: 20),
//
//               // Avatar selection grid
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade200,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
//                   child: Obx(() => GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       mainAxisSpacing: 12,
//                       crossAxisSpacing: 12,
//                       childAspectRatio: 1,
//                     ),
//                     itemCount: avatarPaths.length,
//                     itemBuilder: (context, index) {
//                       final isSelected =
//                           controller.selectedAvatarIndex.value == index;
//                       return GestureDetector(
//                         onTap: () => controller.selectAvatar(index),
//                         child: Stack(
//                           alignment: Alignment.bottomCenter,
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 color: Colors.white,
//                                 border: Border.all(
//                                   color: isSelected
//                                       ? Colors.amber
//                                       : Colors.grey.shade300,
//                                   width: 2,
//                                 ),
//                                 image: DecorationImage(
//                                   image: AssetImage(avatarPaths[index]),
//                                   fit: BoxFit.contain,
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               bottom: 6,
//                               child: CircleAvatar(
//                                 radius: 10,
//                                 backgroundColor: Colors.white,
//                                 child: Icon(
//                                   isSelected
//                                       ? Icons.check_circle
//                                       : Icons.circle_outlined,
//                                   color: isSelected
//                                       ? Colors.green
//                                       : Colors.grey,
//                                   size: 16,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   )),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
