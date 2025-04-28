// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../constants/colors.dart';
//
// class EditProfileController extends GetxController {
//   var awardName = ''.obs;
//   var relation = ''.obs;
//   var age = ''.obs;
//   var gender = ''.obs;
//   var dob = ''.obs;
//
// }
//
// class EditProfileScreen extends StatelessWidget {
//   final controller = Get.put(EditProfileController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.secondary,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(60),
//         child: AppBar(
//           backgroundColor: AppColors.secondary,
//           elevation: 0,
//           leading: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: IconButton(
//                 icon: Icon(Icons.arrow_back, color: AppColors.orange),
//                 onPressed: () => Get.back(),
//               ),
//             ),
//           ),
//           centerTitle: true,
//           title: Text(
//             'Edit details',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//               fontFamily: "Baloo2",
//               color: AppColors.black,
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               SizedBox(height: 20),
//               Stack(
//                 alignment: Alignment.bottomRight,
//                 children: [
//                   Container(
//                     height: 90,
//                     width: 90,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image: AssetImage('assets/images/user_image.png'),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: AppColors.white,
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 4,
//                         ),
//                       ],
//                     ),
//                     child: IconButton(
//                       onPressed: () {
//                         // You can implement image picker
//                       },
//                       icon: Icon(Icons.camera_alt, size: 20, color: AppColors.orange),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 30),
//               _buildTextField("Award name", controller.awardName),
//               SizedBox(height: 16),
//               _buildTextField("Relation with parent", controller.relation),
//               SizedBox(height: 16),
//               _buildTextField("Age", controller.age),
//               SizedBox(height: 16),
//               _buildDropdownField("Gender", controller),
//               SizedBox(height: 16),
//               _buildTextField("Date of birth", controller.dob),
//               SizedBox(height: 30),
//               SizedBox(
//                 width: 150,
//                 height: 45,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.orange,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   onPressed: () {
//                     // Save data logic
//                     print('Saved!');
//                   },
//                   child: Text(
//                     "Save",
//                     style: TextStyle(
//                       color: AppColors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 18,
//                       fontFamily: "Baloo2",
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(String hint, RxString controllerText) {
//     return Obx(
//           () => TextFormField(
//         initialValue: controllerText.value,
//         onChanged: (value) => controllerText.value = value,
//         decoration: InputDecoration(
//           hintText: hint,
//           filled: true,
//           fillColor: AppColors.white,
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(color: AppColors.orange),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(color: AppColors.orange),
//           ),
//           contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDropdownField(String hint, EditProfileController controller) {
//     return Obx(
//           () => DropdownButtonFormField<String>(
//         value: controller.gender.value.isEmpty ? null : controller.gender.value,
//         onChanged: (value) {
//           if (value != null) {
//             controller.gender.value = value;
//           }
//         },
//         items: ["Male", "Female", "Other"]
//             .map((gender) => DropdownMenuItem(
//           value: gender,
//           child: Text(gender),
//         ))
//             .toList(),
//         decoration: InputDecoration(
//           hintText: hint,
//           filled: true,
//           fillColor: AppColors.white,
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(color: AppColors.orange),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(color: AppColors.orange),
//           ),
//           contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//         ),
//       ),
//     );
//   }
// }
