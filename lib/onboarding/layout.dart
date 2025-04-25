// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../cash_epic_dollar/history_screen.dart';
// import '../controller/controller.dart';
//
// class CashEpicDollarScreen extends StatelessWidget {
//   final CashEpicDollarController controller = Get.put(
//     CashEpicDollarController(),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cash Epic Dollar'),
//         leading: const BackButton(),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(24),
//               decoration: BoxDecoration(
//                 color: Colors.yellow[100],
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Center(
//                 child: Image.asset(
//                   'assets/images/cash_epic_image.png',
//                   height: 100,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             const Text(
//               "Cash Out",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 fontFamily: "Ballo2",
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextFormField(
//               readOnly: true,
//               decoration: InputDecoration(
//                 hintText: "100 epic dollar is equal to \$1 when cash out",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   fontFamily: "Baloo2",
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   showDialog(
//                     context: context,
//                     barrierDismissible: false,
//                     builder: (context) {
//                       return Dialog(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Container(
//                                 padding: const EdgeInsets.all(16),
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.yellow[700],
//                                 ),
//                                 child: const Icon(
//                                   Icons.check,
//                                   color: Colors.black,
//                                   size: 36,
//                                 ),
//                               ),
//                               const SizedBox(height: 20),
//                               const Text(
//                                 "Your request has been submitted!",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               const SizedBox(height: 20),
//                               SizedBox(
//                                 width: double.infinity,
//                                 child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     foregroundColor: Colors.black,
//                                     backgroundColor: Colors.yellow[700],
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                   ),
//                                   onPressed: () {
//                                     Get.back(); // Instead of Navigator.pop
//                                   },
//                                   child: const Text("Okay"),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//                 child: const Text("Submit"),
//               ),
//             ),
//             const SizedBox(height: 24),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   "History",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 GestureDetector(
//                   onTap: () => Get.to(() => HistoryScreen()),
//                   child: const Text(
//                     "View all",
//                     style: TextStyle(color: Colors.orange),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: Obx(
//                 () => ListView.builder(
//                   itemCount: controller.history.length,
//                   itemBuilder: (context, index) {
//                     var item = controller.history[index];
//                     return Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 12,
//                           vertical: 10,
//                         ),
//                         child: Row(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Image.asset(
//                                 item['image'],
//                                 width: 40,
//                                 height: 35,
//                                 fit: BoxFit.contain,
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     item['title'],
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     item['date'],
//                                     style: TextStyle(
//                                       color: Colors.grey[600],
//                                       fontSize: 13,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 const Text(
//                                   "Epic dollars",
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 10,
//                                     vertical: 6,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     border: Border.all(color: Colors.orange),
//                                   ),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       const Icon(
//                                         Icons.monetization_on,
//                                         color: Colors.amber,
//                                         size: 18,
//                                       ),
//                                       const SizedBox(width: 4),
//                                       Text(
//                                         "${item['epicDollars']}",
//                                         style: const TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
