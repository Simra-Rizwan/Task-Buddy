import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../controller/weekly_calendar_controller.dart';

class WeeklyCalendarWidget extends StatelessWidget {
  const WeeklyCalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WeeklyCalendarController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Calendar View',
          style: TextStyle(
            fontFamily: 'Baloo2',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),

        Obx(() {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: controller.currentWeek.map((date) {
                final isSelected = controller.selectedDate.value.day == date.day &&
                    controller.selectedDate.value.month == date.month &&
                    controller.selectedDate.value.year == date.year;

                return GestureDetector(
                  onTap: () => controller.selectDate(date),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: isSelected
                        ? BoxDecoration(
                      color: AppColors.PrimaryColor,
                      borderRadius: BorderRadius.circular(20),
                    )
                        : null,
                    width: 40,
                    child: Column(
                      children: [
                        Text(
                          _getWeekdayName(date.weekday),
                          style: TextStyle(
                            fontFamily: 'Baloo2',
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          date.day.toString(),
                          style: TextStyle(
                            fontFamily: 'Baloo2',
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        }),
      ],
    );
  }

  String _getWeekdayName(int weekday) {
    const weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return weekDays[weekday - 1];
  }
}
