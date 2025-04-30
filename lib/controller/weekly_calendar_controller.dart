import 'package:get/get.dart';

class WeeklyCalendarController extends GetxController {
  var selectedDate = DateTime.now().obs;

  List<DateTime> get currentWeek {
    final today = selectedDate.value;
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  void goToPreviousWeek() {
    selectedDate.value = selectedDate.value.subtract(const Duration(days: 7));
  }

  void goToNextWeek() {
    selectedDate.value = selectedDate.value.add(const Duration(days: 7));
  }
}
