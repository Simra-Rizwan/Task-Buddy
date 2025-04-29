// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// class ChatDetailController extends GetxController {
//   var messages = <Map<String, dynamic>>[
//     {
//       'type': 'sender',
//       'text': 'I commented on Figma, I want to add some fancy icons. Do you have any icon set?',
//       'date': DateTime(2025, 10, 3)
//     },
//     {
//       'type': 'receiver',
//       'text': 'Yes, we will provide Fancy icon in SVG format.',
//       'date': DateTime(2025, 10, 3)
//     },
//     {
//       'type': 'sender',
//       'text': 'I commented on Figma, I want to add some fancy icons. Do you have any icon set?',
//       'date': DateTime(2025, 10, 3)
//     },
//     {
//       'type': 'sender',
//       'text': 'I commented on Figma, I want to add some fancy icons. Do you have any icon set?',
//       'date': DateTime(2025, 10, 3)
//     },
//     {
//       'type': 'sender',
//       'text': 'I commented on Figma, I want to add some fancy icons. Do you have any icon set?',
//       'date': DateTime(2025, 10, 3)
//     },
//   ].obs;
//
//   Map<String, List<Map<String, dynamic>>> get groupedMessages {
//     Map<String, List<Map<String, dynamic>>> groups = {};
//     for (var msg in messages) {
//       final key = _formatDateForGroup(msg['date']);
//       groups.putIfAbsent(key, () => []).add(msg);
//     }
//     return groups;
//   }
//
//   String _formatDateForGroup(DateTime date) {
//     final now = DateTime.now();
//     final yesterday = now.subtract(Duration(days: 1));
//     if (_isSameDay(date, now)) return 'Today';
//     if (_isSameDay(date, yesterday)) return 'Yesterday';
//     return DateFormat('dd/MM/yyyy').format(date);
//   }
//
//   bool _isSameDay(DateTime d1, DateTime d2) {
//     return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
//   }
// }
