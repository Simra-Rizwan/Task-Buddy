import 'package:get/get.dart';

class Task {
  final String title;
  final String time;
  final String iconPath;
  final int reward;
  RxBool isChecked; // <--- Add this

  Task({
    required this.title,
    required this.time,
    required this.iconPath,
    required this.reward,
    bool isChecked = false, // <--- optional initial value
  }) : isChecked = isChecked.obs; // <--- initialize as observable
}

 class TaskController extends GetxController{
   var tasks = <Task> [
     Task(title: "Clean you room", time: "4:00 PM", iconPath: "assets/images/coin.png", reward: 4),
     Task(title: "Do home work", time: "4:00 PM", iconPath: "assets/images/coin.png", reward: 4),
     Task(title: "Clean you room", time: "4:00 PM", iconPath: "assets/images/coin.png", reward: 4),
     Task(title: "Do home work", time: "4:00 PM", iconPath: "assets/images/coin.png", reward: 4)
   ].obs;
 }